
local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)


RegisterNetEvent('superfood:client:Eat', function(itemName)
    if itemName == "sandwich" then
        TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    elseif itemName == "twerks_candy" then
        TriggerEvent('animations:client:EmoteCommandStart', {"twerks_candy"})
    elseif itemName == "snikkel_candy" then
        TriggerEvent('animations:client:EmoteCommandStart', {"snikkel_candy"})
    elseif itemName == "tosti" then
        TriggerEvent('animations:client:EmoteCommandStart', {"sandwich"})
    elseif itemName == "nekodonut" then
        TriggerEvent('animations:client:EmoteCommandStart', {"donut"})
  


    else
	    TriggerEvent('animations:client:EmoteCommandStart', {"eat"})
    end
	QBCore.Functions.Progressbar("eat_something", 'Eating '..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
		if not QBCore.Shared.Items[itemName].thirst and not QBCore.Shared.Items[itemName].hunger then
			TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(30,55))
		end
       -- TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
        TriggerServerEvent('superfood:server:removeitem', itemName)
		if itemName == "bmochi" or itemName == "gmochi" or itemName == "omochi" or itemName == "pmochi" then exports['qb-buffs']:AddBuff("hacking", 15000)
		elseif itemName == "miso" then exports['qb-buffs']:AddBuff("luck", 15000) 
		elseif itemName == "nekodonut" then exports['qb-buffs']:AddBuff("stamina", 15000) exports['qb-buffs']:StaminaBuffEffect(15000, 1.4)
		elseif itemName == "purrito" then exports['qb-buffs']:AddBuff("intelligence", 15000)
		elseif itemName == "noodlebowl" then exports['qb-buffs']:AddBuff("strength", 15000)
		elseif itemName == "mozzarellasticks" then exports['qb-buffs']:AddBuff("swimming", 15000)   exports['qb-buffs']:SwimmingBuffEffect(15000, 1.4)
		elseif itemName == "ramen" then  exports['qb-buffs']:AddBuff("super-hunger", 15000)
		elseif itemName == "bento" then    exports['qb-buffs']:AddBuff("super-health", 15000) exports['qb-buffs']:AddHealthBuff(15000, 10)
		elseif itemName == "nekocookie" then   exports['qb-buffs']:AddBuff("super-armor", 15000)  exports['qb-buffs']:AddArmorBuff(15000, 10)
		elseif itemName == "pikachusoup" then  exports['qb-buffs']:AddBuff("super-stress", 15000) exports['qb-buffs']:AddStressBuff(15000, 10)
		elseif itemName == "ernadotaco" then  exports['qb-buffs']:AddBuff("super-thirst", 15000)

        end

		
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)



RegisterNetEvent('superfood:client:smoke', function(itemName)
    if itemName == "cig" then
        TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
    elseif itemName == "cigar" then
        TriggerEvent('animations:client:EmoteCommandStart', {"cigar"})
   

    else
	    TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
    end
	QBCore.Functions.Progressbar("eat_something", 'Smoking '..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
		if not QBCore.Shared.Items[itemName].thirst and not QBCore.Shared.Items[itemName].hunger then
			TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(30,55))
		end
       -- TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
       TriggerServerEvent('superfood:server:removeitem', itemName)
		if itemName == "bmochi" or itemName == "gmochi" or itemName == "omochi" or itemName == "pmochi" then exports['qb-buffs']:AddBuff("hacking", 15000)
		elseif itemName == "miso" then exports['qb-buffs']:AddBuff("luck", 15000) 
		elseif itemName == "nekodonut" then exports['qb-buffs']:AddBuff("stamina", 15000) exports['qb-buffs']:StaminaBuffEffect(15000, 1.4)
		elseif itemName == "purrito" then exports['qb-buffs']:AddBuff("intelligence", 15000)
		elseif itemName == "noodlebowl" then exports['qb-buffs']:AddBuff("strength", 15000)
		elseif itemName == "mozzarellasticks" then exports['qb-buffs']:AddBuff("swimming", 15000)   exports['qb-buffs']:SwimmingBuffEffect(15000, 1.4)
		elseif itemName == "ramen" then  exports['qb-buffs']:AddBuff("super-hunger", 15000)
		elseif itemName == "bento" then    exports['qb-buffs']:AddBuff("super-health", 15000) exports['qb-buffs']:AddHealthBuff(15000, 10)
		elseif itemName == "nekocookie" then   exports['qb-buffs']:AddBuff("super-armor", 15000)  exports['qb-buffs']:AddArmorBuff(15000, 10)
		elseif itemName == "pikachusoup" then  exports['qb-buffs']:AddBuff("super-stress", 15000) exports['qb-buffs']:AddStressBuff(15000, 10)
		elseif itemName == "ernadotaco" then  exports['qb-buffs']:AddBuff("super-thirst", 15000)

        end

		
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)


