
Config = {
	Lan = "en", -- Pick your language here
	Debug = false, -- Set to true to show green debug boxes to help track
	img = "inventory/html/images/", -- Set this to the directory for your inventory image files
	JimShops = true, -- If using my free script jim-shops, enable this to use it with the mechanic stores.
	JimMenu = true, -- If using my free edit of qb-menu enable this.
	distkph = false, -- Set to false to read distance travelled in Miles.
	Notify = "qb",

-- Main variables
	isVehicleOwned = true, -- Keep this true if you only want changes to be made to owned vehicles
	RequiresJob = true,  -- Do the specfic items require the mechanic job?
	LocationRequired = true, -- Are the mecahnics locked to specific locations?
	LocationBlips = true, -- Enable to grab the blip locations from locations.lua
	CosmeticsJob = true, -- Do vehicle cosmetics require a mechanic job role?
	FreeRepair = false,  -- Are repairs free? True means yes
	StashRepair = true, -- Enable for repair materials to be removed from a job stash (disabled if RequiresJob = false)
	Stores = true, -- Set true to turn on shop storage features
	Crafting = true, -- Set true to turn on crafting features
	StashCraft = true,  -- Set true to grab materials from mechaincs stash for crafting
	PreviewPhone = false, -- Enable this is preview menu generates an email, False if you want to give an item
	PreviewJob = false, -- Enable this if you want /preview to require a Job Role
	PreviewLocation = false, -- Enable this if you want to lock /preview to a job location (ignored if LocationRequired is false)

	PhoneMail = "qb", 	-- If PreviewPhone is true, change this to choose the correct phone system
						-- "qb" = use qb-phone for emails
						-- "gks" = use gks-phone for emails

	CosmeticRemoval = true, -- If "true" items will be removed on successful application of a mod
							-- If "false" items will not be removed on use.

	ShowOdo = true, -- Wether the distance is showed in car by default
	OdoLocation  = "bottom-right", 	-- Where the Odometer will show,
									-- "left", "right", "top", "top-left", "top-right", "bottom", "bottom-left", "bottom-right"
	OdoShowIcons = false, -- Enable this to allow the use of the warning icons on the odometer
	OdoAlwaysShowIcons = false, -- Enable this to show the icons even when not damaged

	OdoIconsToShow = {
		["engine"] = true,
		["radiator"] = true,
		["brakes"] = true,
		["axle"] = true,
		["clutch"] = true,
		["wheel"] = true,
		["headlight"] = true,
	},

	Chameleon = false, -- Enable this if you have install the chameleon paint mod
	WaxFeatures = false, -- Enable this if you want to use Car Wax Features

-- Player vehicle repair config
	ManualRepairCost = 250, -- Set this to a high amount to get people to talk to mechanics rather than use automated systems
	ManualRepairCostBased = true, 	-- Set this to true if you want the cost to ALWAYS be the amount set at "ManualRepairCost"
									-- Set this to false if you want it to "ManualRepairCost" to be the max and cost is calculated by damage

	ManualRepairBased = false, -- Set this to true if you want to set the repair cost to be based on QBCore.Shared.Vehicle costs(overrides the cost setting above)
	ManualRepairPercent = 3,	-- Set this to the percent of the vehicle price (Only works if ManualRepairBased is true)
								-- Default is 5% because $200,000 would be $10,000 max to repair by this system
								-- 5% of a $10,000 car would be $500

	repairEngine = true, -- Set this to true if automated repairs also repair engine (not just body)
	repairExtras = true, -- Set this to true for automated repairs to also repair extra damages (if mechanicjob is available and repairEngine is true)

	requireDutyCheck = true, -- if set to true, the repair bench will only be usable if there are no mechanics in the server ON DUTY
	dutyMessage = "There is a Mechanic on duty!", -- This is the notification that pops up when a person tries to repair when a mechanic is on duty, choose what you want for it.

	repairAnimate = true, -- Better than staring at a progress bar, "damaged" parts will be removed and replaced. Making it look more authentic
	repairSpeed = 1500, -- The time between each task while using repairAnimate. 1500 Seems to be a reasonable time for it

-- NOS STUFF
	NosRefillCharge = math.random(2000,2500), -- amount in dollars required to refill a nos can

	NosTopSpeed = -1.0, -- Enabling this adds a multiplier to the top speed of the vehicle
						-- Set this to "-1.0" to disable this
						-- This doesn't affect the boost acceleration
	NosBoostPower = { -- NOS boost acceleration power
		5.0, -- Level 1
		--5.2, -- Level 2
		--10.0, -- Level 3
	},

	NitrousUseRate = 2.0, -- How fast the nitrous drains (halved for level1, doubled for level3)

	NitrousCoolDown = 30, -- 7 Seconds, set to 0 to disable
	CooldownConfirm = true, -- Will play a confirmation beep when cooldown is done

	nosDamage = true, -- This enables NOS causing damage to engine while boosting
	boostExplode = true, -- If boosting too long at level 3 boost, tank will explode.

	-- Effects
	EnableFlame = true, -- True adds exhaut flame effects while boosting
	EnableTrails = false, -- True adds taillight effects while boosting
	EnableScreen = false, -- True adds screen effects while boosting

	skillcheck = "qb-skillbar", -- When adding Nos to a vehicle there are three script options available
								-- "qb-skillbar" "qb-lock" "Polar-UI"

	explosiveFail = true, 		-- Better not fail that skill check. (1 in 10 chance of explosion)
	explosiveFailJob = true, 	-- if true, mechanics can trigger an explosion
								-- if false, mechanics will never trigger an explosion

-- Discord preview receipts
	-- You will need to set custom info in each job location in locations.lua
	-- But for the ones you don't add info to, it will default to these numbers
	DiscordPreview = false, -- Set to true if you want to use discord receipts
	DiscordDefault = "", -- Set this to the default channel API link if one isn't set for a location
	DiscordColour = 16753920, -- This is the default "decimal" number colour

--Extra Vehicle Repair Costs
	RepairEngine = "wires",			---Engine repair item and its MAX cost
	RepairEngineCost = 2,

	RepairBody = "ducttape",			---Body Repair item and its cost
	RepairBodyCost = 3,

	RepairRadiator = "newoil",		---Radiator Repair item and its cost
	RepairRadiatorCost = 1,

	RepairAxle = "axleparts",		---DriveShaft Repair item and its cost
	RepairAxleCost = 1,

	RepairBrakes = "sparkplugs",	---Brakes Repair item and its cost
	RepairBrakesCost = 1,

	RepairClutch = "carbattery",	---Clutch Repair item and its cost
	RepairClutchCost = 1,

	RepairFuel = "wires",			---Fuel Repair item and its cost
	RepairFuelCost = 5,

--DuctTape Controllers
	DuctSimpleMode = false, -- This will repair the engine to the max (set below)
	MaxDuctEngine = 450.0, -- 450.0 is 45% health, this will be the max amount that it can be repaired to
	DuctAmountEngine = 100.0, -- Repairs the engine by 10% each use

	DuctTapeBody = true,  --Enable if you want duct tape to repair body at the same time as engine
	MaxDuctBody = 450.0,
	DuctAmountBody = 100.0, -- Repairs the engine by 10% each use

	RemoveDuctTape = true, --If Enabled it will remove 1 duct after use. If false it will be constantly reusable

	JobRoles = { "mechanic", "tuner", "otto", "hayes", "bennys", "lostmech" }, -- These are the job roles who can use items if RequiresJob is enabled.
								-- Add your extra job roles here or just leave as "mechanic"
	--Example--
	--JobRoles = { "mechanic", "tuner" }

-- nosBar() stuff
	nosBarColour = true, -- "true" to set nosBars to use colour, "false" for white and grey
	nosBarFull = "▓", -- The symbol to be used for a "full" segment of the bar
	nosBarEmpty = "░", -- The symbol to be used for an "empty" segment of the bar
}

-- No touch
Loc = {}
Crafting = {}
Stores = {}
VehicleNitrous = {}
VehicleStatus = {}
purgemode = true
purgeSize = 0.4
boostLevel = 1
purgeCool = 0

if not Config.JimMenu then Config.img = "" end