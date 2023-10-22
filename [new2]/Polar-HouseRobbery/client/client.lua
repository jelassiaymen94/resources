local QBCore = exports['qb-core']:GetCoreObject()



local noise = 0
local inside = false
local blip = nil

local npc = nil

CreateThread(function()
    RequestModel("a_m_y_business_03")
    while not HasModelLoaded("a_m_y_business_03") do
        Wait(100)
    end

    npc = CreatePed(4, "a_m_y_business_03", vector3(221.25, 769.52, 204.67), false, true)
    SetEntityHeading(npc, 357.7963)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)

    exports['qb-target']:AddTargetEntity(npc, {
    options = {{ event = 'Polar-stores:Client:Menu',  icon = "far fa-clipboard", label = Lang:t("label.asklocation")}}, distance = 1.5  })
end)


AddEventHandler('onResourceStop', function(resourceName) if (GetCurrentResourceName() ~= resourceName) then return end DeleteEntity(npc) end)




RegisterNetEvent("Polar-HouseRobbery:startrobbery", function()

    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:Header', function(canStart)
    if canStart then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
            if result then
                TriggerServerEvent("Polar-HouseRobbery:server:takeitem2")
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
                QBCore.Functions.Notify(Lang:t('notify.donthaveitem'), 'error')
            end
        end, Config.StartItem)
    else
        QBCore.Functions.Notify(Lang:t("notify.needtowait"), "error")
    end
    end)
end)

RegisterNetEvent('Polar-HouseRobbery:Client:Noise', function(house)
	local ped = PlayerPedId()
	while inside do
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
		end
		if noise > 30 then
			callPolice(house)
		end
	end
end)

RegisterNetEvent("Polar-HouseRobbery:getrandomhouseloc", function()
    local house = Config.Locations[math.random(#Config.Locations)]
    TriggerEvent("Polar-HouseRobbery:createblipandroute", house)
    TriggerEvent("Polar-HouseRobbery:createentry", house)
end)



RegisterNetEvent("Polar-HouseRobbery:createblipandroute", function(house)
    QBCore.Functions.Notify(Lang:t("notify.recivedlocation"), "success")
    blip = AddBlipForCoord(house.location.x, house.location.y, house.location.z)
    SetBlipSprite(blip, 374)
    SetBlipColour(blip, 1)
    SetBlipAlpha(blip, 90)
    SetBlipScale(blip, 0.5)
    SetBlipRoute(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Robbery location")
    EndTextCommandSetBlipName(blip)
end)





RegisterNetEvent("Polar-HouseRobbery:createentry", function(house)
            exports['qb-target']:AddCircleZone("hr_entry", vector3(house.location.x, house.location.y, house.location.z), 0.5, {
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
                                    EntryMinigame(house)
                                else
                                    QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
                                end
                            end, Config.PickItem)
                        else
                            local c = math.random(1, 2)
                            QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
                                if HasItem then
                                    if c == 1 then
                                        EntryMinigame(house)
                                    elseif c == 2 then
                                        callPolice(house)
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

RegisterNetEvent("Polar-HouseRobbery:goinside", function(house)
    SetEntityCoords(PlayerPedId(), house.inside.x, house.inside.y, house.inside.z)
    TriggerEvent("Polar-HouseRobbery:createexit", house)
    TriggerEvent("Polar-HouseRobbery:createloot", house)
    if isNight() then 
        TriggerEvent("Polar-HouseRobbery:Client:Noise", house)
    else
        callPolice(house)
    end
end)

RegisterNetEvent("Polar-HouseRobbery:createexit", function(house)
   
       

            exports['qb-target']:AddCircleZone("hr_exit", vector3(house.exit.x, house.exit.y, house.exit.z), 0.5, {
                name = "hr_exit",
                debugPoly = false,
                useZ=true
            }, {
                options = {
                    {  
                    action = function()
                        Wait(1000)
                        inside = false
                        SetEntityCoords(PlayerPedId(), house.location.x, house.location.y, house.location.z)
                        noise = 0
                        Wait(500)
                        RemoveBlip(blip)
                    end,
                    icon = "far fa-clipboard",
                    label = Lang:t('label.exit'),
                    },
                },
                distance = 1.5
            })
       
   
end)

RegisterNetEvent("Polar-HouseRobbery:createloot", function(house)
    for _,v in ipairs(house.loot) do
        local n = v[1]
        local p = v[2] 
        TriggerServerEvent('Polar-HouseRobbery:Server:CreateTarget', n, p)  
    end
end)


function beginLoot(name)
        TriggerServerEvent('Polar-HouseRobbery:Server:RemoveTarget', name)
        QBCore.Functions.Progressbar("loot_house", Lang:t("progress.lookingforstuff"), math.random(6000,12000), false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini@repair",
	    	anim = "fixing_a_player",
	    	flags = 16,
        }, {}, {}, function() -- Done
            StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
            TriggerServerEvent("robbery:loot")
            ClearPedTasks(PlayerPedId())
        end, function() end)
end



function isNight()
	local hour = GetClockHours()
	if hour > Config.Night[1] or hour < Config.Night[2] then
		return true
	end
	return false
end

function StartAnimation() QBCore.Functions.PlayAnim("mp_arresting", "a_uncuff") end

function EntryMinigame(house)
        StartAnimation()
        exports['Polar-UI']:Circle(function(success)
            if success then
                inside = true
                if GetPedDrawableVariation(PlayerPedId(), 1) == 0 then
                    callPolice(house)
                    TriggerEvent("Polar-HouseRobbery:goinside", house)
                    QBCore.Functions.Notify(Lang:t("notify.gotthedoor"), "success")
                    if GetPedDrawableVariation(PlayerPedId(), 1) == 0 then
                        QBCore.Functions.Notify(Lang:t("notify.donthavemask"))
                    end
                else
                    TriggerEvent("Polar-HouseRobbery:goinside", house)
                    QBCore.Functions.Notify(Lang:t("notify.gotthedoor"), "success")
                end
            else
                QBCore.Functions.Notify(Lang:t("notify.messedup"), "error")
                StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent("Polar-HouseRobbery:server:takeitem")
                callPolice(house)
                Wait(500)
                
            end
        end, Config.Circles, Config.MS) -- NumberOfCircles, MS
end



--[[RegisterCommand('startrob', function()
    TriggerEvent('Polar-HouseRobbery:startrobbery')
end)]]


RegisterNetEvent('Polar-HouseRobbery:Client:RemoveTarget', function(name) exports['qb-target']:RemoveZone(name) end)
RegisterNetEvent('Polar-HouseRobbery:Client:CreateTarget', function(name, loc) 
    exports['qb-target']:AddCircleZone(name, loc, 0.5, { name = name, debugPoly = true, useZ=true  }, {
    options = { {   action = function() beginLoot(name)  end, icon = "far fa-clipboard", label = Lang:t('label.loot'),  }, }, distance = 1.5 })
end)