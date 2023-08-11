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
    while true do 
    Wait(math.random(30000, 60000))

    ResetGraveTimer()
    end
end)





RegisterServerEvent("Graverobbery:Server:GiveItems", function(CurGrave)
    if CurGrave == nil then return end
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local lootfound = false

    local chance4 = math.random(1,100)
    if chance4 >= Config.BreakChance then 
        Player.Functions.RemoveItem(Config.GraveItem, 1) 
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.GraveItem], "remove", 1)  
        TriggerClientEvent('QBCore:Notify', src, 'Your Shovel Broke.', 'error', 3500)
    end

    local chance = math.random(1, 100)
    local amount = math.random(2,10)

    for i = 1, amount do

        local chance3 = math.random(1,100)
        local chance2 = math.random(1,100)

        local reward = Config.GraveRewards[math.random(1, #Config.GraveRewards)]
        local reward2 = Config.SGraveRewards[math.random(1, #Config.SGraveRewards)]
        local reward3 = Config.EGraveRewards[math.random(1, #Config.EGraveRewards)]

    if chance >= Config.GraveRewardChance then 
        lootfound = true 
        if chance2 >= Config.EGraveChance then
            Player.Functions.AddItem(reward3, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward3], "add", 1)
        elseif chance2 >= Config.GraveSpecialChance then
            Player.Functions.AddItem(reward2, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward2], "add", 1)
        else
            local amount2 = math.random(1,2)
            Player.Functions.AddItem(reward, amount2)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[reward], 'add', amount2)
        end
    end

    end
    if lootfound == true then 
        TriggerClientEvent('QBCore:Notify', src, 'You found something!', 'success', 3500)
    else
        TriggerClientEvent('QBCore:Notify', src, 'You found nothing.', 'error', 3500)
    end
end)