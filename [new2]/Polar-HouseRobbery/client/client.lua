local QBCore = exports['qb-core']:GetCoreObject()

canStart = true
ongoing = false
robberyStarted = false
robberystopped = false
noise = 0
NeededAttempts = 0
SucceededAttempts = 0
FailedAttemps = 0



CreateThread(function()
    hashKey = RequestModel(GetHashKey(Config.Ped))


    while not HasModelLoaded(GetHashKey(Config.Ped)) do
        Wait(1)
    end

    local npc = CreatePed(4, Config.ModelHash, Config.PedLocation, false, true)
    SetEntityHeading(npc, Config.PedHeading)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end)

CreateThread(function()
    exports['qb-target']:AddTargetModel(Config.Ped, {
    	options = {
    		{
    			event = "Polar-HouseRobbery:startrobbery",
    			icon = "far fa-clipboard",
    			label = Lang:t("label.asklocation")
    		}
    	},
    	distance = 2.5,
    })
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end
    DeleteEntity(npc)
end)

RegisterNetEvent("Polar-HouseRobbery:startrobbery")
AddEventHandler("Polar-HouseRobbery:startrobbery", function()
    if canStart then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
            if result then
                TriggerServerEvent("Polar-HouseRobbery:server:takeitem2")
                if isNight() then
                    canStart = false
                    ongoing = true
                    QBCore.Functions.Notify(Lang:t("notify.starting"), "success")
                    local missionWait = math.random( 1000,  1001)
                    Wait(missionWait)
                    SetTimeout(2000, function()
                       
                            TriggerServerEvent('qb-phone:server:sendNewMail', {
                                sender =  Lang:t("mail.sender"),
                                subject = Lang:t("mail.subject"),
                                message = Lang:t("mail.message"),
                                button = {
                                    enabled = true,
                                    buttonEvent = "Polar-HouseRobbery:getrandomhouseloc"
                                }
                            })
                      
                    end)
                else
                    canStart = false
                    ongoing = true
                    QBCore.Functions.Notify(Lang:t("notify.starting"), "success")
                    local missionWait = math.random( 1000,  1001)
                    Wait(missionWait)
                    SetTimeout(2000, function()
                       
                            TriggerServerEvent('qb-phone:server:sendNewMail', {
                                sender =  Lang:t("mail.sender"),
                                subject = Lang:t("mail.subject"),
                                message = Lang:t("mail.messagenotnight"),
                                button = {
                                    enabled = true,
                                    buttonEvent = "Polar-HouseRobbery:getrandomhouseloc"
                                }
                            })
                       
                    end)
                
                end
            else
                QBCore.Functions.Notify(Lang:t('notify.donthaveitem'), 'error')
            end
        end, Config.StartItem)
    elseif ongoing then
        QBCore.Functions.Notify(Lang:t("notify.robberyinprogress"), "error")
    else
        QBCore.Functions.Notify(Lang:t("notify.needtowait"), "error")
    end
end)

RegisterNetEvent('Polar-HouseRobbery:noise')
AddEventHandler('Polar-HouseRobbery:noise', function()
	local ped = PlayerPedId()
	while ongoing do
		if IsPedShooting(ped) then
			noise = noise + 100
            QBCore.Functions.Notify('Noise: '..noise)
            Wait(1000)
		end
		if GetEntitySpeed(ped) > 1.7 then
			noise = noise + 10
            QBCore.Functions.Notify('Noise: '..noise)
            Wait(1000)
			if GetEntitySpeed(ped) > 2.5 then
				noise = noise + 15
                QBCore.Functions.Notify('Noise: '..noise)
                Wait(1000)
			end
			if GetEntitySpeed(ped) > 3.0 then
				noise = noise + 20
                QBCore.Functions.Notify('Noise: '..noise)
                Wait(1000)
			end
			Wait(300)
		else
			noise = noise - 10
            Wait(1000)
			if noise < 0 then
				noise = 0
			end
			Wait(1000)
		end
		if noise > 100 then
			stopRobbery()
		end
	end
end)

