local QBCore = exports['qb-core']:GetCoreObject()
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
			event = "Polar-Sub:client:TacoTruck",
			icon = "fas fa-bolt",
			label = "Open Trunk",
           -- job = 'taco',
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
