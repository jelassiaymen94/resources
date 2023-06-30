local English = {
    ['cooldown'] = 'You Cannot Thermite Right Now..',
    ['sometingelse'] = 'Someone is Doing This',
    ['thermitefail'] = 'You Failed',
    ['vaultopen'] = 'Vault Unlocked',
    ['nopolice'] = 'There are not enough Police',
    ['doorunlock'] = 'Door Unlocked!',
    ['nodrill'] = 'You dont have a Drill',
    ['nothermite'] = 'You dont have Thermite',
    ['nokeycard'] = 'You dont have a Keycard',
    ['nopcitem'] = 'You dont have a Hacking Device',
    ['novaultitem'] = 'You dont have a Blue Laptop',
    ['nobomb'] = 'You aint got a bomb',
}
local French = {
    ['cooldown'] = 'You Cannot Thermite Right Now..',
    ['sometingelse'] = 'Someone is Doing This',
    ['thermitefail'] = 'You Failed',
    ['vaultopen'] = 'Vault Unlocked',
    ['nopolice'] = 'There are not enough Police',
    ['doorunlock'] = 'Door Unlocked!',
    ['nodrill'] = 'You dont have a Drill',
    ['nothermite'] = 'You dont have Thermite',
    ['nokeycard'] = 'You dont have a Keycard',
    ['nopcitem'] = 'You dont have a Hacking Device',
    ['novaultitem'] = 'You dont have a Blue Laptop',
    ['nobomb'] = 'You aint got a bomb',
}







-- text('nopolice')
function text(entry)
    if Config.Language == 'English' then
	return English[entry] -- change to your language
    elseif Config.Language == 'French' then
    return French[entry] -- change to your language

    end
end