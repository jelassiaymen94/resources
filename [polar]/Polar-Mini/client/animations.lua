






local prevPos = nil

local inAnim = false


CreateThread(function()
    while true do 
        local currentPos = GetEntityCoords(PlayerPedId())
            if currentPos == prevPos then
                if inAnim then else
                    print('1')
                -- PlayAnimation('move_m@generic_idles@std', 'idle_e')
                end
            else
                prevPos =  currentPos
            end
        Wait(1000)
    end
end)




function PlayAnimation(dict, anim)
    inAnim = true
        
     
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
    print('2')
    TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, -1, 1, 0, false, false, false)
    print('3')
    Wait(5000)
    inAnim = false
end
