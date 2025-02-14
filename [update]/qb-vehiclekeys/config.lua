Config = {}

-- NPC Vehicle Lock States
Config.LockNPCDrivingCars = true -- Lock state for NPC cars being driven by NPCs [true = locked, false = unlocked]
Config.LockNPCParkedCars = true -- Lock state for NPC parked cars [true = locked, false = unlocked]
local QBCore = exports['qb-core']:GetCoreObject()
-- Lockpick Settings
local polar = {
    "numeric",
    "alphabet",
    "alphanumeric",
    "greek",
    "braille",
    "runes"
}
Config.RemoveLockpickNormal = 0.1 -- Chance to remove lockpick on fail
Config.RemoveLockpickAdvanced = 0.02 -- Chance to remove advanced lockpick on fail
Config.LockPickDoorEvent = function(type) -- This function is called when a player attempts to lock pick a vehicle


    if type == 'special' then
        loadAnimDict("veh@break_in@0h@p_m_one@")
        TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)

        exports['Polar-UI']:Scrambler(function(success)
            if success then
                LockpickFinishCallback(success, type)
            else
                TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
                TriggerEvent("QBCore:Notify", "You failed to lockpick.", "error")
            end
        end, polar[math.random(1,#polar)], 20, 0)


    elseif type == 'advanced' then

        loadAnimDict("veh@break_in@0h@p_m_one@")
        TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)

    exports['Polar-UI']:Circle(function(success)
        if success then
            LockpickFinishCallback(success, type)
        else

           
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            TriggerEvent("QBCore:Notify", "You failed to lockpick.", "error")
        end
    end, 5, 40) -- NumberOfCircles, MS

    
    else

        loadAnimDict("veh@break_in@0h@p_m_one@")
        TaskPlayAnim(PlayerPedId(), "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 3.0, 3.0, -1, 16, 0, 0, 0, 0)

    exports['Polar-UI']:Circle(function(success)
        if success then
            LockpickFinishCallback(success, type)
        else

           
            TriggerServerEvent('hud:server:GainStress', math.random(1, 4))
            TriggerEvent("QBCore:Notify", "You failed to lockpick.", "error")
        end
    end, 5, 40) -- NumberOfCircles, MS

    end
end

-- Carjack Settings
Config.CarJackEnable = true -- True allows for the ability to car jack peds.
Config.CarjackingTime = 7500 -- How long it takes to carjack
Config.DelayBetweenCarjackings = 7000 -- Time before you can carjack again
Config.CarjackChance = {
    ['2685387236'] = 0.0, -- melee
    ['416676503'] = 0.5, -- handguns
    ['-957766203'] = 0.5, -- SMG
    ['860033945'] = 0.5, -- shotgun
    ['970310034'] = 0.5, -- assault
    ['1159398588'] = 0.5, -- LMG
    ['3082541095'] = 0.5, -- sniper
    ['2725924767'] = 0.5, -- heavy
    ['1548507267'] = 0.0, -- throwable
    ['4257178988'] = 0.0, -- misc
}

-- Hotwire Settings
Config.HotwireChance = 0.8 -- Chance for successful hotwire or not
Config.TimeBetweenHotwires = 5000 -- Time in ms between hotwire attempts
Config.minHotwireTime = 15000 -- Minimum hotwire time in ms
Config.maxHotwireTime = 30000 --  Maximum hotwire time in ms

-- Police Alert Settings
Config.AlertCooldown = 10000 -- 10 seconds
Config.PoliceAlertChance = 0.75 -- Chance of alerting police during the day
Config.PoliceNightAlertChance = 0.50 -- Chance of alerting police at night (times:01-06)

-- Job Settings
Config.SharedKeys = { -- Share keys amongst employees. Employees can lock/unlock any job-listed vehicle
    ['police'] = { -- Job name
        requireOnduty = true,
        vehicles = {
	    'npolchar', -- Vehicle model
	    'npolexp', -- Vehicle model
        'npolmm', -- Vehicle model
        'npolvic', -- Vehicle model
        'npolvette', -- Vehicle model
        'npolstang', -- Vehicle model
        'polas350', -- Vehicle model
	}
    },

    ['tuner'] = {
        requireOnduty = false,
        vehicles = {
            'towtruck',
	}
    }
}

-- These vehicles cannot be jacked
Config.ImmuneVehicles = {
    'stockade'
}

-- These vehicles will never lock
Config.NoLockVehicles = {}

-- These weapons cannot be used for carjacking
Config.NoCarjackWeapons = {
    "WEAPON_UNARMED",
    "WEAPON_Knife",
    "WEAPON_Nightstick",
    "WEAPON_HAMMER",
    "WEAPON_Bat",
    "WEAPON_Crowbar",
    "WEAPON_Golfclub",
    "WEAPON_Bottle",
    "WEAPON_Dagger",
    "WEAPON_Hatchet",
    "WEAPON_KnuckleDuster",
    "WEAPON_Machete",
    "WEAPON_Flashlight",
    "WEAPON_SwitchBlade",
    "WEAPON_Poolcue",
    "WEAPON_Wrench",
    "WEAPON_Battleaxe",
    "WEAPON_Grenade",
    "WEAPON_StickyBomb",
    "WEAPON_ProximityMine",
    "WEAPON_BZGas",
    "WEAPON_Molotov",
    "WEAPON_FireExtinguisher",
    "WEAPON_PetrolCan",
    "WEAPON_Flare",
    "WEAPON_Ball",
    "WEAPON_Snowball",
    "WEAPON_SmokeGrenade",
    "weapon_m67",
    "weapon_sword",
}
