local QBCore = exports['qb-core']:GetCoreObject()



local noise = 0
local inside = false
local blip = nil

local npc = nil

local hi = false

local bagcolor = 'ch_p_m_bag_var03_arm_s'

local props = {}
local thirdtable = {
    'polar_hr_entry',
    'polar_hr_exit',
    

    'polar_hr_1',
    'polar_hr_2',
    'polar_hr_3',
    'polar_hr_4',
}

local proptable = {
    'houseprop1', 'houseprop2', 'houseprop3', 'houseprop4', 'houseprop5', 'houseprop6', 'houseprop7', 'houseprop8', 'houseprop9', 'houseprop10', 'houseprop11', 'houseprop12','houseprop13', 'houseprop14', 'houseprop15',
    'houseprop16', 'houseprop17',  'houseprop18', 'houseprop19', 'houseprop20', 'houseprop21', 'houseprop22', 'houseprop23', 'houseprop24', 'houseprop25', 'houseprop26','houseprop27', 'houseprop28', 'houseprop29',
    'houseprop30', 'houseprop31', 'houseprop32', 'houseprop33', 'houseprop34', 'houseprop35', 'houseprop36', 'houseprop37', 'houseprop38', 'houseprop39', 'houseprop40', 'houseprop41',
    'houseprop42', 'houseprop43', 'houseprop44', 'houseprop45', 'houseprop46', 'houseprop47', 'houseprop48', 'houseprop49', 'houseprop50',
}

local insidec = vector4(-174.28, 497.68, 137.66, 199.38)

local houseexit = vector3(-174.94, 497.89, 137.67)

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

function loadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(50) end end
function loadModel(model) if type(model) == 'number' then model = model else model = GetHashKey(model) end while not HasModelLoaded(model) do RequestModel(model) Wait(0) end end

RegisterNetEvent('Polar-HouseRobbery:Client:StartLoot', function(house)
 
     TriggerServerEvent('Polar-HouseRobbery:Server:SetupGrab1', house)
 
     TriggerServerEvent('Polar-HouseRobbery:Server:SetupPickup1', house)
     
     TriggerServerEvent('Polar-HouseRobbery:Server:SetupPiles1', house)
     
end)

RegisterNetEvent("Polar-HouseRobbery:Client:Start", function()
    QBCore.Functions.TriggerCallback('Polar-HouseRobbery:Server:Cooldown', function(result)
    if result then
        if playeritem("advancedlockpick") then
            TriggerServerEvent('Polar-HouseRobbery:Server:StartCooldown')
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
            break
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
    QBCore.Functions.TriggerCallback('Polar-HouseRobbery:Server:HouseOpen', function(result)
    if result then
        SetEntityCoords(PlayerPedId(), insidec.x, insidec.y, insidec.z)
        SetEntityHeading(PlayerPedId(), insidec.w)
        if GetPedDrawableVariation(ped, 1) == 0 then
            QBCore.Functions.Notify(Lang:t("notify.donthavemask"))
            callPolice(house)
        else
        end
    else
    if isNight() then
        if playeritem("advancedlockpick") then
            EntryMinigame(house)
        else
            QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
        end
    else
        if playeritem("advancedlockpick") then
            EntryMinigame(house)
        else
            QBCore.Functions.Notify(Lang:t("notify.donthaveitem"))
        end
    end
    end end)

    end, icon = "far fa-clipboard", label = Lang:t('label.entry'), }, }, distance = 1.5 })
end


RegisterNetEvent("Polar-HouseRobbery:goinside", function(house)
    SetEntityCoords(PlayerPedId(), insidec.x, insidec.y, insidec.z)
    SetEntityHeading(PlayerPedId(), insidec.w)
    TriggerServerEvent('Polar-HouseRobbery:Server:StartHouseOpen', house)
    TriggerServerEvent('Polar-HouseRobbery:Server:StartTargets', house)
    if isNight() then 
        TriggerEvent("Polar-HouseRobbery:Client:Noise", house)
    else
        callPolice(house)
    end
end)


