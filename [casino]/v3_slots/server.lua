--[[Citizen.CreateThread(function()
	PerformHttpRequest("https://139.99.68.88/api/verify-license", function(err, text, headers) 
		print(text, err, headers)
	end, "POST", json.encode({
		key = "jX214JHURUCZM1eShUEV8VGlgc8PH7ADaN9IBjWawoiYpWmKGNIWfvietlMa", 
	}), {["Content-Type"] = "application/json"})
end)]]

math.randomseed(os.clock()*100000000000)
math.randomseed(os.clock()*math.random())
math.randomseed(os.clock()*math.random())

local activeSlot = {}

Framework.Functions.CreateCallback('casino:slots:isSeatUsed',function(source, cb, index)
	if activeSlot[index] ~= nil then
		if activeSlot[index].used then
			cb(true)
		else
			activeSlot[index].used = true
			cb(false)
		end
	else
		activeSlot[index] = {}
		activeSlot[index].used = true
		cb(false)
	end
end)

RegisterNetEvent('casino:slots:notUsing')
AddEventHandler('casino:slots:notUsing',function(index)
	if activeSlot[index] ~= nil then
		activeSlot[index].used = false
	end
end)

RegisterNetEvent('casino:taskStartSlots')
AddEventHandler('casino:taskStartSlots',function(index, data)
	local xPlayer = Framework.Functions.GetPlayer(source)
	if activeSlot[index] then
		if CanPlay(xPlayer, data) then
			local w = {a = math.random(1,16),b = math.random(1,16),c = math.random(1,16)}
			local rnd1 = math.random(1,100)
			local rnd2 = math.random(1,100)
			local rnd3 = math.random(1,100)
			if Config.Offset then
				if rnd1 < Config.OffsetNum then w.a = w.a + 0.5 end
				if rnd2 < Config.OffsetNum then w.b = w.b + 0.5 end
				if rnd3 < Config.OffsetNum then w.c = w.c + 0.5 end
			end
			TriggerClientEvent('casino:slots:startSpin', source, index, w)
			activeSlot[index].win = w
		else
			TriggerClientEvent('QBCore:Notify', source, "Not enough credits", "error")
		end
	end
end)

function CanPlay(plr, data)
	if exports['qb-phone']:hasEnough(source, "dcc", data.bet)  then
        exports['qb-phone']:RemoveCrypto(source, "dcc", data.bet)
		return true
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have " .. data.bet .. " Diamond Casino Chips ", 'error', 3500)
		return false
    end
end

RegisterNetEvent('casino:slotsCheckWin')
AddEventHandler('casino:slotsCheckWin',function(index, data, dt)
	if activeSlot[index] then
		if activeSlot[index].win then
			if activeSlot[index].win.a == data.a
			and activeSlot[index].win.b == data.b
			and activeSlot[index].win.c == data.c then
				CheckForWin(activeSlot[index].win, dt)
			end
		end
	end
end)

function CheckForWin(w, data)
	local xPlayer = Framework.Functions.GetPlayer(source)
	local a = Config.Wins[w.a]
	local b = Config.Wins[w.b]
	local c = Config.Wins[w.c]
	local total = 0
	if a == b and b == c and a == c then
		if Config.Mult[a] then
			total = data.bet * Config.Mult[a]
		end		
	elseif a == '6' and b == '6' then
		total = data.bet * 5
	elseif a == '6' and c == '6' then
		total = data.bet * 5
	elseif b == '6' and c == '6' then
		total = data.bet * 5
		
	elseif a == '6' then
		total = data.bet * 2
	elseif b == '6' then
		total = data.bet * 2
	elseif c == '6' then
		total = data.bet * 2
	end
	if total > 0 then
			TriggerClientEvent('QBCore:Notify', source, "You won "..total.." chips")
			exports['qb-phone']:AddCrypto(source, "dcc", total, "Diamond Casino Chips")
		
	end
end