local alcoholCount = 0

RegisterNetEvent('superfood:client:DrinkAlcohol', function(itemName)
    if itemName == "vodka" then
        TriggerEvent('animations:client:EmoteCommandStart', {"vodka"})
    elseif itemName == "beer" then
        TriggerEvent('animations:client:EmoteCommandStart', {"beer"})
    elseif itemName == "whiskey" then
        TriggerEvent('animations:client:EmoteCommandStart', {"whiskey"})
  

    else
	TriggerEvent('animations:client:EmoteCommandStart', {"wine"})
	end
    QBCore.Functions.Progressbar("snort_coke", "Drinking "..QBCore.Shared.Items[itemName].label.."..", math.random(3000, 6000), false, true, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('superfood:server:removeitem', itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
        alcoholCount = alcoholCount + 1
        if alcoholCount > 1 and alcoholCount < 4 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
        elseif alcoholCount >= 4 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
			AlienEffect()
        end
       
    end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        triggerNotify(nil, Loc[Config.Lan].progressbar["cancel"], "error")
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)

function AlienEffect()
    StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
    Wait(math.random(5000, 8000))
    local ped = PlayerPedId()
    RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
    while not HasAnimSetLoaded("MOVE_M@DRUNK@VERYDRUNK") do Citizen.Wait(0) end
    SetPedCanRagdoll(ped, true )
    ShakeGameplayCam('DRUNK_SHAKE', 2.80)
    SetTimecycleModifier("Drunk")
    SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", true)
    SetPedMotionBlur(ped, true)
    SetPedIsDrunk(ped, true)
    Wait(1500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(13500)
    SetPedToRagdoll(ped, 5000, 1000, 1, false, false, false )
    Wait(120500)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    ResetPedMovementClipset(ped, 0)
    SetPedIsDrunk(ped, false)
    SetPedMotionBlur(ped, false)
    AnimpostfxStopAll()
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
    Wait(math.random(45000, 60000))
    StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
    StopScreenEffect("DrugsMichaelAliensFightIn")
    StopScreenEffect("DrugsMichaelAliensFight")
    StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('superfood:client:Drink', function(itemName)
    if itemName == "coffee" then
        TriggerEvent('animations:client:EmoteCommandStart', {"coffee"})
    elseif itemName == "water_bottle" then
        TriggerEvent('animations:client:EmoteCommandStart', {"water_bottle"})
    elseif itemName == "kurkakola" then
        TriggerEvent('animations:client:EmoteCommandStart', {"ecola"})
  

    else
	TriggerEvent('animations:client:EmoteCommandStart', {"cup"})
	end
	QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerServerEvent('superfood:server:removeitem', itemName)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		toggleItem(false, itemName, 1)
		if QBCore.Shared.Items[itemName].thirst then TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst) end
		if QBCore.Shared.Items[itemName].hunger then TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger) end
		if not QBCore.Shared.Items[itemName].thirst and not QBCore.Shared.Items[itemName].hunger then
			TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + math.random(30,55))
		end
		
	end, function() -- Cancel
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, itemName)
end)