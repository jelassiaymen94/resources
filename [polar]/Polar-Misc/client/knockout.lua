local QBCore = exports["qb-core"]:GetCoreObject()
local knockedOut = false
local wait = 15
local count = 60
local isdead = false

CreateThread(function()
        while true do
            Wait(1)
            local ped = PlayerPedId()
            PlayerData = QBCore.Functions.GetPlayerData()
            if not knockedOut then
            if IsPedInMeleeCombat(ped) then
                --  {UNARMED ONLY}
                if (HasPedBeenDamagedByWeapon(ped, GetHashKey("WEAPON_UNARMED"), 0)) then
                    -- Health to be knocked out
                    if GetEntityHealth(ped) < 150 then
                        knockedOut = true
                        --SetPlayerInvincible(ped, true)
                        -- Position taken by your Ped
                        SetPedToRagdoll(ped, 22000, 22000, 0, 0, 0, 0)
                        -- Time to wait
                        Wait(60)
                        local time = math.random(15000,20000)
                        QBCore.Functions.Progressbar("knocked-out", "Unconscious...", time, false, false, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true
                            },
                            {},
                            {},
                            {},
                            function()
                                -- Done
                                QBCore.Functions.Notify("Finally you're awake!", "success", 5000)
                               -- SetPlayerInvincible(ped, false)
                                Wait(120000)
                                knockedOut = false
                                SetEntityHealth(ped, 150)
                            end,
                            function()
                            end,
                            "fa-solid fa-face-dizzy")
             
                            knockedOut = false
                        -- Health after knockout preferably dont make it more than 150 (50 %) because people will abuse with it {No need to go to hospital or so}
                       
                    end
                end
            end
            end
            --[[if knockedOut then
                --Your ped is able to die
                SetPlayerInvincible(ped(), false)
                DisablePlayerFiring(ped(), true)
                SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
                ResetPedRagdollTimer(ped)
                -- Blur Cam
                SetTimecycleModifier("hud_def_blur")
                if wait >= 0 then
                    count = count - 1
                    if count == 0 then
                        count = 60
                        wait = wait - 1
                        --- in case bark
                        if GetEntityHealth(ped) <= 50 then
                            -- Ped healing
                            SetEntityHealth(ped, GetEntityHealth(ped) + 2)
                        end
                    end
                else
                    -- Remove Blue cam
                    SetTimecycleModifier("")
                    SetTransitionTimecycleModifier("")
                    -- Ped Able to die again
                    SetPlayerInvincible(ped(), false)
                    knockedOut = false
                end
            end]]
            -- Simple clear Knockout if Dead
            if PlayerData['isdead']then
                 -- Remove Konockout effect
                 SetTimecycleModifier("")
                 SetTransitionTimecycleModifier("")
                 knockedOut = false
             end
        end
    end
)
