QBCore = exports[Config.QBCoreFolderName]:GetCoreObject()

RegisterNetEvent('ol-graffiti:client:openGangMenu')
AddEventHandler("ol-graffiti:client:openGangMenu", function()
    if QBCore.Functions.GetPlayerData().gang.name ~= Config.NotInGameGang then
        QBCore.Functions.TriggerCallback('ol-graffiti:server:getGangLVL', function(lvl)
            QBCore.Functions.TriggerCallback('ol-graffiti:server:getGangPlayers', function(amount, online, playerdata)
                local headerMenu = {}
                headerMenu[#headerMenu + 1] = {
                    header = "| Turf Menu " .. QBCore.Functions.GetPlayerData().gang.label .. " |",
                    isMenuHeader = true, -- Set to true to make a nonclickable title
                }
                headerMenu[#headerMenu + 1] = {
                    header = 'Gang LVL: ' .. lvl,
                    isMenuHeader = true
                }
                headerMenu[#headerMenu + 1] = {
                    header = 'Gang Members online: ' .. online .. '/' .. amount,
                    isMenuHeader = true
                }
                headerMenu[#headerMenu+1] = {
                    header = "⬅ BACK",
                    params = {
                        event = 'ol-graffiti:openTurfMenu',
                    }
                }
                exports[Config.MenuFolderName]:openMenu(headerMenu)
            end, QBCore.Functions.GetPlayerData().gang.name, false)
        end, QBCore.Functions.GetPlayerData().gang.name)
    else
        QBCore.Functions.Notify('You are not in gang', 'error')
    end
end)

RegisterNetEvent('ol-graffiti:openTurfMenu')
AddEventHandler("ol-graffiti:openTurfMenu", function()
    local headerMenu = {}
    headerMenu[#headerMenu+1] = {
        header = "| Turf Menu " .. QBCore.Functions.GetPlayerData().gang.label .. " |",
        isMenuHeader = true, -- Set to true to make a nonclickable title
    }
    headerMenu[#headerMenu+1] = {
        header = "Gang Turf Data",
        params = {
            event = "ol-graffiti:client:openGangMenu",
        }
    }
    headerMenu[#headerMenu+1] = {
        header = "Toggle Turfs",
        params = {
            event = "ol-graffiti:client:toggleTurfs",
        }
    }
    headerMenu[#headerMenu+1] = {
        header = "CLOSE",
        params = {
            event = Config.MenuEventPrefix .. ':close',
        }
    }
    exports[Config.MenuFolderName]:openMenu(headerMenu)
end)

RegisterNetEvent('ol-graffiti:client:OpenMenu', function(Items, gang)
    if Items and #Items > 0 then
        local headerMenu = {}
        headerMenu[#headerMenu + 1] = {
            header = "| Sell Menu |",
            isMenuHeader = true,
        }
        for i, item in next, Items do
            local xitem = {
                label = item.label,
                name = item.name,
                amount = item.amount,
                gang = gang
            }
            headerMenu[#headerMenu + 1] = {
                header = "Item Name: " .. item.label,
                params = {
                    event = "ol-graffiti:client:GetAmount",
                    args = xitem
                }
            }
        end
        exports[Config.MenuFolderName]:openMenu(headerMenu)
    else
        QBCore.Functions.Notify(Config.Text.NPC_TEXT.NOITEMSTOSELL, 'error')
    end
end)

RegisterNetEvent('ol-graffiti:client:GetAmount', function(item)
    local sellitem = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Amount (max - " .. item.amount .. ")",
				name = "amount", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
        }
    })
    if sellitem and tonumber(sellitem.amount) > tonumber(item.amount) then
        QBCore.Functions.Notify(Config.Text.NPC_TEXT.NOTENOUGHTITEMS, 'error')
    elseif sellitem then
        TriggerServerEvent('ol-graffiti:server:sellitemsALL', item, sellitem.amount, item.gang)
    end
end)