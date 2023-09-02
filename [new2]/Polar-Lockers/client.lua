CreateThread(function()
	for i = 1, #Config.Lockers do
       
		local loc = Config.Lockers[i].Location
		local codes = Config.Lockers[i].Code
		local specia = Config.Lockers[i].SPECIAL
		local uspecia = Config.Lockers[i].USESPECIAL
		local weight = Config.Lockers[i].Weight
		local slots = Config.Lockers[i].Slots
		Wait(50)
		
			
		local n = math.random(1,9999) local z = math.random(1,9999)
	  
		if uspecia == nil then
	  
			exports['qb-target']:AddBoxZone("name:" .. n .. z, vector3(loc.x, loc.y, loc.z), 0.8, 0.5, 
			{ name="name:" .. n .. z, heading = 0, debugPoly=false, minZ=loc.z-1.05, maxZ=loc.z+0.80 },
			{ options = { { event = "Polar-Lockers:StashAvailability", icon = "fas fa-briefcase", label = "Open", 
		--  job = Config.Lockers[i].JOB, -- job = {["police"] = 0, ["ambulance"] = 2},
		--  gang = Config.Lockers[i].GANG, --  gang = {["ballas"] = 0, ["thelostmc"] = 2},
		--  citizenid = Config.Lockers[i].CID,-- citizenid = {["JFD98238"] = true, ["HJS29340"] = true},
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
	{ icon = "fas fa-circle-xmark", header = "", txt = "Close", params = { event = "Menu:Close" } },
	{ icon = "fas fa-briefcase", header = "Open Locker", txt = "The Worlds Biggest Secret Lies Behind This Door", params = { event = "Polar-Lockers:Client:OpenLocker", args = { code = codes, slots = slotas, weight = waght} } }
	}

	exports['qb-menu']:openMenu(menutable)
	      
end)


RegisterNetEvent('Polar-Lockers:Client:OpenLocker', function(data)
	local weight = data.weight
	local slots = data.slots
	local code = data.code
	local text = exports['qb-input']:ShowInput({
        header = "Enter Password",
        submitText = "Enter",
        inputs = {
            {
                text = "Enter the Code", -- text you want to be displayed as a place holder
                name = "lockercodename", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true, 
            },
        },
    })
    if text ~= nil then
        for _, v in pairs(text) do
			if v == code then
				EnterStash(code, weight, slots)
            else
				TriggerEvent('Polar-Lockers:Client:OpenLocker', data)
			end
        end
    else
		TriggerEvent('Polar-Lockers:Client:OpenLocker', data)
    end
end)



function EnterStash(code, weight, slots)
    TriggerEvent("inventory:client:SetCurrentStash", "LOCKER:CODE:"..code)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "LOCKER:CODE:"..code, {
        maxweight = weight,
        slots = slots,
    })
end









