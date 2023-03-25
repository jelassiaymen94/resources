local QBCore = exports['qb-core']:GetCoreObject()

local entitySets = {
    ["basketball"] = {"mba_tribune", "mba_tarps", "mba_basketball", "mba_jumbotron"},
    ["derby"] = {"mba_cover", "mba_terrain", "mba_derby", "mba_ring_of_fire"},
    ["paintball"] = {"mba_tribune", "mba_chairs", "mba_paintball", "mba_jumbotron"},
    ["concert"] = {"mba_tribune", "mba_tarps", "mba_backstage", "mba_concert", "mba_jumbotron"},
    ["fashion"] = {"mba_tribune", "mba_tarps", "mba_backstage", "mba_fashion", "mba_jumbotron"},
    ["fameorshame"] = {"mba_tribune", "mba_tarps", "mba_backstage", "mba_fameorshame", "mba_jumbotron"},
    ["wrestling"] = {"mba_tribune", "mba_tarps", "mba_fighting", "mba_wrestling", "mba_jumbotron"},
    ["mma"] = {"mba_tribune", "mba_tarps", "mba_fighting", "mba_mma", "mba_jumbotron"},
    ["boxing"] = {"mba_tribune", "mba_tarps", "mba_fighting", "mba_boxing", "mba_jumbotron"},
    ["all"] = {'mba_tribune', 'mba_cover', 'mba_tarps', 'mba_chairs', 'mba_basketball', 'mba_derby', 'mba_paintball', 'mba_fighting', 'mba_wrestling', 'mba_mma', 'mba_boxing', 'mba_backstage', 'mba_concert', 'mba_fashion', 'mba_fameorshame', 'mba_ring_of_fire', 'mba_jumbotron', 'mba_terrain'},
}

RegisterCommand("closenui", function(source, args, rawCommand)
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
end, false)
RegisterCommand("opennui", function(source, args, rawCommand)
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
end, false)

RegisterCommand('mba', function(source, args, rawCommand)
    if not args[1] then return end
    if args[1] then
        if args[1] == "all" then return end
        local intID = GetInteriorAtCoords(-324.22030000, -1968.49300000, 20.60336000)
        if intID ~= 0 then
            removeEntitysets(intID)
            Wait(500)
            enableEntitysets(intID, args[1])
        end
    end
end, false)

function removeEntitysets(intID)
    for _, entitySet in ipairs(entitySets["all"]) do
        DeactivateInteriorEntitySet(intID, entitySet)
    end
    RefreshInterior(intID)
end

function enableEntitysets(intID, entities)
    for _, entitySet in ipairs(entitySets[entities]) do
        ActivateInteriorEntitySet(intID, entitySet)
    end
    RefreshInterior(intID)
end




RegisterNetEvent('polar-mba:Client:basketball', function(source, args, rawCommand)
    if not args[1] then return end
    if args[1] then
        if args[1] == "all" then return end
        local intID = GetInteriorAtCoords(-324.22030000, -1968.49300000, 20.60336000)
        if intID ~= 0 then
            removeEntitysets(intID)
            Wait(500)
            enableEntitysets(intID, args[1])
        end
    end
end, false)













CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/evidence', 'Insert evidence number to open. Example: /evidence 69', {})
end)

PDStations = {
    --vector3(449.52, -987.85, 30.69), -- MRPD
    vector3(381.2, -1609.13, 30.2), -- DAVIS
    --vector3(840.55, -1290.2, 28.65), -- TROOPER STATION
    --vector3(1851.64, 3689.25, 34.27), -- SANDY
    --vector3(-446.36, 6010.07, 31.71), -- PALETO
}

RegisterCommand('evidence', function(source, args)
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    local pos = GetEntityCoords(PlayerPedId())
    local canOpen = false
    for k,v in pairs(PDStations) do
        if #(pos - v) < 30.0 then
            canOpen = true
        end
    end
    if PlayerJob.name == "police" then
        if canOpen then
            slot = tonumber(args[1])
            if args[1] ~= nil then
                TriggerServerEvent("inventory:Server:OpenInventory", "stash", " 1 | Drawer "..slot, {
                    maxweight = 1000000,
                    slots = 100,
                })
                TriggerEvent("inventory:Client:SetCurrentStash", " 1 | Drawer "..slot)
            else
                QBCore.Functions.Notify("You must enter a drawer number.", "error")
            end  
        else
            QBCore.Functions.Notify("You are not near a police station.", "error")
        end
    else
        QBCore.Functions.Notify("Access denied. Police only.", "error")
    end
end)