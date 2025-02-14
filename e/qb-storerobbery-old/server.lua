

QBCore = exports['qb-core']:GetCoreObject()

local cashA = 350 				--<<how much minimum you can get from a robbery
local cashB = 1000				--<< how much maximum you can get from a robbery
local ScashA = 500 			--<<how much minimum you can get from a robbery
local ScashB = 2000				--<< how much maximum you can get from a robbery

RegisterServerEvent('qb-storerobbery:server:takeMoney')
AddEventHandler('qb-storerobbery:server:takeMoney', function(register, isDone)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	-- Add some stuff if you want, this here above the if statement will trigger every 2 seconds of the animation when robbing a cash register.
    if isDone then
    local info = math.random(3, 10)
    exports['inventory']:AddItem(src, "band", info, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["band"], "add", info) 
        if math.random(1, 100) <= 50 then
            -- Give Special Item (Safe Cracker)
            Player.Functions.AddItem("safecracker", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["safecracker"], 'add')
        end
    end
end)

RegisterServerEvent('qb-storerobbery:server:setRegisterStatus')
AddEventHandler('qb-storerobbery:server:setRegisterStatus', function(register)
    Config.Registers[register].robbed   = true
    Config.Registers[register].time     = Config.resetTime
    TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, register, Config.Registers[register])
end)

RegisterServerEvent('qb-storerobbery:server:setSafeStatus')
AddEventHandler('qb-storerobbery:server:setSafeStatus', function(safe)
    TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, true)
    Config.Safes[safe].robbed = true

    SetTimeout(math.random(40, 80) * (60 * 1000), function()
        TriggerClientEvent('qb-storerobbery:client:setSafeStatus', -1, safe, false)
        Config.Safes[safe].robbed = false
    end)
end)

RegisterServerEvent('qb-storerobbery:server:SafeReward')
AddEventHandler('qb-storerobbery:server:SafeReward', function(safe)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	--[[local bags = math.random(4500,7500)
	local info = {
		worth = math.random(ScashA, ScashB)
	}
	Player.Functions.AddItem('markedcash', bags, false)
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedcash'], "add")]]

    local info = {worth = math.random(5000, 8000)}
    exports['inventory']:AddItem(src, "markedbills", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["markedbills"], "add", 1) 
    TriggerEvent("qb-log:server:CreateLog", "storerobbery", "Store Robbery Rewards", "default", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Received the following from the Store Robbery. **Loot**: '.."2".. ' x '.. "markedbills")

    local luck = math.random(1, 100)
    local odd = math.random(1, 100)
    if luck <= 30 then
            Player.Functions.AddItem("trojan_usb", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["trojan_usb"], "add")
        if luck == odd then
            Citizen.Wait(500)
            Player.Functions.AddItem("hacking_device", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hacking_device"], "add")
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        local toSend = {}
        for k, v in ipairs(Config.Registers) do

            if Config.Registers[k].time > 0 and (Config.Registers[k].time - Config.tickInterval) >= 0 then
                Config.Registers[k].time = Config.Registers[k].time - Config.tickInterval
            else
                if Config.Registers[k].robbed then
                    Config.Registers[k].time = 0
                    Config.Registers[k].robbed = false

                    table.insert(toSend, Config.Registers[k])
                end
            end
        end

        if #toSend > 0 then
            --The false on the end of this is redundant
            TriggerClientEvent('qb-storerobbery:client:setRegisterStatus', -1, toSend, false)
        end

        Citizen.Wait(Config.tickInterval)
    end
end)

QBCore.Functions.CreateCallback('qb-storerobbery:server:getRegisterStatus', function(source, cb)
    cb(Config.Registers)
end)

QBCore.Functions.CreateCallback('qb-storerobbery:server:getSafeStatus', function(source, cb)
    cb(Config.Safes)
end)

RegisterServerEvent('qb-storerobbery:server:CheckItem')
AddEventHandler('qb-storerobbery:server:CheckItem', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local ItemData = Player.Functions.GetItemByName("safecracker")
    if ItemData ~= nil then
        TriggerClientEvent('qb-storerobbery:client:hacksafe', source)
    else
        TriggerClientEvent('QBCore:Notify', source, "You appear to be missing something?")
    end
end)

RegisterServerEvent('qb-storerobbery:server:callCops')
AddEventHandler('qb-storerobbery:server:callCops', function(type, safe, streetLabel, coords)

   --[[ local cameraId = 4
    if type == "safe" then
        cameraId = Config.Safes[safe].camId
    else
        cameraId = Config.Registers[safe].camId
    end]]
    exports['qb-dispatch']:StoreRobbery(camId)
    TriggerClientEvent("dispatch:storerobbery", -1, coords, cameraId) -- Project Sloth Dispatch

    -- // QB PHONE PD ALERT \\ --
    local alertData = {
        title = "10-90 | Store Robbery",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = "Someone Is Trying To Rob A Store At "..streetLabel.."" 
        --(CAMERA ID: "..cameraId..")"
    }
    TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
    
end)