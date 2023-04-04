local QBCore = exports['qb-core']:GetCoreObject()

-- Get Walking Style --
RegisterServerEvent('Polar-Misc:server:GetWalkStyle', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    TriggerClientEvent('Polar-Misc:client:SetWalkStyle', src, Player.PlayerData.metadata['walkstyle'])
end)

-- Set Walking Style --
RegisterServerEvent('Polar-Misc:server:SetWalkStyle', function(style)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.PlayerData.metadata['walkstyle'] = style
    Player.Functions.SetMetaData('walkstyle', Player.PlayerData.metadata['walkstyle'])
   
end)

