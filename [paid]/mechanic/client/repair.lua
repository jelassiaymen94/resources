local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

--========================================================== Repair
local stashName = ""

local repairing = false
RegisterNetEvent('jim-mechanic:client:Repair:ItemCheck', function(data)
	if not Config.FreeRepair then if Config.RequiresJob and Config.StashRepair then
	TriggerEvent('jim-mechanic:client:Repair:Sure', data) else
	local p = promise.new() QBCore.Functions.TriggerCallback("jim-mechanic:repairCost", function(cb) p:resolve(cb) end, data)
	if Citizen.Await(p) then TriggerEvent('jim-mechanic:client:Repair:Sure', data)
	else
		triggerNotify(nil, Loc[Config.Lan]["repair"].materials, "error")
		TriggerEvent('jim-mechanic:client:Repair:Check')
	end
	end
	elseif Config.FreeRepair then TriggerEvent('jim-mechanic:client:Repair:Sure', data) end
end)

RegisterNetEvent('jim-mechanic:client:Repair:Apply', function(data)
	if not repairing then repairing = true else return end
	local vehicle, setanimDict, setanim, setflags, settask
	if not IsPedInAnyVehicle(PlayerPedId(), false) then	vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) end
	if lockedCar(vehicle) then return end
	if data.part == Loc[Config.Lan]["repair"].engine then
		SetVehicleDoorOpen(vehicle, 4, false, true)
	elseif data.part == Loc[Config.Lan]["repair"].body then
		SetVehicleDoorOpen(vehicle, 4, false, true)
		settask = "WORLD_HUMAN_WELDING"
	elseif data.part == Loc[Config.Lan]["repair"].radiator then
		SetVehicleDoorOpen(vehicle, 4, false, true)
		setanimDict = "mini@repair"
		setanim = "fixing_a_ped"
		setflags = 16
	elseif data.part == Loc[Config.Lan]["repair"].brakes then
		setanimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
		setanim = "machinic_loop_mechandplayer"
		setflags = 8
	elseif data.part == Loc[Config.Lan]["repair"].tank then
		setanimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
		setanim = "machinic_loop_mechandplayer"
		setflags = 8
	elseif data.part == Loc[Config.Lan]["repair"].tire then
		setanimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
		setanim = "machinic_loop_mechandplayer"
		setflags = 8
	end

	time = math.random(8000,10000)

	if Config.RequiresJob and Config.StashRepair and not Config.FreeRepair then
		stashName = PlayerJob.name .. "Safe"
		local bartext = Loc[Config.Lan]["repair"].repairing

		if data.part == Loc[Config.Lan]["repair"].engine then part = Config.RepairEngine cost = data.cost end
		if data.part == Loc[Config.Lan]["repair"].body then part = Config.RepairBody cost = data.cost end
		if data.part == Loc[Config.Lan]["repair"].radiator then part = Config.RepairRadiator cost = data.cost bartext = Loc[Config.Lan]["repair"].changing end
		if data.part == Loc[Config.Lan]["repair"].driveshaft then part = Config.RepairAxle cost = data.cost end
		if data.part == Loc[Config.Lan]["repair"].brakes then part = Config.RepairBrakes cost = data.cost bartext = Loc[Config.Lan]["repair"].changing end
		if data.part == Loc[Config.Lan]["repair"].clutch then part = Config.RepairClutch cost = data.cost bartext = Loc[Config.Lan]["repair"].changing end
		if data.part == Loc[Config.Lan]["repair"].tank then part = Config.RepairFuel cost = data.cost end
		if data.part == Loc[Config.Lan]["repair"].tire then part = "sparetire" cost = data.cost bartext = Loc[Config.Lan]["repair"].changing end

		local hasitem = false
		local indx = 0
		local countitem = 0
		local p = promise.new()
		QBCore.Functions.TriggerCallback('jim-mechanic:server:GetStashItems', function(cb) p:resolve(cb) end, stashName)
		StashItems = Citizen.Await(p)
		for k, v in pairs(StashItems) do
			if v.name == part then
				hasitem = true
				if v.amount >= cost then
					countitem = v.amount
					indx = k
				end
			end
		end
		emptyHands(PlayerPedId())
		if hasitem and countitem >= cost then
			local getoff = {}
			if data.part == Loc[Config.Lan]["repair"].tire then
				local coord = nil
				for _, v in pairs({"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}) do
					if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 1.5 then
						coord = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
						break
					end
				end
				lookVeh(coord)
				CreateThread(function()
					for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
						if IsVehicleTyreBurst(vehicle, v, false) == 1 or IsVehicleTyreBurst(vehicle, v, true) == 1 then
								getoff[v] = GetVehicleWheelXOffset(vehicle, v)
								SetVehicleWheelXOffset(vehicle, v, getoff[v] + 100)
							Wait(200)
						end
					end
				end)
			end
			if data.part == Loc[Config.Lan]["repair"].radiator then
				if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 1.5 then
					TaskGoStraightToCoord(PlayerPedId(), GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")), 1.0, -1, GetEntityHeading(PlayerPedId()), 0)
					Wait(600)
				end
				lookVeh(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")))
			end
			if data.part == Loc[Config.Lan]["repair"].engine then
				if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 1.5 then
					TaskGoStraightToCoord(PlayerPedId(), GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")), 1.0, -1, GetEntityHeading(PlayerPedId()), 0)
					Wait(600)
				end
				lookVeh(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")))
				lookVeh(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -2.0, 0.0))
				loadAnimDict("amb@world_human_vehicle_mechanic@male@base")
				TaskPlayAnim(PlayerPedId(), "amb@world_human_vehicle_mechanic@male@base", "base", 3.0, 3.0, -1, 1, 1.0, false, false, false)
			end
			if data.part == Loc[Config.Lan]["repair"].clutch then
				if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 1.5 then
					TaskGoStraightToCoord(PlayerPedId(), GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")), 1.0, -1, GetEntityHeading(PlayerPedId()), 0)
					Wait(600)
				end
				lookVeh(GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")))
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-180.0)
				loadAnimDict("amb@world_human_vehicle_mechanic@male@base")
				TaskPlayAnim(PlayerPedId(), "amb@world_human_vehicle_mechanic@male@base", "base", 3.0, 3.0, -1, 1, 1.0, false, false, false)
			end
			if data.part == Loc[Config.Lan]["repair"].driveshaft then
				local coord = nil
				for _, v in pairs({"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}) do
					if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 1.5 then
						coord = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
						break
					end
				end
				lookVeh(coord)
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId())-180.0)
				loadAnimDict("amb@world_human_vehicle_mechanic@male@base")
				TaskPlayAnim(PlayerPedId(), "amb@world_human_vehicle_mechanic@male@base", "base", 3.0, 3.0, -1, 1, 1.0, false, false, false)
			end
			QBCore.Functions.Progressbar("repair_part", bartext..data.part, time, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false,	},
			{ task = settask, animDict = setanimDict, anim = setanim, flags = setflag, }, {}, {}, function() -- Done
				repairing = false
				emptyHands(PlayerPedId())
				if data.part == Loc[Config.Lan]["repair"].body then
					local tirehealth = {}
					for i = 0, 5 do SetVehicleDoorShut(vehicle, i, false, true) Wait(200) end
					enhealth = GetVehicleEngineHealth(vehicle)
					for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
						tirehealth[v] = { health = GetTyreHealth(vehicle, v) }
						if IsVehicleTyreBurst(vehicle, v, false) == 1 or IsVehicleTyreBurst(vehicle, v, true) == 1 then
							tirehealth[v].defalte = IsVehicleTyreBurst(vehicle, v, false)
							tirehealth[v].rim = IsVehicleTyreBurst(vehicle, v, true)
						end
						print(json.encode(tirehealth[v]))
					end
					SetVehicleBodyHealth(vehicle, 1000.0)
					 SetVehicleFixed(vehicle)
					SetVehicleEngineHealth(vehicle, enhealth)
					for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
						SetTyreHealth(vehicle, v, tirehealth[v].health)
						if tirehealth[v].delate == 1 then SetVehicleTyreBurst(vehicle, v, 0, tirehealth[v].health)
						elseif tirehealth[v].rim == 1 then SetVehicleTyreBurst(vehicle, v, 1, 0.0) end
					end
				elseif data.part == Loc[Config.Lan]["repair"].engine then
					SetVehicleEngineHealth(vehicle, 1000.0) SetVehiclePetrolTankHealth(vehicle, 1000.0) SetVehicleOilLevel(vehicle, 1000.0)
				elseif data.part == Loc[Config.Lan]["repair"].radiator then
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "radiator", 100)
				elseif data.part == Loc[Config.Lan]["repair"].driveshaft then
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "axle", 100)
				elseif data.part == Loc[Config.Lan]["repair"].brakes then
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "brakes", 100)
				elseif data.part == Loc[Config.Lan]["repair"].clutch then
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "clutch", 100)
				elseif data.part == Loc[Config.Lan]["repair"].tank then
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "fuel", 100)
				elseif data.part == Loc[Config.Lan]["repair"].tire then
					for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
						if getoff[v] then SetVehicleWheelXOffset(vehicle, v, getoff[v]) end
						SetVehicleTyreFixed(vehicle, v)
					end
				end
				emptyHands(PlayerPedId())
				updateCar(vehicle)
				TriggerEvent("jim-mechanic:client:Repair:Check")
				triggerNotify(nil, data.part..Loc[Config.Lan]["repair"].repaired, "success")

				if (countitem - cost) <= 0 then StashItems[indx] = nil
				else countitem = (countitem - cost)	StashItems[indx].amount = countitem	end

				TriggerServerEvent('jim-mechanic:server:saveStash', stashName, StashItems)
				qblog("Repaired `"..data.part.."` [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")

			end, function()
				repairing = false
				triggerNotify(nil, data.part..Loc[Config.Lan]["repair"].cancel, "error")
				emptyHands(PlayerPedId())
				for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do if getoff[v] then SetVehicleWheelXOffset(vehicle, v, getoff[v]) end end
			end, "mechanic_tools")
		else
			triggerNotify(nil, Loc[Config.Lan]["repair"].nomaterials, 'error')
			repairing = false
			return
		end

	else
		QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["repair"].repairing..data.part, time, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
		{ task = settask, animDict = setanimDict, anim = setanim, flags = setflag, }, {}, {}, function()
			repairing = false
			emptyHands(PlayerPedId())
			if data.part == Loc[Config.Lan]["repair"].body then
				enhealth = GetVehicleEngineHealth(vehicle)
				SetVehicleBodyHealth(vehicle, 1000.0)
				 SetVehicleFixed(vehicle)
				SetVehicleEngineHealth(vehicle, enhealth)
			elseif data.part == Loc[Config.Lan]["repair"].engine then
				SetVehicleEngineHealth(vehicle, 1000.0)
			elseif data.part == Loc[Config.Lan]["repair"].radiator then
				TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "radiator", 100)
			elseif data.part == Loc[Config.Lan]["repair"].driveshaft then
				TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "axle", 100)
			elseif data.part == Loc[Config.Lan]["repair"].brakes then
				TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "brakes", 100)
			elseif data.part == Loc[Config.Lan]["repair"].clutch then
				TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "clutch", 100)
			elseif data.part == Loc[Config.Lan]["repair"].tank then
				TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "fuel", 100)
			elseif data.part == Loc[Config.Lan]["repair"].tire then
				for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
					if getoff[v] then SetVehicleWheelXOffset(vehicle, v, getoff[v]) end
					SetVehicleTyreFixed(vehicle, v)
				end
			end
			if not Config.FreeRepair then TriggerServerEvent('jim-mechanic:ItemRemove', data) end

			emptyHands(PlayerPedId())
			updateCar(vehicle)
			TriggerEvent("jim-mechanic:client:Repair:Check")
			triggerNotify(nil, data.part..Loc[Config.Lan]["repair"].repaired, "success")
		end, function()
			for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do if getoff[v] then SetVehicleWheelXOffset(vehicle, v, getoff[v]) end end
			repairing = false
			triggerNotify(nil, data.part..Loc[Config.Lan]["repair"].cancel, "error")
			emptyHands(PlayerPedId())
		end, "mechanic_tools")
	end
