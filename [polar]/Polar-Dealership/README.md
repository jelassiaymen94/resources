
Discord: https://discord.gg/e4SSqHdQhY
Tebex: https://www.polarscripts.net

# Description

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)
* [PolyZone by mkafrin](https://github.com/mkafrin/PolyZone)

# Installation
* **Run the included SQL script to create the databases**
* **Add the jobs to your shared.lua**
* **Add custom vehicles to the sh_config.lua file for its respective dealership**
* **All custom vehicles must be added to the shared.lua**
* **Prices for vehicles are taken from the database, with a multiplier (see sh_config) added to it**



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
