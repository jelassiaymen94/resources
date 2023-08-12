local QBCore = exports['qb-core']:GetCoreObject()


local placementConfig = Config.Placement["Back"]
RegisterNetEvent('weaponBack:equipWeapon')
AddEventHandler('weaponBack:equipWeapon', function(weaponHash)
    if DoesEntityExist(PlayerPedId()) and not IsEntityDead(PlayerPedId()) then
        local weaponModel = Config.WeaponsOnBack[weaponHash].model
        local currentPlacement = weaponPlacements[weaponHash] or 1
        local newPlacement = currentPlacement
        
        if currentPlacement == 1 then
            placementConfig = Config.PlacementSecond["Back"]
            newPlacement = 2
        elseif currentPlacement == 2 then
            placementConfig = Config.PlacementThird["Back"]
            newPlacement = 3
        end

        

        RequestModel(weaponModel)
        while not HasModelLoaded(weaponModel) do
            Wait(1)
        end
        
        local weaponObject = CreateObject(GetHashKey(weaponModel), 0.0, 0.0, 0.0, true, true, true)
        AttachEntityToEntity(weaponObject, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), placementConfig.bone), placementConfig.x, placementConfig.y, placementConfig.z, placementConfig.x_rotation, placementConfig.y_rotation, placementConfig.z_rotation, true, true, false, true, 1, true)
        weaponsOnBack[weaponHash] = weaponObject
        weaponPlacements[weaponHash] = newPlacement
    end
end)

local weapons = {}
local weaponsOnBack = {}
local currentWeapons = {}

RegisterNetEvent('weaponBack:removeWeapon')
AddEventHandler('weaponBack:removeWeapon', function(weaponHash)
        DeleteEntity(weaponsOnBack[weaponHash])
        weaponsOnBack[weaponHash] = nil
        weaponPlacements[weaponHash] = nil
    
end)

CreateThread(function()
    for k, v in ipairs(Config.WeaponsOnBack) do
        weapons[k] = v
        print(json.encode(weapons[k]))
        print('s')
    end
end)
CreateThread(function()
    while true do
        --Wait(Config.LoopSpeed)
        
      
            print('startiong')
            

            for k, v in ipairs(Config.WeaponsOnBack) do
                if playeritem("weapon_assaultrifle") then
                    print('hi')
                    print(json.encode(v.model))
                else
                    print('no weapon')
                end
            end
          
       

          --[[  for i = 1, #currentWeapons do
                local weaponHash = currentWeapons[i]
                if not weaponsOnBack[weaponHash] then
                    TriggerEvent('weaponBack:equipWeapon', weaponHash)
                end
            end

            for weaponHash, weaponObject in pairs(weaponsOnBack) do
                if not table.includes(currentWeapons, weaponHash) then
                    DeleteEntity(weaponObject)
                    weaponsOnBack[weaponHash] = nil
                    weaponPlacements[weaponHash] = nil
                    TriggerEvent('weaponBack:removeWeapon', weaponHash)
                end
            end]]
        Wait(1000)
    end
end)




local PlayerData = nil
function playeritem(items, amount)
        PlayerData = QBCore.Functions.GetPlayerData()
        local isTable = type(items) == 'table'
        local isArray = isTable and table.type(items) == 'array' or false
        local totalItems = #items
        local count = 0
        local kvIndex = 2
        if isTable and not isArray then
            totalItems = 0
            for _ in pairs(items) do 
                local totalItems2 = totalItems + 1 
                totalItems = totalItems2
            end
            kvIndex = 1
        end
        for _, itemData in pairs(PlayerData.items) do
            if isTable then
                for k, v in pairs(items) do
                    local itemKV = {k, v}
                    if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                        local count2 = count + 1 
                        count = count2
                    end
                end
                if count == totalItems then
                    return true
                end
            else -- Single item as string
                if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
    return true
                end
            end
        end
    return false
end