local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Server:UpdateObject', function() if source ~= '' then return false end QBCore = exports['qb-core']:GetCoreObject() end)

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	for _, v in pairs(Config.DumpItems) do if not QBCore.Shared.Items[v] then print("^5Debug^7: ^2DumpItems^7: ^2Missing Item from ^4QBCore^7.^4Shared^7.^4Items^7: '^6"..v.."^7'") end end
end)

RegisterServerEvent('jim-recycle:Dumpsters:Reward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	for i = 1, math.random(1, 1) do
		local item = Config.DumpItems[math.random(1, #Config.DumpItems)]
		local amount = math.random(1, 3)
		Player.Functions.AddItem(item, amount)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
		Citizen.Wait(100)
	end
	local Luck = math.random(1, 4000)
	local Odd = math.random(1, 4000)
	if Luck == Odd then
	local random = math.random(1, 2) 
		Player.Functions.AddItem("largejoint", random, false, {["quality"] = nil})
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["joint"], 'add', random)
		TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "black", "**" .. src .. "** ADDED Joint" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
	end
	local Luck = math.random(1, 10000)
	local Odd = math.random(1, 10000)
	if Luck == Odd then
	local random = math.random(1, 1) 
		Player.Functions.AddItem("weapon_pistol", random, false, {["quality"] = 5})
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_pistol"], 'add', random)
		TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "black", "**" .. src .. "** ADDED PISTOL" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
	end
	local Luck = math.random(1, 40000)
	local Odd = math.random(1, 40000)
	if Luck == Odd then
	local random = math.random(1, 1) 
		Player.Functions.AddItem("methkey", random, false, {["quality"] = nil})
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["methkey"], 'add', random)
		TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "black", "**" .. src .. "** ADDED methkey" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
	end
	local Luck = math.random(1, 200000)
	local Odd = math.random(1, 200000)
	if Luck == Odd then
	local random = math.random(1, 1) 
		Player.Functions.AddItem("weapon_microsmg2", random, false, {["quality"] = 5})
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_microsmg2"], 'add', random)
		TriggerEvent("qb-log:server:CreateLog", "dumpsterspecial", "JIM RECYCLE", "orange", "**" .. src .. "** ADDED weapon_microsmg2" .. random .. ", " .. Luck .. " == " .. Odd .. " ")
	end



end)
