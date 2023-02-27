--- Events

RegisterNetEvent('Polar-WeedPlanting:client:UseBranch', function()
    QBCore.Functions.Progressbar('weedbranch', _U('processing_branch'), 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('Polar-WeedPlanting:server:ProcessBranch')
    end, function() -- Cancel
        QBCore.Functions.Notify(_U('canceled'), 'error', 2500)
    end)
end)

RegisterNetEvent('Polar-WeedPlanting:client:UseDryWeed', function()
    QBCore.Functions.Progressbar('dryweed', _U('packaging_weed'), 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('Polar-WeedPlanting:server:PackageWeed')
    end, function() -- Cancel
        QBCore.Functions.Notify(_U('canceled'), 'error', 2500)
    end)
end)
