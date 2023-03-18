QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = false
local PlayerData = {}
local ClosestTraphouse = nil




Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}



CreateThread(function()
    Wait(1000)
    if QBCore.Functions.GetPlayerData() ~= nil then
        isLoggedIn = true
        PlayerData = QBCore.Functions.GetPlayerData()
        QBCore.Functions.TriggerCallback('Polar-Pawnshop:server:GetTraphousesData', function(trappies)
            Config.Pawnshop = trappies
        end)
    end
    targets()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerData = QBCore.Functions.GetPlayerData()
    QBCore.Functions.TriggerCallback('Polar-Pawnshop:server:GetTraphousesData', function(trappies)
        Config.Pawnshop = trappies
    end)
    targets()
end)

RegisterNetEvent('Polar-Pawnshop:client:SyncData')
AddEventHandler('Polar-Pawnshop:client:SyncData', function(k, data)
    Config.Pawnshop[k] = data
end)



function targets()
    props()
    
    exports['qb-target']:AddBoxZone("hi", vector3(157.47, -1316.6, 29.5), 1, 1, {
        name = "hi",
        heading = 145.5,
        debug = true,
            minZ = 29.4,
            maxZ =  30,
        }, {
            options = {
                {
                    type = "client",
                    event = "Polar-Pawnshop:client:Startup",
                    icon = "fa-solid fa-bolt",
                    label = "Open",
                    job = 'pawnshop',
                   -- excludejob = 'police'
                },
                {
                    type = "client",
                    event = "Polar-Pawnshop:client:Grab",
                    icon = "fa-solid fa-dollar",
                    label = " Grab Money ",
                    job = 'pawnshop',
                   -- excludejob = 'police'
                }
            },
            distance = 0.55
        })
      
        
end
function props()

    local prop = CreateObject(GetHashKey("v_serv_abox_g3"), vector3(157.7, -1317.3, 28.2), true, false, false)
  
    FreezeEntityPosition(prop, true)

end
RegisterNetEvent('Polar-Pawnshop:client:Startup', function()
    local data = Config.Pawnshop[99]

    local TraphouseInventory = {}
    TraphouseInventory.label = "Pawnshop Safe"
    TraphouseInventory.items = data.inventory
    TraphouseInventory.slots = 5
    TriggerServerEvent("inventory:server:OpenInventory", "traphouse", 99, TraphouseInventory)


end)
RegisterNetEvent('Polar-Pawnshop:client:Grab', function()



    TriggerServerEvent("Polar-Pawnshop:server:TakeMoney", 99)


end)
CreateThread(function()
    Wait(7000)
    while true do
        Wait(1)
               
        local data = Config.Pawnshop[99]
              
    end
end)
