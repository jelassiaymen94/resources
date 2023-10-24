local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
	QBCore = exports['qb-core']:GetCoreObject() 
end)



RegisterNetEvent("realtor:server:updateProperty", function(type, property_id, data)
    -- Job check
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not PlayerData.job.name == "realtor" then return false end

    data.realtorSrc = src
    -- Update property
    TriggerEvent("housing:server:updateProperty", type, property_id, data)
end)

RegisterNetEvent("realtor:server:registerProperty", function(data)
    -- Job check
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not PlayerData.job.name == "realtor" then return false end

    data.realtorSrc = src
    -- Register property
    TriggerEvent("housing:server:registerProperty", data)
end)

RegisterNetEvent("realtor:server:addTenantToApartment", function(data)
    -- Job check
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not PlayerData.job.name == "realtor" then return false end

    data.realtorSrc = src
    -- Add tenant
    TriggerEvent("housing:server:addTenantToApartment", data)
end)

lib.callback.register("realtor:server:getNames", function (source, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerData = Player.PlayerData
    if not PlayerData.job.name == "realtor" then return false end
    
    local names = {}
    for i = 1, #data do
        local target = QBCore.Functions.GetPlayerByCitizenId(data[i]) or QBCore.Functions.GetOfflinePlayerByCitizenId(data[i])
        if target then
            names[#names+1] = target.PlayerData.charinfo.firstname .. " " .. target.PlayerData.charinfo.lastname
        else
            names[#names+1] = "Unknown"
        end
    end
    
    return names
end)