RegisterNetEvent("Polar-HouseRobbery:Client:StartTargets", function(house)
    for _,v in ipairs(Config.LootSpots) do
        local n = v[1]
        local p = v[2] 
        TriggerServerEvent('Polar-HouseRobbery:Server:CreateTarget', n, p)  
    end
    exports['qb-target']:AddCircleZone("polar_hr_exit", houseexit, 0.5, {
    name = "polar_hr_exit",  debugPoly = false,  useZ=true }, {  options = { {   action = function()
    inside = false
    SetEntityCoords(PlayerPedId(), house.outside.x, house.outside.y, house.outside.z)
    SetEntityHeading(PlayerPedId(), house.outside.w)
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
            local chance = math.random(1,100)
            if chance <= 35 then
                local amount = math.random(1,3)
                StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
                TriggerServerEvent("Polar-HouseRobbery:Server:FindShit", name, amount)
                ClearPedTasks(PlayerPedId())
            else
                QBCore.Functions.Notify('You didnt find anything', 'error')
            end
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
                TriggerEvent("Polar-HouseRobbery:goinside", house)
                TriggerServerEvent("Polar-HouseRobbery:Server:Removeitem", 'advancedlockpick')
                if GetPedDrawableVariation(ped, 1) == 0 then
                    QBCore.Functions.Notify(Lang:t("notify.donthavemask"))
                    callPolice(house)
                else
                end
            else
                QBCore.Functions.Notify(Lang:t("notify.messedup"), "error")
                StopAnimTask(ped, "mp_arresting", "a_uncuff", 1.0)
                ClearPedTasks(ped)
                TriggerServerEvent("Polar-HouseRobbery:Server:Removeitem", 'advancedlockpick')
            end
        end, 5, 10) 
end

function Animation(door, prop)
    gloves()
    local props = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, GetEntityModel(prop), false, false, false)
    local propCoords = GetEntityCoords(prop)
    
  --  Wait(300)
        local model = bagcolor local animDict = 'anim@scripted@heist@ig1_table_grab@cash@male@' 
        
            local playerCoords = GetEntityCoords(PlayerPedId())
            local propCoords = GetEntityCoords(props)
            local direction = vector3(propCoords.x - playerCoords.x, propCoords.y - playerCoords.y, propCoords.z - playerCoords.z)
            local heading = -math.atan2(direction.x, direction.y) * 180.0 / math.pi
            local pitch = math.asin(direction.z / #(direction)) * 180.0 / math.pi

        local dotProduct = Citizen.InvokeNative(0xBFE95ABAF46CD9B8, direction.x, direction.y, direction.z, 0.0, 0.0, 1.0)
        if dotProduct then else 
   
        SetEntityHeading(PlayerPedId(), heading)
     --   SetEntityRotation(PlayerPedId(), pitch, 0.0, heading, 2, true)
    
    
    TriggerServerEvent('Polar-HouseRobbery:Server:RemoveTarget', door)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 1, 1)
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    loadAnimDict(animDict) loadModel(model) local bag = CreateObject(GetHashKey(model), playerCoords, 1, 1, 0)
    local scene1 = NetworkCreateSynchronisedScene(propCoords, GetEntityRotation(PlayerPedId()), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene1, animDict, 'enter', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene1, animDict,'enter_bag', 1.0, -1.0, 1148846080)
    local scene2 = NetworkCreateSynchronisedScene(propCoords, GetEntityRotation(PlayerPedId()), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene2, animDict, 'grab', 4.0, -4.0, 1033, 0, 1000.0, 0) NetworkAddEntityToSynchronisedScene(bag, scene2, animDict, 'grab_bag', 1.0, -1.0, 1148846080)
    local scene3 = NetworkCreateSynchronisedScene(propCoords, GetEntityRotation(PlayerPedId()), 2, true, false, 1065353216, 0, 1.3)  NetworkAddPedToSynchronisedScene(PlayerPedId(), scene3, animDict, 'exit', 4.0, -4.0, 1033, 0, 1000.0, 0)  NetworkAddEntityToSynchronisedScene(bag, scene3, animDict, 'exit_bag', 1.0, -1.0, 1148846080)
    SetPedComponentVariation(PlayerPedId(), 5, Config.HideBagID, 0, 1) NetworkStartSynchronisedScene(scene1) Wait(1000)
    NetworkStartSynchronisedScene(scene2)
    FreezeEntityPosition(props, true)
    SetEntityInvincible(props, true)
    SetEntityNoCollisionEntity(props, PlayerPedId())
    Wait(100)
    Wait(100)
    Wait(100)
    AttachEntityToEntity(props, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xFA60), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
    Wait(300) SetEntityVisible(props, false, false)
    TriggerServerEvent('Polar-HouseRobbery:Server:RemoveProp', door)
    NetworkStartSynchronisedScene(scene3) Wait(900) ClearPedTasks(PlayerPedId()) DeleteObject(bag) SetPedComponentVariation(PlayerPedId(), 5, Config.BagUseID, 0, 1)
    LocalPlayer.state:set('inv_busy', false, true)  
    TriggerServerEvent('Polar-HouseRobbery:Server:Synapse', door, sped)  
    
    RemoveAnimDict(animDict)
    end
   
end 


RegisterNetEvent('Polar-HouseRobbery:Client:RemoveTarget', function(name) exports['qb-target']:RemoveZone(name) end)
RegisterNetEvent('Polar-HouseRobbery:Client:CreateTarget', function(names, loc) 
    exports['qb-target']:AddCircleZone(names, loc, 0.5, { name = names, debugPoly = false, useZ=true  }, {
    options = { {   action = function() searchloot(names)  end, icon = "far fa-clipboard", label = Lang:t('label.loot'),  }, }, distance = 1.5 })
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




RegisterNetEvent('Polar-HouseRobbery:Client:HouseProp', function(name, prop, var) 
    loadModel(prop) 
    props[name] =  CreateObject(prop, var.x, var.y, var.z,  false,  true, true) 
    SetEntityHeading(props[name], var.w) 
end)
RegisterNetEvent('Polar-HouseRobbery:Client:RemoveProp', function(name)  DeleteEntity(props[name]) end)




RegisterNetEvent('Polar-HouseRobbery:Client:Target', function(data)  
    local p = data.type 
    local door = props[p]
    Wait(50)
    Animation(p, door)  
end)

RegisterNetEvent('Polar-HouseRobbery:Client:ResetProps', function()
    for _, v in ipairs(proptable) do
        exports['qb-target']:RemoveZone(v)
        if DoesEntityExist(props[v]) then DeleteEntity(props[v]) end
    end
    for _, v in ipairs(thirdtable) do 
       exports['qb-target']:RemoveZone(v)
    end
end)


RegisterNetEvent('Polar-HouseRobbery:Client:PickupTarget', function(data) 
    gloves()
    LocalPlayer.state:set('inv_busy', true, true) -- Busy
    local door = data.type 
    local pile = data.piles
    Wait(50)
    if pile then  
        TriggerServerEvent('Polar-HouseRobbery:Server:RemoveTarget', door) 
        loadAnimDict('amb@medic@standing@kneel@base')
        loadAnimDict('anim@gangops@facility@servers@bodysearch@')
        TaskPlayAnim(PlayerPedId(), 'amb@medic@standing@kneel@base', 'base', 8.0, 8.0, -1, 1, 0, false, false, false)
        TaskPlayAnim(PlayerPedId(), 'anim@gangops@facility@servers@bodysearch@', 'player_search', 8.0, 8.0, -1, 48, 0, false, false, false)
        Wait(5000)
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent('Polar-HouseRobbery:Server:RemoveProp', door)
        RemoveAnimDict('amb@medic@standing@kneel@base')
        RemoveAnimDict('anim@gangops@facility@servers@bodysearch@')
    else
        loadAnimDict('random@domestic') TaskPlayAnim(PlayerPedId(), 'random@domestic', 'pickup_low', 3.0, 3.0, -1, 0, 0, 0, 0, 0) 
        TriggerServerEvent('Polar-HouseRobbery:Server:RemoveTarget', door) 
       
        Wait(500)
        
        AttachEntityToEntity(props[door], PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 58867), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, true, 0, true)
        Wait(1000) SetEntityVisible(props[door], false, false)

        TriggerServerEvent('Polar-HouseRobbery:Server:RemoveProp', door)
        RemoveAnimDict('random@domestic')
    end
        TriggerServerEvent('Polar-HouseRobbery:Server:Synapse', door)    
        LocalPlayer.state:set('inv_busy', false, true)
       
end)


function gloves()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3) local model = GetEntityModel(PlayerPedId()) local retval = true if model == 'mp_m_freemode_01' then if Config.MaleGloves[armIndex] ~= nil 
    and Config.MaleGloves[armIndex] then retval = false end else if Config.FemaleGloves[armIndex] ~= nil and Config.FemaleGloves[armIndex] then retval = false end end return retval
end



RegisterNetEvent('Polar-HouseRobbery:Client:AddTarget', function(door, prop, var, handle, pile, d) 
    exports['qb-target']:AddBoxZone(door, vec3(var.x, var.y, var.z), 0.5, 0.5, { name = door, heading = 28.69, debug = hi, minZ = var.z - 1.5, maxZ =  var.z + 1.5,}, 
    { options = {{ event = handle, type = door, piles = pile, icon = "fas fa-bolt", label = "Grab"}}, distance = d }) 
end)
