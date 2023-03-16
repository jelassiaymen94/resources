local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent('Polar-Weed:Server:RemoveTrimItem', function()
    local math = math.random(1,100)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if math < 25 then

            if exports[Config.Inventory]:RemoveItem(Player.PlayerData.source, Config.NeededPickItem, Config.NeededPickItemAmount, false) then --  item removed from inventory
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.NeededPickItem], 'remove', Config.NeededPickItemAmount)
            TriggerEvent("qb-log:server:CreateLog", "weed", "REMOVED TRIM ITEM", "red", "**" .. GetPlayerName(src) .. "** Removed" .. Config.NeededPickItemAmount .. " " .. Config.NeededPickItem .. "s")
            end

    end
end)

RegisterNetEvent('Polar-Weed:Server:GivePotItem', function()
    local Player = QBCore.Functions.GetPlayer(source)

    Player.Functions.AddItem(Config.GivenPotItem, Config.GivenPotItemAmount)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.GivenPotItem], 'add',  Config.GivenPotItemAmount)
     TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN POT ITEM", "blue", "**" .. GetPlayerName(src) .. "** Got" .. Config.GivenPotItemAmount .. " " .. Config.GivenPotItem .. "s")
end)

RegisterNetEvent('Polar-Weed:Server:GiveTrimItem', function()
   
    local Player = QBCore.Functions.GetPlayer(source)
    
  

    TriggerServerEvent('Polar-Weed:Server:addLowGradeMarijuana')
   
    
end)
RegisterNetEvent('Polar-Weed:Server:SearchReward', function()
    local math = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if math >= 75 then
        -- 25% Chance
       
        Player.Functions.AddItem(Config.SearchReward25,  Config.SearchReward25Amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SearchReward25], 'add',   Config.SearchReward25Amount)
         TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN SEARCHED ITEM", "red", "**" .. GetPlayerName(src) .. "** Got" ..  Config.SearchReward25Amount .. " " .. Config.SearchReward25 .. "s")
    elseif math < 10 then
        -- 9% Chance
       
        Player.Functions.AddItem(Config.SearchReward9,  Config.SearchReward9Amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SearchReward9], 'add',   Config.SearchReward9Amount)
         TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN SEARCHED ITEM", "red", "**" .. GetPlayerName(src) .. "** Got" ..  Config.SearchReward9Amount .. " " .. Config.SearchReward9 .. "s")
    else
        -- 66% Chance
        
        Player.Functions.AddItem(Config.SearchReward66,  Config.SearchReward66Amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SearchReward66], 'add',   Config.SearchReward66Amount)
         TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN SEARCHED ITEM", "red", "**" .. GetPlayerName(src) .. "** Got" ..  Config.SearchReward66Amount .. " " .. Config.SearchReward66 .. "s")
    end
end)
RegisterNetEvent('Polar-Weed:Server:SpecialSearchReward', function()
    local math = math.random(1,100)
    local Player = QBCore.Functions.GetPlayer(source)
    if math >= 75 then
        -- 25% Chance
       
        Player.Functions.AddItem(Config.SpecialSearchReward25, Config.SpecialSearchReward25Amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SpecialSearchReward25], 'add',  Config.SpecialSearchReward25Amount)
         TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN SEARCHED ITEM", "red", "**" .. GetPlayerName(src) .. "** Got" .. Config.SpecialSearchReward25Amount .. " " .. Config.SpecialSearchReward25 .. "s")
    elseif math < 10 then
        -- 9% Chance
       
        Player.Functions.AddItem(Config.SpecialSearchReward9, Config.SpecialSearchReward9Amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SpecialSearchReward9], 'add',  Config.SpecialSearchReward9Amount)
         TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN SEARCHED ITEM", "red", "**" .. GetPlayerName(src) .. "** Got" .. Config.SpecialSearchReward9Amount .. " " .. Config.SpecialSearchReward9 .. "s")
    else
        -- 66% Chance
        
        Player.Functions.AddItem(Config.SpecialSearchReward66, Config.SpecialSearchReward66Amount)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.SpecialSearchReward66], 'add',  Config.SpecialSearchReward66Amount)
         TriggerEvent("qb-log:server:CreateLog", "weed", "GIVEN SEARCHED ITEM", "red", "**" .. GetPlayerName(src) .. "** Got" .. Config.SpecialSearchReward66Amount .. " " .. Config.SpecialSearchReward66 .. "s")
    end
