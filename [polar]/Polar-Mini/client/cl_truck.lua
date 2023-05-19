local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    --start()
    -- getmenu()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        start()
        getmenu()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    start()
    getmenu()
end)




function start()

    for i = 1, #Config.TruckPeds do
        exports['qb-target']:SpawnPed({
            model = Config.TruckPeds[i].model,
            coords = Config.TruckPeds[i].coords,
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


RegisterNetEvent('Polar-Mini:Client:TruckMenu2', function()
    TriggerEvent('Polar-Mini:Client:TruckMenu')

end)

function getmenu()
    local chance = math.random(1,100)
    if chance < 25 then
        Menus = {
            [1] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vec(),
                amount = 55,
        
            },






        }

   -- elseif chance < 50 then
        

 --   elseif chance < 75 then
        

    else
        Menus = {
            [1] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vec(),
                amount = 55,
        
            },
            [2] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vec(),
                amount = 55,
        
            },
            [3] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vec(),
                amount = 55,
        
            },



        }

    end
end



RegisterNetEvent('Polar-Mini:Client:Transfer', function(args)



end)



RegisterNetEvent('Polar-Mini:Client:TruckMenu', function()

	
	local menu = {
		{ header = "Truck Missions", txt = "", icon = "fa-solid fa-bolt", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }

    for i = 1, #Menus do
	
		local setheader = "" .. Menus[i].name .. ""
		local disable = false
        local hide = false
        menu[#menu+1] = { hidden = hide, disabled = disable, icon = Menus[i].icon, header = setheader, txt = Menus[i].text .. " then " .. Menus[i].loc .. " next " .. Menus[i].amount .. " ", params = { event = "Polar-Mini:Client:Transfer", args = { location = Menus[i].loc, payamount = Menus[i].amount} } }
		Wait(0)
	
	exports['qb-menu']:openMenu(menu)
    end

end)
