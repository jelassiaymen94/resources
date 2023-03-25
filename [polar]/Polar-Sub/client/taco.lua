--[[CreateThread(function()
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
            job = 'taco',
			canInteract = function(e)local p = GetEntityModel(e) Wait(50) if p == 1951180813 then return true end 
			return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(e, 0.0, -4.0, 0.0)) < 5.0 end
			
		}
	},
		distance = 1.5,
	})
   -- end
end)
RegisterNetEvent('Polar-Sub:client:TacoTruck', function() print('TACO!')  











end)]]