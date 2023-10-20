Config = {
	Default_Prio = 500000, -- This is the default priority value if a discord isn't found
	AllowedPerTick = 1, -- How many players should we allow to connect at a time?
	CheckForGhostUsers = 40, -- How many seconds should the script check for ghosts users in the queue?
	HostDisplayQueue = true,
	onlyActiveWhenFull = false,
	Requirements = { -- A player must have the identifier to be allowed into the server
		Discord = true,
		Steam = false
	},
	WhitelistRequired = true, -- If this option is set to true, a player must have a role in Config.Rankings to be allowed into the server
	Debug = false,
	Webhook = '',
	Displays = {
		Prefix = 'Fastro Que',
		ConnectingLoop = { 
			
		},
		Messages = {
			MSG_CONNECTING = 'You are being connected [{QUEUE_NUM}/{QUEUE_MAX}]: ', -- Default message if they have no discord roles 
			MSG_CONNECTED = 'You are up! You are being connected now :)',
			MSG_DISCORD_REQUIRED = 'Your Discord was not detected... You are required to have Discord to play on this server...',
			MSG_STEAM_REQUIRED = 'Your Steam was not detected... You are required to have Steam to play on this server...',
			MSG_NOT_WHITELISTED = 'You do not have a Discord role whitelisted for this server... You are not whitelisted.',
		},
	},
}

Config.Rankings = {
	-- LOWER NUMBER === HIGHER PRIORITY 
	-- ['roleID'] = {rolePriority, connectQueueMessage},
	['1011780619258314842'] = {10000, "You are being connected (Normal Que) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- normal

	['1107451190435905598'] = {5000, "You are being connected (Bronze Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- bronze
	['1107451144822853753'] = {4000, "You are being connected (Silver Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- silver
	['1107451031136251954'] = {3000, "You are being connected (Gold Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- gold
	['1107451053189906562'] = {2000, "You are being connected (Diamond Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- diamond
	['1164749145240768642'] = {1000, "You are being connected (GOAT Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- GOAT

	['1109825980295548930'] = {4000, "You are being connected (Streamer Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- streamer
	['1011783216778194994'] = {4000, "You are being connected (Admin Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- administration

	['1011781307975602216'] = {10, "You are being connected (Founder Queue) [{QUEUE_NUM}/{QUEUE_MAX}]:"}, -- management
}