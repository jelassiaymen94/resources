local QBCore = exports[Config.Core]:GetCoreObject()

 











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