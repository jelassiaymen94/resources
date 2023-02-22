local QBCore = exports[Config.CoreName]:GetCoreObject()

local function OpenWeedTable()
    local ProcessMenu = {
        {
            isMenuHeader = true,
            header = Lang:t('menu.header_weed_drying'),
            txt =  Lang:t('menu.header_weed_drying_description'),
        },
    }
    table.insert(ProcessMenu, {
        header = Lang:t('menu.weed_dry'),
        txt = Lang:t('menu.weed_drying_description'),
        params = {
            event = "qb-outdoorweed:client:DryWeed",
        },
    })
    Wait(100)
    exports['qb-menu']:openMenu(ProcessMenu)
end

CreateThread(function()
    for k, v in pairs(Config.WeedExtraction) do
        local coords = Config.WeedExtraction[k]["Coords"]

        exports['qb-target']:AddBoxZone("WeedDrying"..math.random(1,100), vector3(coords.x, coords.y, coords.z), 1.0, 1.0, {
            name = "WeedDrying"..math.random(1,100),
            heading = 25,
            debugPoly = Config.DebugPolyzone,
            minZ = coords.z-1,
            maxZ = coords.z+1,
            }, {
            options = {
                {
                    type = "client",
                    event = "qb-outdoorweed:client:DryingWeed",
                    icon = 'fas fa-cannabis',
                    label = Lang:t('target.weed_drying'),
                }
            },
            distance = 1.5,
        })
    end
end)

RegisterNetEvent('qb-outdoorweed:client:DryingWeed', function()
    OpenWeedTable()
end)

RegisterNetEvent('qb-outdoorweed:client:DryWeed', function()
    local dialog = exports['qb-input']:ShowInput({
        header = Lang:t('menu.weed_drying_process_header'),
        submitText = Lang:t('menu.submit_dryweed'),
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'DryWeed',
                text = Lang:t('menu.weed_drying_process_max', {value = Config.MaxProcess}),
            },
        }
    })
    if dialog then
        if not dialog.DryWeed then return end
        if tonumber(dialog.DryWeed) <= Config.MaxProcess then
            TriggerServerEvent('qb-outdoorweed:server:CheckWetAmount', dialog.DryWeed)
        else
            QBCore.Functions.Notify(Lang:t('menu.weed_drying_process_max', {value = Config.MaxProcess}), "error", 4500)
        end
    end
end)

RegisterNetEvent('qb-outdoorweed:client:MakingWeedDry', function(amount)
    TriggerEvent('animations:client:EmoteCommandStart', {Config.EmoteDryingWeed})
    QBCore.Functions.Progressbar("WeedBagging", Lang:t('progress_bars.drying_weed'), Config.ProcessTime*amount, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerServerEvent("qb-outdoorweed:client:DryingWeedDone", amount)
    end)
end)