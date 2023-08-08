Config = {} or Config
local QBCore = exports['qb-core']:GetCoreObject()


Config.Target = "qb-target"


Config.CrackIcon = "fas fa-recycle"



Config.CallBack =  QBCore.Functions.CreateCallback -- ESX.RegisterServerCallback
Config.TrigCallBack = QBCore.Functions.TriggerCallback -- ESX.TriggerServerCallback


Config.TextCrack = "Crack ATM"


Config.Text = "Press E to attach atm | Press X to remove rope"


Config.CooldownTime = 1
Config.MinimumPolice = 2
Config.RopeItem = 'drill'



local English = {
    ['cooldown'] = 'You Cannot Do This Right Now..',
    ['norope'] = 'You dont have any rope',
    ['nopolice'] = 'There are not enough Police',
    
}
local French = {
    ['cooldown'] = 'You Cannot Do This Right Now..',
    ['norope'] = 'You dont have any rope',
    ['nopolice'] = 'There are not enough Police',

}

function text(entry)
	return English[entry] -- change to your language
end