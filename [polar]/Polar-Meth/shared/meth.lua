Config = {} or Config



-- Debug
Config.Debug = false -- debug for checks


-- ITEMS ----==============================================================
Config.MethItem = 'meth'
-- it takes a multiplier of 1-4 based on how good you do on minigames and multiplies it by math.random(Config.MultiplierMin, Config.MultiplierMax)
Config.MultiplierMin = 2
Config.MultiplierMax = 4

Config.Ing1 = 'purifiedwater' 
Config.Ing2 = 'hydrochloric_acid'
Config.Ing3 = 'sodium_hydroxide'
Config.Ing4 = 'methylamine'

Config.TrayItem = 'methtray'
Config.BreakItem = 'weapon_hammer' -- item needed to break the tray down to shards
Config.BagItem = 'drugbag'
Config.MethShardItem = 'methshard' -- item needed to bag into meth
--====================================================================================




Config.SceneTime = 39800
Config.UseCam = false -- use the cam in the corner? can cause weird f8 issues but nothing crazy



Config.LabKeyCard = 'methkey'

-- inside meth lab interior locations
Config.ExitLabThirdEye = vector3(969.05, -146.15, -46.0)
Config.ILabCord = vector3(969.54, -147.1, -46.4)
Config.ILabHead = 273.27


-- Location of Third eye and exit location of teleporting
Config.EnterLabThirdEye = vector3(1384.2406, 4305.5506, 36.6780)

----------------------------------------------------------------




Config.Framework = 'qb'
Config.Target = 'qb' -- or 'ox'
Config.Inventory = 'qb' -- or 'ox'

Config.CooldownTime = 5 -- minutes between batches (Server side)

Config.MixLocation = vector3(978.21, -147.2, -48.53)
Config.CookZone = vector3(978.2, -146.8, -48.53) -- dont touch if you don't know

Config.TempLocation = vector3(982.97, -145.95, -48.7)

Config.TrayLocation = vector3(984.7, -140.94, -49.2)
Config.TrayTime = 5000

Config.BagLocation = vector3(988.92, -140.77, -49.2)
Config.PackageZone = vector3(988.98, -141.34, -48.95) -- dont touch if you don't know


Config.Labs = {
    ["first"] = {
        InsideLabCord = vector3(1383.3054, 4305.7793, 36.6741),
        InsideLabHead = 27.85,
    }

}

------ CALLBACKS -----------
if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end
Config.TriggerCallBack = QBCore.Functions.TriggerCallback -- ESX.TriggerServerCallback
Config.CreateCallBack = QBCore.Functions.CreateCallback -- ESX.RegisterServerCallback
--============================--

local English = {
    ['cooldown'] = 'Wait for the room to cool',
    ['busy'] = 'Someone is Doing This',
    ['tray'] = 'Smash the Tray',
    ['bag'] = 'Bag the Shards',
    ['ingredients'] = 'You dont got the right shit',
    ['mixerstart'] = 'Mixer Started',
    ['tempokay'] = 'Temp is Okay',
    ['tempgood'] = 'Temp is Good',
    ['tempgreat'] = 'Temp is Great',
  
}
local French = {
 
  
}


function text(entry)
	return English[entry] -- change to your language
   -- return French[entry]

    
end












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






