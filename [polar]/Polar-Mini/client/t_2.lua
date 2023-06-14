
local mode = 0 local counter = 0

RegisterKeyMapping("changemode", "Change Shooting Mode", "keyboard", 'o')
RegisterCommand("changemode", function(source)  switch() end, false)

function switch()
    weapon = GetWeapontypeGroup(GetSelectedPedWeapon(PlayerPedId()))
    if weapon == 970310034 then
    mode += 1
    if mode > 3 then mode = 1 end
    else print('you need a weapon that has a firing switch') end
end
AddEventHandler('CEventGunShot', function() 
    counter = counter + 1
    weapon = GetWeapontypeGroup(GetSelectedPedWeapon(PlayerPedId()))
    if weapon == 970310034 then
            if mode == 1 then
                pause()
        elseif mode == 2 then
            if counter > 7 then 
                pause()
            end  
        end 
    end
end)
function pause()
    while counter > 0 do
    if IsDisabledControlJustReleased(0,24) then weapon = nil counter = 0 end
    DisablePlayerFiring(PlayerPedId(), true)
    Wait(1)
    end
end

