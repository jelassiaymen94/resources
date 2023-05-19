local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    start()
    getmenu()
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


TruckPeds = {
    [1] = {
        coords = vector4(-118.74, 6455.69, 31.39, 315.65),
        model = "a_m_m_genfat_01",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Amir',
    },

}

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


RegisterNetEvent('Polar-Mini:Client:TruckMenu2', function()
    getexp()
    TriggerEvent('Polar-Mini:Client:TruckMenu')

end)
local exp = nil
function getexp()

    local PlayerData = QBCore.Functions.GetPlayerData()
    exp = PlayerData.metadata["trucker"] or 0
    TriggerServerEvent('Polar-Mini:Server:SetTruckerExp', xxp)


end


function getmenu()
    local chance = math.random(1,100)
    if chance < 25 then
        Menus = {
            [1] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
                xp = math.random(1,25)
            },






        }

    elseif chance < 50 then
        Menus = {
            [1] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
                xp = math.random(1,25)
        
            },
            [2] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
                xp = math.random(1,25)
            },





        }

    elseif chance < 75 then
        Menus = {
            [1] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
                xp = math.random(1,25)
            },
            [2] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
                xp = math.random(1,25)
        
            },
            [3] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
                xp = math.random(1,25)
        
            },





        }

    else
        Menus = {
            [1] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
        
            },
            [2] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
        
            },
            [3] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
        
            },
            [4] = {
                name = 'Pillbox Medical',
                icon = "",
                text = 'Required: A Truck',
                loc = vector4(-1279.64, 5251.13, 51.87, 148.89),
                amount = 55,
        
            },



        }

    end
end
local xpp = nil local loc = nil local amount = nil
RegisterNetEvent('Polar-Mini:Client:Transfer', function(data)

    
    xpp = data.xp
    loc = data.location
    amount = data.payamount
    print(xpp) -- xp amount given
    print(loc) -- pickup location
    print(amount) -- pay amount

end)


RegisterNetEvent('Polar-Mini:Client:TruckMenu', function()

	local coords = GetEntityCoords(PlayerPedId())
   
	local menu = {
		{ header = " EXP : " .. exp .. "" , txt = "", icon = "fa-solid fa-bolt", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }

    for i = 1, #Menus do
        local distance1 = GetDistanceBetweenCoords(Menus[i].loc.x, Menus[i].loc.y, Menus[i].loc.z, coords.x, coords.y, coords.z, false)
        local distance = distance1 / 1000
		local setheader = "" .. Menus[i].name .. ""
		local disable = false
        local hide = false
        menu[#menu+1] = { hidden = hide, disabled = disable, icon = Menus[i].icon, header = setheader, txt = " Distance: " .. math.floor(distance) .. "m away " .. "<p>" .. "Payout $" .. Menus[i].amount .. " ", params = { event = "Polar-Mini:Client:Transfer", args = { location = Menus[i].loc, payamount = Menus[i].amount, xp = Menus[i].xp} } }
		Wait(0)
	
	exports['qb-menu']:openMenu(menu)
    end

end)
