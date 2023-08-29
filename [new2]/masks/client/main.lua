local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function() -- LOADS ANIMATION
    while not HasAnimDictLoaded("mp_masks@standard_car@ds@") do
        RequestAnimDict("mp_masks@standard_car@ds@")
        Wait(1)
    end
end)



-- Assuming you have already registered the mask item with qbcore's item system

-- Function to get the mask the player is wearing and store it on the mask item info
function UpdateMaskInfo(playerId)
    local player = playerId

    local mask = GetPedDrawableVariation(player, 1) -- Assuming mask slot is 1, adjust as needed
    local maskTexture = GetPedTextureVariation(player, 1)
    
    -- Assuming you have a function to update item info in qbcore
    QBCore.Functions.SetItemMetaData("mask_item_name", "mask", {drawable = mask, texture = maskTexture})
end

-- Triggered when the player uses the mask item
RegisterServerEvent('useMaskItem')
AddEventHandler('useMaskItem', function()
    local source = source
    local player = QBCore.Functions.GetPlayer(source)
    
    local maskInfo = player.PlayerData.items["mask_item_name"].info.mask
    if maskInfo then
        SetPedComponentVariation(PlayerPedId(), 1, maskInfo.drawable, maskInfo.texture, 0) -- Set mask clothing
    end
end)