Config = {} or Config

-- Core Values----
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'ps-inventory'
Config.Skillbar = 'qb-skillbar'
----------------------------------------------------------------

Config.UnlockTime = 60 -- amount of seconds before the door locks

-- Debug
Config.Debug = false -- debug for checks

------- CHECKS --------


-- ITEMS ----
Config.Ing1 = 'purifiedwater'
Config.Ing1Amount = 1

Config.Ing2 = 'bakingsoda'
Config.Ing2Amount = 1

Config.Ing3 = 'cokematerials'
Config.Ing3Amount = 1

Config.Ing4 = 'bigbrick'
Config.Ing4Amount = 1

Config.BreakItem = 'stolencard'
Config.BreakItemAmount = 1

Config.BagItem = 'drugbag'
Config.BagItemAmount = 1

Config.Can = 'jerry_can'
Config.CanAmount = 1

Config.CokeItem = 'cokebag'

Config.LeafItem = 'cocaleaf'
Config.LeafItemAmount = 50

Config.PreparedItem = 'bigbrick'
Config.PreparedItemAmount = 1

Config.PackageItem = 'cocabrick'
Config.PackageItemAmount = 1

Config.PackagedItem = 'cokepowder'
Config.PackagedItemAmount = 1

Config.Buffs = true -- NEEDS TO BE TRUE
Config.LuckBuff = 'luck'
----------------------------------------------------------------


----- PLANT -----
Config.UseCokePlant = true
Config.Spawn = vector3(2806.5, 4774.46, 46.98)
Config.Radius = 50.0
Config.ProgressBarLabel = "Collecting..."
Config.ProgressBartime = 10000
Config.ProgressBarScenario = 'world_human_gardener_plant'
Config.MinPlants = 15
----------------------------------------------------------------



Config.CooldownTime = 300000 -- 10 Mins


-- -39.1956
------ LAB STUFF ------
Config.UseLab = true
Config.Usekey = true
Config.LabKeyCard = 'cokekey'
Config.LabKeyCardAmount = 1

----------------------------------------------------------------


------ PROCESS -----

Config.SortUseScene = true
Config.SortUseCam = true
--Config.SortCamCoord = 1090.74, -3194.49, -38.99
Config.SortSceneTime = 20000
Config.SortHeading = 177.63
Config.SortZone = vector3(1092.9, -3194.9, -38.99)
Config.X = -1.91
Config.Y = -0.32
Config.Z = -0.60
----------------------------------------------------------------


------- PACKAGE ------

Config.PackageUseScene = true
Config.PackageUseCam = true 
--Config.PackageCamCoord = 1098.04, -3197.92, -39.20
Config.PackageSceneTime = 45000
Config.PackageZone = vector3(1101.245,-3198.82,-39.0)
Config.PackageHeading = 180.34
----------------------------------------------------------------


--------- SPAWN LOCATIONS ----
-- inside spawn
Config.ILabCord = vector3(1088.64, -3187.72, -9999938.99)
Config.ILabHead = 173.75

-- outside spawn
Config.InsideLabCord = vector3(387.46, 3584.63, -9999933.29)
Config.InsideLabHead = 351.85

Config.UseProps = true
Config.TableHeight = -39.1956
Config.Floor = -39.99
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