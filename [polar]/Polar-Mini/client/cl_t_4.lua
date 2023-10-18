RegisterCommand("guard", function(s)  bodyguard(0, "npcguards", true) end, false)
RegisterCommand("enemy", function(s)  bodyguard(5, "npcenemy", false) end, false)

local model = "s_m_m_prisguard_01"
local weapon = 'weapon_smg'
local ammo = 50
local health = 300
local accuracy = 50
local range = 2

local etable = {}
local gtable = {}
local cache = {
    ["player"] = {},
    ["bodyguard"] = {},
    ["enemy"] = {},
    ["vehicle"] = {
        ["seats"] = {},
        ["entity"] = {},
    },
}
local seats = {}
local incar = false

function bodyguard(what, guard, bg)
    cache["player"] = PlayerPedId() 
    RequestModel(model) while not HasModelLoaded(model) do Wait(0) end
    SetPedRelationshipGroupHash(cache["player"], 'PLAYER')
    AddRelationshipGroup(guard)
    
    
    local loc = GetRandomSpawnLocation(GetEntityCoords(cache["player"]), 6)
    local ground, z = GetGroundZFor_3dCoord(loc.x, loc.y, loc.z, 0)

    local enemy = CreatePed(4, model, loc.x, loc.y, z, 0, true, true)
    SetEntityHeading(enemy, loc.w)
    GiveWeaponToPed(enemy, weapon, ammo, 0, 1)
    SetCurrentPedWeapon(enemy, weapon, true)
    SetPedCombatAttributes(enemy, 46, true)
    SetPedCombatAttributes(enemy, 5, true)
    SetPedCombatAbility(enemy, 100)
    SetPedCombatMovement(enemy, 1)
    SetEntityHealth(enemy, health) 
    SetPedAccuracy(enemy, accuracy) 
    SetPedCombatRange(enemy, range)
    SetPedRelationshipGroupDefaultHash(enemy, guard)
    SetPedRelationshipGroupHash(enemy, guard)
    SetCanAttackFriendly(enemy, false, false)
    SetCanAttackFriendly(cache["player"], false, false)
    SetPedAsEnemy(enemy, true)
    SetRelationshipBetweenGroups(0, guard, guard)
    SetRelationshipBetweenGroups(what, guard, 'PLAYER')
    SetRelationshipBetweenGroups(what, 'PLAYER', guard)
    TaskSetBlockingOfNonTemporaryEvents(enemy, true)
    if bg then
        cache["bodyguard"][enemy] = {}
        cache["bodyguard"][enemy]["ped"] = enemy
        cache["bodyguard"][enemy]["incar"] = false

        table.insert(gtable, enemy)
       
        Wait(100)
        TriggerEvent('Polar-Mini:Client:Loopup')
       
        
        while true do
            
           
            local em, id = etablecheck(etable, false)
            if em then  
                local dist = Vdist(GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, GetEntityCoords(enemy).x, GetEntityCoords(enemy).y, GetEntityCoords(enemy).z)
                if dist < 2 then
                    TaskCombatPed(cache["bodyguard"][enemy]["ped"], id, 0, 16)
                else
                    TaskGoToEntityWhileAimingAtEntity(cache["bodyguard"][enemy]["ped"], cache["player"], id, 5.0, true, 1.0, 1.0, true, true, 1) 
                    Wait(1000)
                end
              
              
            
              
            else

            if DoesEntityExist(GetVehiclePedIsIn(cache["player"]), true) then
                local veh = GetVehiclePedIsIn(cache["player"])
                cache["vehicle"]["entity"] = veh
                Wait(100)
                if not incar then incar = true 
                    cache["vehicle"]["seats"][veh] = GetVehicleMaxNumberOfPassengers(veh)
                    for seat = 0, cache["vehicle"]["seats"][veh] - 1 do
                        table.insert(seats, seat)
                    end
                end
                
                if not cache["bodyguard"][enemy]["incar"] then 
                    cache["bodyguard"][enemy]["incar"] = true
                    if #seats > 0 then
                        local taken = table.remove(seats, 1)
                        TaskEnterVehicle(cache["bodyguard"][enemy]["ped"], veh, -1, taken, 1.0, 1, 0)
                    end
                end

            else
                if cache["bodyguard"][enemy]["incar"] == true then
                    cache["bodyguard"][enemy]["incar"] = false
                    TaskLeaveVehicle(cache["bodyguard"][enemy]["ped"], cache["vehicle"]["entity"], 0)
                    Wait(3000)
                    cache["vehicle"]["entity"] = {}
                    seats = {}
                    incar = false
                end
              
                TaskGoToEntity(cache["bodyguard"][enemy]["ped"], cache["player"], -1, 1.0, 100.0, 1073741824, 0)
               
             --  TaskFollowToOffsetOfEntity(cache["bodyguard"][enemy]["ped"], cache["player"], 1.0, 1.0, 0.0, -1, 10.0, 1.0, true) -- Make the guard follow the player 
                
            
              
            end
          

            end

            
            Wait(100)  
        end
    else
        cache["enemy"] = enemy
        TaskCombatPed(enemy, cache["player"], 0, 16)
        table.insert(etable, enemy)
    
        
    end
end

RegisterNetEvent('Polar-Mini:Client:Loopup', function()
    while true do
    local _, et = etablecheck(gtable, true)
    if _ then
        repeat
        DisablePlayerFiring(cache["player"], true)
        local _, et = etablecheck(gtable, true)
        Wait(1)
        until et == nil
    end
    Wait(100)
    end
end)

function etablecheck(t, guard)
    if next(t) == nil then return false end
    for _, id in ipairs(t) do
        if guard then

        local a, ent = GetEntityPlayerIsFreeAimingAt(PlayerId())
        for _, id in ipairs(t) do
            if ent == id then
                return true, id
            end
        end
        return false, nil
        
        else
           
        if IsEntityDead(id) then 
            table.remove(t, _) 
            return false
        else
            return true, id
        end
      

        end
    end
end
function FindAvailableVehicleSeat(v)
    local ms = GetVehicleMaxNumberOfPassengers(v)
    for seat = -1, ms do
        if IsVehicleSeatFree(v, seat) then return seat end
    end
end
function GetRandomSpawnLocation(c, min)
    local randomX = 0
    local randomY = 0
    repeat
        randomX = math.random(-min, min)
        randomY = math.random(-min, min)
    until math.sqrt(randomX * randomX + randomY * randomY) >= min
    local spawnX = c.x + randomX
    local spawnY = c.y + randomY
    local spawnZ = c.z
    return vector3(spawnX, spawnY, spawnZ)
end