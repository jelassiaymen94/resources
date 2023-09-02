local QBCore = exports['qb-core']:GetCoreObject()


local playerPed = PlayerPedId()


local src = source




function bencher(bench, minimum, textname)
    if bench == "Config.WeaponsBench" then bench = Config.WeaponsBench end
    if bench == nil then print('bench = nil') return end
    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:Header', function(headers)
        if headers then
    local PlayerData = QBCore.Functions.GetPlayerData()
	local menutable = {
		{ header = textname, txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = headers, txt = "Close", params = { event = "Menu:Close" } } }
        local disable = false
        local hide = false
    if PlayerData.metadata["craftingrep"] < minimum then 
            menutable[#menutable+1] = { hidden = hide, disabled = disable, icon = "", header = "You Don't Have enough Exp", txt = "Required: " .. minimum .. " exp"}
            Wait(0)
            exports['qb-menu']:openMenu(menutable)
    else
        for i = 1, #bench do
                local requiredItems = "" 
                for _, data in ipairs(bench[i].required) do 
                    requiredItems = requiredItems .. "<p> <img src=nui://" .. Config.img .. QBCore.Shared.Items[data[1]].image .. " width=25px onerror='this.onerror=null; this.remove();'> " .. data[2] .. " " .. QBCore.Shared.Items[data[1]].label
                end 
                local item = bench[i].item
                local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[item].label
                local disable = false
                local hide = true
              
                if PlayerData.metadata["craftingrep"] >= bench[i].exp then hide = false end
              
                menutable[#menutable+1] = { hidden = hide, disabled = disable, icon = bench[i].icon, header = setheader, txt = "Required: " .. requiredItems, params = { event = "Polar-Crafting:Client:Transfer",args = { item = bench[i].item, requires = bench[i].required, give = bench[i].give, exp = bench[i].exp, giveexp = bench[i].giveexp} } }
                Wait(0)
                end
        exports['qb-menu']:openMenu(menutable)
    end
    end
    end)
end




RegisterNetEvent('Polar-Crafting:Client:Anim', function(item)
    
    local itemname = QBCore.Shared.Items[item].label
    QBCore.Functions.Progressbar("crafting", "Crafting " .. itemname .. " ", 7500, false, true, 
    {disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
    {animDict = "mini@repair", anim = "fixing_a_ped", flags = 0,}, {}, {}, 
    function() -- Done

     
    


    end, function()

        -- cancel notification
        QBCore.Functions.Notify('Canceled', 'error')

        -- debug
        if Config.Debug then print('canceled') end

    end)  


end)




RegisterNetEvent('Polar-Crafting:Client:OpenMenuPublic', function(data)  
    local bench = data.benches
    local minimum = data.minimum 
    local name = data.bigname
    bencher(bench, minimum, name) 
end)

