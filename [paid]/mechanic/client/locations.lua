local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
			for _, v in pairs(Config.JobRoles) do if v == PlayerJob.name then havejob = true end end
			if havejob then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)
		PlayerJob = PlayerData.job
		for _, v in pairs(Config.JobRoles) do if v == PlayerJob.name then havejob = true end end
		if havejob then onDuty = PlayerJob.onduty end end)
	Wait(500)
end)

Config.Locations = {
	-- BENNYS NEXT TO PDM --
	--[[{	job = "bennys",
		zones = {
			vector2(-39.657638549805, -1026.12890625),
			vector2(-54.971218109131, -1066.3665771484),
			vector2(-20.210899353027, -1079.1593017578),
			vector2(-6.8900542259216, -1038.0417480469),
		},
		stash = { { coords = vector3(-40.9, -1056.62, 28.4), w = 3.6, d = 0.6, heading = 70.0 }, },
		store = { { coords = vector3(-37.53, -1036.11, 28.6), w = 1.6, d = 0.6, heading = 340.0 }, },
		crafting = { { coords = vector3(-38.25, -1038.99, 28.6), w = 4.0, d = 0.6, heading = 340.0 }, },
		clockin = { { coords = vector3(-34.95, -1040.71, 28.59), heading = 8.0, }, },
		garage = { spawn = vector4(-49.14, -1031.25, 27.76, 339.67),
					out = vector4(-42.38, -1035.11, 28.52, 68.01),
					list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" } },
		payments = { coords = vector3(-35.91, -1040.47, 28.6), heading = 340.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
		blip = vector3(-43.05, -1043.99, 28.76),
		bliplabel = "Bennys Workshop",    -- Bennys Workshop next to PDM
		blipcolor = 1,
		discordlink = "",
		discordcolour = 16711680,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
	},]]
	-- ALTA STREET BENNYS --
	{	job = "bennys",
		zones = {
			vector2(-189.07, -1311.31),
			vector2(-188.36, -1343.46),
			vector2(-217.37, -1343.54),
			vector2(-217.99, -1340.32),
			vector2(-244.44, -1342.33),
			vector2(-244.07, -1312.06)
		},
		stash = { { coords = vector3(-225.61, -1315.66, 31.8), w = 1.6, d = 0.6, heading = 0, }, },
		store = { { coords = vector3(-212.6, -1322.5, 31.44), w = 0.85, d = 1.8, heading = 359.0, }, },
		crafting = { { coords = vector3(-215.68, -1339.68, 31.77), w = 0.8, d = 1.0, heading = 270.0, }, },
		clockin = { { coords = vector3(-210.69, -1336.03, 34.89), heading = 90.0, }, },
		garage = { spawn = vector4(-180.59, -1312.18, 31.3, 358.36),
					out = vector4(-187.25, -1310.55, 31.3, 270.52),
					list = { "towtruck" } },
        payments = { coords = vector3(-197.91, -1317.94, 31.07), heading = 270.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" },
		blip = vector3(-211.55, -1324.55, 30.9),
		bliplabel = "Bennys Workshop",
		blipcolor = 1,
		discordlink = "",
		discordcolour = 16711680,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
	},
	--[[
	-- Angles of Death --
	{	job = "mechanic",
		zones = {
			vector2(-251.52, 6245.45),
 			vector2(-228.03, 6268.56),
 			vector2(-207.58, 6245.45),
 			vector2(-233.33, 6223.48)
		},
		stash = { { coords = vector3(-232.88, 6273.74, 31.68), w = 1.8, d = 0.6, heading = 340.0, }, },
		store = { { coords = vector3(-238.12, 6276.6, 31.46), w = 1.2, d = 0.45, heading = 340.0, }, },
		crafting = { { coords = vector3(-234.22, 6270.08, 31.54), w = 3.2, d = 1.0, heading = 255.0, }, },
		clockin = { { coords = vector3(-244.49, 6270.17, 31.48), heading = 90.0, }, },
		garage = { spawn = vector4(-36100000000.48, -12300000000.14, 38.03, 158.96),
					out = vector4(-356000000000.2, -126000000.55, 3900000.43, 253.49),
					list = { "towtruck" } },
		payments = { coords = vector3(-241.7, 6272.49, 31.5), heading = 90.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" },
		blip = vector3(-238.0, 6270.55, 31.53),
		bliplabel = "AOD Mechanic",
		blipcolor = 75,
		discordlink = "",
		discordcolour = 2571775,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	},]]
	--[[ HAYES AUTOS --
	{	job = "hayes",
		zones = {
			vector2(490.57400512695, -1302.0946044922),
			vector2(490.27529907227, -1305.3948974609),
			vector2(509.71032714844, -1336.8293457031),
			vector2(483.09429931641, -1339.0887451172),
			vector2(479.38552856445, -1330.6906738281),
			vector2(469.89437866211, -1309.5773925781)
		},
		stash = { { coords = vector3(478.84, -1326.94, 29.21), w = 1.6, d = 0.6, heading = 27.0, }, },
		store = { { coords = vector3(474.83, -1308.06, 29.21), w = 1.6, d = 0.5, heading = 295.0, }, },
		crafting = { { coords = vector3(472.54, -1313.22, 29.21), w = 3.2, d = 1.0, heading = 30.0, }, },
		clockin = { { coords = vector3(485.88, -1319.49, 29.11), heading = 284.0, }, },
		garage = { spawn = vector4(487.67, -1308.78, 28.6, 233.44),
					out = vector4(483.06, -1311.35, 29.21, 298.78),
					list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" } },
		payments = { coords = vector3(471.76, -1311.61, 29.20), heading = 120.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png width=150px></p>" },
		blip = vector3(480.52, -1318.24, 29.2),
		bliplabel = "Hayes Autos",
		blipcolor = 57,
		discordlink = "",
		discordcolour = 39135,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png",
	},
	-- LS CUSTOMS ROUTE 68 --
	{	job = "mechanic",
		zones = {
			vector2(1190.58, 2645.39),
			vector2(1190.72, 2634.46),
			vector2(1170.39, 2634.2),
			vector2(1170.33, 2645.83)
		},
		stash = { { coords = vector3(1180.85, 2635.0, 37.75), w = 1.6, d = 0.6, heading = 90.0 }, },
		store = { { coords = vector3(1171.64, 2635.84, 37.78), w = 0.6, d = 0.5, heading = 45.0 }, },
		crafting = { { coords = vector3(1176.69, 2635.44, 37.75), w = 3.2, d = 1.0, heading = 270.0 }, },
		clockin = { { coords = vector3(1183.89, 2635.29, 37.78), heading = 185.0, }, },
		garage = { spawn = vector4(1165.92, 2642.87, 37.23, 358.2),
					out = vector4(1170.25, 2645.6, 37.81, 88.15),
					list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" } },
		payments = { coords = vector3(1179.39, 2635.17, 37.75), heading = 176.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" },
		blip = vector3(1177.62, 2640.83, 37.75),
		bliplabel = "Los Santos Customs",
		blipcolor = 81,
		discordlink = "",
		discordcolour = 2571775,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	},
	-- BEEKERS GARAGE PALETO --
	{	job = "mechanic",
		zones = {
			vector2(117.79, 6625.31),
			vector2(102.88, 6611.96),
			vector2(95.51, 6619.93),
			vector2(108.8, 6633.98)
		},
		stash = { { coords = vector3(105.98, 6628.84, 31.79), w = 3.2, d = 1.0, heading = 315.0 }, },
		store = { { coords = vector3(109.9, 6632.02, 31.79), w = 0.6, d = 0.5, heading = 270.0 }, },
		crafting = { { coords = vector3(102.7, 6626.23, 31.79), w = 1.6, d = 0.6, heading = 315.0 }, },
		clockin = { { coords = vector3(100.61, 6623.84, 31.81), heading = 74.0, }, },
		garage = { spawn = vector4(109.92, 6608.11, 31.18, 313.99),
					out = vector4(107.43, 6614.64, 32.0, 226.54),
					list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" } },
		payments = { coords = vector3(103.87, 6627.14, 31.79), heading = 12.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/4/40/Beeker%27s_logo_GTA_V.png width=150px></p>" },
		blip = vector3(108.36, 6623.67, 31.79),
		bliplabel = "Beekers Garage",
		blipcolor = 52,
		discordlink = "",
		discordcolour = 23552,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/4/40/Beeker%27s_logo_GTA_V.png",
	},
	-- GABZ LS TUNER SHOP --
	{	job = "tuner",
		zones = {
			vector2(154.69816589355, -3007.0153808594),
			vector2(120.64015197754, -3006.7275390625),
			vector2(120.48593902588, -3051.8874511719),
			vector2(154.61296081543, -3051.5419921875)
		},
		stash = { { coords = vector3(144.38, -3051.3, 7.04), w = 0.6, d = 3.6, heading = 0.0 }, },
		store = { { coords = vector3(128.64, -3014.68, 7.04), w = 1.6, d = 3.0, heading = 0.0, }, },
		crafting = { { coords = vector3(136.71, -3051.29, 7.04), w = 0.6, d = 1.0, heading = 0.0, }, },
		clockin = { { coords = vector3(145.29, -3012.93, 6.94), heading = 86.0, }, },
		nosrefill = { { coords = vector4(121.17, -3044.73, 7.04, 268.96) } },
		garage = { spawn = vector4(163.22, -3009.31, 5.27, 89.72),
					out = vector4(157.37, -3016.57, 7.04, 179.58),
					list = { "flatbed" } },
		payments = { coords = vector3(146.44, -3014.09, 6.94), heading = 195.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" },
		blip = vector3(139.91, -3023.83, 7.04),
		bliplabel = "LS Tuner Shop",
		blipcolor = 81,
		discordlink = "",
		discordcolour = 2571775,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	},
	-- AIRPORT LS CUSTOMS --
	{	job = "mechanic",
		zones = {
			vector2(-1118.5782470703, -2017.4730224609),
			vector2(-1143.9351806641, -2042.6685791016),
			vector2(-1172.8060302734, -2014.1071777344),
			vector2(-1147.3665771484, -1988.7028808594)
		},
		stash = { { coords = vector3(-1141.11, -2004.79, 13.18), w = 1.6, d = 0.6, heading = 45.0, }, },
		store = { { coords = vector3(-1144.2, -2003.91, 13.18), w = 1.6, d = 0.6, heading = 45.0, }, },
		crafting = { { coords = vector3(-1158.71, -2002.37, 13.18), w = 0.6, d = 3.8, heading = 45.0, }, },
		clockin = { { coords = vector3(-1155.69, -1998.91, 13.22), heading = 62.0, }, },
		garage = { spawn = vector4(-1154.63, -1986.95, 12.5, 315.29),
					out = vector4(-1147.87, -1989.09, 13.16, 45.01),
					list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" } },
		payments = { coords = vector3(-1147.41, -2001.07, 13.18), heading = 285.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" },
		blip = vector3(-1150.68, -2002.48, 13.18),
		bliplabel = "Los Santos Customs",
		blipcolor = 81,
		discordlink = "",
		discordcolour = 2571775,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	},
	-- POPULAR STREET LS CUSTOMS --
	{	job = "mechanic",
		zones = {
			vector2(712.07940673828, -1092.9447021484),
			vector2(712.08245849609, -1052.4462890625),
			vector2(767.2265625, -1053.3394775391),
			vector2(770.71307373047, -1113.0911865234),
			vector2(741.73657226562, -1108.9860839844)
		},
		stash = { { coords = vector3(736.25, -1063.52, 22.17), w = 3.2, d = 0.6, heading = 87.0 }, },
		store = { { coords = vector3(738.35, -1073.36, 22.17), w = 3.8, d = 0.6, heading = 359.0 }, },
		crafting = { { coords = vector3(724.49, -1075.09, 22.17), w = 0.8, d = 1.0, heading = 91.0 }, },
		clockin = { { coords = vector3(738.26, -1087.66, 21.97), heading = 276.0, }, },
		garage = { spawn = vector4(716.22, -1069.58, 21.6, 1.08),
					out = vector4(719.63, -1068.84, 22.24, 89.2),
					list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" } },
		payments = { coords = vector3(738.34, -1090.52, 21.97), heading = 220.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" },
		blip = vector3(731.69, -1088.84, 22.17),
		bliplabel = "Los Santos Customs",
		blipcolor = 81,
		discordlink = "",
		discordcolour = 2571775,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	},
	-- LOST MC MECH SHOP--
	{   job = "mechanic",
		zones = {
			 vector2(930.68, -124.24),
 			vector2(1010.61, -179.92),
 			vector2(1048.86, -150.38),
 			vector2(979.17, -76.52)

		},
		stash = { { coords = vector3(992.53, -134.76, 74.11), w = 1.5, d = 1.0, heading = 0.0 }, },
		store = { { coords = vector3(1001.25, -131.65, 74.1), w = 4.2, d = 1.0, heading = 0.0 }, },
		crafting = { { coords = vector3(1003.02, -128.46, 74.1), w = 1.0, d = 4.0, heading = 0.0 }, },
		nosrefill = { { coords = vector4(988.4, -132.23, 74.06, 264.83) } },
		clockin = { { coords = vector3(991.58, -137.89, 73.73), heading = 220.03, }, },
		nosrefill = { { coords = vector4(986.4965, -136.9700, 74.0611, 241.0040) } },
		garage = { spawn = vector4(980.1698, -115.1427, 74.1310, 135.2370),
					out = vector4(980.2639, -130.2501, 74.0613, 235.8448),
					list = { "towtruck", "flatbed" } },
		payments = { coords = vector3(999.35, -123.5, 74.00), heading = 327.74, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" },
		blip = vector3(991.76, -126.85, 74.06),
		bliplabel = "Lost MC Mech Shop",
		blipcolor = 5,
		discordlink = "",
		discordcolour = 2571775,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	}, 
	-- OTTOS AUTOS -- 
    {	job = "otto",
		zones = {
			vector2(789.39, -835.61),
			vector2(789.39, -771.21),
			vector2(851.52, -771.21),
			vector2(851.52, -835.61)
		},
		stash = { { coords = vector3(836.97, -814.73, 26.33), w = 0.6, d = 3.6, heading = 90.0 }, },
		store = { { coords = vector3(837.02, -808.22, 26.33), w = 1.0, d = 1.4, heading = 90.0 }, },
		nosrefill = { { coords = vector4(830.61, -823.93, 26.33, 210.01) } },
		crafting = { { coords = vector3(837.03, -811.74, 26.33), w = 1.4, d = 2.2, heading = 90.0 }, },
		clockin = { { coords = vector3(834.63, -829.76, 26.13), heading = 197.67, }, },
		garage = { spawn = vector4(826.59, -793.63, 26.21, 84.34),
					out = vector4(824.3, -801.2, 26.37, 0.65),
					list = { "flatbed"} },
		payments = { coords = vector3(833.96, -826.79, 26.13), heading = 0.35, img = "<center><p><img src=https://i.imgur.com/74UVnCb.jpeg width=150px></p>" },
		blip = vector3(831.03, -813.01, 26.33),
		bliplabel = "Otto's Autos",
		blipcolor = 57,
		discordlink = "",
		discordcolour = 16711680,
		discordimg = "https://i.imgur.com/74UVnCb.jpeg",
	},]]
	-- HAYES AUTOS --
	--[[{    job = "hayes",
		zones = {
			vector2(-1439.9047851563, -443.4548034668),
			vector2(-1426.0206298828, -466.5227355957),
			vector2(-1400.1343994141, -451.71572875977),
			vector2(-1414.7999267578, -427.64019775391)
		},
		stash = { { coords = vector3(-1414.94, -452.35, 35.91), w = 4.0, d = 1.0, heading = 302.0, }, },
		store = { { coords = vector3(-1408.04, -448.04, 35.91), w = 5.5, d = 1.0, heading = 302.0, }, },
		crafting = { { coords = vector3(-1407.68, -442.32, 35.91), w = 0.6, d = 1.0, heading = 302.0, }, },
		clockin = { { coords = vector3(-1427.19, -457.51, 35.71), heading = 300.0 }, },
		garage = { spawn = vector4(-1379.84, -451.82, 34.44, 124.0),
					out = vector4(-1401.57, -451.19, 34.48, 212.71),
					list = { "towtruck", "utillitruck3" } },
		payments = { coords = vector3(-1429.02, -453.6, 35.97), heading = 350.0, img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png width=150px></p>" },
		blip = vector3(-1417.12, -445.9, 35.91),
		bliplabel = "Hayes Autos",
		blipcolor = 57,
		discordlink = "",
		discordcolour = 39135,
		discordimg = "https://static.wikia.nocookie.net/gtawiki/images/0/0c/HayesAutoBodyShop-GTAV-Logo.png",
	},]]
}

local till = {}
local laptop = {}
local nos = {}
local parking = {}
local Targets = {}
CreateThread(function()
	if Config.LocationRequired then
		for k in pairs(Config.Locations) do
			JobLocation = PolyZone:Create(Config.Locations[k].zones, { name = Config.Locations[k].job, debugPoly = Config.Debug })
			JobLocation:onPlayerInOut(function(isPointInside)
				if isPointInside then
					if Config.RequiresJob and PlayerJob.name == tostring(Config.Locations[k].job) then injob = true
					else injob = true if Config.Locations[k].autoClockout then TriggerServerEvent("QBCore:ToggleDuty") end end
				else injob = false end
			end)
		end
	end
	if Config.LocationBlips then
		for k in pairs(Config.Locations) do
			if Config.Locations[k].blip then
				local blip = AddBlipForCoord(Config.Locations[k].blip)
				SetBlipAsShortRange(blip, true)
				SetBlipSprite(blip, 446)
				SetBlipColour(blip, Config.Locations[k].blipcolor)
				SetBlipScale(blip, 0.6)
				SetBlipDisplay(blip, 6)
				BeginTextCommandSetBlipName('STRING')
				if Config.Locations[k].bliplabel then AddTextComponentString(Config.Locations[k].bliplabel)
				else AddTextComponentString("Mechanic Shop") end
				EndTextCommandSetBlipName(blip)
			end
		end
	end
	--Make Crafting Locations
	if Config.Crafting then
		for k, v in pairs(Config.Locations) do job = v.job
			if v.crafting then
				for l, b in pairs(v.crafting) do
					Targets["MechCraft: "..k..l] =
					exports['qb-target']:AddBoxZone("MechCraft: "..k..l, b.coords, b.w, b.d, { name="MechCraft: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 },
						{ options = { { event = "jim-mechanic:client:Crafting:Menu", icon = "fas fa-cogs", label = Loc[Config.Lan]["crafting"].menuheader, job = job }, },
							distance = 2.0 })
				end
			end
		end
	end
	--Make Store Locations
	if Config.Stores then
		for k, v in pairs(Config.Locations) do job = v.job
			if v.store then
				for l, b in pairs(v.store) do
					Targets["MechStore: "..k..l] =
					exports['qb-target']:AddBoxZone("MechStore: "..k..l, b.coords, b.w, b.d, { name="MechStore: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 },
						{ options = { { event = "jim-mechanic:client:Store:Menu", icon = "fas fa-cogs", label = Loc[Config.Lan]["stores"].browse, job = job }, },
							distance = 2.0 })
				end
			end
		end
	end
	--Make Cash Register Locations
	for k, v in pairs(Config.Locations) do
		if v.payments then v = v.payments
			Targets["MechReceipt: "..k] =
			exports['qb-target']:AddBoxZone("MechReceipt: "..k, v.coords, 0.47, 0.34, { name="MechReceipt: "..k, heading = v.heading, debugPoly=Config.Debug, minZ=v.coords.z-0.1, maxZ=v.coords.z+0.4 },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan]["payments"].charge, job = v.job, img = v.img }, },
					distance = 2.0
			})
			till[#till+1] = makeProp({prop = `prop_till_03`, coords = vector4(v.coords.x, v.coords.y, v.coords.z+1.03, v.heading+180.0)}, 1, false)
		end
	end
	--Make Mechanic Stash locations
	if Config.RequiresJob and ((Config.StashRepair and not Config.FreeRepair) or Config.StashCraft) then
		for k, v in pairs(Config.Locations) do job = v.job
			if v.stash then
				for l, b in pairs(v.stash) do
					Targets["MechSafe: "..k..l] =
					exports['qb-target']:AddBoxZone("MechSafe: "..k..l, b.coords, b.w, b.d, { name="MechSafe: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-1.0, maxZ=b.coords.z+1.0 },
						{ options = { { event = "jim-mechanic:client:Safe", icon = "fas fa-cogs", label = Loc[Config.Lan]["repair"].browse, job = job }, },
							distance = 2.0 })
				end
			end
		end
	end
	--Make Clockin Locations
	for k, v in pairs(Config.Locations) do
		if v.clockin then
			for l, b in pairs(v.clockin) do
				local bossrole = {}
				for grade in pairs(QBCore.Shared.Jobs[v.job].grades) do
					if QBCore.Shared.Jobs[v.job].grades[grade].isboss == true then
						if bossrole[v.job] then
							if bossrole[v.job] > tonumber(grade) then bossrole[job] = tonumber(grade) end
						else bossrole[v.job] = tonumber(grade) end
					end
				end
				laptop[#laptop+1] = makeProp({prop = `prop_laptop_01a`, coords = vector4(b.coords.x, b.coords.y, b.coords.z+1.03, b.heading+180.0)}, 1, false)

				Targets["MechClock: "..k..l] =
				exports['qb-target']:AddBoxZone("MechClock: "..k..l, vector3(b.coords.x, b.coords.y, b.coords.z), 0.45, 0.4, { name="MechClock: "..k..l, heading = b.heading, debugPoly=Config.Debug, minZ=b.coords.z-0.1, maxZ=b.coords.z+0.4 },
					{ options = {
						{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-clipboard", label = "Duty Toggle", job = v.job },
						{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = "Open Bossmenu", job = bossrole, },
					},
					distance = 2.0 })
			end
		end
	end
	--Garage Locations
	for k, v in pairs(Config.Locations) do job = v.job
		if v.garage then
			local out = v.garage.out
			parking[#parking+1] = makeProp({prop = `prop_parkingpay`, coords = out}, 1, false)

			Targets["MechGarage: "..k] =
			exports['qb-target']:AddBoxZone("MechGarage: "..k, vector3(out.x, out.y, out.z-1.03), 0.8, 0.5, { name="MechGarage: "..k, heading = out[4]+180.0, debugPoly=Config.Debug, minZ=(out.z-1.03)-0.1, maxZ=out.z-1.03+1.3 },
				{ options = { { event = "jim-mechanic:client:Garage:Menu", icon = "fas fa-clipboard", label = Loc[Config.Lan]["garage"].jobgarage, job = job, coords = v.garage.spawn, list = v.garage.list }, },
				distance = 2.0 })
		end
	end
	--NosRefill Locations
	for k, v in pairs(Config.Locations) do
		if v.nosrefill then
			for l, b in pairs(v.nosrefill) do
				nos[#nos+1] = makeProp({prop = `prop_byard_gastank02`, coords = vector4(b.coords.x, b.coords.y, b.coords.z, b.coords.w+180.0)}, 1, false)

				Targets["MechNos: "..k..l] =
				exports['qb-target']:AddBoxZone("MechNos: "..k..l, vector3(b.coords.x, b.coords.y, b.coords.z), 0.7, 0.7, { name="MechNos: "..k..l, heading = b.coords[4], debugPoly=Config.Debug, minZ=b.coords.z-1.05, maxZ=b.coords.z+0.25 },
					{ options = { { event = "jim-mechanic:client:NosRefill", item = "noscan", icon = "fas fa-gauge-high", label = "NOS ($"..Config.NosRefillCharge..")", coords = b.coords, tank = nos[#nos], }, },
					distance = 2.0 })

			end
		end
	end
end)

----- CRAFTING STUFF -------
RegisterNetEvent('jim-mechanic:client:Crafting:Menu', function()
	local Menu = {}
	Menu[#Menu + 1] = { isMenuHeader = true, header = Loc[Config.Lan]["crafting"].menuheader, txt = "", }
	Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = string.gsub(Loc[Config.Lan]["common"].close, "❌ ", ""), params = { event = "jim-mechanic:client:Menu:Close" } }
	Menu[#Menu + 1] = { header = Loc[Config.Lan]["crafting"].toolheader, txt = #Crafting.Tools..Loc[Config.Lan]["crafting"].numitems, params = { event = "jim-mechanic:Crafting", args = { craftable = Crafting.Tools, header = Loc[Config.Lan]["crafting"].toolheader, } } }
	Menu[#Menu + 1] = { header = Loc[Config.Lan]["crafting"].performheader, txt = #Crafting.Perform..Loc[Config.Lan]["crafting"].numitems, params = { event = "jim-mechanic:Crafting", args = { craftable = Crafting.Perform, header = Loc[Config.Lan]["crafting"].performheader, } } }
	Menu[#Menu + 1] = { header = Loc[Config.Lan]["crafting"].cosmetheader, txt = #Crafting.Cosmetic..Loc[Config.Lan]["crafting"].numitems, params = { event = "jim-mechanic:Crafting", args = { craftable = Crafting.Cosmetic, header = Loc[Config.Lan]["crafting"].cosmetheader, } } }
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('jim-mechanic:Crafting', function(data)
	local Menu = {}
	Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
	Menu[#Menu + 1] = { icon = "fas fa-circle-arrow-left", header = "", txt = string.gsub(Loc[Config.Lan]["common"].ret, "⬅️ ", ""), params = { event = "jim-mechanic:client:Crafting:Menu" } }
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" and k ~= "job" then
				if data.craftable[i]["job"] then hasjob = false
					for l, b in pairs(data.craftable[i]["job"]) do
						if l == PlayerJob.name and PlayerJob.grade.level >= b then hasjob = true end
					end
				end
				if not QBCore.Shared.Items[k] then print("^5Debug^7: ^2Item not found in server^7: '^6"..k.."^7'") else
					if data.craftable[i]["job"] and hasjob == false then else
						local text = ""
						setheader = "<img src=nui://"..Config.img..QBCore.Shared.Items[k].image.." width=30px onerror='this.onerror=null; this.remove();'> "..QBCore.Shared.Items[tostring(k)].label
						if data.craftable[i]["amount"] then setheader = setheader.." x"..data.craftable[i]["amount"] end
						for l, b in pairs(data.craftable[i][tostring(k)]) do
							if b == 1 then number = "" else number = " x"..b end
							text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>"
							settext = text
						end
						Menu[#Menu + 1] = { icon = k, header = setheader, txt = settext, params = { event = "jim-mechanic:Crafting:MakeItem", args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } }
						settext, setheader = nil
					end
				end
			end
		end
	end
	exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('jim-mechanic:Crafting:MakeItem', function(data)
	QBCore.Functions.TriggerCallback('jim-mechanic:Crafting:get', function(amount)
		if not amount then triggerNotify(nil, Loc[Config.Lan]["crafting"].ingredients, 'error') else TriggerEvent('jim-mechanic:Crafting:ItemProgress', data) end
	end, data.item, data.craft)
end)

RegisterNetEvent('jim-mechanic:Crafting:ItemProgress', function(data)
	QBCore.Functions.Progressbar('making_food', "Crafting "..QBCore.Shared.Items[data.item].label, 7000, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "mini@repair", anim = "fixing_a_ped", flags = 8, },
	{}, {}, function()
		qblog("Crafted `"..data.item.."`")
		TriggerServerEvent('jim-mechanic:Crafting:GetItem', data.item, data.craft)
		emptyHands(PlayerPedId())
		TriggerEvent("jim-mechanic:Crafting", data)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		emptyHands(PlayerPedId())
	end, data.item)
end)

------ Nos Refill -------
local refilling = false
RegisterNetEvent('jim-mechanic:client:NosRefill', function(data)
	if refilling then return end
	local p = promise.new()	QBCore.Functions.TriggerCallback('jim-mechanic:checkCash', function(cb) p:resolve(cb) end)
	local cash = Citizen.Await(p)
	if cash >= Config.NosRefillCharge then
		refilling = true
		local coords = GetOffsetFromEntityInWorldCoords(data.tank, 0, 0.5, 0.02)
		local prop = makeProp({prop = `v_ind_cs_gascanister`, coords = vector4(coords.x, coords.y, coords.z+1.03, data.coords.w)}, 1, 1)

		if not IsPedHeadingTowardsPosition(PlayerPedId(), coords, 20.0) then
			TaskTurnPedToFaceCoord(PlayerPedId(), coords, 1500) Wait(1500)
		end
		if #(coords - GetEntityCoords(PlayerPedId())) > 1.3 then TaskGoStraightToCoord(PlayerPedId(), coords, 0.5, 400, 0.0, 0) Wait(400) end

		UseParticleFxAssetNextCall('core')
		local gas = StartParticleFxLoopedOnEntity('ent_sht_steam', prop, 0.02, 0.00, 0.42, 0.0, 0.0, 0.0, 0.1, 0, 0, 0)

		QBCore.Functions.Progressbar('making_food', "Refilling "..QBCore.Shared.Items["nos"].label, 7000, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
		{ task = "CODE_HUMAN_MEDIC_TEND_TO_DEAD" },
		{}, {}, function()
			qblog("Purchased a NOS refill")
			TriggerServerEvent("jim-mechanic:chargeCash", Config.NosRefillCharge)
			toggleItem(false, "noscan", 1)
			toggleItem(true, "nos", 1)
			DeleteObject(prop)
			prop = nil
			StopParticleFxLooped(gas)
			gas = nil
			emptyHands(PlayerPedId())
			refilling = false
		end, function() -- Cancel
			DeleteObject(prop)
			StopParticleFxLooped(gas)
			gas = nil
			emptyHands(PlayerPedId())
			prop = nil
			refilling = false
		end, "nos")
	else
		triggerNotify(nil, "Not enough cash", "error") return
	end
end)

------ Store Stuff ------
-- Menu to pick the store
RegisterNetEvent('jim-mechanic:client:Store:Menu', function(data)
    exports['qb-menu']:openMenu({
        { header = Loc[Config.Lan]["stores"].tools, txt = "", params = { event = "jim-mechanic:client:Store", args = { id = 1, job = data.job } } },
        { header = Loc[Config.Lan]["stores"].perform, txt = "", params = { event = "jim-mechanic:client:Store", args = { id = 2, job = data.job } } },
        { header = Loc[Config.Lan]["stores"].cosmetic, txt = "", params = { event = "jim-mechanic:client:Store", args = { id = 3, job = data.job } } },
    })
end)

-- Open the selected store
RegisterNetEvent('jim-mechanic:client:Store', function(data)
	local event = "inventory:server:OpenInventory" if Config.JimShops then event = "jim-shops:ShopOpen" end
	if data.id == 1 then TriggerServerEvent(event, "shop", data.job, Stores.ToolItems)
	elseif data.id == 2 then TriggerServerEvent(event, "shop", data.job, Stores.PerformItems)
	elseif data.id == 3 then TriggerServerEvent(event, "shop", data.job, Stores.StoreItems) end
end)

------ Repair Stash Stuff -----
RegisterNetEvent('jim-mechanic:client:Safe', function(data) TriggerEvent("inventory:client:SetCurrentStash", data.job.."Safe") TriggerServerEvent("inventory:server:OpenInventory", "stash", data.job.."Safe", { maxweight = 2000000, slots = 60, }) end)

-------- Garage Stuff ---------
local currentVeh = { out = false, current = nil }
local garageBlip = nil

RegisterNetEvent('jim-mechanic:client:Garage:Menu', function(data)
	loadAnimDict("amb@prop_human_atm@male@enter")
	TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true)
	local vehicleMenu = { { icon = "fas fa-car-tunnel", header = Loc[Config.Lan]["garage"].jobgarage, isMenuHeader = true } }
	if Config.JimMenu then vehicleMenu[#vehicleMenu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = string.gsub(Loc[Config.Lan]["common"].close, "❌ ", ""), params = { event = "jim-mechanic:client:Menu:Close" } }
	else vehicleMenu[#vehicleMenu + 1] = { header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "jim-mechanic:client:Menu:Close" } } end
	if currentVeh.out and DoesEntityExist(currentVeh.current) then
		local col1, col2 = GetVehicleColours(currentVeh.current)
		for k, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do if col1 == v.id then col1 = v.name end end
		vehicleMenu[#vehicleMenu+1] = { icon = "fas fa-clipboard-list", header = Loc[Config.Lan]["garage"].vehout,
										txt = searchCar(currentVeh.current)..Loc[Config.Lan]["paint"].primary..": "..col1.."<br>"..Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(currentVeh.current)).."]" ,
										params = { event = "jim-mechanic:client:Garage:Blip", }, }
		vehicleMenu[#vehicleMenu+1] = { icon = "fas fa-car-burst", header = Loc[Config.Lan]["garage"].remveh, params = { event = "jim-mechanic:client:Garage:RemSpawn" } }
	else
		currentVeh = { out = false, current = nil }
		table.sort(data.list, function(a, b) return a:lower() < b:lower() end)
		for k, v in pairs(data.list) do
			local spawnName = v
			local v = string.lower(GetDisplayNameFromVehicleModel(GetHashKey(spawnName))) v = v:sub(1,1):upper()..v:sub(2).." "..GetMakeNameFromVehicleModel(GetHashKey(tostring(spawnName)))
			for _, b in pairs(QBCore.Shared.Vehicles) do
				if tonumber(b.hash) == GetHashKey(spawnName) then
					if Config.Debug then print("^5Debug^7: ^2Vehicle^7: ^6"..b.hash.." ^7(^6"..b.name.." "..b.brand.."^7)")
				end
				v = b.name.." "..b.brand
				end
			end
			vehicleMenu[#vehicleMenu+1] = { header = v, params = { event = "jim-mechanic:client:Garage:SpawnList", args = { spawnName = spawnName, coords = data.coords } } }
		end
	end
    exports['qb-menu']:openMenu(vehicleMenu)
	unloadAnimDict("amb@prop_human_atm@male@enter")
end)

RegisterNetEvent("jim-mechanic:client:Garage:SpawnList", function(data)
	local oldveh = GetClosestVehicle(data.coords.x, data.coords.y, data.coords.z, 2.5, 0, 71)
	if oldveh ~= 0 then
		local name = GetDisplayNameFromVehicleModel(GetEntityModel(oldveh)):lower()
		for k, v in pairs(QBCore.Shared.Vehicles) do
			if tonumber(v.hash) == GetEntityModel(oldveh) then
			if Config.Debug then print("^5Debug^7: ^2Vehicle^7: '^6"..v.hash.."^7' (^6"..v.label.."^7)") end
			name = QBCore.Shared.Vehicles[k].name break
			end
		end
		triggerNotify(nil, name..Loc[Config.Lan]["garage"].cantspawn, "error")
	else
		QBCore.Functions.SpawnVehicle(data.spawnName, function(veh)
			currentVeh = { out = true, current = veh }
			SetVehicleModKit(veh, 0)
			NetworkRequestControlOfEntity(veh)
			SetEntityAsMissionEntity(veh, true, true)
			SetVehicleColours(veh, Loc[Config.Lan].vehicleResprayOptionsClassic[math.random(1, #Loc[Config.Lan].vehicleResprayOptionsClassic)].id, Loc[Config.Lan].vehicleResprayOptionsClassic[math.random(1, #Loc[Config.Lan].vehicleResprayOptionsClassic)].id)
			SetVehicleNumberPlateText(veh, string.sub(PlayerJob.label, 1, 5)..tostring(math.random(100, 999)))
			SetEntityHeading(veh, data.coords.w)
			TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
			TriggerEvent("vehiclekeys:client:SetOwner", trim(GetVehicleNumberPlateText(veh)))
			SetVehicleEngineOn(veh, true, true)
			Wait(250)
			if GetNumVehicleMods(veh, 48) > 0 or GetVehicleLiveryCount(veh) > -1 then TriggerEvent("jim-mechanic:client:Preview:Livery", {close=true}) end
			triggerNotify(nil, GetDisplayNameFromVehicleModel(data.spawnName).." ["..trim(GetVehicleNumberPlateText(currentVeh.current)).."]")
			qblog("`Garage - "..GetDisplayNameFromVehicleModel(data.spawnName).."` spawned [**"..trim(GetVehicleNumberPlateText(currentVeh.current)).."**]")
		end, data.coords, true)
	end
end)

RegisterNetEvent("jim-mechanic:client:Garage:RemSpawn", function(data)
	if Config.RemSpawn then
		SetVehicleEngineHealth(currentVeh.current, 200.0)
		SetVehicleBodyHealth(currentVeh.current, 200.0)
		for i = 0, 7 do SmashVehicleWindow(currentVeh.current, i) Wait(150) end PopOutVehicleWindscreen(currentVeh.current)
		for i = 0, 5 do	SetVehicleTyreBurst(currentVeh.current, i, true, 0) Wait(150) end
		for i = 0, 5 do SetVehicleDoorBroken(currentVeh.current, i, false) Wait(150) end
	end
	Wait(800)
	DeleteEntity(currentVeh.current) currentVeh = { out = false, current = nil }
end)

local markerOn = false
RegisterNetEvent("jim-mechanic:client:Garage:Blip", function(data)
	triggerNotify(nil, Loc[Config.Lan]["garage"].marker)
	if markerOn then markerOn = not markerOn end
	markerOn = true
	local carBlip = GetEntityCoords(currentVeh.current)
	if not DoesBlipExist(garageBlip) then
		garageBlip = AddBlipForCoord(carBlip.x, carBlip.y, carBlip.z)
		SetBlipColour(garageBlip, 8)
		SetBlipRoute(garageBlip, true)
		SetBlipSprite(garageBlip, 85)
		SetBlipRouteColour(garageBlip, 3)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentString(Loc[Config.Lan]["garage"].markername)
		EndTextCommandSetBlipName(garageBlip)
	end
	while markerOn do
		local time = 5000
		local carLoc = GetEntityCoords(currentVeh.current)
		local playerLoc = GetEntityCoords(PlayerPedId())
		if DoesEntityExist(currentVeh.current) then
			if #(carLoc - playerLoc) <= 30.0 then time = 100
			elseif #(carLoc - playerLoc) <= 1.5 then
				RemoveBlip(garageBlip)
				garageBlip = nil
				markerOn = not markerOn
			else time = 5000 end
		else
			RemoveBlip(garageBlip)
			garageBlip = nil
			markerOn = not markerOn
		end
		Wait(time)
	end
end)

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Targets) do exports["qb-target"]:RemoveZone(k) end
	for i = 1, #till do DeleteEntity(till[i]) end
	for i = 1, #laptop do DeleteEntity(laptop[i]) end
	for i = 1, #nos do DeleteEntity(nos[i]) end
	for i = 1, #parking do DeleteEntity(parking[i]) end
	emptyHands(PlayerPedId())
end)