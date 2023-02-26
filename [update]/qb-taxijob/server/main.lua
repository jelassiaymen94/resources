local QBCore = exports['qb-core']:GetCoreObject()

function NearTaxi(src)
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    for _, v in pairs(Config.NPCLocations.DeliverLocations) do
        local dist = #(coords - vector3(v.x,v.y,v.z))
        if dist < 30 then
            return true
        end
    end
end

RegisterNetEvent('qb-taxi:server:NpcPay', function(Payment)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == "taxi" then
        if NearTaxi(src) then
            local randomAmount = math.random(1, 5)
            local r1, r2 = math.random(1, 5), math.random(1, 5)
            if randomAmount == r1 or randomAmount == r2 then Payment = Payment + math.random(100, 200) end
            Player.Functions.AddMoney('cash', Payment)
            local chance = math.random(1, 500)
            if chance < 21 then
                Player.Functions.AddItem("keycard", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["keycard"], "add")-- 50%
            --[[elseif chance >=27 and chance <75 then 
                Player.Functions.AddItem("safecracker", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add")-- 50%
            elseif chance >=76 and chance <150 then
                Player.Functions.AddItem("cryptostick", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add") -- 50%]]
            elseif chance >=21 and chance <50 then
                Player.Functions.AddItem("safecracker", random.math(1,5), false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["safecracker"], "add") -- 50%
            --[[elseif chance >=301 and chance <700 then
                Player.Functions.AddItem("cryptostick", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add") -- 50%
            elseif chance >=701 and chance <1500 then
                Player.Functions.AddItem("cryptostick", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add") -- 50%
            elseif chance >=1501 and chance <4500 then
                Player.Functions.AddItem("cryptostick", 1, false)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add") -- 50%
            elseif chance >=4501 and chance <10000 then
                Player.Functions.AddItem("cryptostick", math.random(1,5), false) -- 50%
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "add") -- 50%]]
            end
        else
            DropPlayer(src, 'Attempting To Exploit')
        end
    else
        DropPlayer(src, 'Attempting To Exploit')
    end
end)
