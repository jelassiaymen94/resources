local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('Polar-Pawnshop:server:TakeMoney')
AddEventHandler('Polar-Pawnshop:server:TakeMoney', function(TraphouseId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.Pawnshop[TraphouseId].money ~= 0 then
        Player.Functions.AddMoney('cash', Config.Pawnshop[TraphouseId].money)
        Config.Pawnshop[TraphouseId].money = 0
        TriggerClientEvent('Polar-Pawnshop:client:SyncData', -1, TraphouseId, Config.Pawnshop[TraphouseId])
        TriggerEvent("qb-log:server:CreateLog", "pawnshop", "PAWNSHOP", "blue", "**" .. GetPlayerName(src) .. "** Got money for selling stuff to pawnshop")

    else
        TriggerClientEvent('QBCore:Notify', src, 'No money in safe', 'error', '2500')
    end
end)

function SellTimeout(traphouseId, slot, itemName, amount, info)
    Citizen.CreateThread(function()
        if itemName == "markedbills" then
            SetTimeout(math.random(1000, 5000), function()
                if Config.Pawnshop[traphouseId].inventory[slot] ~= nil then
                    RemoveHouseItem(traphouseId, slot, itemName, 1)
                    Config.Pawnshop[traphouseId].money = Config.Pawnshop[traphouseId].money + math.ceil(info.worth / 100 * 80)
                    TriggerClientEvent('Polar-Pawnshop:client:SyncData', -1, traphouseId, Config.Pawnshop[traphouseId])
                end
            end)
        else
            for i = 1, amount, 1 do
                local SellData = Config.Items[itemName]
                SetTimeout(SellData.wait, function()
                    if Config.Pawnshop[traphouseId].inventory[slot] ~= nil then
                        RemoveHouseItem(traphouseId, slot, itemName, 1)
                        Config.Pawnshop[traphouseId].money = Config.Pawnshop[traphouseId].money + SellData.reward
                        TriggerClientEvent('Polar-Pawnshop:client:SyncData', -1, traphouseId, Config.Pawnshop[traphouseId])
                    end
                end)
                if amount > 1 then
                    Citizen.Wait(SellData.wait)
                end
            end
        end
    end)
end

function AddHouseItem(traphouseId, slot, itemName, amount, info, source)
    local amount = tonumber(amount)
    traphouseId = tonumber(traphouseId)
    if Config.Pawnshop[traphouseId].inventory[slot] ~= nil and Config.Pawnshop[traphouseId].inventory[slot].name == itemName then
        Config.Pawnshop[traphouseId].inventory[slot].amount = Config.Pawnshop[traphouseId].inventory[slot].amount + amount
    else
        local itemInfo = QBCore.Shared.Items[itemName:lower()]
        Config.Pawnshop[traphouseId].inventory[slot] = {
            name = itemInfo["name"],
            amount = amount,
            info = info ~= nil and info or "",
            label = itemInfo["label"],
            description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
            weight = itemInfo["weight"],
            type = itemInfo["type"],
            unique = itemInfo["unique"],
            useable = itemInfo["useable"],
            image = itemInfo["image"],
            slot = slot,
        }
    end
    SellTimeout(traphouseId, slot, itemName, amount, info)
    TriggerClientEvent('Polar-Pawnshop:client:SyncData', -1, traphouseId, Config.Pawnshop[traphouseId])
end

function RemoveHouseItem(traphouseId, slot, itemName, amount)
	local amount = tonumber(amount)
    traphouseId = tonumber(traphouseId)
	if Config.Pawnshop[traphouseId].inventory[slot] ~= nil and Config.Pawnshop[traphouseId].inventory[slot].name == itemName then
		if Config.Pawnshop[traphouseId].inventory[slot].amount > amount then
			Config.Pawnshop[traphouseId].inventory[slot].amount = Config.Pawnshop[traphouseId].inventory[slot].amount - amount
		else
			Config.Pawnshop[traphouseId].inventory[slot] = nil
			if next(Config.Pawnshop[traphouseId].inventory) == nil then
				Config.Pawnshop[traphouseId].inventory = {}
			end
		end
	else
		Config.Pawnshop[traphouseId].inventory[slot] = nil
		if Config.Pawnshop[traphouseId].inventory == nil then
			Config.Pawnshop[traphouseId].inventory[slot] = nil
		end
	end
    TriggerClientEvent('Polar-Pawnshop:client:SyncData', -1, traphouseId, Config.Pawnshop[traphouseId])
end

function GetInventoryData(traphouse, slot)
    traphouse = tonumber(traphouse)
    if Config.Pawnshop[traphouse].inventory[slot] ~= nil then
        return Config.Pawnshop[traphouse].inventory[slot]
    else
        return nil
    end
end

function CanItemBeSaled(item)
    local retval = false
    if Config.Items[item] ~= nil then
        retval = true
    elseif item == "markedbills" then
        retval = true
    end
    return retval
end


QBCore.Functions.CreateCallback('Polar-Pawnshop:server:GetTraphousesData', function(source, cb)
    cb(Config.Pawnshop)
end)
