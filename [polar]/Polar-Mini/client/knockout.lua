local QBCore = exports["qb-core"]:GetCoreObject()
local knockedOut = false
local count = 0
local isdead = false

CreateThread(function()
        while true do
            Wait(100)
            local ped = PlayerPedId()
            PlayerData = QBCore.Functions.GetPlayerData()
            if not knockedOut then
            if IsPedInMeleeCombat(ped) then
                if (HasPedBeenDamagedByWeapon(ped, GetHashKey("WEAPON_UNARMED"), 0)) then
                    print(count)
                    count += 1
                   if count > 2 then
                    if GetEntityHealth(ped) < 190 then
                        knockedOut = true
                        local time = math.random(15000,20000)
                        SetPedToRagdoll(ped, time+1000, time+1000, 0, 0, 0, 0)
                        Wait(60)
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
                                QBCore.Functions.Notify("Finally you're awake!", "success", 5000)
                                Wait(30000)
                                count = 0
                                knockedOut = false
                            end,
                            function()
                            end)
                            count = 0
                            knockedOut = false
                        end
                    end
                end
            end
            end
            if PlayerData['isdead']then
                 SetTimecycleModifier("")
                 SetTransitionTimecycleModifier("")
                 knockedOut = false
             end
        end
    end
)
