-- Controls
CreateThread(function()
    DisableIdleCamera(true)

    while true do
        if Client.isMenuOpen or Client.gizmoEntity then
            DisableControlAction(0, 0, true) -- Next Camera
            DisableControlAction(0, 1, true) -- Look Left/Right
            DisableControlAction(0, 2, true) -- Look up/Down
            DisableControlAction(0, 16, true) -- Next Weapon
            DisableControlAction(0, 17, true) -- Select Previous Weapon
            DisableControlAction(0, 22, true) -- Jump
            DisableControlAction(0, 23, true) -- Enter vehicle
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 26, true) -- Look Behind
            DisableControlAction(0, 36, true) -- Input Duck/Sneak
            DisableControlAction(0, 37, true) -- Weapon Wheel
            DisableControlAction(0, 44, true) -- Cover
            DisableControlAction(0, 47, true) -- Detonate
            DisableControlAction(0, 55, true) -- Dive
            DisableControlAction(0, 69, true) -- Vehicle attack
            DisableControlAction(0, 81, true) -- Next Radio (Vehicle)
            DisableControlAction(0, 82, true) -- Previous Radio (Vehicle)
            DisableControlAction(0, 91, true) -- Passenger Aim (Vehicle)
            DisableControlAction(0, 92, true) -- Passenger Attack (Vehicle)
            DisableControlAction(0, 99, true) -- Select Next Weapon (Vehicle)
            DisableControlAction(0, 106, true) -- Control Override (Vehicle)
            DisableControlAction(0, 114, true) -- Fly Attack (Flying)
            DisableControlAction(0, 115, true) -- Next Weapon (Flying)
            DisableControlAction(0, 121, true) -- Fly Camera (Flying)
            DisableControlAction(0, 122, true) -- Control OVerride (Flying)
            DisableControlAction(0, 135, true) -- Control OVerride (Sub)
            DisableControlAction(0, 140, true) -- Melee attack light
            DisableControlAction(0, 142, true) -- Attack alternate
            DisableControlAction(0, 199, true) -- Pause menu (P)
            DisableControlAction(0, 200, true) -- Pause Menu (ESC) 
            DisableControlAction(0, 245, true) -- Chat
            DisableControlAction(0, 257, true) -- Attack 2

            DisableControlAction(0, 30, true) -- Player Movement
            DisableControlAction(0, 31, true) -- Player Movement

            if IsDisabledControlPressed(0, 25) then
                EnableControlAction(0, 1, true) -- Look Left/Right
                EnableControlAction(0, 2, true) -- Look up/Down
                EnableControlAction(0, 30, true) -- Player Movement
                EnableControlAction(0, 31, true) -- Player Movement
                EnableControlAction(0, 22, true) -- Jump
                EnableControlAction(0, 23, true) -- Enter vehicle
            end
        else
            Wait(500)
        end
        Wait(0)
    end
end)