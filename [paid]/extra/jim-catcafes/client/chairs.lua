local QBCore = exports['qb-core']:GetCoreObject() 

local catseat = nil
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["CatChair"..k] =
		exports['qb-target']:AddBoxZone("CatChair"..k, v.coords.xyz, 0.7, 0.7, { name="CatChair"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1.2, maxZ = v.coords.z+0.1, },
			{ options = { { event = "jim-catcafe:Chair", icon = "fas fa-chair", label = Loc[Config.Lan].target["sit"], loc = v.coords, stand = v.stand }, },
				distance = 2.2
		})
	end
end)

RegisterNetEvent('jim-catcafe:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz)
		if dist <= 0.4 then triggerNotify(nil, Loc[Config.Lan].error["seat_taken"]) canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		catseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if catseat then SetEntityCoords(ped, catseat) end
				catseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Config.Chairs = {
	--Downstairs--
	--Booth1
	{ coords = vector4(-573.04, -1058.81, 22.5, 180.75), stand = vector3(-575.37, -1059.79, 22.34-0.5) },
	{ coords = vector4(-573.92, -1058.82, 22.5, 180.75), stand = vector3(-575.37, -1059.79, 22.34-0.5) },
	{ coords = vector4(-573.06, -1060.7, 22.5, 0.75), stand = vector3(-575.37, -1059.79, 22.34-0.5)},
	{ coords = vector4(-573.91, -1060.72, 22.5, 0.75), stand = vector3(-575.37, -1059.79, 22.34-0.5) },
	--Booth2
	{ coords = vector4(-572.98, -1062.46, 22.5, 180.75), stand = vector3(-575.34, -1063.39, 22.34-0.5) },
	{ coords = vector4(-573.84, -1062.45, 22.5, 180.75), stand = vector3(-575.34, -1063.39, 22.34-0.5) },
	{ coords = vector4(-573.05, -1064.37, 22.5, 0.75), stand = vector3(-575.34, -1063.39, 22.34-0.5) },
	{ coords = vector4(-573.89, -1064.37, 22.5, 0.75), stand = vector3(-575.34, -1063.39, 22.34-0.5) },
	--Booth3
	{ coords = vector4(-573.0, -1066.11, 22.5, 180.75), stand = vector3(-575.49, -1067.04, 22.34-0.5) },
	{ coords = vector4(-573.9, -1066.1, 22.5, 180.75), stand = vector3(-575.49, -1067.04, 22.34-0.5) },
	{ coords = vector4(-573.07, -1068.03, 22.5, 0.75), stand = vector3(-575.49, -1067.04, 22.34-0.5) },
	{ coords = vector4(-573.87, -1068.01, 22.5, 0.75), stand = vector3(-575.49, -1067.04, 22.34-0.5) },
	--Fireside
	{ coords = vector4(-580.84, -1051.22, 22.35, 277.75) },
	{ coords = vector4(-579.78, -1052.51, 22.35, 329.75) },
	{ coords = vector4(-577.61, -1052.6, 22.35, 35.75) },
	{ coords = vector4(-576.86, -1051.03, 22.35, 108.75) },
	--Center
	{ coords = vector4(-579.72, -1062.12, 22.35, 0.75) },
	{ coords = vector4(-580.7, -1062.55, 22.35, 45.75) },
	{ coords = vector4(-581.02, -1063.46, 22.35, 90.75) },
	{ coords = vector4(-580.64, -1064.45, 22.35, 135.75) },
	{ coords = vector4(-579.71, -1064.79, 22.35, 180.75) },
	{ coords = vector4(-578.67, -1064.47, 22.35, 225.75) },
	{ coords = vector4(-578.33, -1063.39, 22.35, 270.75) },
	{ coords = vector4(-578.76, -1062.34, 22.35, 315.75) },
	--Stools
	{ coords = vector4(-586.18, -1064.68, 22.6, 90.75), stand = vector3(-585.72, -1064.75, 22.34) },
	{ coords = vector4(-586.17, -1065.69, 22.6, 90.75), stand = vector3(-585.75, -1065.69, 22.34) },
	{ coords = vector4(-586.15, -1066.68, 22.6, 90.75), stand = vector3(-585.84, -1066.7, 22.34) },
	{ coords = vector4(-586.17, -1067.69, 22.6, 90.75), stand = vector3(-585.79, -1067.64, 22.34) },
	--Boss sofa
	{ coords = vector4(-591.21, -1049.06, 22.35, 180.75) },
	{ coords = vector4(-589.95, -1049.06, 22.35, 180.75) },
	--Boss Room1
	{ coords = vector4(-598.44, -1050.99, 22.35, 270.0) },
	{ coords = vector4(-598.45, -1050.1, 22.35, 270.0) },
	{ coords = vector4(-596.26, -1053.52, 22.35, 0.0) },
	--Upstairs
	--Sofa1
	{ coords = vector4(-573.72, -1052.29, 26.61, 270.0) },
	{ coords = vector4(-573.73, -1053.45, 26.61, 270.0) },
	--Corner Sofa
	{ coords = vector4(-569.68, -1066.56, 26.62, 90.0) },
	{ coords = vector4(-569.7, -1068.13, 26.62, 90.0) },
	{ coords = vector4(-570.97, -1069.42, 26.62, 0) },
	{ coords = vector4(-572.61, -1069.4, 26.62, 0) },
	--Boss Room 2
	{ coords = vector4(-577.09, -1065.14, 26.61, 165.0) },
	{ coords = vector4(-578.82, -1065.24, 26.61, 200.0) },
	{ coords = vector4(-578.24, -1067.83, 26.61, 0) },
	--Boss Room 3
	{ coords = vector4(-577.0, -1062.6, 26.61, 0) },
	{ coords = vector4(-579.1, -1061.28, 26.61, 270.0) },
	{ coords = vector4(-577.39, -1057.87, 26.61, 180.0) },
	{ coords = vector4(-578.59, -1057.9, 26.61, 180.0) },



	--Pizza This
	{ coords = vector4(807.9069, -751.4764, 26.7026, 101.5982) },
	{ coords = vector4(806.1431, -751.5276, 26.7026, 268.5868) },

	{ coords = vector4(804.0069, -751.4764, 26.7026, 101.5982) },
	{ coords = vector4(802.2431, -751.5276, 26.7026, 268.5868) },

	{ coords = vector4(800.0069, -751.4764, 26.7026, 101.5982) },
	{ coords = vector4(798.10431, -751.5276, 26.7026, 268.5868)} ,
	
	{ coords = vector4(797.0084, -748.7601, 26.7026, 278.4816) },
	{ coords = vector4(798.9216, -748.8779, 26.7026, 91.6060) },

	{ coords = vector4(795.1649, -750.6094, 26.7026, 207.0319) },
	{ coords = vector4(795.1807, -752.5009, 26.7026, 359.6903) },

	{ coords = vector4(799.4573, -754.1772, 26.7026, 160.4784) },
	{ coords = vector4(799.5353, -755.9198, 26.7026, 6.5840) },

	{ coords = vector4(808.3690, -754.9415, 26.7026, 94.6647) },
	{ coords = vector4(807.0561, -754.9944, 26.7026, 274.9730) },

	{ coords = vector4(806.2277, -754.9752, 26.7026, 93.1248) },
	{ coords = vector4(805.0195, -754.9280, 26.7026, 280.7643) },

	{ coords = vector4(804.1083, -754.8967, 26.7026, 91.7087) },
	{ coords = vector4(802.8602, -754.9262, 26.7026, 264.1760) },

	{ coords = vector4(802.0463, -754.8981, 26.7026, 91.6212) },
	{ coords = vector4(800.7537, -754.9836, 26.7026, 270.5303) },

	{ coords = vector4(799.3034, -756.9819, 26.7026, 177.4958) },
	{ coords = vector4(799.3613, -758.3081, 26.7026, 3.2606) },

	{ coords = vector4(799.3450, -759.0669, 26.7026, 183.7257) },
	{ coords = vector4(799.3556, -760.4307, 26.7026, 359.0855) },

	{ coords = vector4(795.3203, -764.9874, 26.7026, 276.5388) },
	{ coords = vector4(796.6287, -767.4503, 26.7026, 7.3423) },


	{ coords = vector4(797.8398, -750.4246, 31.2768, 177.8154) },

	{ coords = vector4(798.5808, -752.6882, 31.2768, 30.9735) },
	{ coords = vector4(797.2145, -752.7292, 31.2768, 340.7815) },

	{ coords = vector4(802.4689, -749.4296, 31.3101, 166.1089) },
	
	{ coords = vector4(803.1282, -756.2916, 31.2377, 95.3240) },
	{ coords = vector4(802.1777, -757.3364, 31.2379, 15.8063) },
	{ coords = vector4(800.9120, -757.3875, 31.2370, 359.5260) },

	-- VU
	{ coords = vector4(108.1505, -1293.2938, 28.2351, 30.7400) },
	{ coords = vector4(109.7852, -1292.3635, 28.2351, 33.1351) },
	{ coords = vector4(111.5717, -1290.7211, 28.2351, 64.4317) },
	{ coords = vector4(111.8358, -1288.4940, 28.2351, 101.4155) },
	{ coords = vector4(110.6376, -1286.7369, 28.2351, 141.9115) },
	{ coords = vector4(108.4722, -1286.1493, 28.2351, 179.2657) },
	{ coords = vector4(106.4437, -1286.8931, 28.2351, 214.7701) },
	{ coords = vector4(104.7334, -1287.7128, 28.2351, 210.0566) },


	{ coords = vector4(117.5490, -1286.0802, 28.2351, 107.6394) },
	{ coords = vector4(117.2224, -1287.9105, 28.2351, 50.9886) },
	{ coords = vector4(115.8208, -1288.6671, 28.2351, 348.0322) },

	{ coords = vector4(114.0899, -1284.3916, 28.2351, 56.8379) },
	{ coords = vector4(114.1733, -1281.9164, 28.2351, 130.2637) },
	{ coords = vector4(111.8956, -1281.6162, 28.2351, 209.6584) },

	{ coords = vector4(115.6705, -1283.4268, 28.2351, 280.8539) },
	{ coords = vector4(116.8522, -1281.3368, 28.2351, 198.3394) },
	{ coords = vector4(119.1363, -1282.2800, 28.2351, 121.8745) },


	{ coords = vector4(120.4932, -1284.1045, 28.2351, 206.3119) },
	{ coords = vector4(122.1210, -1284.5566, 28.2351, 119.3692) },
	{ coords = vector4(121.7036, -1286.2625, 28.2351, 23.4474) },

	{ coords = vector4(124.5337, -1294.3286, 29.2351, 122.9272) },
	{ coords = vector4(124.0466, -1296.1021, 29.2351, 37.4462) },
	{ coords = vector4(122.1814, -1295.5067, 29.2351, 304.4066) },

	{ coords = vector4(121.1587, -1296.1888, 29.2351, 127.3011) },
	{ coords = vector4(120.6994, -1298.0304, 29.2351, 33.2134) },
	{ coords = vector4(118.8963, -1297.4493, 29.2351, 300.2027) },

	{ coords = vector4(123.7471, -1287.4939, 28.2351, 116.3296) },
	{ coords = vector4(123.3663, -1289.0948, 28.2351, 32.0547) },

	{ coords = vector4(117.2388, -1292.7369, 28.2351, 23.1054) },
	{ coords = vector4(115.5051, -1292.2776, 28.2351, 302.2918) },

	{ coords = vector4(129.4026, -1287.5555, 29.4451, 301.6623) },
	{ coords = vector4(128.8213, -1286.3926, 29.4451, 303.5497) },
	{ coords = vector4(128.0578, -1285.2538, 29.4451, 309.3460) },
	{ coords = vector4(127.3889, -1284.0341, 29.4451, 300.9986) },
	{ coords = vector4(126.6435, -1282.6362, 29.4451, 309.0873) },

	{ coords = vector4(116.3527, -1304.2124, 29.2351, 73.7355) },
	{ coords = vector4(112.7164, -1306.3302, 29.2351, 346.1244) },
	{ coords = vector4(110.2205, -1302.1090, 29.2351, 253.6351) },
	{ coords = vector4(112.3339, -1300.7244, 29.2351, 212.8439) },


	{ coords = vector4(98.6965, -1290.4026, 29.2351, 117.07734) },
	{ coords = vector4(98.1301, -1289.4277, 29.2351, 126.0504) },
	{ coords = vector4(-587.8709, -918.0253, 33.5854, 123.7933) },

},

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
end)