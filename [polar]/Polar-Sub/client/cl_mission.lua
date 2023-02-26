local QBCore = exports['qb-core']:GetCoreObject()
local onmission = false
CreateThread(function()
    --missionpeds()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        missionpeds()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    missionpeds()
    
end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if onmission then
        TriggerServerEvent('Polar-Sub:Server:MissionEmpty')
    end
end)

function missionpeds()

for i = 1, #Config.MissionPeds do
    exports['qb-target']:SpawnPed({
        model = Config.MissionPeds[i].model,
        coords = Config.MissionPeds[i].coords,
        minusOne = true,
        freeze = true,
        invincible = false,
        blockevents = true,
        scenario = 'WORLD_HUMAN_AA_COFFEE',
        target = {
            options = {
            {
                type = "Client",
                icon = 'fa-solid fa-bolt',
                label = 'Talk',
                -- job = {"mechanic", "tuner", "otto"},
               -- action = function()
               --     TriggerEvent('Polar-Sub:Client:CryptoPartMenu')
               -- end,
               -- event = 'Polar-Sub:Client:CryptoPartMenu',
                event = 'Polar-Sub:Client:MissionMenu',
                product = Config.MissionPeds[i].product,

            }
            },
            distance = 2.5,
        },
    })

end
end

RegisterNetEvent('Polar-Sub:Client:MissionStart', function(data)

    
    QBCore.Functions.TriggerCallback('Polar-Sub:Server:MIssionCheck', function(bool)
        full = bool
    end)
    Wait(100)
    if not full then TriggerServerEvent('Polar-Sub:Server:getMoneyamount', money, amounts)
    else QBCore.Functions.Notify('Someone is on a Mission!', 'error') if Config.Debug then print('Someone is on a Mission!') end end
end)
RegisterNetEvent('Polar-Sub:Client:StartupS', function()
    onmission = true
    TriggerServerEvent('Polar-Sub:Server:MissionFull')
    pbar(hmm, money, amounts)
end)
function pbar(hmm, money, amounts)
    QBCore.Functions.Progressbar("hi", "Handling Details ", 5500, false, true,  {disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
    {}, {}, {}, function() -- Done
        nextup(hmm, money, amounts)
    end, function()
        QBCore.Functions.Notify('Canceled', 'error') if Config.Debug then print('canceled') end
    end)  
end
function nextup(hmm, money, amounts)
    local what = hmm
    local moneys = money
    local amount = amounts
    Wait(1)
    local name = what
    print('tryna create')
    CreateZone(name, center, radius)
    print(name, center, radius)
end
function CreateZone(name, center, radius)
    local zone = PolyZone:Create({
        name = name,
        minZ = center.z - 10.0,
        maxZ = center.z + 10.0,
        coords = {},
        debugGrid = false,
    })

    local numPoints = 16  -- Number of points in the circle
    for i = 1, numPoints do
        local angle = (i - 1) / numPoints * math.pi * 2
        local x = center.x + math.cos(angle) * radius
        local y = center.y + math.sin(angle) * radius
        zone:AddPoint(x, y)
    end

    return zone
end
RegisterNetEvent('Polar-Sub:Client:MissionMenu', function(data)
    typea = data.product
    --money = data.product.moneytype
  --  amounts = data.product.amount
  --  pedamounts = data.product.pedamount
   -- center = data.product.packagelocation
   -- radius = data.product.radius
    Wait(1000)
    print(typea)
  --  print(money)
   -- print(amounts)
   -- print(pedamounts)
   -- print(center)
   -- print(radius)
	Wait(100)
    --[[
	local menu = {
		{ header = "Mission Menu", txt = "", icon = "fa-solid fa-bolt", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }


	
		local setheader = "Start " .. typea .. " Mission"
		local disable = false
        local hide = false
        menu[#menu+1] = { hidden = hide, disabled = disable, icon = "", header = setheader, txt = "This is your legacy", params = { event = "Polar-Sub:Client:MissionStart", args = { nee = typea } } }
		Wait(0)
	
	exports['qb-menu']:openMenu(menu)
   ]]
end)
function CreateAggressivePed(model, x, y, z)
    local ped = CreatePed(4, model, x, y, z, 0.0, true, true)
    SetPedCombatAttributes(ped, 46, true)
    SetPedCombatAbility(ped, 100)
    SetPedCombatMovement(ped, 2)
    SetPedCombatRange(ped, 2)
    TaskCombatPed(ped, PlayerPedId(), 0, 16)
    return ped
end
function GetRandomPositionInZone(zoneName)
    local zone = PolyZone.Get(zoneName)
    if zone then
        local x, y, z = table.unpack(zone:GetRandomPosition())
        return x, y, z
    end
end
function HandleZoneEnter(name)
        local playerPed = PlayerPedId()
        local zoneCenter = GetRandomPositionInZone(name)

        for i = 1, pedamounts do
            local x = zoneCenter.x + math.random(-30, 30)
            local y = zoneCenter.y + math.random(-30, 30)
            local z = GetGroundZFor_3dCoord(x, y, zoneCenter.z, 0)
            local aggressivePed = CreateAggressivePed(GetHashKey("a_m_y_mexthug_01"), x, y, z)
        end
end
AddEventHandler("PolyZone", function(name)
    if onmission then
        HandleZoneEnter(name)
    end
end)