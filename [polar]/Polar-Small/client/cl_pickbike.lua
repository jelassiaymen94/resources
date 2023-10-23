local QBCore = exports['qb-core']:GetCoreObject()
local bike = nil
local hasbike = false
local closebike = false
local bikes = {
['bmx'] = {
	['x'] = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
['tribike3'] = {
	x = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
['fixter'] = {
	x = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
['cruiser'] = {
	x = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
['scorcher'] = {
	x = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
['tribike2'] = {
	x = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
['tribike'] = {
	x = 0.0,
	y = 0.35,
	z = 0.160,
	RotX = 180.0,
	RotY = 170.0,
	RotZ = 90.0
},
}
local function PickUpBike(hash)
	local ped = PlayerPedId()
	local name = string.lower(GetDisplayNameFromVehicleModel(hash))
	RequestAnimDict("anim@heists@box_carry@")
	while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
		Wait(1)
	end
	TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
	AttachEntityToEntity(bike, ped, GetPedBoneIndex(player, 60309), bikes[name].x, bikes[name].y, bikes[name].z, bikes[name].RotX, bikes[name].RotY, bikes[name].RotZ, true, false, false, true, 0, true)
	hasbike = true
	exports['qb-core']:DrawText("[G] Drop ", 'left')
end

local function PressedKey(hash)
	CreateThread(function ()
		while not hasbike do
			local ped = PlayerPedId()
			if IsControlJustReleased(0, 38) then
				PickUpBike(hash)
			end
			Wait(1)
		end
	end)
end

CreateThread( function ()

		for k,v in pairs(bikes) do
			local hash = GetHashKey(k)
			exports['qb-target']:AddTargetModel(hash, {
				options = {
				{
					type = "client",
					event = "Polar-Bikes:client:takeup", -- I'm not familiar but there is a way to put the function right in here and pass the variable i believe but this event will do for now.
					icon = "fas fa-bicycle",
					label = "Pick Up",
					hash = hash
				}
			},
				distance = 2.0,
			})
		end

end)

RegisterNetEvent("Polar-Bikes:client:takeup", function(data)
	local hash = data.hash
	bike = QBCore.Functions.GetClosestVehicle()
	PickUpBike(hash)
end)

RegisterCommand('dropbike', function()
	if IsEntityAttachedToEntity(bike, PlayerPedId()) then
		DetachEntity(bike, false, false)
		SetVehicleOnGroundProperly(bike)
		ClearPedTasks(PlayerPedId())
		hasbike = false
		closebike = false
		exports['qb-core']:HideText()
	end
end)

RegisterKeyMapping('dropbike', 'Drop Bike', 'keyboard', 'G')
