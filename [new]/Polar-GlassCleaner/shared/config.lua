Config = {} or Config


Config.OxTarget = false






Config.JobTime = 15 -- minutes / cooldown on per job














--============== BLIPS -=============
Config.BlipName = "Location" -- blip name
Config.BlipSprite = 682 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.BlipColor = 40  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip





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