CreateThread(function(data)
    exports['qb-target']:AddCircleZone("VehiclePed", vector3(-295.67, -996.3, 29.25), 0.4, { 
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

      exports['qb-target']:AddCircleZone("VehiclePed2", vector3(2009.4813, 3050.4080, 47.2136), 0.4, { 
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

      exports['qb-target']:AddCircleZone("VehiclePed3", vector3(-131.8657, 6332.7012, 31.4905), 0.4, { 
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
    
    exports['qb-target']:AddCircleZone("AircraftPed", vector3(-1686.57, -3149.22, 12.99), 0.4, { 
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

    exports['qb-target']:AddCircleZone("BoatPed", vector3(-753.5, -1512.27, 4.02), 0.4, { 
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

        exports['qb-target']:AddCircleZone("BoatPed2", vector3(-1604.2683, 5256.1191, 1.0711), 0.4, { 
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

            exports['qb-target']:AddCircleZone("BoatPed3", vector3(-308.6725, -2447.0972, 1.8159), 0.4, { 
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

                exports['qb-target']:AddCircleZone("BoatPed3", vector3(-308.6725, -2447.0972, 1.8159), 0.4, { 
                    name = "boatped3", 
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