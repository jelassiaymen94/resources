CreateThread(function()
	for i = 1, #Config.Locations do
       
		local loc = Config.Locations[i].Location
		local codes = Config.Locations[i].Code
		local specia = Config.Locations[i].SPECIAL
		local uspecia = Config.Locations[i].USESPECIAL
		local weight = Config.Locations[i].Weight
		local slots = Config.Locations[i].Slots
		Wait(50)
		
		if Config.UseProp then makeProp({prop = Config.Prop, coords = vector4(loc.x, loc.y, loc.z, loc.w-180.0)}, 1, false) end
			
		local n = math.random(1,9999) local z = math.random(1,9999)
	  
		if uspecia == nil then
	  
			exports[Config.Target]:AddBoxZone("name:" .. n .. z, vector3(loc.x, loc.y, loc.z), 0.8, 0.5, 
			{ name="name:" .. n .. z, heading = loc.w+180.0, debugPoly=false, minZ=loc.z-1.05, maxZ=loc.z+0.80 },
			{ options = { { event = "Polar-Lockers:StashAvailability", icon = "fas fa-briefcase", label = "Open", 
		--  job = Config.Locations[i].JOB, -- job = {["police"] = 0, ["ambulance"] = 2},
		--  gang = Config.Locations[i].GANG, --  gang = {["ballas"] = 0, ["thelostmc"] = 2},
		--  citizenid = Config.Locations[i].CID,-- citizenid = {["JFD98238"] = true, ["HJS29340"] = true},
			slot = slots, 
			code = codes,
			weights = weight,
			}, },
			distance = 2.0 })











		end
	end
end)



RegisterNetEvent('Polar-Lockers:StashAvailability', function(data)
	local codes = data.code
	local slotas = data.slot
	local waght = data.weights


	local menutable = {
	{ header =  "Storage Locker", txt = "Contact a Real Estate agent to see availability", icon = "", isMenuHeader = true,  },
	{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } } }
    local disable = false
    local hide = false

	exports['qb-menu']:openMenu(menutable)
	menutable[#menutable+1] = { hidden = hide, disabled = disable, icon = "", header = "Open Locker", txt = "", params = { event = "Polar-Lockers:Client:OpenLocker", args = { code = codes, slots = slotas, weight = waght} } }
         
end)


RegisterNetEvent('Polar-Lockers:Client:OpenLocker', function(data)
	local weight = data.weight
	local slots = data.slots
	local code = data.code
	local keyboard = exports["qb-keyboard"]:KeyboardInput({
		header = "Enter Password",
		rows = {
			{
				id = 0,
				txt = ""
			}
		}
	})
    if keyboard ~= nil then
        if keyboard[1].input == code then
            EnterStash(code, weight, slots)
        end
    end
end)



function EnterStash(code, weight, slots)
    TriggerEvent("inventory:client:SetCurrentStash", "LOCKER:CODE:"..code)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "LOCKER:CODE:"..code, {
        maxweight = weight,
        slots = slots,
    })
end









