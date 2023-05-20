local QBCore = exports['qb-core']:GetCoreObject()


local xpp = nil local loc = nil local amount = nil local pickloc = nil local exp = 0
local trailervehicle = nil local pickupb = nil local trailermod = nil local trailer = nil
local lastjob = nil local dropoff = nil
local hide = true
local playeramount = 0
local onjob = false
local onRoute = false
local text = nil local icon = nil local name = nil local xp = nil
local random = nil
local type = nil

PickupLocTruck = {

    vector4(-985.67, -2941.83, 13.95, 146.56),
    vector4(233.1, -3114.72, 5.79, 354.99),
    vector4(853.02, -3127.8, 5.9, 90.58),
    vector4(853.01, -3143.86, 5.9, 91.18),
    vector4(473.82, -2992.51, 6.04, 85.94),
    vector4(-206.57, -1978.1, 27.62, 180.86),
    vector4(-1803.93, 799.54, 138.51, 38.93),
    vector4(211.06, 2747.4, 43.43, 95.55),
    vector4(1854.13, 2625.45, 45.67, 357.95),
    vector4(-3146.63, 1043.02, 20.76, 336.96),
    vector4(-1051.42, -1566.17, 4.81, 304.45),
    vector4(-1097.89, -2398.09, 13.95, 63.3),
    vector4(-1051.42, -1566.17, 4.81, 304.45),
    vector4(-1392.11, 83.84, 53.99, 0.8),
    vector4(1043.83, -2491.49, 28.51, 153.18),
    vector4(1151.86, -3017.54, 5.9, 88.19),

}
TrailersTruck = {
    'docktrailer',
    'trailers3',
    'trailerlogs',
    'tvtrailer',
    'tanker',
    'trailers4',
    'trailers',
    'trailers2',
    'tr2',
    'docktrailer',
   
}
SpecialTrailers = {
    'tr4',
    'tr3',
    'tr4',
    'tr3',
}
DropoffTruck = {

    vector4(803.32, -764.96, 26.73, 88.6),
    vector4(-1921.37, 2085.64, 137.03, 172.67),
    vector4(-1526.96, 83.48, 56.59, 273.54),
    vector4(103.55, -129.25, 54.75, 157.09),
    vector4(-886.61, -1488.29, 5.02, 107.36),
    vector4(258.25, 2578.75, 45.15, 278.74),
    vector4(-1028.54, -493.36, 36.94, 114.5),
    vector4(1794.73, 107.68, 169.52, 300.82),
    vector4(-1044.46, -522.1, 36.04, 28.73),
    vector4(2683.58, 3292.73, 55.24, 238.18),
    vector4(1032.41, -2492.01, 28.51, 153.41),
    vector4(1549.47, 3561.8, 35.36, 42.65),
    vector4(-1181.6, -904.75, 13.77, 302.18),
    vector4(972.42, 3.15, 81.04, 145.91),
    vector4(103.55, -129.25, 54.75, 157.09),
    vector4(258.25, 2578.75, 45.15, 278.74),
    vector4(1794.73, 107.68, 169.52, 300.82),
    vector4(-96.01, -2682.36, 6.01, 358.93),
    vector4(-1816.56, -1234.23, 13.02, 109.54),

}


local TruckPeds = {
    [1] = {
        coords = vector4(1741.23, -1608.02, 112.48, 56.29),
        model = "a_m_m_genfat_01",
        icon = 'fas fa-file-invoice-dollar',
        label = 'Talk to Amir',
    },

}
function math2()
    local chance2 = math.random(1,100)
    Wait(50)
    if exp > 100 then
        if chance2 < 90 then 
            type = 'Delivery'
        else
            type = 'Special'
        end
    elseif exp > 250 then
        if chance2 < 85 then 
            type = 'Delivery'
        else
            type = 'Special'
        end
    elseif exp > 350 then
        if chance2 < 75 then 
            type = 'Delivery'
        else
            type = 'Special'
        end
    elseif exp > 500 then
        if chance2 < 50 then 
            type = 'Delivery'
        else
            type = 'Special'
        end
    else
        if chance2 < 95 then 
            type = 'Delivery'
        else
            type = 'Special'
        end
    end