RegisterNetEvent("Polar-HouseRobbery:getrandomhouseloc")
AddEventHandler("Polar-HouseRobbery:getrandomhouseloc", function()
    local missionTarget = Config.Locations[math.random(#Config.Locations)]
    TriggerEvent("Polar-HouseRobbery:createblipandroute", missionTarget)
    TriggerEvent("Polar-HouseRobbery:createentry", missionTarget)
end)

RegisterNetEvent("Polar-HouseRobbery:createblipandroute")
AddEventHandler("Polar-HouseRobbery:createblipandroute", function(missionTarget)
    QBCore.Functions.Notify(Lang:t("notify.recivedlocation"), "success")
    targetBlip = AddBlipForCoord(missionTarget.location.x, missionTarget.location.y, missionTarget.location.z)
    SetBlipSprite(targetBlip, 374)
    SetBlipColour(targetBlip, 1)
    SetBlipAlpha(targetBlip, 90)
    SetBlipScale(targetBlip, 0.5)
    SetBlipRoute(targetBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.BlipName)
    EndTextCommandSetBlipName(targetBlip)
end)

RegisterNetEvent("Polar-HouseRobbery:createentry", function(missionTarget)
  
            exports['qb-target']:AddCircleZone("hr_entry", vector3(missionTarget.location.x, missionTarget.location.y, missionTarget.location.z), 0.5, {
                name = "hr_entry",
                debugPoly = false,
                useZ=true
            }, {
                options = {
                    {  
                    action = function()
                        if isNight() then
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                                if HasItem then
                                    EntryMinigame(missionTarget)
                                else
                                    QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
                                end
                            end, Config.PickItem)
                        else
                            local c = math.random(1, 2)
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                                if HasItem then
                                    if c == 1 then
                                        EntryMinigame(missionTarget)
                                    elseif c == 2 then
                                        callPolice(missionTarget)
                                        QBCore.Functions.Notify(Lang:t('notify.alarm'), 'error')
                                    end
                                else
                                    QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
                                end
                            end, Config.PickItem)
                        end
                    end,
                    icon = "far fa-clipboard",
                    label = Lang:t('label.entry'),
                    },
                },
                distance = 1.5
            })
       

	
end)

RegisterNetEvent("Polar-HouseRobbery:goinside", function(missionTarget)
    robberyStarted = true
    SetEntityCoords(PlayerPedId(), missionTarget.inside.x, missionTarget.inside.y, missionTarget.inside.z)
    TriggerEvent("Polar-HouseRobbery:createexit", missionTarget)
    TriggerEvent("Polar-HouseRobbery:createloot", missionTarget)
    if Config.noise then
        TriggerEvent("Polar-HouseRobbery:noise")
    else
    end
end)

RegisterNetEvent("Polar-HouseRobbery:createexit", function(missionTarget)
   
       

            exports['qb-target']:AddCircleZone("hr_exit", vector3(missionTarget.exit.x, missionTarget.exit.y, missionTarget.exit.z), 0.5, {
                name = "hr_exit",
                debugPoly = false,
                useZ=true
            }, {
                options = {
                    {  
                    action = function()
                        Wait(1000)
                        robberyStarted = false
                        ongoing = false
                        SetEntityCoords(PlayerPedId(), missionTarget.location.x, missionTarget.location.y, missionTarget.location.z)
                        cooldownNextRobbery()
                        Wait(500)
                        exports['qb-core']:HideText()
                    end,
                    icon = "far fa-clipboard",
                    label = Lang:t('label.exit'),
                    },
                },
                distance = 1.5
            })
       
   
end)

RegisterNetEvent("Polar-HouseRobbery:createloot", function(missionTarget)

    for i,v in ipairs(missionTarget.loot) do
        local looted = false
        
      

                exports['qb-target']:AddCircleZone("hr_entry", vector3(v.x, v.y, v.z), 0.5, {
                    name = "hr_entry",
                    debugPoly = true,
                    useZ=true
                }, {
                    options = {
                        {  
                        action = function()
                            if not looted then
                                beginLoot()
                                looted = true
                            else
                                QBCore.Functions.Notify(Lang:t("notify.alreadycheacked"), "error")
                            end
                        end,
                        icon = "far fa-clipboard",
                        label = Lang:t('label.loot'),
                        },
                    },
                    distance = 1.5
                })
         
    end
end)


function beginLoot()
  
        QBCore.Functions.Progressbar("loot_house", Lang:t("progress.lookingforstuff"), math.random(6000,12000), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini@repair",
	    	anim = "fixing_a_player",
	    	flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
            TriggerServerEvent("robbery:loot")
            ClearPedTasks(PlayerPedId())
        end, function() -- Cancel
            StopAnimTask(ped, "mini@repair", "fixing_a_player", 1.0)
            openingDoor = false
            ClearPedTasks(PlayerPedId())
            QBCore.Functions.Notify(Lang:t("notify.canceled"), "error")
        end)
  
