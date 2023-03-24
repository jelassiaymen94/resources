local QBCore = exports['qb-core']:GetCoreObject()
local cutting = false
local p = nil
local h = 1
CreateThread(function()
   -- while true do 
    --    Wait(1000)
	local pallets = {
		'hw1_13_props_pallet01lod5',
		'prop_pallet_pile_02',
		'p_pallet_02a_s',
		'prop_pallet_pile_01',
		'test_tree_forest_trunk_base_01',
		'test_tree_forest_trunk_04',

		}
    
	exports['qb-target']:AddTargetModel(pallets, {
		options = {
		{ 
			type = "client",
			event = "Polar-Sub:client:pallet",
			icon = "fas fa-bolt",
			label = "Cut",
            --job = 'taco',
			-- item = '',
			canInteract = function(e) p = e if h == 1 then return true end end,
			
		}
	},
		distance = 1.5,
	})
   -- end
end)
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end
function LoadAnimDict(dict) if HasAnimDictLoaded(dict) then return end RequestAnimDict(dict) while not HasAnimDictLoaded(dict) do    Wait(10) end end
RegisterNetEvent('Polar-Sub:client:pallet', function(data) 
	loadModel('prop_tool_consaw')
	cutting = true
	local coords = GetEntityCoords(p)
	TriggerEvent('Polar-Sub:Client:Loop', coords)
	local prop = CreateObject('prop_tool_consaw', vector3(0,0,0), true, true, true)
	DisableCamCollisionForEntity(prop)
	AttachEntityToEntity(prop, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 18905), 0.38, -0.1, 0.23, -91.0, -53.0, 2.0, true, true, false, false, 1, true)
	local dict = "weapons@heavy@minigun"
	local anim = "fire_low"
	loadAnimDict(dict)
	--TaskTurnPedToFaceEntity(PlayerPedId(), p, 1.0)
	TaskPlayAnim(PlayerPedId(), dict, anim, 3.0, 3.0, -1, 1, 0, false, false, false)
	Wait(5000)
	ClearPedTasks(PlayerPedId())
	SetEntityAsMissionEntity(p, true, true)
	DeleteEntity(p)
	SetEntityAsMissionEntity(prop, true, true)
	DeleteEntity(prop)
	cutting = false
	TriggerServerEvent('Polar-Sub:Server:fuckyou', p, 'wood', 1)
end)

RegisterNetEvent('Polar-Sub:Client:Loop', function(coords)
	CreateThread(function()
		while cutting do
			Wait(200)

			if not HasNamedPtfxAssetLoaded("core") then  RequestNamedPtfxAsset("core") end while not HasNamedPtfxAssetLoaded("core") do Wait(0) end
			UseParticleFxAssetNextCall("core")
			local dust = StartNetworkedParticleFxNonLoopedAtCoord("ent_dst_wood_splinter", coords.x, coords.y, coords.z-1.5, 0.0, 0.0, math.random(0,359)+.0, 1.7, 0.0, 0.0, 0.0)
			

		end
	
	
	end)
	


end)
