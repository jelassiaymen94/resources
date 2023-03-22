local weapons = {
	--Custom Weapon
	'WEAPON_AK47',
	'WEAPON_M9',
	'WEAPON_FNX45',
	'WEAPON_DE',
	'WEAPON_GLOCK17',
	'WEAPON_M4',
	'WEAPON_HK416',
	'WEAPON_MK14',
	'WEAPON_HUNTINGRIFLE',
	'WEAPON_AR15',
	'WEAPON_M70',
	'WEAPON_M1911',
	'WEAPON_MAC10',
	'WEAPON_UZI',
	'WEAPON_MP9',
	'WEAPON_M110',
	'WEAPON_MOSSBERG',
	'WEAPON_REMINGTON',
	'WEAPON_SCARH',
	'WEAPON_SHIV',
	
	'WEAPON_knife',
	'WEAPON_flashlight',
	'WEAPON_poolcue',
	'WEAPON_hatchet',
	'WEAPON_ball',
	'WEAPON_bat',
	'weapon_golfclub',
	'weapon_crowbar',

	
	'WEAPON_groza',
	
	'WEAPON_dp9',
	
	'WEAPON_dildo',
	
	

    'WEAPON_krambit',
    'WEAPON_gepard',
 
    'WEAPON_g18c',
  
    'WEAPON_mp5',
    'weapon_sword',
    'WEAPON_M67',
  

	'weapon_microsmg2',
	'weapon_microsmg3',
	'weapon_pistol',
	'weapon_katana',
	'weapon_assaultrifle',
	'weapon_assaultrifle2',
	
	'weapon_glock',
	'weapon_sledgehammer',
	'weapon_huntingrifle',
	'weapon_pistol50',
	'weapon_hk416',
	'weapon_mp9',
	'weapon_ar15',
	'weapon_scarh',
	'weapon_remington',
	'weapon_mossberg',
	'weapon_m9',
	'weapon_fnx45',

	'WEAPON_KNIFE',
	'WEAPON_NIGHTSTICK',
	'WEAPON_BREAD',
	'WEAPON_FLASHLIGHT',
	'WEAPON_HAMMER',
	'WEAPON_BAT',
	'WEAPON_GOLFCLUB',
	'WEAPON_CROWBAR',
	'WEAPON_BOTTLE',
	'WEAPON_DAGGER',
	'WEAPON_HATCHET',
	'WEAPON_MACHETE',
	'WEAPON_SWITCHBLADE',
	'WEAPON_BATTLEAXE',
	'WEAPON_POOLCUE',
	'WEAPON_WRENCH',
	'WEAPON_PISTOL',
	'WEAPON_PISTOL_MK2',
	'WEAPON_COMBATPISTOL',
	'WEAPON_APPISTOL',
	'WEAPON_PISTOL50',
	'WEAPON_REVOLVER',
	'WEAPON_SNSPISTOL',
	'WEAPON_HEAVYPISTOL',
	'WEAPON_VINTAGEPISTOL',
	'WEAPON_MICROSMG',
	'WEAPON_SMG',
	'WEAPON_ASSAULTSMG',
	'WEAPON_MINISMG',
	'WEAPON_MACHINEPISTOL',
	'WEAPON_COMBATPDW',
	'WEAPON_PUMPSHOTGUN',
	'WEAPON_SAWNOFFSHOTGUN',
	'WEAPON_ASSAULTSHOTGUN',
	'WEAPON_BULLPUPSHOTGUN',
	'WEAPON_HEAVYSHOTGUN',
	'WEAPON_ASSAULTRIFLE',
	'WEAPON_CARBINERIFLE',
	'WEAPON_ADVANCEDRIFLE',
	'WEAPON_SPECIALCARBINE',
	'WEAPON_BULLPUPRIFLE',
	'WEAPON_COMPACTRIFLE',
	'WEAPON_MG',
	'WEAPON_COMBATMG',
	'WEAPON_GUSENBERG',
	'WEAPON_SNIPERRIFLE',
	'WEAPON_HEAVYSNIPER',
	'WEAPON_MARKSMANRIFLE',
	'WEAPON_GRENADELAUNCHER',
	'WEAPON_RPG',
	'WEAPON_STINGER',
	'WEAPON_MINIGUN',
	'WEAPON_GRENADE',
	'WEAPON_STICKYBOMB',
	'WEAPON_SMOKEGRENADE',
	'WEAPON_BZGAS',
	'WEAPON_MOLOTOV',
	'WEAPON_DIGISCANNER',
	'WEAPON_FIREWORK',
	'WEAPON_MUSKET',
	'WEAPON_STUNGUN',
	'WEAPON_HOMINGLAUNCHER',
	'WEAPON_PROXMINE',
	'WEAPON_FLAREGUN',
	'WEAPON_MARKSMANPISTOL',
	'WEAPON_RAILGUN',
	'WEAPON_DBSHOTGUN',
	'WEAPON_AUTOSHOTGUN',
	'WEAPON_COMPACTLAUNCHER',
	'WEAPON_PIPEBOMB',
	'WEAPON_DOUBLEACTION',
}
--Weapons that require the Police holster animation
local holsterableWeapons = {
	'WEAPON_STUNGUN',
	
	'WEAPON_SCARH',
	'WEAPON_GLOCK',
	'WEAPON_M4',
	'WEAPON_REMINGTON',
	'WEAPON_AR15',
	'WEAPON_MP9',
	'WEAPON_MK14',
	
	
}

local holstered = true
local canFire = true
local currWeapon = `WEAPON_UNARMED`
local currentHolster = nil
local currentHolsterTexture = nil
local WearingHolster = nil

