local QBCore = exports[Config.Core]:GetCoreObject()


function hitup(bool)
  
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = bool
    --[[
    for i = 1, #Config.ItemList do

		local numbaofitem = Config.ItemList[i].numbaofitem
		local givexp = Config.ItemList[i].givexp
        local giveamount = Config.ItemList[i].giveamount

        
		removeitem(numbaofitem, givexp, giveamount, item, 'metalscrap', 3, 'plastic', 2, 'rubber', 1) -- done***
       
    end
    ]]

   

    if item == 'lockpick' then
        -- 3(amount of items), 1(xp given per craft), 1(giveamount), item(no touch), mat1, mat1amount, mat2, mat2amount, mat3, mat3amount etc.
        removeitem(3, 1, 1, item, 'metalscrap', 3, 'plastic', 2, 'rubber', 1) -- done***
        
    elseif item == 'screwdriverset' then
      
        removeitem(3, 2, 1, item, 'iron', 4, 'metalscrap', 4, 'steel', 2) -- done***
              
    elseif item == 'armor' then

        removeitem(2, 3, 1, item, 'carbon', 2, 'steel', 15) -- done***
      
    elseif item == 'weapon_switchblade' then

        removeitem(3, 4, 1, item, 'metalscrap', 10, 'steel', 5, 'rubber', 3) -- done***
    
    elseif item == 'weapon_sledgehammer' then

        removeitem(3, 5, 1, item, 'iron', 15, 'steel', 5, 'rubber', 5) -- done***

    elseif item == 'weapon_flare' then

        removeitem(2, 10, 1, item, 'plastic', 20, 'aluminumoxide', 1) -- done***

    elseif item == 'metalscratchy' then

        removeitem(2, 15, 1, item, 'metalscrap', 10, 'iron', 10) -- done***

    elseif item == 'electronickit' then

        removeitem(3, 20, 1, item, 'refined_iron', 1, 'goldingot', 1, 'plastic', 5) -- done***

    elseif item == 'keypad' then

        removeitem(3, 20, 1, item, 'electronickit', 2, 'plastic', 5, 'rubber', 2) -- done***

    elseif item == 'weapon_knuckle' then

        removeitem(2, 25, 1, item, 'refined_steel', 2, 'goldingot', 2) -- done***

    elseif item == 'gunpowder' then

        removeitem(2, 20, 10, item, 'aluminumoxide', 1, 'charcoal', 25) -- done

    elseif item == 'pistol_ammo' then

        removeitem(2, 20, 1, item, 'copperore', 2, 'gunpowder', 1) -- done***

    elseif item == 'weapon_fnx45' then

        removeitem(6, 35, 1, item, 'refined_iron', 1, 'refined_aluminum', 1, 'pistolbarrel', 1, 
        'pistolbody', 1, 'pistolgrip', 1, 'copper', 4) -- done

    elseif item == 'ironoxcidepowder' then

        removeitem(4, 40, 1, item, 'glass', 15, 'gunpowder', 2, 'plastic', 1, 'refined_iron', 1) -- done

    elseif item == 'aluminumoxide' then

        removeitem(4, 40, 1, item, 'glass', 20, 'plastic',1, 'copper', 5, 'refined_aluminum', 1) -- done

    elseif item == 'thermitepowder' then

        removeitem(4, 45, 1, item, 'glass', 5, 'plastic', 1, 'ironoxcidepowder', 1, 'aluminumoxide', 1) -- done

    elseif item == 'thermite' then

        removeitem(2, 45, 1, item, 'refined_plastic', 4, 'thermitepowder', 1) -- done

    elseif item == 'weapon_smokegrenade' then
        
        removeitem(4, 50, 1, item, 'carbon', 1, 'charcoal', 5, 'aluminum', 5, 'thermitepowder', 1) -- done***

    elseif item == 'weapon_pipebomb' then

        removeitem(4, 75, 1, item, 'gunpowder', 10, 'refined_aluminum', 2, 'rubber', 3, 'thermitepowder', 1)  -- done***

    elseif item == 'weapon_m67' then

        removeitem(4, 100, 1, item, 'metalscrap', 6, 'refined_aluminum', 2, 'thermitepowder', 2, 'refined_iron', 1)  -- done***

    elseif item == 'weapon_molotov' then

        removeitem(3, 60, 2, item, 'weapon_petrolcan', 2, 'bottle', 2, 'cloth', 1)  -- done***

    elseif item == 'handcuffs' then

        removeitem(3, 65, 1, item, 'metalscrap', 5, 'refined_steel', 5, 'refined_iron', 1)  -- done***

    elseif item == 'smg_ammo' then

        removeitem(2, 30, 1, item, 'gunpowder', 2, 'copperore', 4) -- done***

    elseif item == 'weapon_mac10' then

        removeitem(6, 130, 1, item, 'refined_iron', 2, 'refined_copper', 2, 'smgbarrel', 1, 'smgbody', 1, 'smggrip', 1, 'rubber', 5)-- done***

    elseif item == 'weapon_uzi' then

        removeitem(6, 110, 1, item, 'refined_steel', 2, 'smgbarrel', 1, 'smgbody', 1, 'smggrip', 1, 'rubber', 5, 'refined_copper', 2)-- done***

    elseif item == 'weapon_pistol50' then

        removeitem(6, 150, 1, item, 'refined_steel', 5, 'refined_aluminum', 5, 'pistolbarrel', 1, 'pistolbody', 1, 'pistolgrip', 1, 'rubber', 1)-- done***
             
    elseif item == 'rifle_ammo' then

        removeitem(2, 40, 1, item, 'copperore', 3, 'gunpowder', 6)

    elseif item == 'weapon_assaultrifle2' then

        removeitem(7, 170, 1, item, 'carbon', 5, 'riflereciever', 1, 'rifletrigger', 1, 'riflegrip', 1, 'refined_aluminum', 1, 'refined_steel', 1, 'rubber', 5, 'refined_copper', 1)

    elseif item == 'weapon_assaultrifle' then

        removeitem(7, 190, 1, item, 'carbon', 10, 'riflereciever', 5, 'rifletrigger', 1, 'riflegrip', 1, 'refined_aluminum', 1, 'refined_steel', 1, 'rubber', 5, 'refined_copper', 1)

    else 

    TriggerClientEvent('QBCore:Notify', src,"No item Choosen", red, alerttime)

    end
  
