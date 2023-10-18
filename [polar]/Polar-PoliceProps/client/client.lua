

local objecttable = {}


RegisterCommand("cone", function(s)  spawnprop("prop_roadcone02b", 'Cone', 0) end, false)
RegisterCommand("barrier", function(s)  spawnprop("prop_barrier_work06a", "Barrier", 1) end, false)
RegisterCommand("clearprops", function(s)  TableClear(objecttable) end, false)


function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end


AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end  
    TableClear(objecttable)
    LocalPlayer.state:set('inv_busy', false, true) 
end)


function spawnprop(type, name, number)
    local random = math.random(1,1000)
    local oname = name .. random
    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
    LocalPlayer.state:set('inv_busy', true, true) 
   
    loadAnimDict('random@domestic') TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
    Wait(500)
    RemoveAnimDict('random@domestic')
    
    TriggerServerEvent('Polar-PoliceProps:Server:Create', oname, type, vec4(coords.x,coords.y,coords.z, GetEntityHeading(PlayerPedId())), name, number)
    
    LocalPlayer.state:set('inv_busy', false, true)
end


RegisterNetEvent('Polar-PoliceProps:Client:Create', function(oname, prop, var, handle, grabname, number) 

    exports['qb-target']:AddBoxZone(oname, vec3(var.x, var.y, var.z + number), 0.5, 0.5, { name = oname, heading = 28.69, debug = false, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
    { options = {{ event = handle, type = oname, icon = "fas fa-bolt", label = "Grab " .. grabname}}, distance = 1.5  }) 

    loadModel(prop) 
    objecttable[oname] =  CreateObject(prop, var.x, var.y, var.z,  false,  true, true) 
    SetEntityHeading(objecttable[oname], var.w) 
    FreezeEntityPosition(objecttable[oname],true)
end)


RegisterNetEvent('Polar-PoliceProps:Client:Remove', function(oname) 
    exports['qb-target']:RemoveZone(oname)  
    DeleteEntity(objecttable[oname]) 
end)


RegisterNetEvent('Polar-PoliceProps:Client:Grab', function(data) 
    LocalPlayer.state:set('inv_busy', true, true) 
  
    local oname = data.type
   
    loadAnimDict('random@domestic') TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
    Wait(500)
    RemoveAnimDict('random@domestic')
    TriggerServerEvent('Polar-PoliceProps:Server:Remove', oname) 
    LocalPlayer.state:set('inv_busy', false, true)
       
end)


function TableClear(table) 
    for _, v in pairs(table) do
    exports['qb-target']:RemoveZone(_)
        if DoesEntityExist(v) then 
            DeleteEntity(v)
        end
    end
end



