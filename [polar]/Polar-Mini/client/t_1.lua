
local type = 'mph' -- mph or kmh, sets type of speed your server uses


local sleeptimer = nil local vroom = nil local stop = nil


RegisterCommand('startspeed', function()
    if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
        CreateThread(function()
            stop = false
            while true do
                if stop then break end
                if GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 then
                local car = GetVehiclePedIsIn(PlayerPedId()) local model = GetEntityModel(car)  local m = GetDisplayNameFromVehicleModel(model)
                local speed = GetEntitySpeed(PlayerPedId()) -- PlayerPedId()
                if type == 'mph' then
                    vroom = speed * 2.236936 -- mph
                    print('Your Speed is ' .. math.floor(vroom) .. ' Miles Per Hour in a ' .. m .. '')
                elseif type == 'kmh' then
                    vroom = speed * 3.6
                    print('Your Speed is ' .. math.floor(vroom) .. ' Kilometers Per Hour in a ' .. m .. '')
                else
                    print('wrong type')
                end
                time = sleeptimer or 2000
                Wait(time)
                else break end
            end
        end)
    else print('no car') end
end)
RegisterCommand('setspeed', function(source, args)
        sleeptime = tonumber(args[1])
        sleeptimer = sleeptime * 1000
end)
RegisterCommand('stopspeed', function()
    stop = true
    sleeptimer = nil
end)