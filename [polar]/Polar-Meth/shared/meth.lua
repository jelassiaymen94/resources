Config = {} or Config

-- Core Values----------------------------------------------------------------
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'qb-inventory'
Config.Skillbar = 'qb-skillbar'
----------------------------------------------------------------

Config.UnlockTime = 60 -- amount of seconds before the door locks

-- Debug
Config.Debug = true -- debug for checks

local TIME = math.random(4000,5000)
Config.Time = TIME -- time to wait between %s
----------------------------------------------------------------




-- COOLDOWNS
--local COOLDOWN = math.random(10.15)
--Config.PlayerCooldown = COOLDOWN -- measured in minutes

----------------------------------------------------------------




-- ITEMS
Config.Methitem = 'meth'

Config.Ing1 = 'purifiedwater'
Config.Ing1Amount = 1

Config.Ing2 = 'hydrochloric_acid'
Config.Ing2Amount = 1

Config.Ing3 = 'sodium_hydroxide'
Config.Ing3Amount = 1

Config.Ing4 = 'methylamine'
Config.Ing4Amount = 1

Config.TrayItem = 'methtray'
Config.TrayItemAmount = 1

Config.BreakItem = 'weapon_hammer'
Config.BreakItemAmount = 1

Config.BagItem = 'drugbag'
Config.BagItemAmount = 1
----------------------------------------------------------------




-- PS Buffs 
Config.Buffs = true
Config.LuckBuff = "luck"
----------------------------------------------------------------






--- METH LAB 
Config.UseLab = true -- enables enter and exit targets

Config.LabKeyCard = 'methkey'

Config.LabLocation = vector3(1384.2406, 4305.5506, 36.6780) -- location where third eye is
Config.InsideLabLocation = vector3(969.05, -146.15, -46.0)-- location where third eye is

Config.SceneTime = 39800
Config.UseScene = true
Config.UseCam = true

-- inside meth lab interior
Config.ILabCord = vector3(969.54, -147.1, -46.4)
Config.ILabHead = 273.27

Config.CookZone = vector3(978.2, -146.8, -48.53)
Config.PackageZone = vector3(988.98, -141.34, -48.95)

-- when exiting your location, should be near Config.LabLocation
Config.InsideLabCord = vector3(1383.3054, 4305.7793, 36.6741)
Config.InsideLabHead = 27.85
----------------------------------------------------------------






-- SCRAMBLER MINIGAME
Config.RandomScrambler2 = {
    
    'alphabet',
    'numeric',
    'alphanumeric',
    'greek',
    'braille',
    'runes',

} 
Config.ScramblerMirrorMin2 = 0
Config.ScramblerMirrorMax2 = 2
Config.ScramblerSecondMin2 = 20
Config.ScramblerSecondMax2 = 30
----------------------------------------------------------------