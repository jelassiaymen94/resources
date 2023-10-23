

CreateThread(function()
	while true do
		if IsAimCamActive() then
			HideHudComponentThisFrame(14)
			drawCrosshair(true)
		else
			drawCrosshair(false)
		end
		Wait(100)
	end
end)






function drawCrosshair(bool)
	if bool then
	SendNUIMessage({
		type = "dot",
		display = true
	})
	else
	SendNUIMessage({
		type = "dot",
		display = false
	})
	end
end
