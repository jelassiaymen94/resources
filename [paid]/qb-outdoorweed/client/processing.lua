local QBCore = exports[Config.CoreName]:GetCoreObject()

local function OpenWeedTable()
    local ProcessMenu = {
        {
            isMenuHeader = true,
            header = Lang:t('menu.header_weed_processing_table'),
            txt =  '',
        },
    }
    Wait(100)
    table.insert(ProcessMenu, {
        header = Lang:t('menu.header_weed_bags'),
        txt = Lang:t('menu.weed_bags_description'),
        params = {
            event = "qb-outdoorweed:client:WeedBag",
        },
    })
    Wait(100)
    table.insert(ProcessMenu, {
        header = Lang:t('menu.header_joints'),
        txt = Lang:t('menu.roll_some_joints_description'),
        params = {
            event = "qb-outdoorweed:client:Joint",
        }
    })
    Wait(100)
    exports['qb-menu']:openMenu(ProcessMenu)
end

CreateThread(function()
    for k, v in pairs(Config.WeedProcessing) do
        local coords = Config.WeedProcessing[k]["Coords"]

        exports['qb-target']:AddBoxZone("WeedProcessing"..math.random(1,100), vector3(coords.x, coords.y, coords.z), 1.0, 1.0, {
            name = "WeedProcessing"..math.random(1,100),
            heading=25,
            debugPoly = Config.DebugPolyzone,
            minZ = coords.z-1,
            maxZ = coords.z+1,
            }, {
            options = {
              {
                type = "client",
                event = "qb-outdoorweed:client:Process",
                icon = 'fas fa-cannabis',
                label = Lang:t('target.weed_processing'),
              }
            },
            distance = 1.5,
        })
    end
end)

RegisterNetEvent('qb-outdoorweed:client:Process', function()
    OpenWeedTable()
end)

RegisterNetEvent('qb-outdoorweed:client:WeedBag', function()
    local dialog = exports['qb-input']:ShowInput({
        header = Lang:t('menu.weed_bagging_process_header'),
        submitText = Lang:t('menu.submit_bagweed'),
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'WeedBag',
                text = Lang:t('menu.weed_bagging_process_max', {value=Config.MaxProcess})
            },
        }
    })
    if dialog then
        if not dialog.WeedBag then return end
        if tonumber(dialog.WeedBag) <= Config.MaxProcess then
            TriggerServerEvent('qb-outdoorweed:server:CheckAmount', dialog.WeedBag, "WeedBag")
        else
            QBCore.Functions.Notify(Lang:t('error.weed_bagging_process_max', {value=Config.MaxProcess}), "error", 4500)
        end
    end
end)

RegisterNetEvent('qb-outdoorweed:client:Joint', function()
    local dialog = exports['qb-input']:ShowInput({
        header = Lang:t('menu.header_joint_making'),
        submitText = Lang:t('menu.submit_joint_making'),
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'Joint',
                text = Lang:t('menu.joint_making_process_max', {value=Config.MaxProcess})
            },
        }
    })
    if dialog then
        if not dialog.Joint then return end
        if tonumber(dialog.Joint) <= Config.MaxProcess then
            TriggerServerEvent('qb-outdoorweed:server:CheckAmount', dialog.Joint, "Joints")
        else
            QBCore.Functions.Notify(Lang:t('error.joint_making_process_max', {value=Config.MaxProcess}), "error", 4500)
        end
    end
end)


RegisterNetEvent('qb-outdoorweed:client:MakingJoint', function(amount)
    TriggerEvent('animations:client:EmoteCommandStart', {Config.EmoteMakingJoints})
    QBCore.Functions.Progressbar("JointsMaking", Lang:t('progress_bars.making_joints'), Config.ProcessTime*amount, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("qb-outdoorweed:client:MakingJointDone", amount)
    end)
end)

RegisterNetEvent('qb-outdoorweed:client:MakingWeed', function(amount)
    TriggerEvent('animations:client:EmoteCommandStart', {Config.EmoteBaggingWeed})
    QBCore.Functions.Progressbar("WeedBagging", Lang:t('progress_bars.bagging_weed'), Config.ProcessTime*amount, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("qb-outdoorweed:client:MakingWeedDone", amount)
    end)
end)