local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

Config.RepairLocations = {
    --Add your poly zone box locations and job name for each store and it will add it to the qb-target loop above
   -- { coords = vector4(121.0, -3047.69, 7.04, 270.11), }, -- TUNERS GARAGE
	--{ coords = vector4(-45.27, -1048.43, 28.4, 250.0), }, -- BENNYS NEXT TO PDM
	--{ coords = vector4(-1164.42, -2018.84, 13.18, 313.67), }, -- AIRPORT LSCUSTOMS
	--{ coords = vector4(1184.09, 2639.45, 37.75, 89.97), }, -- HARMONY
	--{ coords = vector4(103.46, 6620.7, 31.79, 315.31), }, -- BEEKERS GARAGE
	--{ coords = vector4(-328.4855, -138.4216, 39.0097, 73.5023), }, -- LS CUSTSOMS main
	--{ coords = vector4(730.6884, -1093.4324, 22.1691, 355.2512), }, -- LS CUSTSOMS HAWICK
	--{ coords = vector4(965.7256, -105.9416, 74.3637, 129.8147), }, -- LOST MC
	--{ coords = vector4(539.2959, -168.4962, 54.4813, 95.5089), }, -- globe Oil
	--{ coords = vector4(-742.4644, -1507.0500, 5.0005, 27.4131), }, -- heli tours Oil
}
local PlayerData = {}
local bench = {}
local Targets = {}
CreateThread(function()
	for k, v in pairs(Config.RepairLocations) do
		bench[#bench+1] = makeProp({coords = vector4(v.coords.x, v.coords.y, v.coords.z-1.37, v.coords.w), prop = `gr_prop_gr_bench_03a`}, 1, 0)
		Targets["repairbench"..k] =
		exports['qb-target']:AddBoxZone("repairbench"..k, v.coords.xyz, 1.2, 4.2, { name="repairbench"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1, maxZ = v.coords.z+1.4, },
			{ options = { { event = "jim-mechanic:client:Manual:Menu", icon = "fas fa-cogs", label = Loc[Config.Lan]["police"].userepair, }, }, distance = 5.0 })
	end
end)

RegisterNetEvent('jim-mechanic:client:Manual:Menu', function()
	if not outCar() then return end
	PlayerData = QBCore.Functions.GetPlayerData()

	if Config.requireDutyCheck then
		if not PlayerData.job.name == "police"  then
		elseif not PlayerData.job.name == "ambulance" then
		local p = promise.new()	QBCore.Functions.TriggerCallback('jim-mechanic:mechCheck', function(cb) p:resolve(cb) end)
		if Citizen.Await(p) == true then triggerNotify(nil, Config.dutyMessage, "error") return end
		end
	end
	
	local playerPed = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
	local health = 0
	local engHealth = (GetVehicleEngineHealth(vehicle)/10)
	if GetVehicleEngineHealth(vehicle) > 1000 then engHealth = 100 end
	if GetVehicleEngineHealth(vehicle) < 0 then engHealth = 1 end
	local bodHealth = (GetVehicleBodyHealth(vehicle)/10)
	if GetVehicleEngineHealth(vehicle) > 1000 then bodHealth = 100 end
	if GetVehicleEngineHealth(vehicle) < 0 then bodHealth = 1 end
	if Config.repairEngine then	health = math.ceil(engHealth/2)+math.ceil(bodHealth/2)
	elseif not Config.repairEngine then	health = math.ceil((bodHealth)) end

	local cost = 0
	if Config.ManualRepairBased then
		for k, v in pairs(QBCore.Shared.Vehicles) do
			if tonumber(v.hash) == GetEntityModel(vehicle) then
				local percent = (Config.ManualRepairPercent / 100)
				if Config.Debug then print("^5Debug^7: ^2Vehicle^7: '^6"..v.hash.. "^7' (^6"..QBCore.Shared.Vehicles[k].name.."^7)") end
				cost = math.ceil((QBCore.Shared.Vehicles[k].price * percent) - math.ceil((health/100) * (QBCore.Shared.Vehicles[k].price * percent)))
			end
		end
	else
		if ManualRepairCostBased then cost = Config.ManualRepairCost
		else cost = Config.ManualRepairCost - math.ceil((health/100) * Config.ManualRepairCost)
		end
	end

	local p2 = promise.new()
	QBCore.Functions.TriggerCallback('jim-mechanic:checkCash', function(cb) p2:resolve(cb) end)
	local cash = Citizen.Await(p2)
	if GetPedInVehicleSeat(vehicle, -1) ~= playerPed then return end
	local RepairMenu = {}
		RepairMenu[#RepairMenu+1] = {  isMenuHeader = true, header = searchCar(vehicle),
										txt = "Class: "..getClass(vehicle).."<br>"..Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(vehicle)).."]<br>"..searchDist(vehicle)}
		RepairMenu[#RepairMenu+1] = { icon = "fas fa-circle-xmark", header = string.gsub(Loc[Config.Lan]["common"].close, "❌", " "), params = { event = "jim-mechanic:client:Menu:Close" } }

		local settext = Loc[Config.Lan]["repair"].body..":<br>"..nosBar(math.ceil((GetVehicleBodyHealth(vehicle)/10))).." "..math.ceil((GetVehicleBodyHealth(vehicle)/10)).."%"
		if Config.repairEngine then settext = Loc[Config.Lan]["repair"].engine..":<br>"..nosBar(math.ceil((GetVehicleEngineHealth(vehicle)/10))).." "..math.ceil((GetVehicleEngineHealth(vehicle)/10)).."%<br>"..settext end

		local seticon = "fas fa-wrench" local greyed = false local check = " ✅"
		if cost == 0 then greyed = true check = "" end
		if cash < cost then seticon = "fas fa-wallet" greyed = true check = " ❌" end
		RepairMenu[#RepairMenu+1] = { isMenuHeader = greyed,
										icon = seticon,
										header = Loc[Config.Lan]["police"].repair.." - $"..cost..check,
										txt = settext,
										params = { event = "jim-mechanic:client:Manual:Repair", args = { cost = cost, }, } }

		--RepairMenu[#RepairMenu+1] = { icon = "fas fa-magnifying-glass", header = "Preview", txt = "", params = { event = "jim-mechanic:client:Preview:Menu" }, }
		--RepairMenu[#RepairMenu+1] = { header = "Test", txt = "Vehicle Death Simulator", params = { event = "jim-mechanic:client:Police:test" }, }

	exports['qb-menu']:openMenu(RepairMenu)
end)
local repairing = false
RegisterNetEvent('jim-mechanic:client:Manual:Repair', function(data)
	if repairing then return end
	repairing = true
	local playerPed = PlayerPedId()
	TriggerServerEvent("jim-mechanic:chargeCash", data.cost)
	local vehicle = GetVehiclePedIsIn(playerPed, false) pushVehicle(vehicle)
	FreezeEntityPosition(vehicle, true)
	if Config.repairEngine and Config.repairAnimate then
		triggerNotify(nil, Loc[Config.Lan]["police"].engine)
		Wait(10000) -- 10000 = 10 second wait
		SetVehicleEngineHealth(vehicle, 1000.0)
		if useMechJob() and Config.repairExtras then
			TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "radiator", 100)
			TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "axle", 100)
			TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "brakes", 100)
			TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "clutch", 100)
			TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "fuel", 100)
		end
	end
	if Config.repairAnimate then
		local wait = 1500
		triggerNotify(nil, Loc[Config.Lan]["manual"].tyres)
		for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
			if IsVehicleTyreBurst(vehicle, v, false) == 1 or IsVehicleTyreBurst(vehicle, v, true) == 1 then local offset = GetVehicleWheelXOffset(vehicle, v) SetVehicleWheelXOffset(vehicle, v, offset+2000) SetVehicleTyreFixed(vehicle, v) Wait(wait) SetVehicleWheelXOffset(vehicle, v, offset) Wait(wait) end
		end
		if not AreAllVehicleWindowsIntact(vehicle) then
			triggerNotify(nil, Loc[Config.Lan]["manual"].window)
			for i = 0, 5 do if not IsVehicleWindowIntact(vehicle, i) then RemoveVehicleWindow(vehicle, i) Wait(wait/2) end end
		end

		--[[triggerNotify(nil, Loc[Config.Lan]["manual"].doors)
		for i = 0, 5 do if not IsVehicleDoorDamaged(vehicle, i) then SetVehicleDoorBroken(vehicle, i, true) Wait(wait) else print("door "..i.." not found") end end]]
		triggerNotify(nil, Loc[Config.Lan]["police"].body)
		Wait(wait*2)
		SetVehicleBodyHealth(vehicle, 1000.0)
		 SetVehicleFixed(vehicle)
		TriggerEvent('jim-mechanic:client:Manual:Menu')
		triggerNotify(nil, Loc[Config.Lan]["police"].complete, "success")
	else
		QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["repair"].repairing, 8000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ }, {}, {}, function()
				if Config.repairEngine then SetVehicleEngineHealth(vehicle, 1000.0) end
				if useMechJob() and Config.repairExtras then
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "radiator", 100)
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "axle", 100)
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "brakes", 100)
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "clutch", 100)
					TriggerServerEvent("vehiclemod:server:updatePart", trim(GetVehicleNumberPlateText(vehicle)), "fuel", 100)
				end
				SetVehicleBodyHealth(vehicle, 1000.0)
				 SetVehicleFixed(vehicle)
				TriggerEvent('jim-mechanic:client:Manual:Menu')
				triggerNotify(nil, Loc[Config.Lan]["police"].complete, "success")
			end, function() -- Cancel
		end, "fas fa-wrench")
	end
	FreezeEntityPosition(vehicle, false)
	repairing = false
	qblog("Repair Bench used ($**"..data.cost.."**) [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
	for i = 1, #bench do DeleteEntity(bench[i])	end
end)