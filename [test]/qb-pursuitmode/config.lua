Config = {}

Config.DefaultKey = 'N'

Config.SlowdownOnSwitch = false
Config.SlowdownPercentage = 0.02 -- 0.2 => 20%

Config.PlaySoundOnSwitch = true

Config.PlayServerSyncedSound = true -- server synced sounds can be heard by other players, disable if you cannot hear the sounds at higher speeds or mess with the distance settings below
Config.MaxSoundDistance = 3.0 -- Server Synced only, and no volume falloff
Config.MaxSoundDistanceAtMediumSpeeds = 5.0 -- Do not touch if you don't know what you're doing!
Config.MaxSoundDistanceAtHighSpeeds = 10.0 -- Do not touch if you don't know what you're doing!

Config.SoundFile = 'beep-sound-1' -- file name without the .ogg (located in /resources/[standalone]/interact-sound/client/html/sounds/)
Config.SoundVolume = 0.05

Config.SwitchNotification = "Changed mode to %s" -- %s will be replaced with the vehicle mode, e.g. S+

Config.AuthorizedJobs = { -- empty => everyone can use it
    "police",
    "ambulance",
}

Config.VehicleModes = { -- If you define a new mode, you will have to add a new Vehicle Modification and a new mode for EVERY vehicle defined in Config.VehiclesConfig!
    "A",
    "A+",
    "S",
    "S+",
    "X",
}

Config.VehicleModifications = {
    ["A"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = -1,
        ["Brakes"] = -1,
        ["Transmission"] = -1,
        ["XenonHeadlightsColor"] = 0,
    },
    ["A+"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 2,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["XenonHeadlightsColor"] = 1,
    },
    ["S"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 3,
        ["Brakes"] = 1,
        ["Transmission"] = 2,
        ["XenonHeadlightsColor"] = 5,
    },
    ["S+"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 4,
        ["Brakes"] = 2,
        ["Transmission"] = 3,
        ["XenonHeadlightsColor"] = 8,
    },
    --[[["X"] = {
        ["Turbo"] = true,
        ["XenonHeadlights"] = true,
        ["Engine"] = 4,
        ["Brakes"] = 3,
        ["Transmission"] = 4,
        ["XenonHeadlightsColor"] = 9,
    }]]
}

