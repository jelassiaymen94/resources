Config = Config or {}

Config.Timeout = 60 * (60 * 1000)
Config.DoorLock = 'qb' -- use 'qb' for qb-doorlock events
Config.DoorId = 'jewelery' -- name of the door in your doorlock config
Config.RequiredCops = 2
Config.JewelleryLocation = {
    ["coords"] = vector3(-630.5, -237.13, 38.08),
}

Config.WhitelistedWeapons = {
    [`weapon_assaultrifle`] = {
        ["timeOut"] = 10000
    },
    [`weapon_assaultrifle2`] = {
       ["timeOut"] = 10000
    },
    [`weapon_uzi`] = {
       ["timeOut"] = 15000
    },
    [`weapon_mac10`] = {
       ["timeOut"] = 15000
    },
    [`weapon_sledgehammer`] = {
       ["timeOut"] = 20000
    },
    [`weapon_crowbar`] = {
       ["timeOut"] = 20000
    },
    [`weapon_m4`] = {
       ["timeOut"] = 12500
    },
    [`weapon_gusenberg`] = {
        ["timeOut"] = 15000
     },
    
}
Config.SpecialRewards = {

    [1] = {
        ["item"] = "sapphire",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 1
        },
    },
    [2] = {
        ["item"] = "bluediamond",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 1
        },
    },
    [3] = {
        ["item"] = "ruby",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 1
        },
    },
    [4] = {
        ["item"] = "diamond",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 1
        },
    },
    [5] = {
        ["item"] = "yellow-diamond",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 1
        },
    },
}
Config.VitrineRewards = {
    [1] = {
        ["item"] = "diamond_necklace_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [2] = {
        ["item"] = "sapphire_necklace",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [3] = {
        ["item"] = "ruby_necklace",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [4] = {
        ["item"] = "diamondring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [5] = {
        ["item"] = "diamondnecklace",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [6] = {
        ["item"] = "diamond_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [7] = {
        ["item"] = "emerald_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [8] = {
        ["item"] = "ruby_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [9] = {
        ["item"] = "sapphire_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [10] = {
        ["item"] = "diamond_ring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [11] = {
        ["item"] = "emerald_ring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [12] = {
        ["item"] = "ruby_ring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [13] = {
        ["item"] = "sapphire_ring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [14] = {
        ["item"] = "diamond_necklace",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [15] = {
        ["item"] = "emerald_necklace",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    
    [16] = {
        ["item"] = "silverearring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [17] = {
        ["item"] = "silverchain",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [18] = {
        ["item"] = "silver_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [19] = {
        ["item"] = "goldearring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [20] = {
        ["item"] = "goldchain",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [21] = {
        ["item"] = "gold_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [22] = {
        ["item"] = "sapphire_earring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [23] = {
        ["item"] = "ruby_earring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [24] = {
        ["item"] = "emerald_earring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [25] = {
        ["item"] = "diamond_earring_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [26] = {
        ["item"] = "sapphire_earring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [27] = {
        ["item"] = "ruby_earring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [28] = {
        ["item"] = "emerald_earring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [29] = {
        ["item"] = "diamond_earring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [30] = {
        ["item"] = "sapphire_necklace_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [31] = {
        ["item"] = "ruby_necklace_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    [32] = {
        ["item"] = "emerald_necklace_silver",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 2
        },
    },
    
}

Config.Locations = {
    [1] = {
        ["coords"] = vector4(-626.06, -234.19, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [2] = {
        ["coords"] = vector4(-626.58, -233.47, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [3] = {
        ["coords"] = vector4(-625.4, -238.3, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [4] = {
        ["coords"] = vector4(-626.46, -239.02, 39.24, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [5] = {
        ["coords"] = vector4(-627.59, -234.26, 38.97, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [6] = {
        ["coords"] = vector4(-627.13, -234.79, 38.86, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [7] = {
        ["coords"] = vector4(-624.25, -226.71, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [8] = {
        ["coords"] = vector4(-625.2, -227.32, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [9] = {
        ["coords"] = vector4(-623.72, -228.68, 39.24, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [10] = {
        ["coords"] = vector4(-623.96, -230.76, 39.22, 127.04),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [11] = {
        ["coords"] = vector4(-621.4, -228.77, 39.22, 127.04),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [12] = {
        ["coords"] = vector4(-619.25, -227.31, 39.24, 310.89),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [13] = {
        ["coords"] = vector4(-620.02, -226.36, 39.22, 304),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [14] = {
        ["coords"] = vector4(-617.86, -229.26, 39.22, 127.04),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }, 
    [15] = {
        ["coords"] = vector4(-617.14, -230.28, 39.24, 127.04),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [16] = {
        ["coords"] = vector4(-620.09, -230.63, 39.22, 127.04),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [17] = {
        ["coords"] = vector4(-620.46, -232.87, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [18] = {
        ["coords"] = vector4(-622.62, -232.63, 39.22, 127.04),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [19] = {
        ["coords"] = vector4(-618.9, -234.17, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false, 
    },
    [20] = {
        ["coords"] = vector4(-619.93, -234.85, 39.22, 216.17),
        ["isOpened"] = false,
        ["isBusy"] = false,
    }
}

Config.MaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,
}

Config.FemaleNoHandshoes = {
    [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,
}