RegisterNetEvent('weapons:ResetHolster', function()
	holstered = true
	canFire = true
	currWeapon = `WEAPON_UNARMED`
	currentHolster = nil
	currentHolsterTexture = nil
	WearingHolster = nil
end)

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInParachuteFreeFall(ped) and not IsPedFalling(ped) and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) then
			if currWeapon ~= GetSelectedPedWeapon(ped) then
				pos = GetEntityCoords(ped, true)
				local rot = GetEntityHeading(ped)

				local newWeap = GetSelectedPedWeapon(ped)
				SetCurrentPedWeapon(ped, currWeapon, true)
				loadAnimDict('reaction@intimidation@1h')
				loadAnimDict('reaction@intimidation@cop@unarmed')
				loadAnimDict('rcmjosh4')
				loadAnimDict('weapons@pistol@')

				local HolsterVariant = GetPedDrawableVariation(ped, 7)
				if HolsterVariant == 8 then
					WearingHolster = true
				elseif HolsterVariant == 1 then
					WearingHolster = true
				elseif HolsterVariant == 6 then
					WearingHolster = true
				elseif HolsterVariant == 2 then
					WearingHolster = true
				elseif HolsterVariant == 3 then
					WearingHolster = true
				elseif HolsterVariant == 5 then
					WearingHolster = false
				elseif HolsterVariant == 130 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 21 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 73 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 93 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 94 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 100 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 108 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 110 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 150 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 160 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 161 then --Replace to match config
					WearingHolster = true
				elseif HolsterVariant == 162 then --Replace to match config
					WearingHolster = true
				end
				if CheckWeapon(newWeap) then
					if holstered then
						if WearingHolster == true then
							--TaskPlayAnim(ped, 'rcmjosh4', 'josh_leadout_cop2', 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
							canFire = false
							currentHolster = GetPedDrawableVariation(ped, 7)
							currentHolsterTexture = GetPedTextureVariation(ped, 7)
							TaskPlayAnimAdvanced(ped, 'rcmjosh4', 'josh_leadout_cop2', GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHolster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHolster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHolster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end
							currWeapon = newWeap
							Wait(300)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'intro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					elseif newWeap ~= currWeapon and CheckWeapon(currWeapon) then
						if WearingHolster == true then
							canFire = false

							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@cop@unarmed', 'intro', GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Wait(500)

							if IsWeaponHolsterable(currWeapon) then
								SetPedComponentVariation(ped, 7, currentHolster, currentHolsterTexture, 2)
							end

							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							currentHolster = GetPedDrawableVariation(ped, 7)
							currentHolsterTexture = GetPedTextureVariation(ped, 7)

							TaskPlayAnimAdvanced(ped, 'rcmjosh4', 'josh_leadout_cop2', GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHolster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHolster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHolster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end

							Wait(500)
							currWeapon = newWeap
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'outro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Wait(1600)
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'intro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					else
						if WearingHolster == true then
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							currentHolster = GetPedDrawableVariation(ped, 7)
							currentHolsterTexture = GetPedTextureVariation(ped, 7)
							TaskPlayAnimAdvanced(ped, 'rcmjosh4', 'josh_leadout_cop2', GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Wait(300)
							SetCurrentPedWeapon(ped, newWeap, true)

							if IsWeaponHolsterable(newWeap) then
								if currentHolster == 8 then
									SetPedComponentVariation(ped, 7, 2, 0, 2)
								elseif currentHolster == 1 then
									SetPedComponentVariation(ped, 7, 3, 0, 2)
								elseif currentHolster == 6 then
									SetPedComponentVariation(ped, 7, 5, 0, 2)
								end
							end

							currWeapon = newWeap
							Wait(300)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						else
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'intro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Wait(1000)
							SetCurrentPedWeapon(ped, newWeap, true)
							currWeapon = newWeap
							Wait(1400)
							ClearPedTasks(ped)
							holstered = false
							canFire = true
						end
					end
				else
					if not holstered and CheckWeapon(currWeapon) then
						if WearingHolster == true then
							canFire = false
							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@cop@unarmed', 'intro', GetEntityCoords(ped, true), 0, 0, rot, 3.0, 3.0, -1, 50, 0, 0, 0)
							Wait(500)
							
							if IsWeaponHolsterable(currWeapon) then
								SetPedComponentVariation(ped, 7, currentHolster, 0, 2)
							end

							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							ClearPedTasks(ped)
							SetCurrentPedWeapon(ped, newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						else
							canFire = false
							TaskPlayAnimAdvanced(ped, 'reaction@intimidation@1h', 'outro', GetEntityCoords(ped, true), 0, 0, rot, 8.0, 3.0, -1, 50, 0, 0, 0)
							Wait(1400)
							SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
							ClearPedTasks(ped)
							SetCurrentPedWeapon(ped, newWeap, true)
							holstered = true
							canFire = true
							currWeapon = newWeap
						end
					else
						SetCurrentPedWeapon(ped, newWeap, true)
						holstered = false
						canFire = true
						currWeapon = newWeap
					end
				end
			end
		else
			Wait(250)
		end

		Wait(5)
	end
end)


CreateThread(function()
	while true do
		if not canFire then
			DisableControlAction(0, 25, true)
			DisablePlayerFiring(PlayerPedId(), true)
		else
			Wait(250)
		end

		Wait(3)
	end
end)

function CheckWeapon(newWeap)
	for i = 1, #weapons do
		if GetHashKey(weapons[i]) == newWeap then
			return true
		end
	end
	return false
end

function IsWeaponHolsterable(weap)
	for i = 1, #holsterableWeapons do
		if GetHashKey(holsterableWeapons[i]) == weap then
			return true
		end
	end
	return false
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Wait(5)
	end
end
