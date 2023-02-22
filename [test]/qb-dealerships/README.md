Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
* **Three-in-one dealerships for QBCore. Managers are required to order vehicles that take several days (configurable) to appear in stock. Stock and society money are saved in database**
* **This script comes with extensive logging and debug prints**

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [PolyZone by mkafrin](https://github.com/mkafrin/PolyZone)

# Installation
* **Run the included SQL script to create the databases**
* **Add the jobs to your shared.lua**
* **Add custom vehicles to the sh_config.lua file for its respective dealership**
* **All custom vehicles must be added to the shared.lua**
* **Prices for vehicles are taken from the database, with a multiplier (see sh_config) added to it**

# ADD FOLLOWING JOBS TO THE QBShared.Jobs IN SHARED.LUA
# Cardealer will already exist.
```lua
['cardealer'] = {
	label = 'Vehicle Dealer',
	defaultDuty = true,
	grades = {
		['0'] = {
			name = 'Recruit',
			payment = 50
		},
		['1'] = {
			name = 'Showroom Sales',
			payment = 75
		},
		['2'] = {
			name = 'Business Sales',
			payment = 100
		},
		['3'] = {
			name = 'Finance',
			payment = 125
		},
		['4'] = {
			name = 'Manager',
			isboss = true,
			payment = 150
		},
	},
},
['tuner'] = {
	label = 'Tunershop',
	defaultDuty = true,
	grades = {
		['0'] = {
			name = 'Recruit',
			payment = 50
		},
		['1'] = {
			name = 'Showroom Sales',
			payment = 75
		},
		['2'] = {
			name = 'Business Sales',
			payment = 100
		},
		['3'] = {
			name = 'Finance',
			payment = 125
		},
		['4'] = {
			name = 'Manager',
			isboss = true,
			payment = 150
		},
	},
},
['motordealer'] = {
	label = 'Motordealer Dealer',
	defaultDuty = true,
	grades = {
		['0'] = {
			name = 'Recruit',
			payment = 50
		},
		['1'] = {
			name = 'Showroom Sales',
			payment = 75
		},
		['2'] = {
			name = 'Business Sales',
			payment = 100
		},
		['3'] = {
			name = 'Finance',
			payment = 125
		},
		['4'] = {
			name = 'Manager',
			isboss = true,
			payment = 150
		},
	},
},
```

# HOW TO ADD VEHICLES TO THE SHARED.LUA:
# ADD THIS TO THE QBShared.Vehicles IN SHARED/ VEHICLES.LUA

["lwgtr"] = {
    ['name'] = 'R35 GT-R Liberty Walk',
    ['brand'] = 'Nissan',
    ['model'] = 'lwgtr',
    ['price'] = 575000,
    ['category"] = 'sports',
    ['hash'] = `lwgtr`,
    ['shop'] = 'custom',
},

# LOGGING: ADD FOLLOWING ENTRIES TO YOUR LOGS:
['societies'] = {'webhook'},
['vehicleshop'] = {'webhook'},
['testcar'] = {'webhook'},

# Ace perms commands
'dealer_db': Checks database if all vehicles in the config are in the dealerships_stock table, if not, adds an entry and sets the price to 1.000.000 so you can easily change it.

'dealer_debug': Checks if all vehicles in the config are in the QBCore/shared/vehicles.lua defined. If not, it prints it to console.
