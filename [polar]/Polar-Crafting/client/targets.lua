local QBCore = exports['qb-core']:GetCoreObject()



CreateThread(function()
    --targets()
end)
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        targets()
    end
end)
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Wait(100)
    targets()
    
end)

function makeProp(data, freeze, synced)
    RequestModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or 0, synced or false, false)
    SetEntityHeading(prop, data.coords.w)
    FreezeEntityPosition(prop, freeze or 0)
    if Config.Debug then print("^5Debug^7: ^6Prop ^2Created ^7: '^6"..prop.."^7'") end
    return prop
end

function targets()
  
    for i = 1, #Config.Locations do

    local table = Config.Locations[i].Table
    Wait(50)
	
    makeProp({prop = `prop_tool_bench02`, coords = vector4(table.x, table.y, table.z, table.w-180.0)}, 1, false)
   
    local n = math.random(1,9999) local d = math.random(1,9999) local f = math.random(1,9999) local g = math.random(1,9999) local z = math.random(1,9999)
    exports['qb-target']:AddBoxZone("h:" .. Config.Locations[i].type .. "" .. n .. d .. f .. g .. z, vector3(table.x, table.y, table.z), 0.8, 0.5, 
    { name="h:" .. Config.Locations[i].type .. "" .. n .. d .. f .. g .. z, heading = table.w+180.0, debugPoly=false, minZ=table.z-1.05, maxZ=table.z+0.80 },
	{ options = { { event = "Polar-Crafting:Client:OpenMenuPublic", icon = "fa-solid fa-bolt", label = "Open", type = Config.Locations[i].type }, },
	distance = 2.0 })

        
    end
end
RegisterNetEvent('Polar-Crafting:Client:OpenBench', function(data)
    type = data.type
    print(type)

end)
