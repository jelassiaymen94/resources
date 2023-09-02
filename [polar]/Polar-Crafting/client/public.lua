local QBCore = exports['qb-core']:GetCoreObject()


local playerPed = PlayerPedId()


local src = source



local headers = 'Dis a Bench'


local exp = nil

function GetHeader()
   
    local PlayerData = QBCore.Functions.GetPlayerData()
    if Config.Debug then print('getting header') end
    exp = PlayerData.metadata["craftingrep"] or 0
    TriggerServerEvent('Polar-Crafting:Server:GiveEXP', exp)
    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:Header', function(header)
        headers = header
    end)

end






function weapons()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local weaponmenu = {
		{ header = "Weapons Bench", txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
        local disable = false
        local hide = false
        if PlayerData.metadata["craftingrep"] < Config.WeaponsBenchmin then 
            --print('po')
            weaponmenu[#weaponmenu+1] = { hidden = hide, disabled = disable, icon = "", header = "You Don't Have enough Exp", txt = "Required: " .. Config.WeaponsBenchmin .. " exp"}
            Wait(0)
            exports['qb-menu']:openMenu(weaponmenu)
        else
    for i = 1, #Config.WeaponsBench do
        local requiredItems = "" 
        for _, data in ipairs(Config.WeaponsBench[i].required) do 
            requiredItems = requiredItems .. "<p> <img src=nui://" .. Config.img .. QBCore.Shared.Items[data[1]].image .. " width=25px onerror='this.onerror=null; this.remove();'> " .. data[2] .. " " .. QBCore.Shared.Items[data[1]].label
        end 
            local item = Config.WeaponsBench[i].item
            local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[item].label
            local disable = false
            local hide = true
              
            if PlayerData.metadata["craftingrep"] >= Config.WeaponsBench[i].exp then hide = false end
               
            weaponmenu[#weaponmenu+1] = { hidden = hide, disabled = disable, icon = Config.WeaponsBench[i].icon, header = setheader, txt = "Required: " .. requiredItems, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.WeaponsBench[i].item, requires = Config.WeaponsBench[i].required, give = Config.WeaponsBench[i].give, exp = Config.WeaponsBench[i].exp, giveexp = Config.WeaponsBench[i].giveexp} } }
            Wait(0)
            end
        exports['qb-menu']:openMenu(weaponmenu)
    end
end



function ammo()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local ammomenu = {
		{ header = "Ammunition Bench", txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
        local disable = false
        local hide = false
        if PlayerData.metadata["craftingrep"] < Config.AmmoBenchmin then 
            ammomenu[#ammomenu+1] = { hidden = hide, disabled = disable, icon = "", header = "You Don't Have enough Exp", txt = "Required: " .. Config.AmmoBenchmin .. " exp"}
            Wait(0)
	        exports['qb-menu']:openMenu(ammomenu)
        else
 for i = 1, #Config.AmmoBench do
        local requiredItems = "" 
        for _, data in ipairs(Config.AmmoBench[i].required) do 
            requiredItems = requiredItems .. "<p> <img src=nui://" .. Config.img .. QBCore.Shared.Items[data[1]].image .. " width=25px onerror='this.onerror=null; this.remove();'> " .. data[2] .. " " .. QBCore.Shared.Items[data[1]].label
        end 
        local item = Config.AmmoBench[i].item
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[item].label
		local disable = false
        local hide = true
      
        if PlayerData.metadata["craftingrep"] >= Config.AmmoBench[i].exp then hide = false end
       -- print(exp)
       ammomenu[#ammomenu+1] = { hidden = hide, disabled = disable, icon = Config.AmmoBench[i].icon, header = setheader, txt = "Required: " .. requiredItems, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.AmmoBench[i].item} } }
		Wait(0)
        end
	exports['qb-menu']:openMenu(ammomenu)
    end
end



function bencher(bench, minimum)
   
    print(minimum)
    local PlayerData = QBCore.Functions.GetPlayerData()
	local menutable = {
		{ header = "Crafting Bench", txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
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
               -- print(exp)
               menutable[#menutable+1] = { hidden = hide, disabled = disable, icon = bench[i].icon, header = setheader, txt = "Required: " .. requiredItems, params = { event = "Polar-Crafting:Client:Transfer",args = { item = bench[i].item, requires = bench[i].required, give = bench[i].give, exp = bench[i].exp, giveexp = bench[i].giveexp} } }
                Wait(0)
                end
            exports['qb-menu']:openMenu(menutable)
            end
end





function tools()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local toolsmenu = {
		{ header = "Tools Bench", txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
    if PlayerData.metadata["craftingrep"] < Config.ToolsBenchmin then 
            local disable = false
            local hide = false
            toolsmenu[#toolsmenu+1] = { hidden = hide, disabled = disable, icon = "", header = "You Don't Have enough Exp", txt = "Required: " .. Config.ToolsBenchmin .. " exp"}
            Wait(0)
            exports['qb-menu']:openMenu(toolsmenu)
    else
    for i = 1, #Config.ToolsBench do
        local requiredItems = "" 
        for _, data in ipairs(Config.ToolsBench[i].required) do 
            requiredItems = requiredItems .. "<p> <img src=nui://" .. Config.img .. QBCore.Shared.Items[data[1]].image .. " width=25px onerror='this.onerror=null; this.remove();'> " .. data[2] .. " " .. QBCore.Shared.Items[data[1]].label
        end 
        local item = Config.ToolsBench[i].item
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[item].label
		local disable = false
        local hide = true
      
        if PlayerData.metadata["craftingrep"] >= Config.ToolsBench[i].exp then hide = false end
       -- print(exp)
       toolsmenu[#toolsmenu+1] = { hidden = hide, disabled = disable, icon = Config.ToolsBench[i].icon, header = setheader, txt = "Required: " .. requiredItems, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.ToolsBench[i].item} } }
		Wait(0)
        end
	exports['qb-menu']:openMenu(toolsmenu)
    end
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
    local bench = Config.AmmoBench
    local minimum = data.minimum 
    bencher(bench, minimum) 
end)