end
function getmenu()
    pickloc = PickupLocTruck[math.random(1, #PickupLocTruck)]
    if type == 'Special' then
    trailer = SpecialTrailers[math.random(1, #SpecialTrailers)]
    else
    trailer = TrailersTruck[math.random(1, #TrailersTruck)]
    end
    loc = DropoffTruck[math.random(1, #DropoffTruck)]

    local coords = GetEntityCoords(PlayerPedId())
    local distance1 = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, coords.x, coords.y, coords.z, false)
    local distance = distance1 * 0.0006
 --   print(distance)
 

    if type == 'Special' then
        if distance > 5 then 
            amount = math.random(7500,10000)
            xp = math.random(40,50)
        elseif distance > 3 then
            amount = math.random(3500,6000)
            xp = math.random(30,40)
        elseif distance < 1 then
            amount = math.random(750,1000)
            xp = math.random(5,10)
        else
            amount = math.random(1500,2500)
            xp = math.random(20,30)
        end
    else
        if distance > 5 then 
            amount = math.random(2150,2550)
            xp = math.random(30,40)
        elseif distance > 3 then
            amount = math.random(1350,2000)
            xp = math.random(20,30)
        elseif distance < 1 then
            amount = math.random(250,650)
            xp = math.random(5,10)
        else
            amount = math.random(500,1200)
            xp = math.random(5,10)
        end
    end
end





CreateThread(function()
  --  start()
   -- getmenu()
  --  blip()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        start()
        blip()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    start()
    blip()
    if QBCore.Functions.GetPlayerData().job and QBCore.Functions.GetPlayerData().job.name == 'trucker' then
        onjob = true
        TriggerServerEvent('Polar-Mini:Server:SetPlayerUp', 1)
    else
        onjob = false
    end    
end)
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    if QBCore.Functions.GetPlayerData().job and QBCore.Functions.GetPlayerData().job.name == 'trucker' then

    TriggerServerEvent('Polar-Mini:Server:SetPlayerDown', 1)
    TriggerServerEvent('Polar-Mini:Server:RemoveJob', lastjob)
    end
end)
function check()
    QBCore.Functions.TriggerCallback('Polar-Mini:Server:CheckPlayers', function(amount)
        playeramount = amount
    end)
end
function blip()
    local blip = AddBlipForCoord(vec3(TruckPeds[1].coords.x, TruckPeds[1].coords.y, TruckPeds[1].coords.z)) SetBlipSprite (blip, 477) SetBlipDisplay(blip, 6) SetBlipScale (blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 39) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName('Los Santos Trucking') EndTextCommandSetBlipName(blip)
end
function start()

    for i = 1, #TruckPeds do
        exports['qb-target']:SpawnPed({
            model = TruckPeds[i].model,
            coords = TruckPeds[i].coords,
            minusOne = true,
            freeze = true,
            invincible = false,
            blockevents = true,
            scenario = 'WORLD_HUMAN_AA_COFFEE',
            target = {
                options = {
                {
                    type = "Client",
                    icon = 'fas fa-file-invoice-dollar',
                    label = 'Talk to Amir',
                    -- job = {"mechanic", "tuner", "otto"},
                   -- action = function()
                   --     TriggerEvent('Polar-Sub:Client:CryptoPartMenu')
                   -- end,
                   -- event = 'Polar-Sub:Client:CryptoPartMenu',
                   event = 'Polar-Mini:Client:TruckMenu2',
                }
                },
                distance = 2.5,
            },
        })
    
    end
end
function getjob()

    local PlayerJob = QBCore.Functions.GetPlayerData().job
    lastjob = PlayerJob.name
    
  
end
RegisterNetEvent('Polar-Mini:Client:TruckMenu2', function()
    check()
    if onRoute then
        TriggerEvent('Polar-Mini:Client:CancelTruckMenu')
    else

    
    TriggerEvent('Polar-Mini:Client:TruckMenu')
    end
end)
local exp = nil
function getexp()

    local PlayerData = QBCore.Functions.GetPlayerData()
    exp = PlayerData.metadata["trucker"] or 0
    

end
function finish()
   -- print(amount)
  --  print(xpp)
    SetEntityAsNoLongerNeeded(trailervehicle)
    RemoveBlip(pickupb)
    RemoveBlip(dropoff)
    TriggerServerEvent('Polar-Mini:Server:SetTruckerExp', xpp)
    TriggerServerEvent('Polar-Mini:Server:Amount', amount)
    onRoute = false
    onjob = false
end


RegisterNetEvent('Polar-Mini:Client:Transfer', function()
    TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Trucking', 'Wait for A Contract', 'fas fa-file-invoice-dollar', '#b3e0f2', '10000')
   -- trailermod = data.trailermod
  --  xpp = data.xp
  --  pickloc = data.pickloc
  --  loc = data.location
   -- amount = data.payamount
    getjob()
    onRoute = true
    hide = false
    TriggerServerEvent('Polar-Mini:Server:SetPlayerUp', 1)
    TriggerServerEvent('Polar-Mini:Server:GiveJob')
    startjob()
end)
RegisterNetEvent('Polar-Mini:Client:Cancel', function()
    if hide then return
    else hide = true onRoute = false end
    TriggerServerEvent('Polar-Mini:Server:SetPlayerDown', 1)
    TriggerServerEvent('Polar-Mini:Server:RemoveJob', lastjob)
    DeleteEntity(trailervehicle)
    RemoveBlip(pickupb)
    RemoveBlip(dropoff)
end)

RegisterNetEvent('Polar-Mini:Client:TruckMenu', function()
    getexp()
	local coords = GetEntityCoords(PlayerPedId())
   
	local menu = {
		{ header ="Current Truckers " .. playeramount .. "", txt =  "" .. exp .. " Trucking EXP" , icon = "fas fa-file-invoice-dollar", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } },
       -- { icon = "fa-solid fa-ban", hidden = hide, header = "", txt = "Cancel Route", params = { event = "Polar-Mini:Client:Cancel" } } }

       { icon = "fa-solid fa-user", header = "Los Santos Trucking", txt = "Join Que", params = { event = "Polar-Mini:Client:Transfer"} } }
    --[[for i = 1, #Menus do
        local distance1 = GetDistanceBetweenCoords(Menus[i].loc.x, Menus[i].loc.y, Menus[i].loc.z, coords.x, coords.y, coords.z, false)
        local distance = distance1 * 0.0006
		local setheader = "" .. Menus[i].name .. ""
		local disable = false
        local hide = false
        menu[#menu+1] = { hidden = hide, disabled = disable, icon = Menus[i].icon, header = setheader, txt =" Distance: " .. math.floor(distance) .. " Miles Away " .. "<p>" .. "Payout $" .. Menus[i].amount .. "<p> Potential Exp " .. Menus[i].xp .. "", params = { event = "Polar-Mini:Client:Transfer", args = { location = Menus[i].loc, payamount = Menus[i].amount, xp = Menus[i].xp, pickloc = Menus[i].pickloc, trailermod = Menus[i].trailer} } }
		Wait(0)
	]]
	exports['qb-menu']:openMenu(menu)
    ---end

end)

RegisterNetEvent('Polar-Mini:Client:CancelTruckMenu', function()
    getexp()

    local menu = {
		{ header ="Current Truckers " .. playeramount .. "", txt =  "" .. exp .. " Trucking EXP" , icon = "fas fa-file-invoice-dollar", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } },
        { icon = "fa-solid fa-ban", hidden = hide, header = "", txt = "Cancel Route", params = { event = "Polar-Mini:Client:Cancel" } } }

  
   
	
	exports['qb-menu']:openMenu(menu)
    

end)



function startjob()
    getexp()
    math2()
    getmenu()
    if exports['qb-buffs']:HasBuff("luck") then
    random = math.random(15000,30000)
    else
    random = math.random(15000,30000)
    end

    --print(random)
    Wait(1000)
    Wait(random)
    local coords = GetEntityCoords(PlayerPedId())
    
    local distance1 = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, coords.x, coords.y, coords.z, false)
    local distance = distance1 * 0.0006
    -- loc is deliver
    -- pickloc is pickup location
    -- amount is Payout $
    -- xpp is xp you get
   -- pickup(loc, pickloc, amount, xpp, trailermod)
   local success = exports['qb-phone']:PhoneNotification("Los Santos Trucking"," " .. type .. " " .. math.floor(distance) .. " Miles - $ " .. amount .. " " , 'fas fa-file-invoice-dollar', '#b3e0f2', "NONE", 'fas fa-check-circle', 'fas fa-times-circle')
   if success then
    pickup()
    Wait(3000)
    TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Trucking', 'Head to Pickup The Trailer', 'fas fa-file-invoice-dollar', '#b3e0f2', '10000')
   else
        startjob()
   end


  
end

function pickup()
    RequestModel(trailer) while not HasModelLoaded(trailer) do  Wait(500) end
   
    trailervehicle = CreateVehicle(trailer, pickloc.x, pickloc.y, pickloc.z, pickloc.w, true, false)
   
    Wait(150)
   
    pickupb = AddBlipForEntity(trailervehicle)
    SetBlipSprite (pickupb, 479)
    SetBlipDisplay(pickupb, 6) 
    SetBlipScale  (pickupb, 0.6)
    SetBlipAsShortRange(pickupb, true)
    SetBlipColour(pickupb, 46)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Trailer")
    EndTextCommandSetBlipName(pickupb)
    Wait(100)
    SetBlipRoute(pickupb, true)
    SetBlipRouteColour(pickupb, 46)

    attachcheck()
  
    
end

function attachcheck()
    CreateThread(function()
        while true do
            Wait(1000)
            local trailercoords = GetEntityCoords(trailervehicle)
            local coords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, trailercoords.x, trailercoords.y, trailercoords.z)
           -- print(distance)

            if distance < 8 then
                local car = GetVehiclePedIsIn(PlayerPedId(), false)
                local mod = GetEntityModel(car)
             --   print(mod)
               
                startdrive()
                
                TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Trucking', 'Head to the Drop Off', 'fas fa-file-invoice-dollar', '#b3e0f2', '10000')
                break
            end
        end
    end)
end

function startdrive()

    dropoff = AddBlipForCoord(vec3(loc.x, loc.y, loc.z))
    SetBlipSprite (dropoff, 615)
    SetBlipDisplay(dropoff, 6) 
    SetBlipScale  (dropoff, 0.6)
    SetBlipAsShortRange(dropoff, true)
    SetBlipColour(dropoff, 46)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Dropoff")
    EndTextCommandSetBlipName(dropoff)
    Wait(100)
    SetBlipRoute(dropoff, true)
    SetBlipRouteColour(dropoff, 46)

    CreateThread(function()
        while true do
            Wait(1000)
            local trailercoords = GetEntityCoords(trailervehicle)
            local distance = GetDistanceBetweenCoords(loc.x, loc.y, loc.z, trailercoords.x, trailercoords.y, trailercoords.z)
           -- print(distance)
            if distance < 8 then
            
               
               
              --  exports['qb-core']:DrawText('[H] Drop Off Cargo', 'left')
                if IsControlReleased(0, 74) then
                    finish(amount, xpp)
                    exports['qb-core']:HideText()
                    TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Trucking', 'Head Back to the Depot', 'fas fa-file-invoice-dollar', '#b3e0f2', '10000')
                end
                break
            end
        end
    end)
end