end)


-- CHAIR CHECK
local Check3 = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:Sort3Check", function(source, cb)
    cb(Check3)
end)
RegisterNetEvent('Polar-Weed:Server:UnChecked3', function()

    Check3 = false

end)
RegisterNetEvent('Polar-Weed:Server:Checked3', function()

    Check3 = true

end)

-- CHAIR CHECK
local Check2 = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:Sort2Check", function(source, cb)
    cb(Check2)
end)
RegisterNetEvent('Polar-Weed:Server:UnChecked2', function()

    Check2 = false

end)
RegisterNetEvent('Polar-Weed:Server:Checked2', function()

    Check2 = true

end)




-- CHAIR CHECK
local Check1 = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:Sort1Check", function(source, cb)
    cb(Check1)
end)
RegisterNetEvent('Polar-Weed:Server:UnChecked1', function()

    Check1 = false

end)
RegisterNetEvent('Polar-Weed:Server:Checked1', function()

    Check1 = true

end)

-- CHAIR CHECK
local PottyCheck = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:PotCheck", function(source, cb)
    cb(PottyCheck)
end)
RegisterNetEvent('Polar-Weed:Server:UnPot1', function()

    PottyCheck = false

end)
RegisterNetEvent('Polar-Weed:Server:Pot1', function()

    PottyCheck = true

    TriggerServerEvent('Polar-Weed:Server:PottyTimer')
    
end)


RegisterNetEvent('Polar-Weed:Server:PottyTimer', function()

    Wait(120000)

    TriggerServerEvent('Polar-Weed:Server:UnPot1')
    
end)



-- PICK CHECK
local Pick1Check = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:Pick1Check", function(source, cb)
    cb(Pick1Check)
end)
RegisterNetEvent('Polar-Weed:Server:UnPick1', function()

    Pick1Check = false

end)
RegisterNetEvent('Polar-Weed:Server:Pick1', function()

    Pick1Check = true

end)


-- PICK CHECK
local Pick2Check = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:Pick2Check", function(source, cb)
    cb(Pick2Check)
end)
RegisterNetEvent('Polar-Weed:Server:UnPick2', function()

    Pick2Check = false

end)
RegisterNetEvent('Polar-Weed:Server:Pick2', function()

    Pick2Check = true

end)


--------------------- WEED MISSION

-- SEARCH PACKAGE CHECK
local PackCheck = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:PackCheck2", function(source, cb)
    cb(PackCheck)
end)
RegisterNetEvent('Polar-Weed:Server:UnPack', function()

    PackCheck = false

end)
RegisterNetEvent('Polar-Weed:Server:Pack', function()

    PackCheck = true

end)



-- COOLDOWN CHECK
local MissionCheck = false
QBCore.Functions.CreateCallback("Polar-Weed:Server:MCooldownCheck", function(source, cb)
    cb(MissionCheck)
end)
RegisterNetEvent('Polar-Weed:Server:UnMCooldown', function()
    local cooldowntime = Config.MissionCooldownTime * 30000

    Wait(cooldowntime)

    TriggerServerEvent('Polar-Weed:Server:UnPack')

    Wait(cooldowntime)

    MissionCheck = false

end)
RegisterNetEvent('Polar-Weed:Server:MCooldown2', function()

    MissionCheck = true

end)





QBCore.Functions.CreateCallback('Polar-Weed:Server:GetPolice', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)


