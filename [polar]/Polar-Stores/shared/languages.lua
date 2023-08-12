local English = {
    ['cooldown'] = 'You Cannot Start a hiest Right Now..',
    ['sometingelse'] = 'Someone is Doing This',
    ['nopolice'] = 'There are not enough Police',
    ['doorunlock'] = 'Door Unlocked!',
    ['noboxitem'] = 'You dont have a item',
    ['nopcitem'] = 'You dont have a Hacking Device',
    ['nodoor'] = 'no door item',
    ['noregister'] = 'no register item',
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
    ['novaultitem'] = 'You dont have a Red Laptop',
    ['lazers'] = 'Lazer System Disabled',
    ['noswitchblade'] = 'You Dont have a Switchblade',
    ['nolaserdrill'] = 'You Dont have a Laser Drill',
}







-- text('nopolice')
function text(entry)
	return English[entry] -- change to your language
end