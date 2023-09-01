local QBCore = exports['qb-core']:GetCoreObject()

local prop = nil
local cammode = 0
local function TextInput()
    local text = exports['qb-input']:ShowInput({
        header = "Polaroid Pictures",
        submitText = "Enter",
        inputs = {
            {
                text = "Name Your Picture!", -- text you want to be displayed as a place holder
                name = "thenameofthepolaroid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = false, 
            },
        },
    })
    if text ~= nil then
        for _, v in pairs(text) do
            return v
        end
    else
        return ""
    end
end
local function TextInput2()
    AddTextEntry("FMMC_KEY_TIP8", "Enter the title of the image")
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 100)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        return result
    else
        return nil
    end
end

local function GetWebhook()
    local promise = promise.new()

    QBCore.Functions.TriggerCallback('polaroid:server:webhook', function(webhook)
        promise:resolve(webhook)
    end)

    return Citizen.Await(promise)
end


local function TakePicture()
    local webhook = GetWebhook()
    local title = TextInput()


    if webhook == nil then
        return
    end

    exports['screenshot-basic']:requestScreenshotUpload(webhook, 'files[]', function(data)
        local image = json.decode(data)
        local url = image.attachments[1].proxy_url
        TriggerServerEvent("polaroid:server:getimage", url, title)
    end)
end

local function CameraLoop()
    CreateThread(function()
     

     --   cammode = GetFollowPedCamViewMode()

        while true do
            DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing    
            Wait(0)
            SetFollowPedCamViewMode(4)        
            if IsControlJustPressed(0, 18) then
                Wait(1)
                TakePicture()
                Wait(1)
               -- SetFollowPedCamViewMode(cammode)
                return
            end
        end
    end)
end

RegisterNetEvent("polaroid:client:camera", CameraLoop)