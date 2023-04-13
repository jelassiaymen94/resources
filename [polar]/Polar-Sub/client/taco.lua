local QBCore = exports['qb-core']:GetCoreObject()


local table = {
	['bmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['blueberry'] = 1, },
	 ['gmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['mint'] = 1, },
	 ['omochi'] = { ['sugar'] = 1, ['flour'] = 1, ['orange'] = 1,  },
	 ['pmochi'] = { ['sugar'] = 1, ['flour'] = 1, ['strawberry'] = 1, },
	 ['riceball'] = { ['rice'] = 1, ['nori'] = 1, },
	 ['bento'] = { ['rice'] = 1, ['nori'] = 1, ['tofu'] = 1, },
	 ['purrito'] = { ['rice'] = 1, ['flour'] = 1, ['onion'] = 1, },
	 ['ernadotaco'] = { ['rice'] = 1, ['flour'] = 1, ['onion'] = 1, }
}

CreateThread(function()
   -- while true do 
    --    Wait(1000)
	local bones = {
		'door_pside_r',
		'door_dside_r',
		'handle_pside_r',
		'handle_dside_r',
		}
    
	exports['qb-target']:AddTargetBone(bones, {
		options = {
		{ 
			type = "client",
			event = "jim-catcafe:Crafting",
			icon = "fas fa-bolt",
			label = "Open Trunk",
			craftable = table,
            job = 'taco',
			canInteract = function(e) local p = GetEntityModel(e) Wait(50) if p == 1951180813 then return true end end
			
			
		}
	},
		distance = 1.5,
	})
   -- end
end)

function LoadAnimDict(dict)
    if HasAnimDictLoaded(dict) then return end

    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end
RegisterNetEvent('Polar-Sub:client:TacoTruck', function() 
	LoadAnimDict("amb@prop_human_bum_bin@idle_b")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "idle_d", 4.0, 4.0, -1, 50, 0, false, false, false)
	exports['qb-menu']:openMenu({
        { header = "<img src=nui://"..Config.img..QBCore.Shared.Items['largejoint'].image.." width=45px onerror='this.onerror=null; this.remove();'> Joints",
        txt = "", isMenuHeader = true },
        
		{ header = "<img src=nui://"..Config.img..QBCore.Shared.Items['1ozhigh'].image.." width=45px onerror='this.onerror=null; this.remove();'> Small Joint",
        txt = "Roll Some Small Ass Joints (1 Ounce Needed)", params = { event = "Polar-Weed:Client:SmallJointMake",}},
        
		{ header = "<img src=nui://"..Config.img..QBCore.Shared.Items['1ozhigh'].image.." width=45px onerror='this.onerror=null; this.remove();'> Large Joint",
        txt = "fuk u", params = { event = "Polar-Sub:Client:Make2",}},
        
		{ header = "Exit", params = { event = "Polar-Sub:client:CloseTruck"}},
    })
end)
RegisterNetEvent('Polar-Sub:client:CloseTruck', function ()
	LoadAnimDict("amb@prop_human_bum_bin@idle_b")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)


end)
RegisterNetEvent('Polar-Sub:Client:Make2', function()
	LoadAnimDict("amb@prop_human_bum_bin@idle_b")
    TaskPlayAnim(PlayerPedId(), "amb@prop_human_bum_bin@idle_b", "exit", 4.0, 4.0, -1, 50, 0, false, false, false)
	print('2')

end)







local blurEnabled = false
local mod = '2'
local str = 1.0

RegisterNetEvent('Polar-Sub:Client:W', function()

	local currentCamMode = GetFollowPedCamViewMode()

    -- Check if the camera is valid
    if currentCamMode > -1 then
        -- Check if motion blur is currently enabled
        local blurEnabled = false
        local timecycle = GetTimecycleModifierIndex()
        if string.find(timecycle, mod) then
            blurEnabled = true
        end

        -- Get the player's head position
        local headPos = GetPedBoneCoords(PlayerPedId(), 31086)

        -- Calculate the camera position offset based on the player's head position
        local cameraOffset = vector3(0.0, 1.0, 0.7) -- adjust this value to change the distance
        local cameraPos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), cameraOffset)

        -- Create a new camera positioned at the calculated position offset
        local newCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(newCam, cameraPos.x, cameraPos.y, cameraPos.z)
        SetCamRot(newCam, -10.0, 0.0, GetEntityHeading(PlayerPedId()) - 180.0, 2)
        SetCamFov(newCam, 50.0)

        -- Set the new camera as the rendering camera
        RenderScriptCams(true, false, 0, true, false)
		SetCamMotionBlurStrength(newCam, str)
        -- Apply the motion blur effect to the background
        SetTimecycleModifier(mod)
        SetTimecycleModifierStrength(str)

        -- Toggle the motion blur effect
        if blurEnabled then
            ClearTimecycleModifier()
            QBCore.Functions.Notify("Disabled motion blur", "success")
        else
            QBCore.Functions.Notify("Enabled motion blur", "success")
        end
    else
        -- Notify the player that the camera is invalid
        QBCore.Functions.Notify("Invalid camera", "error")
    end
end)
