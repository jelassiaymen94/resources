local QBCore = exports['qb-core']:GetCoreObject()


local busy = nil
local sound = nil
local prop = nil
local blip = nil

local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)

local phoneProp = 0
local phoneModel = 'prop_npc_phone_02'

local function LoadAnimation(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Wait(1)
	end
end

function newPhoneProp()
	deletePhone()
	RequestModel(phoneModel)
	while not HasModelLoaded(phoneModel) do
		Wait(1)
	end
	phoneProp = CreateObject(phoneModel, 1.0, 1.0, 1.0, 1, 1, 0)

	local bone = GetPedBoneIndex(PlayerPedId(), 28422)
	if phoneModel == 'prop_cs_phone_01' then
		AttachEntityToEntity(phoneProp, PlayerPedId(), bone, 0.0, 0.0, 0.0, 50.0, 320.0, 50.0, 1, 1, 0, 0, 2, 1)
	else
		AttachEntityToEntity(phoneProp, PlayerPedId(), bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
	end
end

function deletePhone()
	if phoneProp ~= 0 then
		DeleteObject(phoneProp)
		phoneProp = 0
	end
end

function DoPhoneAnimation(anim)
    local ped = PlayerPedId()
    local AnimationLib = 'cellphone@'
    local AnimationStatus = anim
    if IsPedInAnyVehicle(ped, false) then
        AnimationLib = 'anim@cellphone@in_car@ps'
    end
    LoadAnimation(AnimationLib)
    TaskPlayAnim(ped, AnimationLib, AnimationStatus, 3.0, 3.0, -1, 50, 0, false, false, false)
    
    
end

RegisterNetEvent('Polar-Misc:Client:StartRun', function()
    local coords = vector3(2816.63, 4752.28, 46.97)
    Wait(5)

    busy = true

    --findsound()
    --if sound ~= nil then
    playsound()
    --Wait(20000)
    
    deletePhone()
    ClearPedTasks(PlayerPedId())

    RequestModel('prop_drug_package')
    while not HasModelLoaded('prop_drug_package') do
        Wait(100)
    end
    local prop = CreateObject('prop_drug_package', vector3(2816.63, 4752.28, 46.97), false, true, false)
    PlaceObjectOnGroundProperly(prop)
    FreezeEntityPosition(prop, true)


    local blip = AddBlipForEntity(prop)
    SetBlipSprite (blip, 501)
    SetBlipDisplay(blip, 6) 
    SetBlipScale  (blip, 0.75)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 0)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Location")
    EndTextCommandSetBlipName(blip)

    exports['qb-target']:AddTargetModel('prop_drug_package', {
        options = {
            {
                type = "Client",
                event = "Polar-Misc:Client:PickupProp",
                icon = "fa-solid fa-bolt",
                label = "Pick Up",
            },
        },
        distance = 1.5
    })
   

    
    --else
   --     TriggerEvent('Polar-Misc:Client:StartRun')
   -- end
end)
RegisterNetEvent('Polar-Misc:Client:PickupProp', function()

    Wait(5)

    DeleteObject(prop)
    
    Wait(5)

    RemoveBlip(blip)

    Wait(5)
    
    endmission()

end)
function playsound()
    local luck = math.random(1,100)
    if luck < 10 then 
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 20 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 30 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 40 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 50 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 60 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 70 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 80 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 90 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    elseif luck < 101 then
        TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, 'panicbutton', 0.35)
    end
end
function endmission()

    Wait(5)

    busy = false



end

function breakphone()

    if Config.BreakPhone then
        local chance = math.random(1,100)
            if Config.BreakChance >= 85 then
                QBCore.Functions.Notify('Your Phone Broke', 'error')
                if Config.Debug then print('phone broke') end
                TriggerServerEvent('Polar-Weed:Server:RemovePhone')
            else
                QBCore.Functions.Notify('Your Phone Almost Broke', 'error')
                if Config.Debug then print('phone almost broke') end
            end
    end
end
function phone()
    if not busy then
       
        newPhoneProp()
        DoPhoneAnimation('cellphone_call_listen_base')
        
        
    QBCore.Functions.Progressbar("searcing", "Calling...", 7500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        breakphone()
        QBCore.Functions.Notify("Called Uknown Number", green, alerttime)
        deletePhone()
        TriggerEvent('Polar-Misc:Client:StartRun')
      

    end, function() -- Cancel
        
        QBCore.Functions.Notify("Canceled", red, alerttime)
        
    end)
    
    else
        QBCore.Functions.Notify("You are already on a Mission", red, alerttime)
        
    end
end
RegisterNetEvent('Polar-Misc:Client:BurnerCops', function()
    QBCore.Functions.TriggerCallback("Polar-Misc:Server:GetPolice", function(result)
        if result >= 0 then

            phone()
          

        else if result < 0 then
            QBCore.Functions.Notify('There are not enough police', 'error')
                -- debug
        if Config.Debug then print('not enough police') end
        return end

    end
    end)
end)