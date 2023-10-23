
local on = true


local screenX, screenY = 0.5, 0.5 -- Middle of the screen
local crosshairWidth, crosshairHeight = 32, 32 -- Adjust the size as needed
local crosshairTextureDict = "commonmenu"
local crosshairTextureName = "shop_box_blank"



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
	local sprite = DrawSprite(crosshairTextureDict, crosshairTextureName, screenX, screenY, crosshairWidth / 1920.0, crosshairHeight / 1080.0, 0.0, 255, 255, 255, 255)
end
