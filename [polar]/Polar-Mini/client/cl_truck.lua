local QBCore = exports['qb-core']:GetCoreObject()

local TruckPeds = {
    [1] = {
        coords = vector4(-118.74, 6455.69, 31.39, 315.65),
        model = "a_m_m_genfat_01",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Amir',
    },

}

local xpp = nil local loc = nil local amount = nil local pickloc = nil
local trailervehicle = nil local pickupb = nil local trailermod = nil local trailer = nil
local lastjob = nil local dropoff = nil
local hide = true
local playeramount = 0
local onjob = false
local onRoute = false
local text = nil local icon = nil local name = nil local xp = nil

function blip()
  
    local blip = AddBlipForCoord(vec3(TruckPeds[1].coords.x, TruckPeds[1].coords.y, TruckPeds[1].coords.z)) SetBlipSprite (blip, 477) SetBlipDisplay(blip, 6) SetBlipScale (blip, 0.6) SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 39) BeginTextCommandSetBlipName("STRING") AddTextComponentSubstringPlayerName('Los Santos Trucking') EndTextCommandSetBlipName(blip)
 
end

CreateThread(function()
    start()
    getmenu()
  --  blip()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        start()
        getmenu()
        blip()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    start()
    getmenu()
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
                    icon = 'fa-solid fa-bolt',
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

local Menus = {}

function getjob()

    local PlayerJob = QBCore.Functions.GetPlayerData().job
    lastjob = PlayerJob.name
    
  
end
RegisterNetEvent('Polar-Mini:Client:TruckMenu2', function()
    getexp()
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
function finish(amount, xxp)
    print(amount)
    print(xxp)
    SetEntityAsNoLongerNeeded(trailervehicle)
    RemoveBlip(pickupb)
    RemoveBlip(dropoff)
    TriggerServerEvent('Polar-Mini:Server:SetTruckerExp', xxp)
    TriggerServerEvent('Polar-Mini:Server:Amount', amount)


end

function getmenu()
    if math.random(1,100) < 25 then
    
        name = 'Pillbox Medical Delivery'
        icon = ""
        text = 'Required: A Truck'
        loc = vector4(281.14, -589.6, 17.91, 171.16)
        amount = math.random(500,1000)
        xp = math.random(1,25)
        pickloc = vector4(-1243.13, -1508.28, 4.45, 199.23)
        trailer = 'trailers'
        
    
    else

            name = 'Smoke On The Water Route'
            icon = ""
            text = 'Required: A Truck'
            loc = vector4(-1227.31, -1504.08, 4.27, 171.16)
            amount = math.random(500,1000)
            xp = math.random(1,25)
            pickloc = vector4(-1243.13, -1508.28, 4.45, 199.23)
            trailer = 'tvtrailer'
     
    end
end

RegisterNetEvent('Polar-Mini:Client:Transfer', function(data)
    
    trailermod = data.trailermod
    xpp = data.xp
    pickloc = data.pickloc
    loc = data.location
    amount = data.payamount
  --  print(xpp) -- xp amount given
  --  print(loc) -- pickup location
 --   print(amount) -- pay amount
    getjob()
    onRoute = true
    hide = false
    TriggerServerEvent('Polar-Mini:Server:SetPlayerUp', 1)
    TriggerServerEvent('Polar-Mini:Server:GiveJob')
    startjob(loc, pickloc, amount, xpp, trailermod)
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

	local coords = GetEntityCoords(PlayerPedId())
   
	local menu = {
		{ header ="Current Truckers " .. playeramount .. "", txt =  "" .. exp .. " Trucking EXP" , icon = "fa-solid fa-truck", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } },
       -- { icon = "fa-solid fa-ban", hidden = hide, header = "", txt = "Cancel Route", params = { event = "Polar-Mini:Client:Cancel" } } }

       { icon = "fa-solid fa-user", header = "Los Santos Trucking", txt = "Join Que", params = { event = "Polar-Mini:Client:Transfer", args = { location = Menus[i].loc, payamount = Menus[i].amount, xp = Menus[i].xp, pickloc = Menus[i].pickloc, trailermod = Menus[i].trailer} } } }
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


    local menu = {
		{ header ="Current Truckers " .. playeramount .. "", txt =  "" .. exp .. " Trucking EXP" , icon = "fa-solid fa-truck", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } },
        { icon = "fa-solid fa-ban", hidden = hide, header = "", txt = "Cancel Route", params = { event = "Polar-Mini:Client:Cancel" } } }

  
   
	
	exports['qb-menu']:openMenu(menu)
    

end)



function startjob(loc, pickloc, amount, xpp, trailermod)
    -- loc is deliver
    -- pickloc is pickup location
    -- amount is Payout $
    -- xpp is xp you get
   -- pickup(loc, pickloc, amount, xpp, trailermod)
   local success = exports['qb-phone']:PhoneNotification("Los Santos Trucking", 'Contract', 'fas fa-file-invoice-dollar', '#b3e0f2', "NONE", 'fas fa-check-circle', 'fas fa-times-circle')
   if success then
    pickup(loc, pickloc, amount, xpp, trailermod)
   else
      print('declined')
   end
    

  --  finish(xpp)
end

function pickup(loc, pickloc, amount, xpp, trailer)
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

    attachcheck(loc, amount, xpp)
  
    
end

function attachcheck(loc, amount, xpp)
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
               
                startdrive(loc, amount, xpp)
                QBCore.Functions.Notify('Head to the Drop Off', 'success', 2500)
                TriggerEvent('qb-phone:client:CustomNotification', 'Los Santos Trucking', 'Head to the Drop Off', 'fas fa-map-pin', '#b3e0f2', '1000')
                break
            end
        end
    end)
end

function startdrive(loc, amount, xpp)

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
            --print(distance)
            if distance < 8 then
            
               
               
                exports['qb-core']:DrawText('[H] Drop Off Cargo', 'left')
                if IsControlPressed(0, 74) then
                    finish(amount, xpp)
                    exports['qb-core']:HideText()
                end
                break
            end
        end
    end)
end