end

function cooldownNextRobbery()
    RemoveBlip(targetBlip)
    exports['qb-core']:HideText()
    Wait(3000)
    if robberystopped == true then
       
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender =  Lang:t("mail.sender"),
                subject = Lang:t("mail.subject2"),
                message = Lang:t("mail.message2"),
                button = {
                    enabled = true,
                    buttonEvent = "Polar-HouseRobbery:getrandomhouseloc"
                }
            })
       
        callPolice(missionTarget)
    elseif robberystopped == false then
        
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender =  Lang:t("mail.sender"),
                subject = Lang:t("mail.subject2"),
                message = Lang:t("mail.message2"),
                button = {
                    enabled = true,
                    buttonEvent = "Polar-HouseRobbery:getrandomhouseloc"
                }
            })
        
    end
    Wait(Config.Cooldown) -- Needs a better option. So that client cant just reconnect and reset timer that way.
    canStart = true
    robberyCreated = false
    ongoing = false
end

function cooldownNextRobberyFail()
    RemoveBlip(targetBlip)
    exports['qb-core']:HideText()
    Wait(3000)
    if robberystopped == true then
      
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender =  Lang:t("mail.sender"),
                subject = Lang:t("mail.subject3"),
                message = Lang:t("mail.message3"),
                button = {
                    enabled = true,
                    buttonEvent = "Polar-HouseRobbery:getrandomhouseloc"
                }
            })
     
        callPolice(missionTarget)
    elseif robberystopped == false then
       
            TriggerServerEvent('qb-phone:server:sendNewMail', {
                sender =  Lang:t("mail.sender"),
                subject = Lang:t("mail.subject3"),
                message = Lang:t("mail.message3"),
                button = {
                    enabled = true,
                    buttonEvent = "Polar-HouseRobbery:getrandomhouseloc"
                }
            })
       
    end
    Wait(Config.Cooldown) -- Needs a better option. So that client cant just reconnect and reset timer that way.
    canStart = true
    robberyCreated = false
    ongoing = false
end

function isNight()
	local hour = GetClockHours()
	if hour > Config.Night[1] or hour < Config.Night[2] then
		return true
	end
	return false
end

function stopRobbery()
    QBCore.Functions.Notify(Lang:t('notify.alarm'), 'error')
    robberystopped = true
end

function StartAnimation()
    QBCore.Functions.PlayAnim("mp_arresting", "a_uncuff")
end

function EntryMinigame(missionTarget)
        StartAnimation()
        exports['Polar-UI']:Circle(function(success)
            if success then
                if GetPedDrawableVariation(PlayerPedId(), 1) == 0 then
                    callPolice(missionTarget)
                    TriggerEvent("Polar-HouseRobbery:goinside", missionTarget)
                    ongoing = true
                    QBCore.Functions.Notify(Lang:t("notify.gotthedoor"), "success")
                    if GetPedDrawableVariation(PlayerPedId(), 1) == 0 then
                        QBCore.Functions.Notify(Lang:t("notify.donthavemask"))
                    end
                    FailedAttemps = 0
                    SucceededAttempts = 0
                    NeededAttempts = 0
                else
                    TriggerEvent("Polar-HouseRobbery:goinside", missionTarget)
                    ongoing = true
                    QBCore.Functions.Notify(Lang:t("notify.gotthedoor"), "success")
                    FailedAttemps = 0
                    SucceededAttempts = 0
                    NeededAttempts = 0
                end
            else
                QBCore.Functions.Notify(Lang:t("notify.messedup"), "error")
                StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("Polar-HouseRobbery:server:takeitem")
                callPolice(missionTarget)
                robberyStarted = false
                ongoing = false
                cooldownNextRobberyFail()
                Wait(500)
                exports['qb-core']:HideText()
            end
        end, Config.Circles, Config.MS) -- NumberOfCircles, MS
end

function callPolice(missionTarget)
    exports[Config.Dispatch]:HouseRobbery()
    QBCore.Functions.Notify(Lang:t('notify.alarm'), 'error')
end

--[[RegisterCommand('startrob', function()
    TriggerEvent('Polar-HouseRobbery:startrobbery')
end)]]
