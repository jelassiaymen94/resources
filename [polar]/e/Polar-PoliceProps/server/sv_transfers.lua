

RegisterNetEvent('Polar-PoliceProps:Server:Remove', function(name) TriggerClientEvent('Polar-PoliceProps:Client:Remove', -1, name)   end)
RegisterNetEvent('Polar-PoliceProps:Server:Create', function(name, prop, loc, grabname, number)  TriggerClientEvent('Polar-PoliceProps:Client:Create', -1, name, prop, vec4(loc.x, loc.y,  loc.z-1, loc.w), "Polar-PoliceProps:Client:Grab", grabname, number) end)



















