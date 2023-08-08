local QBCore = exports['qb-core']:GetCoreObject()
local OldGrave = nil

-- [[ Function ]] --
function ResetGraveTimer(OldGrave)
    local num = Config.GraveTimer  -- 5 minutes 45 seconds
    local time = tonumber(num)
    SetTimeout(time, function()
        Config.Graves[OldGrave].Looted = false
        TriggerClientEvent('Graverobbery:Client:ResetGrave', -1, OldGrave, false)
    end)
end

RegisterServerEvent('Graverobbery:Server:SetGraveState', function(CurGrave)
    local OldGrave = nil
    local src = source
    local OldGrave = CurGrave
    if Config.Graves[OldGrave].Looted == false then 
        ResetGraveTimer(OldGrave)
        TriggerClientEvent('Graverobbery:Client:SetGraveState', -1, OldGrave, true)
    end
    Config.Graves[OldGrave].Looted = true
end)

RegisterServerEvent("Graverobbery:Server:GiveItems", function(CurGrave)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = math.random(1, #Config.GraveRewards)
    local amount = math.random(Config.GraveRewards[reward]["amount"]["min"], Config.GraveRewards[reward]["amount"]["max"])
    local lootfound = false
    local chance = math.random(1, 100)
    if chance <= Config.GraveRewardChance then 
        lootfound = true
        Player.Functions.AddItem(Config.GraveRewards[reward]["item"], amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.GraveRewards[reward]["item"]], 'add')
    end
    if chance >= Config.GraveSpecialChance then
        lootfound = true 
        Player.Functions.AddItem(Config.GraveChanceItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.GraveChanceItem], "add", 1)
    end
    if lootfound == true then 
        TriggerClientEvent('QBCore:Notify', src, 'You found something!', 'success', 3500)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You found nothing.', 'error', 3500)
    end
end)