
local on = true

local circleRadius = 50.0 -- Adjust the radius as needed
local circleColor = {255, 255, 255, 255} -- RGBA color values
local circleSegments = 360 -- Number of line segments to approximate the circle



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
	local centerX, centerY = GetActiveScreenResolution() / 2, GetActiveScreenResolution() / 2
	local step = 2.0 * math.pi / circleSegments

	for i = 1, circleSegments do
		local x1 = circleRadius * math.cos(step * (i - 1)) + centerX
		local y1 = circleRadius * math.sin(step * (i - 1)) + centerY
		local x2 = circleRadius * math.cos(step * i) + centerX
		local y2 = circleRadius * math.sin(step * i) + centerY

		DrawLine(x1, y1, x2, y2, circleColor[1], circleColor[2], circleColor[3], circleColor[4])
	end
end
