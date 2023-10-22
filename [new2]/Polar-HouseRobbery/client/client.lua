local QBCore = exports['qb-core']:GetCoreObject()



local noise = 0
local inside = false
local blip = nil

local npc = nil

CreateThread(function()
    TriggerServerEvent('Polar-HouseRobbery:Server:Reset')
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
    options = {{ event = 'Polar-HouseRobbery:Client:Start',  icon = "far fa-clipboard", label = Lang:t("label.asklocation")}}, distance = 1.5  })
end)
AddEventHandler('onResourceStop', function(resourceName) if (GetCurrentResourceName() ~= resourceName) then return end TriggerServerEvent('Polar-HouseRobbery:Server:Reset') DeleteEntity(npc) end)



RegisterNetEvent("Polar-HouseRobbery:Client:Start", function()
    QBCore.Functions.TriggerCallback('Polar-HouseRobbery:Server:Cooldown', function(result)
    if result then
        if playeritem("advancedlockpick") then
            TriggerServerEvent("Polar-HouseRobbery:server:takeitem2")
                QBCore.Functions.Notify(Lang:t("notify.starting"), "success")
                Wait(math.random(1000, 1001))
                    SetTimeout(2000, function()
                        TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender =  Lang:t("mail.sender"),
                            subject = Lang:t("mail.subject"),
                            message = Lang:t("mail.message"),
                            button = {
                                enabled = true,
                                buttonEvent = "Polar-HouseRobbery:Client:RandomHouse"
                            }
                        })
                    end)
        else QBCore.Functions.Notify(Lang:t('notify.donthaveitem'), 'error') end
    else QBCore.Functions.Notify(Lang:t("notify.needtowait"), "error") end
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
            Wait(1000)
		end
        Wait(10)
	end
end)

RegisterNetEvent("Polar-HouseRobbery:Client:RandomHouse", function()
    local house = Config.Locations[math.random(#Config.Locations)]
    CreateHouse(house)
end)



function CreateHouse(house)
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

    exports['qb-target']:AddCircleZone("polar_hr_entry", vector3(house.location.x, house.location.y, house.location.z), 0.5, {
    name = "polar_hr_entry", debugPoly = false, useZ=true }, { options = { {   action = function()

    if isNight() then
        if playeritem("advancedlockpick") then
            EntryMinigame(house)
        else
            QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
        end
    else
        local c = math.random(1, 2)
        if playeritem("advancedlockpick") then
            if c == 1 then
                EntryMinigame(house)
            elseif c == 2 then
                callPolice(house)
                QBCore.Functions.Notify(Lang:t('notify.alarm'), 'error')
            end
        else
            QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
        end
    end

    end, icon = "far fa-clipboard", label = Lang:t('label.entry'), }, }, distance = 1.5 })
end





RegisterNetEvent("Polar-HouseRobbery:goinside", function(house)
    SetEntityCoords(PlayerPedId(), house.inside.x, house.inside.y, house.inside.z)
    TriggerEvent("Polar-HouseRobbery:CreateLoot", house)
    if isNight() then 
        TriggerEvent("Polar-HouseRobbery:Client:Noise", house)
    else
        callPolice(house)
    end
end)


RegisterNetEvent("Polar-HouseRobbery:CreateLoot", function(house)
    for _,v in ipairs(house.loot) do
        local n = v[1]
        local p = v[2] 
        TriggerServerEvent('Polar-HouseRobbery:Server:CreateTarget', n, p)  
    end
    exports['qb-target']:AddCircleZone("polar_hr_exit", vector3(house.exit.x, house.exit.y, house.exit.z), 0.5, {
    name = "polar_hr_exit",  debugPoly = false,  useZ=true }, {  options = { {   action = function()

    Wait(1000)
    inside = false
    SetEntityCoords(PlayerPedId(), house.location.x, house.location.y, house.location.z)
    noise = 0
    Wait(500)
    RemoveBlip(blip)

    end,  icon = "far fa-clipboard",  label = Lang:t('label.exit'), }, }, distance = 1.5 })
end)


function searchloot(name)
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
            TriggerServerEvent("Polar-HouseRobbery:Server:FindShit", name)
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
        local ped = PlayerPedId()
        StartAnimation()
        exports['Polar-UI']:Circle(function(success)
            if success then
                inside = true
                TriggerServerEvent("Polar-HouseRobbery:Server:Removeitem", 'advancedlockpick')
                TriggerServerEvent("Polar-HouseRobbery:Server:RemoveitemF", 'map')
                if GetPedDrawableVariation(ped, 1) == 0 then
                    QBCore.Functions.Notify(Lang:t("notify.donthavemask"))
                    callPolice(house)
                    TriggerEvent("Polar-HouseRobbery:goinside", house)
                else
                    TriggerEvent("Polar-HouseRobbery:goinside", house)
                end
            else
                QBCore.Functions.Notify(Lang:t("notify.messedup"), "error")
                StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
                ClearPedTasks(ped)
                TriggerServerEvent("Polar-HouseRobbery:Server:Removeitem", 'advancedlockpick')
            end
        end, 5, 10) 
end



--[[RegisterCommand('startrob', function()
    TriggerEvent('Polar-HouseRobbery:startrobbery')
end)]]


RegisterNetEvent('Polar-HouseRobbery:Client:RemoveTarget', function(name) exports['qb-target']:RemoveZone(name) end)
RegisterNetEvent('Polar-HouseRobbery:Client:CreateTarget', function(name, loc) 
    exports['qb-target']:AddCircleZone(name, loc, 0.5, { name = name, debugPoly = false, useZ=true  }, {
    options = { {   action = function() searchloot(name)  end, icon = "far fa-clipboard", label = Lang:t('label.loot'),  }, }, distance = 1.5 })
end)














function playeritem(items, amount)
        local PlayerData = QBCore.Functions.GetPlayerData()
        local isTable = type(items) == 'table'
        local isArray = isTable and table.type(items) == 'array' or false
        local totalItems = #items
        local count = 0
        local kvIndex = 2
        if isTable and not isArray then
            totalItems = 0
            for _ in pairs(items) do 
                local totalItems2 = totalItems + 1 
                totalItems = totalItems2
            end
            kvIndex = 1
        end
        for _, itemData in pairs(PlayerData.items) do
            if isTable then
                for k, v in pairs(items) do
                    local itemKV = {k, v}
                    if itemData and itemData.name == itemKV[kvIndex] and ((amount and itemData.amount >= amount) or (not isArray and itemData.amount >= v) or (not amount and isArray)) then
                        local count2 = count + 1 
                        count = count2
                    end
                end
                if count == totalItems then
                    return true
                end
            else -- Single item as string
                if itemData and itemData.name == items and (not amount or (itemData and amount and itemData.amount >= amount)) then
                    return true
                end
            end
        end
        return false
end