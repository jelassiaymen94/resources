
local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('Polar-Weed:Client:SmallJoint', function(prop_name)
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then QBCore.Functions.Notify("Cannot smoke this while inside a vehicle", "error", 3500) return end
    QBCore.Functions.Progressbar("smoking", "Smoking a Joint...", 7500, false, true, {
	disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true,
	}, { animDict = "amb@world_human_smoking_pot@male@idle_a", anim = "idle_b", flags = 16, 
    }, { model = "p_cs_joint_01", bone = 26610, coords = { x = 0.10, y = -0.03, z = 0.00}, rotation = { x = 0.00, y = 25.0, z = 0.0},
    }, {}, function() 
    AddArmourToPed(playerPed, math.random(0, 0))
    Wait(3000)
    TriggerServerEvent('hud:Server:RelieveStress', math.random(15, 30))    
	end, function() -- Cancel
    ClearPedTasks(playerPed)
	end)
end)
RegisterNetEvent('Polar-Weed:Client:LargeJoint', function(prop_name)
    local playerPed = PlayerPedId()
    if IsPedSittingInAnyVehicle(playerPed) then QBCore.Functions.Notify("Cannot smoke this while inside a vehicle", "error", 3500) return end
    QBCore.Functions.Progressbar("smoking", "Smoking a Joint...", 12500, false, true, {
	disableMovement = false, disableCarMovement = false, disableMouse = false, disableCombat = true,
	}, { animDict = "amb@world_human_smoking_pot@male@idle_a", anim = "idle_b", flags = 16,
    }, { model = "p_cs_joint_01", bone = 26610, coords = { x = 0.10, y = -0.03, z = 0.00}, rotation = { x = 0.00, y = 25.0, z = 0.0},
    }, {}, function()
    AddArmourToPed(playerPed, math.random(25, 50))
    Wait(3000)
    TriggerServerEvent('hud:Server:RelieveStress', math.random(50, 100)) 
    AlienEffect()
	end, function() -- Cancel
    ClearPedTasks(playerPed)
	end)
end)
function AlienEffect() 
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0) Wait(math.random(5000, 8000)) local ped = PlayerPedId() RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK") while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Wait(0) end SetPedCanRagdoll(ped, true ) 
   -- ShakeGameplayCam('DRUNK_SHAKE', 2.80) 
    --SetTimecycleModifier("Drunk") 
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true) SetPedMotionBlur(ped, true) SetPedIsDrunk(ped, true) Wait(1500) SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false ) 
    Wait(13500) SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false ) Wait(30500) ClearTimecycleModifier() ResetScenarioTypesEnabled() ResetPedMovementClipset(ped, 0) SetPedIsDrunk(ped, false) SetPedMotionBlur(ped, false) AnimpostfxStopAll() ShakeGameplayCam('DRUNK_SHAKE', 0.0) StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0) Wait(math.random(45000, 60000)) StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0) StopScreenEffect("DrugsMichaelAliensFightIn") StopScreenEffect("DrugsMichaelAliensFight") StopScreenEffect("DrugsMichaelAliensFightOut")
end