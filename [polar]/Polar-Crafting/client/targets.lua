local QBCore = exports['qb-core']:GetCoreObject()



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
    local values = Config.Locations[i].Bench
    local specia = Config.Locations[i].SPECIAL
    local uspecia = Config.Locations[i].USESPECIAL

    Wait(50)
	
    if Config.UseProp then makeProp({prop = Config.Prop, coords = vector4(table.x, table.y, table.z, table.w-180.0)}, 1, false) end
        
    local n = math.random(1,9999) local z = math.random(1,9999)
  
    if uspecia == nil then
  
        exports[Config.Target]:AddBoxZone("name:" .. n .. z, vector3(table.x, table.y, table.z), 0.8, 0.5, 
        { name="name:" .. n .. z, heading = table.w+180.0, debugPoly=false, minZ=table.z-1.05, maxZ=table.z+0.80 },
	    { options = { { event = "Polar-Crafting:Client:OpenMenuPublic", icon = "fa-solid fa-bolt", label = "Open", 
    --  job = Config.Locations[i].JOB, -- job = {["police"] = 0, ["ambulance"] = 2},
    --  gang = Config.Locations[i].GANG, --  gang = {["ballas"] = 0, ["thelostmc"] = 2},
    --  citizenid = Config.Locations[i].CID,-- citizenid = {["JFD98238"] = true, ["HJS29340"] = true},
        benches = values, 
        minimum = Config.Locations[i].Min,
        bigname = Config.Locations[i].TitleName,
    }, },
	distance = 2.0 })

        
    elseif uspecia == 'cid' then

        exports[Config.Target]:AddBoxZone("name:" .. n .. z, vector3(table.x, table.y, table.z), 0.8, 0.5, 
        { name="name:" .. n .. z, heading = table.w+180.0, debugPoly=false, minZ=table.z-1.05, maxZ=table.z+0.80 },
        { options = { { event = "Polar-Crafting:Client:OpenMenuPublic", icon = "fa-solid fa-bolt", label = "Open", 
        citizenid = specia,
        benches = values, 
        minimum = Config.Locations[i].Min,
        bigname = Config.Locations[i].TitleName,
        }, },
        distance = 2.0 })
    

    elseif uspecia == 'job' then
        exports[Config.Target]:AddBoxZone("name:" .. n .. z, vector3(table.x, table.y, table.z), 0.8, 0.5, 
        { name="name:" .. n .. z, heading = table.w+180.0, debugPoly=false, minZ=table.z-1.05, maxZ=table.z+0.80 },
        { options = { { event = "Polar-Crafting:Client:OpenMenuPublic", icon = "fa-solid fa-bolt", label = "Open", 
        job = specia,
        benches = values, 
        minimum = Config.Locations[i].Min,
        bigname = Config.Locations[i].TitleName,
        }, },
        distance = 2.0 })
    
    elseif uspecia == 'gang' then

        exports[Config.Target]:AddBoxZone("name:" .. n .. z, vector3(table.x, table.y, table.z), 0.8, 0.5, 
        { name="name:" .. n .. z, heading = table.w+180.0, debugPoly=false, minZ=table.z-1.05, maxZ=table.z+0.80 },
        { options = { { event = "Polar-Crafting:Client:OpenMenuPublic", icon = "fa-solid fa-bolt", label = "Open", 
        gang = specia, 
        benches = values, 
        minimum = Config.Locations[i].Min,
        bigname = Config.Locations[i].TitleName,
        }, },
        distance = 2.0 })
    
    end
    end
end

