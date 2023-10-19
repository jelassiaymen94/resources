local English = {
    ['cooldown'] = 'You Cannot Start a hiest Right Now..',
    ['sometingelse'] = 'Someone is Doing This',
    ['nopolice'] = 'There are not enough Police',
    ['doorunlock'] = 'Door Unlocked!',
    ['noboxitem'] = 'You dont have a item',
    ['nopcitem'] = 'You dont have a Hacking Device',
    ['nodoor'] = 'You atleast need a lockpick',
    ['noregister'] = 'Damn no advanced lockpick huh',
    ['nosafe'] = 'Looks like you need some Safe Keys',
}








-- text('nopolice')
function text(entry)
	return English[entry] -- change to your language
end