local QBCore = exports['qb-core']:GetCoreObject()
local OldGrave = nil

-- [[ Function ]] --
function ResetGraveTimer()
    SetTimeout(3000, function()
        TriggerClientEvent('Polar-Graves:Client:Reset', -1)
    end)
end

local number  = 0

RegisterNetEvent('Polar-Graves:Server:GraveSet', function() number += 1 if number > 4 then ResetGraveTimer() end end)
RegisterNetEvent('Polar-Graves:Server:TargetRemove', function(target)  TriggerClientEvent('Polar-Graves:Client:TargetRemove', -1, target) end)

CreateThread(function()
    Wait(math.random(3000, 6000))

    ResetGraveTimer()

end)





RegisterServerEvent("Graverobbery:Server:GiveItems", function(CurGrave)
    if CurGrave == nil then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local reward = Config.GraveRewards[math.random(1, #Config.GraveRewards)]
    local lootfound = false
    local chance = math.random(1, 100)
    if chance <= Config.GraveRewardChance then 
        lootfound = true
        Player.Functions.AddItem(reward, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add')
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