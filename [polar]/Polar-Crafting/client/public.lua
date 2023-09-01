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
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[Config.WeaponsBench[i].item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[Config.WeaponsBench[i].item].label
		local disable = false
        local hide = true
        if PlayerData.metadata["craftingrep"] >= Config.WeaponsBench[i].exp then hide = false end
       -- print(exp)
        weaponmenu[#weaponmenu+1] = { hidden = hide, disabled = disable, icon = Config.WeaponsBench[i].icon, header = setheader, txt = Config.WeaponsBench[i].txt, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.WeaponsBench[i].item} } }
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
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[Config.AmmoBench[i].item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[Config.AmmoBench[i].item].label
        local disable = false
        local hide = true
        if PlayerData.metadata["craftingrep"] >= Config.AmmoBench[i].exp then hide = false end
       -- print(exp)
       ammomenu[#ammomenu+1] = { hidden = hide, disabled = disable, icon = Config.AmmoBench[i].icon, header = setheader, txt = Config.AmmoBench[i].txt, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.AmmoBench[i].item} } }
		Wait(0)
        end
	exports['qb-menu']:openMenu(ammomenu)
    end
end



function explosives()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local explosivesmenu = {
		{ header = "Explosives Bench", txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
        local disable = false
        local hide = false
        if PlayerData.metadata["craftingrep"] < Config.ExplosivesBenchmin then 
            explosivesmenu[#explosivesmenu+1] = { hidden = hide, disabled = disable, icon = "", header = "You Don't Have enough Exp", txt = "Required: " .. Config.ExplosivesBenchmin .. " exp"}
            Wait(0)
            exports['qb-menu']:openMenu(explosivesmenu)
        else
for i = 1, #Config.ExplosivesBench do
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[Config.ExplosivesBench[i].item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[Config.ExplosivesBench[i].item].label
        local disable = false
        local hide = true
        if PlayerData.metadata["craftingrep"] >= Config.ExplosivesBench[i].exp then hide = false end
       -- print(exp)
       explosivesmenu[#explosivesmenu+1] = { hidden = hide, disabled = disable, icon = Config.ExplosivesBench[i].icon, header = setheader, txt = Config.ExplosivesBench[i].txt, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.ExplosivesBench[i].item} } }
		Wait(0)
        end
	exports['qb-menu']:openMenu(explosivesmenu)
    end
end

local items = {
    steel = 5,
    metalscrap = 10,
    rubber = 3,
}




function tools()
    local texes = nil
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
    for item, quantity in pairs(items) do
        texes = string.format("<p> <img src=nui://%s%s width=25px onerror='this.onerror=null; this.remove();'> %d %s", Config.img, QBCore.Shared.Items[item].image, quantity, QBCore.Shared.Items[item].label)
    end
for i = 1, #Config.ToolsBench do
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[Config.ToolsBench[i].item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[Config.ToolsBench[i].item].label
		local disable = false
        local hide = true
      
        if PlayerData.metadata["craftingrep"] >= Config.ToolsBench[i].exp then hide = false end
       -- print(exp)
       toolsmenu[#toolsmenu+1] = { hidden = hide, disabled = disable, icon = Config.ToolsBench[i].icon, header = setheader, txt = "Required: " .. texes, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.ToolsBench[i].item} } }
		Wait(0)
        end
	exports['qb-menu']:openMenu(toolsmenu)
    end
end 



function store()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local storemenu = {
		{ header = "Store Bench", txt = "", icon = "", isMenuHeader = true },
		{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
        if PlayerData.metadata["craftingrep"] < Config.StoreBenchmin then 
            local disable = false
            local hide = false
            storemenu[#storemenu+1] = { hidden = hide, disabled = disable, icon = "", header = "You Don't Have enough Exp", txt = "Required: " .. Config.StoreBenchmin .. " exp"}
            Wait(0)
            exports['qb-menu']:openMenu(storemenu)
        else
for i = 1, #Config.StoreBench do
		local setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[Config.StoreBench[i].item].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items[Config.StoreBench[i].item].label
		local disable = false
        local hide = true
      
        if PlayerData.metadata["craftingrep"] >= Config.StoreBench[i].exp then hide = false end
       -- print(exp)
       storemenu[#storemenu+1] = { hidden = hide, disabled = disable, icon = Config.StoreBench[i].icon, header = setheader, txt = Config.StoreBench[i].txt, params = { event = "Polar-Crafting:Client:Transfer", args = { item = Config.StoreBench[i].item} } }
		Wait(0)
        end
	exports['qb-menu']:openMenu(storemenu)
    end
end


RegisterNetEvent('Polar-Crafting:Client:Anim', function(item)
    
    local itemname = QBCore.Shared.Items[item].label
    QBCore.Functions.Progressbar("crafting", "Crafting " .. itemname .. " ", 13500, false, true, 
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
   type = data.type
   
   if type == 'weapons' then
    GetHeader()
    Wait(50)
    Wait(50)
   TriggerEvent('Polar-Crafting:Client:WeaponsBench')
   elseif type == 'ammo' then
    GetHeader()
    Wait(50)
    Wait(50)
    ammo()
   elseif type == 'tools' then
    GetHeader()
    Wait(50)
    Wait(50)
    tools()
elseif type == 'store' then
    GetHeader()
    Wait(50)
    Wait(50)
    store()
   elseif type == 'explosives' then
  --xpcheck()
  GetHeader()
  Wait(50)
  Wait(50)
  explosives()
   else
    print('error')
   end
end)

local gang = nil
local GangName = nil
function GetGang()

    

  
        QBCore.Functions.TriggerCallback('Polar-Crafting:Server:GetGang', function(number)
            gang = number
    
            Wait(50)
    
            if gang == 1 then 
                GangName = 'Lost MC'
            elseif gang == 2 then
                GangName = 'Cartel'
            elseif gang == 3 then
                GangName = 'Scrap'
            elseif gang == 4 then
                GangName = 'GSF'
            elseif gang == 5 then
                GangName = 'triads'
            elseif gang == 6 then
                GangName = 'Scalleta Family'
            else 
               
            end
        end)
    
       
  

end
RegisterNetEvent('Polar-Crafting:Client:WeaponsBench', function()
    --GetHeader()

   
    exports['qb-menu']:openMenu({
        { 
            header = "Bench",
            txt = "" .. headers .. "",
            icon = "fas fa-bench",
            isMenuHeader = true
        },
        {
            header = "Weapons",
            txt = "Highly Advanced Weaponry to Your Disposal",
            icon = "fas fa-gun",
            params = { 
                event = "Polar-Crafting:Client:CraftWeapons",
                
            }
        },
        {
            header = "Items",
            txt = "What can we make here?",
            icon = "fas fa-mask",
             -- hidden = true,
            params = { 
                event = "Polar-Crafting:Client:Gang",
               
            }
        },

    })

end)
RegisterNetEvent('Polar-Crafting:Client:CraftWeapons', function()

    weapons()

end)
RegisterNetEvent('Polar-Crafting:Client:Gang', function()

     --xpcheck()
     GetGang()
     Wait(50)
     GetHeader()
     Wait(50)
     Wait(50)
     gangbench()


end)
function gangbench()

    local hi = true
    if hi then return end

    if exp <= 199 or gang == nil then
        -- 1 2 3 
       
        exports['qb-menu']:openMenu({
            { 
                header = 'Bench',
                txt = "" .. headers .. "",
                isMenuHeader = true
            },
            {
                header = "You Don't Have enough Exp",
                txt = "Required: 30000 exp",
                isMenuHeader = true,
                
            },
            {
                header = "",
                txt = "You also have to be in a gang to Craft Here",
                isMenuHeader = true
            },
        })
    
    elseif gang == 1 then -- lostmc
         -- 4
         exports['qb-menu']:openMenu({
            { 
                header = " <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_assaultrifle2'].image.." width=25px onerror='this.onerror=null; this.remove();'>" .. " Lost MC Bench",
                txt = "" .. headers .. "",
                isMenuHeader = true
            },
            {
                header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapon_machinepistol'].image.." width=25px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_machinepistol'].label,
                txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 6 Gold Bars".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Cloth" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Rubber" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Body" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Refined Aluminum",
                params = { 
                    event = "Polar-Crafting:Client:MachinePistol",
                   
                }
            },
            {
                header = "<img src=nui://"..Config.img..QBCore.Shared.Items['gusenberg_extendedclip'].image.." width=25px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_machinepistol'].label,
                txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Gold Bars".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Refined Aluminum ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ducttape'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Duct Tape",
                params = { 
                    event = "Polar-Crafting:Client:GusenBergClip",
                   
                }
            },
        })
    elseif gang == 2 then -- cartel
        -- 4
        exports['qb-menu']:openMenu({
           { 
               header = " <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_assaultrifle2'].image.." width=25px onerror='this.onerror=null; this.remove();'>" .. " Cartel Bench",
               txt = "" .. headers .. "",
               isMenuHeader = true
           },
          
       })
    elseif gang == 3 then -- scrappgang
        -- 4
        exports['qb-menu']:openMenu({
           { 
               header =  " <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_assaultrifle2'].image.." width=25px onerror='this.onerror=null; this.remove();'>" .. " Scrap Bench",
               txt = "" .. headers .. "",
               isMenuHeader = true
           },
           {
               header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapon_minismg'].image.." width=25px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_minismg'].label,
               txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Gold Bars".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Cloth" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Rubber" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Body" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Refined Aluminum",
               params = { 
                   event = "Polar-Crafting:Client:MiniSmg",
                   
                  
               }
               
           },
           {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapontint_gold'].image.." width=25px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapontint_gold'].label,
            txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Gold Bars".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 4 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ducttape'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Duct Tape",
            params = { 
                event = "Polar-Crafting:Client:GoldTint",
               
            }
        },
       })
    elseif gang == 4 then -- gsf
        -- 4
        exports['qb-menu']:openMenu({
           { 
               header =  " <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_assaultrifle2'].image.." width=25px onerror='this.onerror=null; this.remove();'>" .. " GSF Bench",
               txt = "" .. headers .. "",
               isMenuHeader = true
           },
           {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapon_microsmg3'].image.." width=45px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_microsmg3'].label,
            txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Refined Aluminum".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Refined Steel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbarrel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Barrel".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smgbody'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Body".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['smggrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Smg Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=30px onerror='this.onerror=null; this.remove();'> 2 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ducttape'].image.." width=25px onerror='this.onerror=null; this.remove();'> 6 Duct Tape".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Cloth",
            params = { 
                event = "Polar-Crafting:Client:32",
               
            }
            },
           {
               header = "<img src=nui://"..Config.img..QBCore.Shared.Items['pistol_extendedclip'].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['pistol_extendedclip'].label,
               txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 10 Iron".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_aluminum'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Refined Aluminum ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Rubber",
               params = { 
                   event = "Polar-Crafting:Client:PistolClip",
                  
               }
           },
       })
    elseif gang == 5 then -- triads
        -- 4
        exports['qb-menu']:openMenu({
           { 
               header =  " <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_assaultrifle2'].image.." width=25px onerror='this.onerror=null; this.remove();'>" .. " Triads Bench",
               txt = "" .. headers .. "",
               isMenuHeader = true
           },
           {
               header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapon_katana'].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_katana'].label,
               txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['iron'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Iron".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_steel'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Refined Steel ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Rubber" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Gold Bars" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ducttape'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Duct Tape" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Cloth",
               params = { 
                   event = "Polar-Crafting:Client:Katana",
                  
               }
           },
           {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['microsmg_extendedclip'].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_katana'].label,
            txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['refined_plastic'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Refined Plastic".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Rubber ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Carbon" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Gold Bars" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ducttape'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Duct Tape",
            params = { 
                event = "Polar-Crafting:Client:SmgClip",
               
            }
        },
       })
    elseif gang == 6 then -- scalletagang
        -- 4
        exports['qb-menu']:openMenu({
           { 
               header =  " <img src=nui://"..Config.img..QBCore.Shared.Items['weapon_assaultrifle2'].image.." width=25px onerror='this.onerror=null; this.remove();'>" .. " Scalletta Bench",
               txt = "" .. headers .. "",
               isMenuHeader = true
           },
           {
               header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapon_gusenberg'].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapon_gusenberg'].label,
               txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 15 Gold Bars".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['carbon'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Carbon".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['riflegrip'].image.." width=25px onerror='this.onerror=null; this.remove();'> 1 Rifle Grip".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Rubber".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['cloth'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Cloth",
               params = { 
                   event = "Polar-Crafting:Client:GusenBerg",
                  
               }
           },
           {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['weapontint_pink'].image.." width=35px onerror='this.onerror=null; this.remove();'>"..QBCore.Shared.Items['weapontint_pink'].label,
            txt = "Required: ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['goldingot'].image.." width=25px onerror='this.onerror=null; this.remove();'> 3 Gold Ingot".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['metalscrap'].image.." width=25px onerror='this.onerror=null; this.remove();'> 5 Metal Scrap ".."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['rubber'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Rubber" .."<p> <img src=nui://"..Config.img..QBCore.Shared.Items['ducttape'].image.." width=25px onerror='this.onerror=null; this.remove();'> 2 Duct Tape",
            params = { 
                event = "Polar-Crafting:Client:PinkTint",
               
            }
        },
       })
    end
end
