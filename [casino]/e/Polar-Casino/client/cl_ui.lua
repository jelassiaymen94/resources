RegisterNetEvent('casinoUi:ShowUI')
AddEventHandler('casinoUi:ShowUI', function(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end)

RegisterNetEvent('casinoUi:HideUI')
AddEventHandler('casinoUi:HideUI', function()
	SendNUIMessage({
		action = 'hide'
	})
end)

function DrawCasinoUi(action, text)
	SendNUIMessage({
		action = action,
		text = text,
	})
end

function HideCasinoUi()
	SendNUIMessage({
		action = 'hide'
	})
end


