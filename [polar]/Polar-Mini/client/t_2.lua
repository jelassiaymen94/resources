
local mode = 0 local counter = 0

RegisterKeyMapping("changemode", "Change Shooting Mode", "keyboard", 'o')
RegisterCommand("changemode", function(source)  switch() end, false)

function switch()
    weapon = GetWeapontypeGroup(GetSelectedPedWeapon(PlayerPedId()))
    if weapon == 970310034 then
    mode += 1
    if mode > 3 then mode = 1 end
    else  print('you need a weapon that has a firing switch') end
end
AddEventHandler('CEventGunShot', function() 
    counter = counter + 1
    weapon = GetWeapontypeGroup(GetSelectedPedWeapon(PlayerPedId()))
    if weapon == 970310034 then
        pause()
    end
end)
function pause()
    if mode == 1 then
        while IsDisabledControlPressed(0,24) do 
            DisablePlayerFiring(PlayerPedId(), true)
            Wait(1)
        end
    elseif mode == 2 then
        Wait(400)
        while IsDisabledControlPressed(0,24) do 
            DisablePlayerFiring(PlayerPedId(), true)
            Wait(1)
        end
    end
end




CreateThread(function()
    SetWeaponDamageModifier("weapon_unarmed", 0.2)
end)