end)

local prevVehicle = nil
RegisterNetEvent('jim-mechanic:client:Repair:Check', function()
	if repairing then return end
	if not skip then if not jobChecks() then return end if not locationChecks() then return end end
	if not inCar() then return end
	if not nearPoint(GetEntityCoords(PlayerPedId())) then return end
	if not IsPedInAnyVehicle(PlayerPedId(), false) then	vehicle = getClosest(GetEntityCoords(PlayerPedId())) pushVehicle(vehicle) lookVeh(vehicle) end
	if lockedCar(vehicle) then return end
	local health = GetVehicleBodyHealth(vehicle) if health < 0.0 then SetVehicleBodyHealth(vehicle, 0.0) elseif health > 1000.0 then SetVehicleBodyHealth(vehicle, 1000.0) end
	local enghealth = GetVehicleEngineHealth(vehicle) if enghealth < 0.0 then SetVehicleEngineHealth(vehicle, 0.0) elseif enghealth > 1000.0 then SetVehicleEngineHealth(vehicle, 1000.0) end
	if useMechJob() then
		if not exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "radiator") then
			if Config.Debug then print("^5Debug^7: '^1nil^7' ^2value found^7, ^2resetting all extra damages to 100^7%") end
			for _, v in pairs({"radiator", "axle", "brakes", "clutch", "fuel"})	do TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), v, 100) end
		end
		if Config.Debug then
			for _, v in pairs({ "radiator", "axle", "brakes", "clutch", "fuel" }) do
				print("^5Debug^7: ^3"..v.."^7: ^6"..exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), v))
			end
		end
	end
	local costEngine, costBody, costRadiator, costAxle, costBrakes, costClutch, costFuel = table.unpack({"", "", "", "", "", "", ""})
	if skip == -2 then else
		if not Config.FreeRepair then
			--Calculate the costs of each part based on damage
			EngineRepair = Config.RepairEngineCost - math.floor(Config.RepairEngineCost * math.floor((GetVehicleEngineHealth(vehicle)/10)+0.5) / 100)
			if EngineRepair ~= 0 then costEngine = Loc[Config.Lan]["repair"].cost..EngineRepair.." "..QBCore.Shared.Items[Config.RepairEngine].label end
			BodyRepair = Config.RepairBodyCost - math.floor(Config.RepairBodyCost * math.floor((GetVehicleBodyHealth(vehicle)/10)+0.5) / 100)
			if GetVehicleBodyHealth(vehicle) < 0 then BodyRepair = Config.RepairBodyCost end
			if BodyRepair ~= 0 then costBody = Loc[Config.Lan]["repair"].cost..BodyRepair.." "..QBCore.Shared.Items[Config.RepairBody].label end
			if useMechJob() then
				RadiatorRepair = Config.RepairRadiatorCost - math.floor(Config.RepairRadiatorCost *	math.floor(exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)),	"radiator")+0.5) / 100)
				if RadiatorRepair ~= 0 then costRadiator = Loc[Config.Lan]["repair"].cost..RadiatorRepair.." "..QBCore.Shared.Items[Config.RepairRadiator].label end
				AxleRepair = Config.RepairAxleCost - math.floor(Config.RepairAxleCost * math.floor(exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "axle")+0.5) / 100)
				if AxleRepair ~= 0 then costAxle = Loc[Config.Lan]["repair"].cost..AxleRepair.." "..QBCore.Shared.Items[Config.RepairAxle].label end
				BrakesRepair = Config.RepairBrakesCost - math.floor(Config.RepairBrakesCost * math.floor(exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "brakes")+0.5) / 100)
				if BrakesRepair ~= 0 then costBrakes = Loc[Config.Lan]["repair"].cost..BrakesRepair.." "..QBCore.Shared.Items[Config.RepairBrakes].label or "" end
				ClutchRepair = Config.RepairClutchCost - math.floor(Config.RepairClutchCost * math.floor(exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "clutch")+0.5) / 100)
				if ClutchRepair ~= 0 then costClutch = Loc[Config.Lan]["repair"].cost..ClutchRepair.." "..QBCore.Shared.Items[Config.RepairClutch].label end
				FuelRepair = Config.RepairFuelCost - math.floor(Config.RepairFuelCost * math.floor(exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "fuel")+0.5) / 100)
				if FuelRepair ~= 0 then costFuel = Loc[Config.Lan]["repair"].cost..FuelRepair.." "..QBCore.Shared.Items[Config.RepairFuel].label end
			end
		end
	end

	local RepairMenu = {
		{ isMenuHeader = true, header = searchCar(vehicle), txt = Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(vehicle))..Loc[Config.Lan]["check"].value..searchPrice(vehicle).."<br>"..searchDist(vehicle)}, }
		RepairMenu[#RepairMenu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = string.gsub(Loc[Config.Lan]["common"].close, "❌ ", ""), params = { event = "jim-mechanic:client:Menu:Close" } }
		local headerlock = false
		local wheels = 0
		for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do if IsVehicleTyreBurst(vehicle, v, 0) == 1 or IsVehicleTyreBurst(vehicle, v, 1) == 1 then wheels = wheels + 1 end end
		if wheels >= 1 then
			RepairMenu[#RepairMenu+1] =	{ icon = "fas fa-compact-disc", isMenuHeader = false, header = "", txt = Loc[Config.Lan]["repair"].replacetire..Loc[Config.Lan]["repair"].cost..wheels.." "..QBCore.Shared.Items["sparetire"].label, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].tire, vehicle = vehicle, status = vehicleStatus, cost = wheels }, }, }
		end
		if math.floor((GetVehicleEngineHealth(vehicle)/10)+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].engine,
			txt = nosBar(math.floor((GetVehicleEngineHealth(vehicle)/10)+0.5)).." "..math.floor((GetVehicleEngineHealth(vehicle)/10)+0.5).."%"..costEngine, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].engine, vehicle = vehicle, cost = EngineRepair } } }
		headerlock = false
		if math.floor((GetVehicleBodyHealth(vehicle)/10)+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].body,
			txt =  nosBar(math.floor((GetVehicleBodyHealth(vehicle)/10)+0.5)).." "..math.floor((GetVehicleBodyHealth(vehicle)/10)+0.5).."%"..costBody, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].body, vehicle = vehicle, cost = BodyRepair } } }
		headerlock = false
		if useMechJob() then
			if math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "radiator"))+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].radiator,
				txt = nosBar(math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "radiator"))+0.5)).." "..math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "radiator"))+0.5).."%"..costRadiator, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].radiator, vehicle = vehicle, status = vehicleStatus, cost = RadiatorRepair } } }
			headerlock = false
			if math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "axle"))+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].driveshaft,
				txt = nosBar(math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "axle"))+0.5)).." "..math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "axle"))+0.5).."%"..costAxle, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].driveshaft, vehicle = vehicle, status = vehicleStatus, cost = AxleRepair } } }
			headerlock = false
			if math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "brakes"))+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].brakes,
				txt = nosBar(math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "brakes"))+0.5)).." "..math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "brakes"))+0.5).."%"..costBrakes, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].brakes, vehicle = vehicle, status = vehicleStatus, cost = BrakesRepair } } }
			headerlock = false
			if math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "clutch"))+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].clutch,
				txt = nosBar(math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "clutch"))+0.5)).." "..math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "clutch"))+0.5).."%"..costClutch, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].clutch, vehicle = vehicle, status = vehicleStatus, cost = ClutchRepair } } }
			headerlock = false
			if math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "fuel"))+0.5) == 100 or skip == -2 then headerlock = true end
			RepairMenu[#RepairMenu+1] =	{ isMenuHeader = headerlock, header = Loc[Config.Lan]["repair"].tank,
				txt = nosBar(math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "fuel"))+0.5)).." "..math.floor((exports['qb-mechanicjob']:GetVehicleStatus(trim(GetVehicleNumberPlateText(vehicle)), "fuel"))+0.5).."%"..costFuel, params = { event = "jim-mechanic:client:Repair:ItemCheck", args = { part = Loc[Config.Lan]["repair"].tank, vehicle = vehicle, status = vehicleStatus, cost = FuelRepair } } }
		end
	if DoesEntityExist(vehicle) then
		if prevVehicle == vehicle then
			AttachEntityToEntity(makeProp({prop = `p_amb_clipboard_01`, coords = vector4(0,0,0,0)}, 1, 1), PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 36029), 0.16, 0.08, 0.1, -130.0, -50.0, 0.0, true, true, false, false, 1, true)
			loadAnimDict("missfam4")
			TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 3.0, 2000, 1, 1.0, false, false, false)
			for i = 0, 5 do SetVehicleDoorOpen(vehicle, i, false, false) end
			exports['qb-menu']:openMenu(RepairMenu)
		else
			SetVehicleDoorOpen(vehicle, 4, false, false)
			time = math.random(3000,5000)
			for i = 0, 5 do SetVehicleDoorOpen(vehicle, i, false, false) end
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["repair"].checkeng, time, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 16, }, {}, {}, function()
				time = math.random(3000,5000)
				QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["repair"].checkbody, time, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
				{ animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 8, },
				{}, {}, function()
					prevVehicle = vehicle
					loadModel(`p_amb_clipboard_01`)
					AttachEntityToEntity(makeProp({prop = `p_amb_clipboard_01`, coords = vector4(0,0,0,0)}, 1, 1), PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 36029), 0.16, 0.08, 0.1, -130.0, -50.0, 0.0, true, true, false, false, 1, true)
					loadAnimDict("missfam4")
					TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 3.0, 2000, 1, 1.0, false, false, false)
					exports['qb-menu']:openMenu(RepairMenu)
				end, function() -- Cancel
					emptyHands(PlayerPedId())
				end, "mechanic_tools")
			end, function()-- Cancel
					emptyHands(PlayerPedId())
				return
			end, "mechanic_tools")
		end
	end
