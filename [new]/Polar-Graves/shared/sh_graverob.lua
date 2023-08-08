Config = {} or Config



-- [[ Grave Reset Timer ]] --
Config.GraveTimer = 300000 -- Default: 300000 = 5 Minutes

-- [[ Rewards ]] --
Config.GraveSpecialChance = 75
Config.GraveChanceItem = "weapon_pistol"
Config.GraveRewardChance = 20
Config.GraveRewards ={
    [1] = {
        ["item"] = "rolex",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [2] = {
        ["item"] = "diamond_ring",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [3] = {
        ["item"] = "goldchain",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [4] = {
        ["item"] = "10kgoldchain",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },
    },
    [5] = {
        ["item"] = "goldbar",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },  
    },
    [6] = {
        ["item"] = "grub",
        ["amount"] = {
            ["min"] = 1,
            ["max"] = 4
        },  
    }, 
}

-- [[ Graves / Reset ]] --
Config.Graves = {
    [1] = {
        ["GraveName"] = "Xirvin",
        ["Coords"] = vector3(-1752.37, -205.8, 56.79),
        ["Looted"] = false, -- Don't change this.
    },
    [2] = {
        ["GraveName"] = "Serena",
        ["Coords"] = vector3(-1729.41, -286.5, 49.83),
        ["Looted"] = false, -- Don't change this.
    },
    [3] = {
        ["GraveName"] = "Scarlett",
        ["Coords"] = vector3(-1730.1, -282.35, 50.01),
        ["Looted"] = false, -- Don't change this.
    },
    [4] = {
        ["GraveName"] = "Jennifer",
        ["Coords"] = vector3(-1745.68, -210.81, 56.81),
        ["Looted"] = false, -- Don't change this.
    },
    [5] = {
        ["GraveName"] = "Rick",
        ["Coords"] = vector3(-1754.84, -218.82, 55.06),
        ["Looted"] = false, -- Don't change this.
    },
    [6] = {
        ["GraveName"] = "Sandra",
        ["Coords"] = vector3(-1761.93, -204.7, 55.81),
        ["Looted"] = false, -- Don't change this.
    },
    [7] = {
        ["GraveName"] = "Peter",
        ["Coords"] = vector3(-1752.89, -219.91, 55.08),
        ["Looted"] = false, -- Don't change this.
    },
    [8] = {
        ["GraveName"] = "Monica",
        ["Coords"] = vector3(-1752.42, -213.23, 56.1),
        ["Looted"] = false, -- Don't change this.
    },
    [9] = {
        ["GraveName"] = "Ted",
        ["Coords"] = vector3(-1746.37, -216.41, 55.93),
        ["Looted"] = false, -- Don't change this.
    },
}

-- [[ Functions ]] --
function GravepoliceAlert(loc)
    exports["qb-dispatch"]:CustomAlert({
        coords = vector3(loc.x, loc.y, loc.z), message = "Suspicious Activity",
        dispatchCode = "10-16", description = "", radius = 10,
        sprite = 58,  color = 46, scale = 1.0,  length = 1,
    })         
end

function Notify(text, type, time)
    QBCore.Functions.Notify(text, type, time)
end