-- To add more cars just copy an existing one and adjust the values correspondingly (don't forget to change the model name aswell, e.g. police3) 
-- You can remove or add any value that is a float, integer or vector3 (for available values check handling.meta) but make sure to do so for every mode / class of that vehicle, otherwise the value won't be reset
Config.VehiclesConfig = {
    ["npolvic"] = {
        ["A"] = {
            ["fDriveInertia"] = 0.5,
            ["fBrakeForce"] = 1.5,
            ["fInitialDriveMaxFlatVel"] = 100.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.35
        },
        ["A+"] = {
            ["fDriveInertia"] = 0.6,
            ["fBrakeForce"] = 1.8,
            ["fInitialDriveMaxFlatVel"] = 105.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.4
        },
        ["S"] = {
            ["fDriveInertia"] = 0.7,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 110.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.45
        },
        ["S+"] = {
            ["fDriveInertia"] = 0.8,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 115.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.5
        },
        --[[["X"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 180.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.39
        }]]
    },
   
    ["npolchar"] = {
        ["A"] = {
            ["fDriveInertia"] = 0.80,
            ["fBrakeForce"] = 1.2,
            ["fInitialDriveMaxFlatVel"] = 100.0,
            ["fSteeringLock"] = 40.0,
            ["fInitialDriveForce"] = 0.35
        },
        ["A+"] = {
            ["fDriveInertia"] = 0.9,
            ["fBrakeForce"] = 1.5,
            ["fInitialDriveMaxFlatVel"] = 105.00,
            ["fSteeringLock"] = 40.0,
            ["fInitialDriveForce"] = 0.4
        },
        ["S"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 1.8,
            ["fInitialDriveMaxFlatVel"] = 110.0,
            ["fSteeringLock"] = 40.0,
            ["fInitialDriveForce"] = 0.45
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.10,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 115.0,
            ["fSteeringLock"] = 40.0,
            ["fInitialDriveForce"] = 0.5
        },
       --[[] ["X"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 150.0,
            ["fSteeringLock"] = 38.0,
            ["fInitialDriveForce"] = 0.70
        }]]
    },
    ["npolexp"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 1.2,
            ["fInitialDriveMaxFlatVel"] = 115.000000,
            ["fSteeringLock"] = 35.0,
            ["fInitialDriveForce"] = 0.33
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.300000,
            ["fBrakeForce"] = 1.5,
            ["fInitialDriveMaxFlatVel"] = 120.000000,
            ["fSteeringLock"] = 35.0,
            ["fInitialDriveForce"] = 0.35
        },
        ["S"] = {
            ["fDriveInertia"] = 2.5000,
            ["fBrakeForce"] = 1.8,
            ["fInitialDriveMaxFlatVel"] = 130.000000,
            ["fSteeringLock"] = 35.0,
            ["fInitialDriveForce"] = 0.415
        },
        ["S+"] = {
            ["fDriveInertia"] = 3.1500,
            ["fBrakeForce"] = 1.8,
            ["fInitialDriveMaxFlatVel"] = 135.000000,
            ["fSteeringLock"] = 35.0,
            ["fInitialDriveForce"] = 0.48
        },
        --[[["X"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 150.0,
            ["fSteeringLock"] = 35.0,
            ["fInitialDriveForce"] = 0.6
        }]]
    },
    ["npolchal"] = {
        ["A"] = {
            ["fDriveInertia"] = 0.2,
            ["fBrakeForce"] = 1.0,
            ["fInitialDriveMaxFlatVel"] = 85.000000,
            ["fSteeringLock"] = 30.0,
            ["fInitialDriveForce"] = 0.165
        },
        ["A+"] = {
            ["fDriveInertia"] = 0.4,
            ["fBrakeForce"] = 1.2,
            ["fInitialDriveMaxFlatVel"] = 90.000000,
            ["fSteeringLock"] = 30.0,
            ["fInitialDriveForce"] = 0.18
        },
        ["S"] = {
            ["fDriveInertia"] = 0.4000,
            ["fBrakeForce"] = 1.3,
            ["fInitialDriveMaxFlatVel"] = 95.000000,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.19
        },
        ["S+"] = {
            ["fDriveInertia"] = 0.4,
            ["fBrakeForce"] = 1.5,
            ["fInitialDriveMaxFlatVel"] = 105.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.23
        },
        --[[["X"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 170.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.39
        }]]
    },
    ["npolvette"] = {
        ["A"] = {
            ["fDriveInertia"] = 0.8,
            ["fBrakeForce"] = 1.0,
            ["fInitialDriveMaxFlatVel"] = 110.000000,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.28
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 1.2,
            ["fInitialDriveMaxFlatVel"] = 125.000000,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.28
        },
        ["S"] = {
            ["fDriveInertia"] = 1.0000,
            ["fBrakeForce"] = 1.0,
            ["fInitialDriveMaxFlatVel"] = 130.000000,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce25"] = 0.29
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 1.0,
            ["fInitialDriveMaxFlatVel"] = 135.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.29
        },
        --[[["X"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 1.0,
            ["fInitialDriveMaxFlatVel"] = 140.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.39
        }]]
    },
    ["npolmm"] = {
        ["A"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 30.300000,
            ["fInitialDriveForce"] = 0.4
        },
        ["A+"] = {
            ["fDriveInertia"] = 1.000000,
            ["fBrakeForce"] = 2.0,
            ["fInitialDriveMaxFlatVel"] = 160.000000,
            ["fSteeringLock"] = 30.300000,
            ["fInitialDriveForce"] = 0.5
        },
        ["S"] = {
            ["fDriveInertia"] = 1.100000,
            ["fBrakeForce"] = 2.5,
            ["fInitialDriveMaxFlatVel"] = 170.000000,
            ["fSteeringLock"] = 30.200000,
            ["fInitialDriveForce"] = 0.6
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 3.0,
            ["fInitialDriveMaxFlatVel"] = 180.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.7
        },
       --[[ ["X"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 3.0,
            ["fInitialDriveMaxFlatVel"] = 180.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.8
        }]]
    },
    ["npolstang"] = {
        ["A"] = {
            ["fDriveInertia"] = 0.7,
            ["fBrakeForce"] = 1.0,
            ["fInitialDriveMaxFlatVel"] = 120.000000,
            ["fSteeringLock"] = 30.0,
            ["fInitialDriveForce"] = 0.235
        },
        ["A+"] = {
            ["fDriveInertia"] = 0.760000,
            ["fBrakeForce"] = 1.2,
            ["fInitialDriveMaxFlatVel"] = 125.000000,
            ["fSteeringLock"] = 30.0,
            ["fInitialDriveForce"] = 0.24
        },
        ["S"] = {
            ["fDriveInertia"] = 0.9,
            ["fBrakeForce"] = 1.3,
            ["fInitialDriveMaxFlatVel"] = 125.000000,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.25
        },
        ["S+"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 1.5,
            ["fInitialDriveMaxFlatVel"] = 140.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.27
        },
        --[[["X"] = {
            ["fDriveInertia"] = 1.0,
            ["fBrakeForce"] = 1.5,
            ["fInitialDriveMaxFlatVel"] = 155.0,
            ["fSteeringLock"] = 25.0,
            ["fInitialDriveForce"] = 0.4
        }]]
    },
    ["17raptorpd"] = {
        ["A"] = {
            ["fDriveInertia"] = 0.3300000,
            ["fBrakeForce"] = 0.3,
            ["fInitialDriveMaxFlatVel"] = 130.000000,
            ["fSteeringLock"] = 36.000000,
            ["fInitialDriveForce"] = 0.35
        },
        ["A+"] = {
            ["fDriveInertia"] = 0.4300000,
            ["fBrakeForce"] = 0.5,
            ["fInitialDriveMaxFlatVel"] = 140.000000,
            ["fSteeringLock"] = 36.000000,
            ["fInitialDriveForce"] = 0.45
        },
        ["S"] = {
            ["fDriveInertia"] = 0.5300000,
            ["fBrakeForce"] = 0.9,
            ["fInitialDriveMaxFlatVel"] = 150.000000,
            ["fSteeringLock"] = 36.000000,
            ["fInitialDriveForce"] = 0.55
        },
        ["S+"] = {
            ["fDriveInertia"] = 0.6300000,
            ["fBrakeForce"] = 1.2,
            ["fInitialDriveMaxFlatVel"] = 160.0,
            ["fSteeringLock"] = 36.000000,
            ["fInitialDriveForce"] = 0.65
        },
       --[[ ["X"] = {
            ["fDriveInertia"] = 1.2,
            ["fBrakeForce"] = 3.0,
            ["fInitialDriveMaxFlatVel"] = 180.0,
            ["fSteeringLock"] = 30.3,
            ["fInitialDriveForce"] = 0.8
        }]]
    },
}

