local QBCore = exports['qb-core']:GetCoreObject()


local selectedVeh = nil
local CurrentTow = nil




local function getVehicleInDirection(coordFrom, coordTo)
    local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, PlayerPedId(), 0)
    local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
    return vehicle
end






RegisterNetEvent('Polar-Tow:Client:UnTow', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    QBCore.Functions.Progressbar("untowing_vehicle", "Detaching Vehicle", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, { 
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
        local modelName = GetDisplayNameFromVehicleModel(selectedVeh)
       
            NetworkRequestControlOfEntity(CurrentTow)
            FreezeEntityPosition(CurrentTow, false)
            Wait(250)
            AttachEntityToEntity(CurrentTow, vehicle, 20, -0.0, -12.0, 1.0, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
            DetachEntity(CurrentTow, true, true)
       
      
            CurrentTow = nil
          
      

    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
        
    end)
end)


RegisterNetEvent('Polar-Tow:Client:Tow', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
    if GetEntityModel(vehicle) == GetHashKey('flatbed') then
            local playerped = PlayerPedId()
            local coordA = GetEntityCoords(playerped, 1)
            local coordB = GetOffsetFromEntityInWorldCoords(playerped, 0.0, 5.0, 0.0)
            local targetVehicle = getVehicleInDirection(coordA, coordB)
            local flatbed = GetHashKey('flatbed')
            local modelName = GetDisplayNameFromVehicleModel(selectedVeh)
                if not IsPedInAnyVehicle(PlayerPedId()) then
                    if vehicle ~= targetVehicle then
                        NetworkRequestControlOfEntity(targetVehicle)
                        local towPos = GetEntityCoords(vehicle)
                        local targetPos = GetEntityCoords(targetVehicle)
                        local flatbed = GetHashKey('flatbed')
                                         
                        if #(towPos - targetPos) < 11.0 then
                            QBCore.Functions.Progressbar("towing_vehicle", "Attaching Vehicle", 5000, false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {
                                animDict = "mini@repair",
                                anim = "fixing_a_ped",
                                flags = 16,
                            }, {}, {}, function() -- Done
                                StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
    
                                local bone = GetEntityBoneIndexByName(vehicle, 'bodyshell')
                           
                                AttachEntityToEntity(targetVehicle, vehicle, GetEntityBoneIndexByName(vehicle, 'bodyshell'), 0.0, -1.5 + -0.85, -0.35 + 1.60, 0, 0, 0, 1, 1, 0, 1, 0, 1)
                                NetworkRequestControlOfEntity(targetVehicle)
                                FreezeEntityPosition(targetVehicle, true)
                            
                                CurrentTow = targetVehicle

                               
                                
                            end, function() -- Cancel
                                StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_ped", 1.0)
                               
                            end)
                        end
                    end
                end
            
    else
        QBCore.Functions.Notify("You need to be in a Flatbed", "error", 5000)
    end
end)




CreateThread(function()
    exports['qb-target']:AddGlobalVehicle({
        options = {
            {
                icon = "fa-solid fa-caret-up",
                label = "Attach Vehicle",
                canInteract = function(entity)
                    local oldtruck = GetVehiclePedIsIn(PlayerPedId(),true)
                    local flatbed = GetHashKey('flatbed')
                   
                    if GetEntityModel(oldtruck) == flatbed and CurrentTow == nil then return true end
                        return false
                end,
                event = "Polar-Tow:Client:Tow",
                job = {
                    ["bennys"] = 0,
                    ["mechanic"] = 0,
                    ["hayes"] = 0,
                    ["harmony"] = 0,
                },
            },
        },
        distance = 3
    })
    exports['qb-target']:AddGlobalVehicle({
        options = {
            {
                icon = "fa-solid fa-caret-down",
                label = "Detach Vehicle",
                canInteract = function(entity)
                    local oldtruck = GetVehiclePedIsIn(PlayerPedId(),true)
                    local flatbed = GetHashKey('flatbed')
                   
                    if GetEntityModel(oldtruck) == flatbed and CurrentTow ~= nil then return true end
                        return false
                end,
                event = "Polar-Tow:Client:UnTow",
                job = {
                    ["bennys"] = 0,
                    ["mechanic"] = 0,
                    ["hayes"] = 0,
                    ["harmony"] = 0,
                },
            },
        },
        distance = 3
    })
end)
