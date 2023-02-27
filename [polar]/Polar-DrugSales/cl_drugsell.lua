local QBCore = exports['qb-core']:GetCoreObject()

-- \ Locals and tables
local SoldPeds = {}
local SellZone = {}
local CurrentZone = nil
local AllowedTarget = true

-- \ Create Zones for the drug sales
for k, v in pairs(Config.Zones) do
    SellZone[k] = PolyZone:Create(v.points, {
        name= 'sellzone'..k,
        minZ = v.minZ,
        maxZ = v.maxZ,
        debugPoly = Config.Debug,
    })
end

-- \ Send police alert on drug sale
local function PoliceAlert()
	exports['qb-dispatch']:DrugSale()
    -- Add Your alert system here
	-- TriggerServerEvent('police:server:policeAlert', 'Drug sale in progress')
	if Config.Debug then print('Police Notify Function triggered') end
end

-- \ Play five animation for both player and ped
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

-- \ Add Old Ped to table
local function AddSoldPed(entity)
    SoldPeds[entity] = true
end

--\ Check if ped is in table
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
					PoliceAlert()
				else
					if Config.Debug then print('You dont have ['..v.item..'] to sell') end
				end
			end
		end
	end	
end

-- \ Interact with the ped
local function InteractPed(ped)
	local Playerjob = QBCore.Functions.GetPlayerData().job				
	SetEntityAsMissionEntity(ped)	
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	TaskTurnPedToFaceCoord(ped, px, py, pz, 10000)
	Wait(1000)	
	if Playerjob.name == 'police' then
		TriggerEvent('QBCore:Notify', 'Locals hate cops!')
		SetPedAsNoLongerNeeded(ped)		
		if Config.Debug then print('Police Not allowed') end
		return
	end		
	local percent = math.random(1, 100)
	if percent < Config.ChanceSell then		
		InitiateSell(ped)
	else
		if Config.Debug then print('Police has been notified') end
		TriggerEvent('Polar-Drugsales:notify', 'The buyer is calling the police!')
		TaskUseMobilePhoneTimed(ped, 8000)		
		PoliceAlert()
	end
	SetPedAsNoLongerNeeded(ped)
end

-- \ Initialize the drug sales
local function InitiateSales(entity)
	QBCore.Functions.TriggerCallback('Polar-Drugsales:server:GetCops', function(result)
		if result < Config.MinimumCops then
			TriggerEvent('Polar-Drugsales:notify', 'Buyer is not interested to buy now!')			
			if Config.Debug then print('Not Enough Cops') end
		else
			local CurrentPedID = PedToNet(entity)			
			local isSoldtoPed = HasSoldPed(CurrentPedID)
			if isSoldtoPed then TriggerEvent('Polar-Drugsales:notify', 'You already spoke with this local') return false end
			AddSoldPed(CurrentPedID)
			InteractPed(entity)
			if Config.Debug then print('Drug Sales Initiated now proceding to interact') end
		end
	end)	
end

-- \ Blacklist Ped Models
function isPedBlacklisted(ped)
	local model = GetEntityModel(ped)
	for i = 1, #Config.BlacklistPeds do
		if model == GetHashKey(Config.BlacklistPeds[i]) then
			return true
		end
	end
	return false
end

-- \ Sell Drugs to peds inside the sellzone
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

-- \ Remove Sell Drugs to peds inside the sellzone
local function RemoveTarget()
	exports['qb-target']:RemoveGlobalPed({"Talk"})
end
exports('RemoveTarget', RemoveTarget)

-- \ This will toggle allowing/disallowing target even if inside zone
local function AllowedTarget(value)
	AllowedTarget = value
end
exports('AllowedTarget', AllowedTarget)

-- \ Notify event for client/server
RegisterNetEvent('Polar-Drugsales:notify', function(msg)
	if Config.Debug then print('Notify:'..msg) end
	TriggerEvent('QBCore:Notify', msg, "primary", 5000)
end)

-- \ Check if inside sellzone
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
							if Config.Debug then print("Target Added ["..CurrentZone.name.."]") end
						end
						if Config.Debug then print(json.encode(CurrentZone)) end
					else										
						SellZone[k].inside = false
						if SellZone[k].target then
							SellZone[k].target = false
							RemoveTarget()
							if Config.Debug then print("Target Removed ["..CurrentZone.name.."]") end
						end
					end
				end
			end
		end
		Wait(1000)
	end
end)