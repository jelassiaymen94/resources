CreateThread(function(data)
    exports['qb-target']:AddCircleZone("vehicleped", vector3(-295.67, -996.3, 30.25), 0.4, { 
        name = "vehicleped", 
        debugPoly = false,
      }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:LicenseCheck",
                icon = "fas fa-car",
                label = "Rent Vehicle",
                LicenseType = "driver",
                MenuType = "vehicle",
            },
        },
        distance = 3.0
      })

      exports['qb-target']:AddCircleZone("vehicleped2", vector3(2009.4813, 3050.4080, 48.2136), 0.4, { 
        name = "vehicleped2", 
        debugPoly = false,
      }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:LicenseCheck",
                icon = "fas fa-car",
                label = "Rent Vehicle",
                LicenseType = "driver",
                MenuType = "vehicle2",
            },
        },
        distance = 3.0
      })

      exports['qb-target']:AddCircleZone("vehicleped3", vector3(-131.8657, 6332.7012, 32.4905), 0.4, { 
        name = "vehicleped3", 
        debugPoly = false,
      }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:LicenseCheck",
                icon = "fas fa-car",
                label = "Rent Vehicle",
                LicenseType = "driver",
                MenuType = "vehicle3",
            },
        },
        distance = 3.0
      })
    
    exports['qb-target']:AddCircleZone("aircraftped", vector3(-1686.57, -3149.22, 13.99), 0.4, { 
        name = "aircraftped", 
        debugPoly = false,
      }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:LicenseCheck",
                icon = "fas fa-car",
                label = "Rent Aircraft",
                LicenseType = "pilot",
                MenuType = "aircraft",
            },
        },
        distance = 3.0
        })

    exports['qb-target']:AddCircleZone("boatped", vector3(-753.5, -1512.27, 5.02), 0.4, { 
        name = "boatped", 
        debugPoly = false,
        }, {
        options = {
            {
                type = "client",
                event = "qb-rental:client:openMenu",
                icon = "fas fa-car",
                label = "Rent Boat",
                MenuType = "boat"
            },
        },
        distance = 3.0
        })

        exports['qb-target']:AddCircleZone("boatped2", vector3(-1604.2683, 5256.1191, 2.0711), 0.4, { 
            name = "boatped2", 
            debugPoly = false,
            }, {
            options = {
                {
                    type = "client",
                    event = "qb-rental:client:openMenu",
                    icon = "fas fa-car",
                    label = "Rent Boat",
                    MenuType = "boat2"
                },
            },
            distance = 3.0
            })

            exports['qb-target']:AddCircleZone("boatped3", vector3(-308.6725, -2447.0972, 2.8159), 0.4, { 
                name = "boatped3", 
                debugPoly = false,
                }, {
                options = {
                    {
                        type = "client",
                        event = "qb-rental:client:openMenu",
                        icon = "fas fa-car",
                        label = "Rent Boat",
                        MenuType = "boat3"
                    },
                },
                distance = 3.0
                })

                exports['qb-target']:AddCircleZone("truckped", vector3(1740.26, -1605.27, 112.5), 0.4, { 
                    name = "truckped", 
                    debugPoly = false,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "qb-rental:client:openMenu",
                            icon = "fas fa-car",
                            label = "Rent Truck",
                            MenuType = "truck"
                        },
                    },
                    distance = 3.0
                    })
end)