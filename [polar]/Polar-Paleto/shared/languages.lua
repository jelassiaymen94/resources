local English = {
    ['cooldown'] = 'You Cannot Thermite Right Now..',
    ['sometingelse'] = 'Someone is Doing This',
    ['thermitefail'] = 'You Failed',
    ['vaultopen'] = 'Vault Unlocked',
    ['nopolice'] = 'There are not enough Police',
    ['doorunlock'] = 'Door Unlocked!',

}
local French = {
    ['cooldown'] = 'You Cannot Thermite Right Now..',
    ['sometingelse'] = 'Someone is Doing This',
    ['thermitefail'] = 'You Failed',
    ['vaultopen'] = 'Vault Unlocked',
    ['nopolice'] = 'There are not enough Police',
    ['doorunlock'] = 'Door Unlocked!',

}







-- text('nopolice')
function text(entry)
    if Config.Language == 'English' then
	return English[entry] -- change to your language
    elseif Config.Language == 'French' then
    return French[entry] -- change to your language

    end
end