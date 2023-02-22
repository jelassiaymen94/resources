
if Config.OldQBCore then
    Citizen.CreateThread(function()
        while QBCore == nil do
            TriggerEvent(Config.Core..':GetObject', function(obj) QBCore = obj end)
            Citizen.Wait(200)
        end
    end)
else
    QBCore = exports[Config.CoreFolderName]:GetCoreObject()
end

RegisterNetEvent(Config.Core..":Client:OnPlayerLoaded")
AddEventHandler(Config.Core..":Client:OnPlayerLoaded", function()
	QBCore.Functions.TriggerCallback('qb-container:server:getTables', function(tabledata)
		ContainerTable = tabledata
		isSpawned = true
    end)
end)

RegisterNetEvent(Config.Core..':Client:OnPlayerUnload')
AddEventHandler(Config.Core..':Client:OnPlayerUnload', function()
	isSpawned = false
    if ContainerTable then
		for k, v in pairs(ContainerTable) do
			DeleteEntity(v.obj)
			v.obj = nil
		end
	end
end)

-- ██   ██  █████   ██████ ██   ██     ███████ ████████  █████  ███████ ██   ██ 
-- ██   ██ ██   ██ ██      ██  ██      ██         ██    ██   ██ ██      ██   ██ 
-- ███████ ███████ ██      █████       ███████    ██    ███████ ███████ ███████ 
-- ██   ██ ██   ██ ██      ██  ██           ██    ██    ██   ██      ██ ██   ██ 
-- ██   ██ ██   ██  ██████ ██   ██     ███████    ██    ██   ██ ███████ ██   ██

RegisterNetEvent("qb-container:client:hackStash")
AddEventHandler("qb-container:client:hackStash", function(data)
	local index = 0
	if ContainerTable then
		for k, v in ipairs(ContainerTable) do
			if v.obj == data.entity then
                if v.code ~= nil then
                    index = k
                    PoliceCall()
                    exports['ps-ui']:Thermite(function(success)
                        if success then
                            TriggerServerEvent("qb-container:server:removeItem", Config.StashHackItem)
                            TriggerEvent("inventory:client:SetCurrentStash", v.containername)
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", v.containername, {
                                maxweight = Config.Containers[v.type].StashSize,
                                slots = Config.Containers[v.type].StashSlots,
                            })
                            ShowNotification(Config.Locale["hack_success"], "success")
                            TriggerServerEvent("qb-container:server:removeKeypad", index, v.coords)
                        else
                            if Config.RemoveItemOnHackFail then
                                TriggerServerEvent("qb-container:server:removeItem", Config.StashHackItem)
                            end
                            ShowNotification(Config.Locale["hack_failure"], "error")
                        end
                    end, 10, 5, 3)
                else
                    ShowNotification(Config.Locale["container_has_no_keypad"], "error")
                end
			end
		end
	end
end)


-- ████████  █████  ██████   ██████  ███████ ████████ 
--    ██    ██   ██ ██   ██ ██       ██         ██    
--    ██    ███████ ██████  ██   ███ █████      ██    
--    ██    ██   ██ ██   ██ ██    ██ ██         ██    
--    ██    ██   ██ ██   ██  ██████  ███████    ██   

local ContainerItems = {`container_max_small`, `container_max_medium`, `container_max_large`}

exports[Config.Target]:AddTargetModel(ContainerItems, {
    options = {

        {
            event = "qb-container:client:OpenStash",
            icon = Config.Locale["icon_for_open_stash"], 
            label = Config.Locale["label_for_open_stash"], 
        }, 
        --[[{
            event = "qb-container:client:destroyContainer",
            icon = Config.Locale["icon_for_destroy"], 
            label = Config.Locale["label_for_destroy"], 
        },
        {
            event = "qb-container:client:checkWear",
            icon = Config.Locale["icon_for_check_wear"], 
            label =  Config.Locale["label_for_check_wear"], 
        },]]
        {
            event = "qb-container:client:addKeyPad",
            icon = Config.Locale["icon_for_keypad"], 
            label = Config.Locale["label_for_keypad"], 
            item = Config.KeyPadItem,
        },

        -- this is the logic to force open stash. 
        -- {
        --     event = "qb-container:client:forceOpenStash",
        --     icon = Config.Locale["icon_for_force_open"], 
        --     label = Config.Locale["label_for_force_open"], 
        --     job = "police",
        -- },


        -- this is the logic to hack a container.
        -- {
        --     event = "qb-container:client:hackStash",
        --     icon = Config.Locale["icon_for_hack"], 
        --     label = Config.Locale["label_for_hack"], 
        --     item = Config.StashHackItem,
        -- },

        -- this is the logic to repair the container.
        -- {
        --     event = "qb-container:client:repairContainer",
        --     icon = Config.Locale["icon_for_repair"], 
        --     label = Config.Locale["label_for_repair"], 
        -- },
    },
    distance = 1.0
})

function ShowNotification(msg, type)
    if Config.Notify['QBCore'] then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify['okokNotify'] then
        exports['okokNotify']:Alert(Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        exports.pNotify:SendNotification({text = msg, type = type, layout = Config.pNotifyLayout, timeout = 5000})
    end
end

function PoliceCall()
    print("this function can be used to add your police alerts")
end