end












-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
local vagos = nil
local ballas = nil
local triads= nil
local scrap= nil
local scaletta = nil
local vatos = nil
local exp = 5
local xp = nil

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
      
        --getsqlvalues()

    end
end)



function getsqlvalues()

    MySQL.query('SELECT * FROM polar_crafting WHERE (exp > 0)',{}, function(tables)
        local id = {}
        for _, v in ipairs(tables) do   
            id[v.id]  = {gangs = v.name, exp = v.exp}

            if  id[v.id] == 1 then
                ballas = v.exp

            elseif  id[v.name] == 'vagos' then
                vagos = exp

            elseif  id[v.name] == 'vatos' then
                vatos = exp
                
            elseif  id[v.name] == 'triads' then
                triads = exp
                
            elseif  id[v.name] == 'scaletta' then
                scaletta = exp
                
            elseif  id[v.name] == 'scrap' then
                scrap = exp
            
            else
                
                ballas = exp

            end
        end
        
    end)

end
QBCore.Functions.CreateCallback("Polar-Crafting:Server:GetGang",function(source, cb)
    local number = nil
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if Player.PlayerData.gang.name == "lostmc" then
        number = 1
    elseif  Player.PlayerData.gang.name == "cartel" then
        number = 2
    elseif  Player.PlayerData.gang.name == "scrappgang" then
        number = 3
    elseif  Player.PlayerData.gang.name == "gsf" then
        number = 4
    elseif  Player.PlayerData.gang.name == "triads" then
        number = 5
    elseif  Player.PlayerData.gang.name == "family" then
        number = 6
    end
    cb(number)
end)
RegisterNetEvent("Polar-Crafting:Server:UpdateVagos", function(amount)
    local pp = amount
    MySQL.update("UPDATE `polar_crafting` SET `exp`=`exp` + (pp) WHERE gang = vagos",{exp = pp},
    function()
       -- TriggerClientEvent("Polar-Weed:Client:growthUpdate", -1)
    end)


end)