end)

RegisterNetEvent('jim-mechanic:client:Repair:Sure', function(data)
	local playerPed	= PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	if not inCar() then return end
	if not IsPedInAnyVehicle(playerPed, false) then	vehicle = getClosest(coords) pushVehicle(vehicle) end
	if lockedCar(vehicle) then return end
	local vehicleStatus = data.status
	if DoesEntityExist(vehicle) then
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		local RepairMenu = {}
		RepairMenu[#RepairMenu+1] = { isMenuHeader = true, header = searchCar(vehicle), txt = Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(vehicle))..Loc[Config.Lan]["check"].value..searchPrice(vehicle).."<br>"..searchDist(vehicle)}
		RepairMenu[#RepairMenu+1] = { header = Loc[Config.Lan]["repair"].doyou..data.part.."?", isMenuHeader = true }
		if Config.JimMenu then
			RepairMenu[#RepairMenu + 1] = { icon = "fas fa-circle-check", header = "", txt = string.gsub(Loc[Config.Lan]["check"].label47, "✅ ", ""), params = { event = "jim-mechanic:client:Repair:Apply", args = { part = data.part, cost = data.cost } } }
			RepairMenu[#RepairMenu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = string.gsub(Loc[Config.Lan]["check"].label48, "❌ ", ""), params = { event = "jim-mechanic:client:Repair:Check" } }
		else
			RepairMenu[#RepairMenu + 1] = { header = "", txt = Loc[Config.Lan]["check"].label47, params = { event = "jim-mechanic:client:Repair:Apply", args = { part = data.part, cost = data.cost } } }
			RepairMenu[#RepairMenu + 1] = { header = "", txt = Loc[Config.Lan]["check"].label48, params = { event = "jim-mechanic:client:Repair:Check" } }
		end
		exports['qb-menu']:openMenu(RepairMenu)
	end
end)