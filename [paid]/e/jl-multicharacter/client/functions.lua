--- DON'T TOUCH
---@type number
Cam = nil
CurCam = nil
SkinLoaded = {}
SpawnedPeds = {}

local Config = require "shared.config"
local DebugCon = require 'shared.functions.utils'.DebugCon

--- Enabling the multicharacter
---@param status boolean
---@param setwelcome? boolean
function EnableMenu(status, setwelcome)
    if status then
        DebugCon("Opening menu, set welcome: " .. tostring(setwelcome))
        TriggerServerEvent("jl-multicharacter:server:setBucket", true)
        lib.callback("jl-multicharacter:server:setupChar", false, function(result)
            if result[1] then
                SendNUIMessage({
                    action = "toggle",
                    data = {
                        status = true,
                        type = "getChar",
                        character = result,
                        welcome = setwelcome,
                        selected = 1,
                        disableDelete = Config.DisableDelete
                    }
                })
                SetDisplay(true)
                TriggerEvent("jl-multicharacter:client:setupPeds", result)
            else
                SendNUIMessage({
                    action = "toggle",
                    data = {
                        status = true,
                        type = "noChar",
                        welcome = true,
                        selected = 1
                    }
                })
                SetDisplay(true)
                TriggerEvent("jl-multicharacter:client:setupPeds")
            end
        end)
    else
        TriggerEvent("qb-weathersync:client:EnableSync")
        TriggerServerEvent("jl-multicharacter:server:setBucket", false)
        SetDisplay(false)
        SendNUIMessage({
            action = "toggle",
            data = {
                status = false,
                type = "reset",
            }
        })
    end
end

function SetCamera(bool)
    TriggerEvent("qb-weathersync:client:EnableSync")
    if bool then
        DebugCon("Setting up the camera..")
        SetTimecycleModifier("V_FIB_IT3")
        local Heading = GetEntityHeading(SpawnedPeds[1]) + 180
        local Offset = GetOffsetFromEntityInWorldCoords(SpawnedPeds[1], 0, 2.0, 0)
        Cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", Offset.x, Offset.y, Offset.z,
            0.0, 0.0, Heading, 60.00, false, 0)
        SetCamActive(Cam, true)
        RenderScriptCams(true, false, 1, true, true)
        -- DON'T TOUCH
        CurCam = 1
    else
        DebugCon("Destroying camera..")
        SetTimecycleModifier('default')
        SetCamActive(Cam, false)
        DestroyCam(Cam, true)
        RenderScriptCams(false, false, 1, true, true)
        SetEntityCoords(PlayerPedId(), Config.DefaultCoords.x, Config.DefaultCoords.y, Config.DefaultCoords.z, true,
            false, false, false)
        SetEntityHeading(PlayerPedId(), Config.DefaultCoords.w)
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true, false)
        TriggerScreenblurFadeOut(500)
        Cam = nil
        CurCam = nil
    end
end

--[[
if Config.cam then
    exports('SetCamera', SetCamera)
end
]]

function SetDisplay(bool)
    DebugCon("Set Display to: " .. tostring(bool))
    Display = bool
    SetNuiFocus(bool, bool)
end
