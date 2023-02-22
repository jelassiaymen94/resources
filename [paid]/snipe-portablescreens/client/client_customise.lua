QBCore, ESX = nil, nil


local object = {GetHashKey("v_ilev_mm_screen2")} -- do not change

exports["qb-target"]:AddTargetModel(object, {
    options = {
        {
            event = "snipe-portablescreens:client:changeImage",
            icon = "fas fa-circle",  -- you can change this
            label = "Change", -- you can change this
        },
    },
    distance = 20.0, -- you can change this
})

-- for qtarget
--[[
    exports.qtarget:AddTargetModel(object, {
	options = {
        {
            event = "snipe-portablescreens:client:changeImage",
            icon = "fas fa-circle",  -- you can change this
            label = "Change Texture", -- you can change this
        },
	},
	distance = 2
})
]]--

CreateThread(function()
    if Config.Core == "ESX" then
        ESX = exports[Config.CoreFolderName]:getSharedObject()
        
        RegisterNetEvent('esx:playerLoaded')
        AddEventHandler('esx:playerLoaded', function(xPlayer)
            TriggerServerEvent("snipe-portablescreens:server:getdata")
        end)

    elseif Config.Core == "QBCore" then
        TriggerEvent(Config.Triggers["getObject"], function(obj) QBCore = obj end)
        if QBCore == nil then
            QBCore = exports[Config.CoreFolderName]:GetCoreObject()
        end

        RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
        AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
            TriggerServerEvent("snipe-portablescreens:server:getdata")
        end)
    end
end)

function ShowNotification(msg, type)
    if Config.Core == "QBCore" and Config.Notify['QBCore'] then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Core == "ESX" and Config.Notify['ESX'] then
        ESX.ShowNotification(msg)
    elseif Config.Notify['okokNotify'] then
        exports['okokNotify']:Alert(Config.OkOkNotifyTitle, msg, 5000, type)
    elseif Config.Notify['pNotify'] then
        exports.pNotify:SendNotification({text = msg, type = type, layout = Config.pNotifyLayout, timeout = 5000})
    end
end

-- Command if you restart script while in server. Comment it on live server. You can enable on test

RegisterCommand("getscreens", function()
    TriggerServerEvent("snipe-portablescreens:server:getdata")
end)