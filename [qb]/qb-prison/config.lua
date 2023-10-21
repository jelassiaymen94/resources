Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

local isServer = IsDuplicityVersion()
if not isServer then
    --- This function will be triggered once the hack is done
    --- @param success boolean
    --- @param currentGate number
    --- @param gateData table
    --- @return nil
    function Config.OnHackDone(success, currentGate, gateData)
        if success then
            TriggerServerEvent("prison:server:SetGateHit", currentGate)
            TriggerServerEvent('qb-doorlock:server:updateState', gateData.gatekey, false, false, false, true)
        else
            TriggerServerEvent("prison:server:SecurityLockdown")
        end
        TriggerEvent('mhacking:hide')
    end
end

Config.Jobs = {
    ["electrician"] = "Electrician"
}

Config.Uniforms ={
    ['male'] = {
        outfitData ={
            ['t-shirt'] = {item = 15, texture = 0},
            ['torso2'] = {item = 15, texture = 0},
			['arms'] = {item = 15, texture = 0},
			['pants'] = {item = 21, texture = 0},
			['shoes'] = {item = 5, texture = 0},
        }
    },
    ['female'] = {
        outfitData ={
            ['t-shirt'] = {item = 6, texture = 0},
			['torso2'] = {item = 17, texture = 0},
			['arms'] = {item = 7, texture = 0},
			['pants'] = {item = 2, texture = 1},
			['shoes'] = {item = 16, texture = 0},
        }
    },
}

Config.Locations = {
    jobs = {
        ["electrician"] = {
            [1] = {
                coords = vector4(1700.82, 2474.19, 44.52, 225),
            },
            [2] = {
                coords = vector4(1695.18, 2471.18, 44.48, 95),
            },
            [3] = {
                coords = vector4(1690.35, 2471.18, 44.48, 95),
            },
            [4] = {
                coords = vector4(1665.43, 2487.56, 44.46, 90), -- 1665.43, 2487.56, 44.46
            },
            [5] = {
                coords = vector4(1764.58, 2528.8, 44.37, 125.0),
            },
            [6] = {
                coords = vector4(1631.04, 2526.7, 44.55, 52.06),
            },
            [7] = {
                coords = vector4(1632.95, 2529.0, 44.56, 229.87),
            }
        }
    },
    ["freedom"] = {
        coords = vector4(1837.83, 2592.97, 45.01, 43.41)
    },
    ["outside"] = {
        coords = vector4(1848.13, 2586.05, 44.67, 269.5)
    },
    ["yard"] = {
        coords = vector4(1765.67, 2565.91, 44.56, 1.5)
    },
    ["middle"] = {
        coords = vector4(1693.33, 2569.51, 44.55, 123.5)
    },
    ["shop"] = {
        coords = vector4(1779.39, 2561.17, 44.67, 177.05)
    },
    spawns = {
        [1] = {
            animation = "bumsleep",
            coords = vector4(1661.046, 2524.681, 45.564, 260.545)
        },
        [2] = {
            animation = "lean",
            coords = vector4(1650.812, 2540.582, 45.564, 230.436)
        },
        [3] = {
            animation = "lean",
            coords = vector4(1654.959, 2545.535, 45.564, 230.436)
        },
        [4] = {
            animation = "lean",
            coords = vector4(1697.106, 2525.558, 45.564, 187.208)
        },
        [5] = {
            animation = "sitchair4",
            coords = vector4(1673.084, 2519.823, 45.564, 229.542)
        },
        [6] = {
            animation = "sitchair",
            coords = vector4(1666.029, 2511.367, 45.564, 233.888)
        },
        [7] = {
            animation = "sitchair4",
            coords = vector4(1691.229, 2509.635, 45.564, 52.432)
        },
        [8] = {
            animation = "finger2",
            coords = vector4(1770.59, 2536.064, 45.564, 258.113)
        },
        [9] = {
            animation = "smoke",
            coords = vector4(1792.45, 2584.37, 45.56, 276.24)
        },
        [10] = {
            animation = "smoke",
            coords = vector4(1768.33, 2566.08, 45.56, 176.83)
        },
        [11] = {
            animation = "smoke",
            coords = vector4(1696.09, 2469.4, 45.56, 1.4)
        }
    }
}

Config.CanteenItems = {
    [1] = {
        name = "sandwich",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 1
    },
    [2] = {
        name = "water_bottle",
        price = 4,
        amount = 50,
        info = {},
        type = "item",
        slot = 2
    }
}
