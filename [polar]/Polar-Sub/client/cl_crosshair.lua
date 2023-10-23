
local on = true


local centerX, centerY = 0.5, 0.5 -- Middle of the screen
local circleRadius = 25.0 -- Adjust the radius as needed
local circleColor = {255, 255, 255, 255} -- RGBA color values



Citizen.CreateThread(function()
	while true do
		if on and IsAimCamActive() then
			HideHudComponentThisFrame(14)
			drawCrosshair()
		end
	Citizen.Wait(6)
	end
end)


RegisterNetEvent('cl:update_c')
AddEventHandler('cl:update_c', function(bool)
	on = bool
end)




RegisterCommand('togglecrosshair', function()
	if on then
		on = false
	elseif not on then 
		on = true
	end
end)





function drawCrosshair()
	local sprite = DrawCircle(centerX, centerY, 0, 5, circleColor[1], circleColor[2], circleColor[3], circleColor[4])
end
