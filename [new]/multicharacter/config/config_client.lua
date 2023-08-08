RegisterNetEvent("multicharacter:WeatherSync")
AddEventHandler("multicharacter:WeatherSync", function(boolean)
    if boolean then
        Wait(150)
        if Config.WeatherSync == 'cd_easytime' then
            TriggerEvent('cd_easytime:PauseSync', true)
        elseif Config.WeatherSync == 'qb-weathersync' then
            TriggerEvent('qb-weathersync:client:DisableSync')
        end
        Wait(50)
        NetworkOverrideClockTime(11, 0, 0)
        ClearOverrideWeather()
        ClearWeatherTypePersist()
        SetWeatherTypePersist(Config.Weather)
        SetWeatherTypeNow(Config.Weather)
        SetWeatherTypeNowPersist(Config.Weather)
    else
        Wait(150)
        if Config.WeatherSync == 'cd_easytime' then
            TriggerEvent('cd_easytime:PauseSync', false)
        elseif Config.WeatherSync == 'qb-weathersync' then
            TriggerEvent('qb-weathersync:client:EnableSync')
        end
    end
end)

openCharacterCreator = function(gender)
    TriggerEvent('Polar-Clothing:client:loadPlayerClothing', Config.Default, PlayerPedId())
    ResetEntityAlpha(PlayerPedId())
    SetPedAoBlobRendering(PlayerPedId(), true)
    if not Config.UseCustomSkinCreator then
        TriggerEvent('Polar-Clothes:client:CreateFirstCharacter')
    else
        TriggerEvent('multicharacter:openCreator', gender)
    end
end

openIdentity = function(cid)
    TriggerEvent('identity:showRegisterIdentity', cid)
end

if Config.RelogCommand then
	RegisterCommand('relog', function(source, args, rawCommand)
		if canRelog == true then
			canRelog = false
			TriggerServerEvent('multicharacter:relog')
            SetTimeout(10000, function()
				canRelog = true
            end)
		end
	end)
end