local QBCore = exports[Config.Core]:GetCoreObject()


local coke = 0
local Plants = {}
local pick = false
local inside = false



CreateThread(function()
    if Config.UseCokePlant then
      
        if Config.Debug then print('Use Coke plant enabled') end

        local cokeZone = CircleZone:Create(Config.Spawn, Config.Radius, {
            name = "Polar-Coke",
            debugPoly = false
            
        })
        cokeZone:onPlayerInOut(function(isPointInside, point, zone)
            if isPointInside then
                inside = true
                SpawnCoke()
                if Config.Debug then print('inside') end
            else
                if Config.Debug then print('out') end
                inside = false
            end
        end)

       


    else
        if Config.Debug then print('Use Coke plant not enabled') end
    end
end)







if Config.UseCokePlant then

    RegisterNetEvent('Polar-Coke:Pick', function()
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local nearbyObject, nearbyID
    
        for i=1, #Plants, 1 do
            if GetDistanceBetweenCoords(coords, GetEntityCoords(Plants[i]), false) < 2 then
                nearbyObject, nearbyID = Plants[i], i
            end
        end
    
        if nearbyObject and IsPedOnFoot(playerPed) then
            if not pick then
                pick = true
                TaskStartScenarioInPlace(playerPed, Config.ProgressBarScenario, 0, false)
    
                QBCore.Functions.Progressbar("search_register", Config.ProgressBarLabel, Config.ProgressBartime, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    ClearPedTasks(playerPed)
                    SetEntityAsMissionEntity(nearbyObject, false, true)
                    DeleteObject(nearbyObject)
    
                    table.remove(Plants, nearbyID)
                    coke = coke - 1
                    
                    TriggerServerEvent('Polar-Coke:GiveLeaf')
                    
                    pick = false
                end, function()
                    ClearPedTasks(playerPed)
                    pick = false
                end)
            end
        end
    
    end)

    
    
    function SpawnCoke()
        if Config.Debug then print('trying to spawn') end
        while coke <  Config.MinPlants do
            Wait(0)
            local weedCoords = SetCoords()
            RequestModel('h4_prop_bush_cocaplant_01')
            while not HasModelLoaded('h4_prop_bush_cocaplant_01') do
                Wait(100)
            end
            local cokeprop = CreateObject('h4_prop_bush_cocaplant_01', weedCoords.x, weedCoords.y, weedCoords.z, false, true, false)
            PlaceObjectOnGroundProperly(cokeprop)
            FreezeEntityPosition(cokeprop, true)
            table.insert(Plants, cokeprop)
            coke += 1
        end
    end
    
    
    function SetCoords()
        while true do
            Wait(1)
    
            local CokeCoordX, CokeCoordY
    
            math.randomseed(GetGameTimer())
            local CoordZX = math.random(-35, 35)
    
            Wait(100)
    
            math.randomseed(GetGameTimer())
            local CoordZY = math.random(-35, 35)
    
            CokeCoordX = Config.Spawn.x + CoordZX
            CokeCoordY = Config.Spawn.y + CoordZY
    
            local coordZ = GetCoordZCoke(CokeCoordX, CokeCoordY)
            local coord = vector3(CokeCoordX, CokeCoordY, coordZ)
    
            if correctcoord(coord) then
                return coord
            end
        end
    end
    
    function correctcoord(plantCoord)
        local correct = true
        if coke > 0 then
            for k, v in pairs(Plants) do
                if #(plantCoord - GetEntityCoords(v)) < 5 then
                    correct = false
                end
            end
            if not inside then
                correct = false
            end
        end
        return correct
    end
    
    function GetCoordZCoke(x, y)
        local groundCheckHeights = { 1.0, 25.0, 50.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0, 80.0 }
    
        for i, height in ipairs(groundCheckHeights) do
            local foundGround, z = GetGroundZFor_3dCoord(x, y, height)
    
            if foundGround then
                return z
            end
        end
    
        return 77
    end
    
   
else
    if Config.Debug then print('Use Coke plant not enabled') end
end