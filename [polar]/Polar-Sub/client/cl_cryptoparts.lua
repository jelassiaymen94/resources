local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    --hi2()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        hi2()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    hi2()
    
end)

function hi2()

for i = 1, #Config.Peds do
    exports['qb-target']:SpawnPed({
        model = Config.Peds[i].model,
        coords = Config.Peds[i].coords,
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
               event = 'Polar-Sub:Client:CryptoMenu',
            }
            },
            distance = 2.5,
        },
    })

end
end
RegisterNetEvent('Polar-Sub:Client:Anim', function(data)
    items = data.item
    cryptos = data.crypto
    amounts = data.amount
    if Config.Debug then
        print('check')
        print(data.item)
        print(data.crypto)
        print(data.amount)
        print(items)
        print(cryptos)
        print(amounts)

    end
    TriggerServerEvent('Polar-Sub:Server:CheckCrypto', items, cryptos, amounts)

end)
RegisterNetEvent('Polar-Sub:Client:Anim2', function(items, cryptos, amounts)
       
        if Config.Debug then
            print('anim')
            print(items)
            print(cryptos)
            print(amounts)
    
        end
   
     

        pp = math.random(1,100)
        if pp < 50 then
            emote = 'argue2'
        elseif pp < 101 then
            emote = 'argue3'
        elseif pp < 75 then
            emote = 'argue4'
        else
            emote = 'argue5'
        end
        Wait(5)
       
        TriggerEvent('animations:Client:EmoteCommandStart', {emote})
    QBCore.Functions.Progressbar("hi", "Sending " .. amounts .. " Crypto... ", 2500, false, true, 
    {disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
    {}, {}, {}, 
    function() -- Done

     
        
        TriggerEvent('animations:Client:EmoteCommandStart', {"c"})
        TriggerServerEvent('Polar-Sub:Server:RemoveCrypto', items, cryptos, amounts)
      

    end, function()
        TriggerEvent('animations:Client:EmoteCommandStart', {"c"})
        -- cancel notification
        QBCore.Functions.Notify('Canceled', 'error')

        -- debug
        if Config.Debug then print('canceled') end

    end)  
   

end)

          
RegisterNetEvent('Polar-Sub:Client:CryptoMenu', function(data)

	
	local menu = {
		{ header = "Crypto Exchange", txt = "", icon = "fa-brands fa-bitcoin", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }

for i = 1, #Config.Menu do
	
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[Config.Menu[i].item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[Config.Menu[i].item].label
		local disable = false
        local hide = false
        menu[#menu+1] = { hidden = hide, disabled = disable, icon = Config.Menu[i].icon, header = setheader, txt = Config.Menu[i].text, params = { event = "Polar-Sub:Client:Anim", args = { item = Config.Menu[i].item, crypto = Config.Menu[i].crypto, amount =  Config.Menu[i].amount} } }
		Wait(0)
	
	exports['qb-menu']:openMenu(menu)
    end
end)

