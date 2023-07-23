Config = {} or Config

Config.Framework = 'qb'
if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end

Config.Debug = true

Config.OxTarget = false

Config.Atms = { 'prop_atm_01', 'prop_atm_02', 'prop_atm_03', 'prop_fleeca_atm' }
Config.Distance = 1.5

Config.CooldownTime = 5

Config.CallBack =  QBCore.Functions.CreateCallback -- ESX.RegisterServerCallback
Config.TrigCallBack = QBCore.Functions.TriggerCallback -- ESX.TriggerServerCallback

Config.BagUseID = 93 -- Which ID is the bag that a player gets after doing an animation? (Should use a black one so it looks close to the animation)
Config.HideBagID = 0 -- Which Bag ID is hiding the bag? This is used to not mess up the animations

Config.MinimumPolice = 0


Config.Icon = 'fa-solid fa-bolt'
Config.Label = 'Tamper'

Config.TamperItem = 'screwdriverset'
Config.ItemRob = 'advancedlockpick'
Config.HackItem = 'pistol_ammo'
Config.CardSwipeItem = 'weapon_pistol'



local English = {
    ['cooldown'] = 'You Cannot Do This Right Now..',
    ['norobitem'] = 'You dont have any robbing items',
    ['notamperitem'] = 'You Dont have a Tamper Item',
    ['nopolice'] = 'There are not enough Police',
    ['Canceled'] = 'You Canceled',
}
local French = {
    ['cooldown'] = 'You Cannot Do This Right Now..',
    ['norobitem'] = 'You dont have any robbing items',
    ['notamperitem'] = 'You Dont have a Tamper Item',
    ['nopolice'] = 'There are not enough Police',
    ['Canceled'] = 'You Canceled',
}

function text(entry)
	return English[entry] -- change to your language
end







Config.HackName = 'Polar-UI'

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
    

-- VAR MINIGAME
Config.VarRandomBlocksMin = 4
Config.VarRandomBlocksMax = 6
Config.VarRandomSecondsMin = 6
Config.VarRandomSecondsMax = 8

-- THERMITE MINIGAME
Config.ThermiteTimeMin = 5
Config.ThermiteTimeMax = 10

Config.ThermiteGridsizeMin = 5
Config.ThermiteGridsizeMax = 6

Config.ThermiteIncorrectMin = 2
Config.ThermiteIncorrectMax = 3


function alertpolice()

    exports['qb-dispatch']:SuspiciousActivity()

end