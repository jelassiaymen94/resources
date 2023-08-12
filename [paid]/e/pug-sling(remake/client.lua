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
    for k, v in pairs(Config.WeaponsOnBack) do
        weapons[k] = v
        --print(json.encode(weapons[k]))
      
    end
    start()
end)
--CreateThread(function()
function start()
    while true do
        --Wait(Config.LoopSpeed)
        
      
          
            

            for k, v in pairs(Config.WeaponsOnBack) do
                --print(json.encode(Config.WeaponsOnBack[k]))
                local hi = json.encode(Config.WeaponsOnBack[k])
                QBCore.Functions.TriggerCallback('pug-sling:server:checkItems', function(result)
                if result then
                    
                    local hi = json.encode(v.hash)
                    local hi2 = json.encode(v.model)
                    local hi3 = json.encode(v.name)
                    print(hi)
                    print(hi2)
                    print(hi3)

                end
                end, hi.name)
              
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
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) start() end)