Config.UseGeneralVehicleConfig = false -- change this if you want every EMERGENCY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
Config.EmergencyVehiclesOnly = true -- change this if you want EVERY vehicle to be able to change modes (still restricted by Configs.AuthorizedJobs)
Config.GeneralVehicleConfig = {
    ["A"] = {
        ["fDriveInertia"] = 1.000000,
        ["fBrakeForce"] = 2.0,
        ["fInitialDriveMaxFlatVel"] = 160.000000,
        ["fSteeringLock"] = 43.300000,
        ["fInitialDriveForce"] = 0.3
    },
    ["A+"] = {
        ["fDriveInertia"] = 1.100000,
        ["fBrakeForce"] = 2.5,
        ["fInitialDriveMaxFlatVel"] = 170.000000,
        ["fSteeringLock"] = 44.200000,
        ["fInitialDriveForce"] = 0.35
    },
    ["S"] = {
        ["fDriveInertia"] = 1.2,
        ["fBrakeForce"] = 3.0,
        ["fInitialDriveMaxFlatVel"] = 180.0,
        ["fSteeringLock"] = 45.3,
        ["fInitialDriveForce"] = 0.4
    },
    ["S+"] = {
        ["fDriveInertia"] = 1.3,
        ["fBrakeForce"] = 3.5,
        ["fInitialDriveMaxFlatVel"] = 190.0,
        ["fSteeringLock"] = 46.3,
        ["fInitialDriveForce"] = 0.45
    },
   --[[ ["X"] = {
        ["fDriveInertia"] = 1.3,
        ["fBrakeForce"] = 3.5,
        ["fInitialDriveMaxFlatVel"] = 200.0,
        ["fSteeringLock"] = 46.3,
        ["fInitialDriveForce"] = 0.45
    }]]
}

