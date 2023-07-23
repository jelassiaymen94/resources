local QBCore = exports['qb-core']:GetCoreObject()
CreateThread(function()
    spawnpeds()
    
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        spawnpeds()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    spawnpeds()
    
end)

function IsVehicleOwned(plate)
	local p = promise.new()
	QBCore.Functions.TriggerCallback('Polar-Dealership:Server:GetCars', function(cb) p:resolve(cb) end, plate)
    return Citizen.Await(p)
end
function trim(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

RegisterNetEvent('Polar-Dealership:Client:SellCar', function()
   
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local pp = GetEntityModel(vehicle)
    local vehicleHash = GetHashKey(vehicle)
    --print(vehicleHash)
    if IsPedInAnyVehicle(playerPed, false) then
        
    if not IsVehicleOwned(trim(GetVehicleNumberPlateText(vehicle))) then
        QBCore.Functions.Notify('You do not own this Vehicle', 'error', 3500)
    else
    local plate = GetVehicleNumberPlateText(vehicle)
    local money = 'cash' 
    QBCore.Functions.DeleteVehicle(vehicle)
    TriggerServerEvent('Polar-Dealership:Server:Sell', money, pp, plate)
    end
    else
        QBCore.Functions.Notify('Youre not in a car', 'error', 3500)
    end
end)

RegisterNetEvent('Polar-Dealership:Client:StoreCar', function()
   
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local pp = GetEntityModel(vehicle)
    local vehicleHash = GetHashKey(vehicle)
    --print(vehicleHash)
    if IsPedInAnyVehicle(playerPed, false) then
    
    local plate = GetVehicleNumberPlateText(vehicle)
    if plate == 'DELIVERY' then
       
   
    nameevent(vehicleHash)
    else  QBCore.Functions.Notify('Not a Dealer Car', 'error', 3500) end
    else
        QBCore.Functions.Notify('Youre not in a car', 'error', 3500)
    end
end)
function nameevent(vehicleHash)
    local input = exports['qb-input']:ShowInput({
        header = "Car Name",
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'carname',
                text = "Enter Car Hash"
            }
        }
    })
    if input then
        if not input.carname then return end
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)
        if GetHashKey(input.carname) == GetEntityModel(vehicle) then
           
            QBCore.Functions.DeleteVehicle(vehicle)
            TriggerServerEvent('Polar-Dealership:Server:StoreCar', input.carname)
        else
            QBCore.Functions.Notify("Invalid argument", "error", 2500)
        end
    end
end

function spawnpeds()

    exports['qb-target']:AddBoxZone('1',  vector4(-1288.1, -3043.17, -48.56, 86.38), 0.5, 0.5, { name =  '1', heading = 28.69, debug = false, minZ = -48.78-0.5, maxZ =  -48.78+0.5,}, 
    { options = {{ event = "Polar-Dealership:Client:OpenCarMenu", icon = "fa-solid fa-bolt", label = "Open Menu", job = 'cardealer' }}, distance = 4.5 }) 

    exports['qb-target']:SpawnPed({
        model = 'a_m_m_genfat_01',
        coords = vector4(-1287.84, -3040.71, -48.78, 264.96),
        minusOne = true,
        freeze = true,
        invincible = false,
        blockevents = true,
        scenario = 'PROP_HUMAN_SEAT_CHAIR',
        target = {
            options = {
            {
                type = "Client",
                icon = 'fa-solid fa-bolt',
                label = 'Open Menu',
                job = "cardealer",
               -- action = function()
               --     TriggerEvent('Polar-Dealership:Client:CryptoPartMenu')
               -- end,
               -- event = 'Polar-Dealership:Client:CryptoPartMenu',
               event = 'Polar-Dealership:Client:OpenCarMenu',
            }
            },
            distance = 4.5,
        },
    })
    

end

RegisterNetEvent('Polar-Dealership:Client:OpenCarMenu', function()


    exports['qb-menu']:openMenu({
        { 
            header = 'Import Management',
            icon = 'fa-solid fa-bolt',
            txt = "All your dealership Needs",
            isMenuHeader = true
        },
        {   
            icon = 'fa-solid fa-car"',
            header = "Sell Vehicle",
            txt = "Sell your import back to the dealership",
            params = { 
                event = "Polar-Dealership:Client:SellCar",
               
            }
        },
        {   
            icon = 'fa-solid fa-car"',
            header = "Store Car",
            txt = "Store Car to the Import Shelves",
            params = { 
                event = "Polar-Dealership:Client:StoreCar",
               
            }
        },
        {   
            icon = 'fa-solid fa-sack-dollar',
            header = "Open Management Menu",
            txt = "Order & Money Management",
            params = { 
                event = "Polar-Dealership:Client:BossMenu",
               
            }
        },
        {   
            icon = 'fa-solid fa-book',
            header = "Floor Management",
            txt = "Manage the Sales Floor",
            params = { 
                event = "Polar-Dealership:Client:ShowRoom",
               
            }
        },
          
    })


end)











