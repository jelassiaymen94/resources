local QBCore = exports['qb-core']:GetCoreObject()


function isCloseVeh()
	
    local ped = PlayerPedId()
    coordA = GetEntityCoords(ped, 1)
    coordB = GetOffsetFromEntityInWorldCoords(ped, 0.0, 100.0, 0.0)
    vehicle = getVehicleInDirection(coordA, coordB)
    if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
        return true
    end
    return false

end

function getVehicleInDirection(coordFrom, coordTo)
	local offset = 0
	local rayHandle
	local vehicle
	for i = 0, 100 do
		rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z + offset, 10, PlayerPedId(), 0)	
		a, b, c, d, vehicle = GetRaycastResult(rayHandle)
		offset = offset - 1
		if vehicle ~= 0 then break end
	end
	local distance = Vdist2(coordFrom, GetEntityCoords(vehicle))
	if distance > 25 then vehicle = nil end
    return vehicle ~= nil and vehicle or 0
end

function hasEnoughOfItem(item)
	local retval = false
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
		if result then
			retval = true
		end
		return retval
	end, item)
end

local ingar = false
local inpound = false
local inbennys = false
RegisterNetEvent('Polar-Radial:Client:InImpound', function(bool) inpound = bool end)
RegisterNetEvent('Polar-Radial:Client:InGarage', function(bool) ingar = bool end)
RegisterNetEvent('Polar-Radial:Client:InBennys', function(bool) inbennys = bool end)
function inGarage()
	return ingar




end
function inImpound()
	return inpound




end
function bennys()
	return inbennys



end