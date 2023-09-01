local QBCore = exports['qb-core']:GetCoreObject()

local SoldPeds = {}
local SellZone = {}
local CurrentZone = nil
local AllowedTarget = true
for k, v in pairs(Config.Zones) do
    SellZone[k] = PolyZone:Create(v.points, {
        name= 'sellzone'..k,
        minZ = v.minZ,
        maxZ = v.maxZ,
        debugPoly = Config.Debug,
    })
end
local function PoliceAlert()
	exports['ps-dispatch']:DrugSale()
end
local function PlayGiveAnim(tped)
	local pid = PlayerPedId()	
	FreezeEntityPosition(pid, true)		
	RequestAnimDict("mp_common")		
	TaskPlayAnim(pid, "mp_common", "givetake2_a", 8.0, -8, -1, 0, 0, 0, 0, 0)    
	TaskPlayAnim(tped, "mp_common", "givetake2_a", 8.0, -8, -1, 0, 0, 0, 0, 0)    	
	Wait(2000)
	FreezeEntityPosition(pid, false)	
	StopAnimTask(pid, "mp_common", "givetake2_a", 1.0)
	StopAnimTask(tped, "mp_common", "givetake2_a", 1.0)
end
local function AddSoldPed(entity)
    SoldPeds[entity] = true
end
local function HasSoldPed(entity)
    return SoldPeds[entity] ~= nil
end
local function InitiateSell(ped)
	local AlreadySold = false
	for k, v in pairs(Config.ZoneDrugs) do			
		if v.zone == CurrentZone.name then
			Wait(200) -- Dont Change this									
			if not AlreadySold then
				if QBCore.Functions.HasItem(v.item, 1) then
					PlayGiveAnim(ped)
					AlreadySold = true
					TriggerServerEvent('Polar-Drugsales:initiatedrug', v)
				else

				end
			end
		end
	end	
end
local function InteractPed(ped)
	local Playerjob = QBCore.Functions.GetPlayerData().job				
	SetEntityAsMissionEntity(ped)	
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	TaskTurnPedToFaceCoord(ped, px, py, pz, 10000)
	Wait(1000)	
	if Playerjob.name == 'police' then
		TriggerEvent('QBCore:Notify', 'Locals hate cops!')
		SetPedAsNoLongerNeeded(ped)		
		return
	end		
	local percent = math.random(1, 100)
	if percent < Config.ChanceSell then		
		InitiateSell(ped)
	else
		TriggerEvent('Polar-Drugsales:notify', 'The buyer is calling the police!')
		TaskUseMobilePhoneTimed(ped, 8000)		
		PoliceAlert()
	end
	SetPedAsNoLongerNeeded(ped)
end
local function InitiateSales(entity)
	QBCore.Functions.TriggerCallback('Polar-Drugsales:server:GetCops', function(result)
		if result < Config.MinimumCops then
			TriggerEvent('Polar-Drugsales:notify', 'Buyer is not interested to buy now!')			
		else
			local CurrentPedID = PedToNet(entity)			
			local isSoldtoPed = HasSoldPed(CurrentPedID)
			if isSoldtoPed then TriggerEvent('Polar-Drugsales:notify', 'You already spoke with this local') return false end
			AddSoldPed(CurrentPedID)
			InteractPed(entity)
		end
	end)	
end
function isPedBlacklisted(ped)
	local model = GetEntityModel(ped)
	for i = 1, #Config.BlacklistPeds do
		if model == GetHashKey(Config.BlacklistPeds[i]) then
			return true
		end
	end
	return false
end
local function CreateTarget()
	exports['qb-target']:AddGlobalPed({
		options = {
			{                			
				icon = 'fas fa-comments',
				label = 'Talk',
				action = function(entity)
					InitiateSales(entity)
				end,
				canInteract = function(entity)
					if CurrentZone then
						if not IsPedDeadOrDying(entity) and not IsPedInAnyVehicle(entity) and CurrentZone.inside and (GetPedType(entity)~=28) and (not IsPedAPlayer(entity)) and (not isPedBlacklisted(entity)) and not IsPedInAnyVehicle(PlayerPedId()) then								
							return true
						end         						
					end					 
					return false
				end,        
			}
		},
		distance = 2.5,
	})
end
exports('CreateTarget', CreateTarget)
local function RemoveTarget()
	exports['qb-target']:RemoveGlobalPed({"Talk"})
end
exports('RemoveTarget', RemoveTarget)
local function AllowedTarget(value)
	AllowedTarget = value
end
exports('AllowedTarget', AllowedTarget)
RegisterNetEvent('Polar-Drugsales:notify', function(msg)
	TriggerEvent('QBCore:Notify', msg, "primary", 5000)
end)
CreateThread(function()
	while true do
		local Ped = PlayerPedId()
		local coord = GetEntityCoords(Ped)
		if Ped and coord and SellZone and next(SellZone) ~= nil then
			for k, v in pairs(SellZone) do
				if SellZone[k] then
					if SellZone[k]:isPointInside(coord) then						
						SellZone[k].inside = true
                        CurrentZone = SellZone[k]	
						if not SellZone[k].target and AllowedTarget then
							SellZone[k].target = true
							CreateTarget()							
						end
					else										
						SellZone[k].inside = false
						if SellZone[k].target then
							SellZone[k].target = false
							RemoveTarget()
						end
					end
				end
			end
		end
		Wait(1000)
	end
end)