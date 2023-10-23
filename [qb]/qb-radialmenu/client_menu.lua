local QBCore = exports['qb-core']:GetCoreObject()

local showMenu = false

-- Keybind Lookup table
local keybindControls = {
	["`"] = 243, ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18, ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182, ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81, ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178, ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173, ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local MAX_MENU_ITEMS = 7

-- Main thread
Citizen.CreateThread(function()
    local keyBind = "F1"
    local keyBind2 = "-"
    while true do
        Citizen.Wait(0)
        SetBigmapActive(false, false)
        if IsControlPressed(1, keybindControls[keyBind]) or IsControlPressed(1, keybindControls[keyBind2]) and GetLastInputMethod(2) and showMenu then
            showMenu = false
            SetNuiFocus(false, false)
        end
        if IsControlPressed(1, keybindControls[keyBind]) or IsControlPressed(1, keybindControls[keyBind2]) and GetLastInputMethod(2) then
            showMenu = true
            local enabledMenus = {}
            for _, menuConfig in ipairs(rootMenuConfig) do
                if menuConfig:enableMenu() then
                    local dataElements = {}
                    local hasSubMenus = false
                    if menuConfig.subMenus ~= nil and #menuConfig.subMenus > 0 then
                        hasSubMenus = true
                        local previousMenu = dataElements
                        local currentElement = {}
                        for i = 1, #menuConfig.subMenus do
                            -- if newSubMenus[menuConfig.subMenus[i]] ~= nil and newSubMenus[menuConfig.subMenus[i]].enableMenu ~= nil and not newSubMenus[menuConfig.subMenus[i]]:enableMenu() then
                            --     goto continue
                            -- end
                            currentElement[#currentElement+1] = newSubMenus[menuConfig.subMenus[i]]
                            currentElement[#currentElement].id = menuConfig.subMenus[i]
                            currentElement[#currentElement].enableMenu = nil

                            if i % MAX_MENU_ITEMS == 0 and i < (#menuConfig.subMenus - 1) then
                                previousMenu[MAX_MENU_ITEMS + 1] = {
                                    id = "_more",
                                    title = "More",
                                    icon = "#more",
                                    items = currentElement
                                }
                                previousMenu = currentElement
                                currentElement = {}
                            end
                            --::continue::
                        end
                        if #currentElement > 0 then
                            previousMenu[MAX_MENU_ITEMS + 1] = {
                                id = "_more",
                                title = "More",
                                icon = "#more",
                                items = currentElement
                            }
                        end
                        dataElements = dataElements[MAX_MENU_ITEMS + 1].items

                    end
                    enabledMenus[#enabledMenus+1] = {
                        id = menuConfig.id,
                        title = menuConfig.displayName,
                        functionName = menuConfig.functionName,
                        icon = menuConfig.icon,
                    }
                    if hasSubMenus then
                        enabledMenus[#enabledMenus].items = dataElements
                    end
                end
            end
            SendNUIMessage({
                state = "show",
                resourceName = GetCurrentResourceName(),
                data = enabledMenus,
                menuKeyBind = keyBind
            })
            SetCursorLocation(0.5, 0.5)
            SetNuiFocus(true, true)

            -- Play sound
            PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)


            while showMenu == true do Citizen.Wait(100) end
            Citizen.Wait(100)
            while IsControlPressed(1, keybindControls[keyBind]) or IsControlPressed(1, keybindControls[keyBind2]) and GetLastInputMethod(2) do Citizen.Wait(100) end
        end
    end
end)
-- Callback function for closing menu
RegisterNUICallback('closemenu', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Send ACK to callback function
    cb('ok')
end)

-- Callback function for when a slice is clicked, execute command
RegisterNUICallback('triggerAction', function(data, cb)
    -- Clear focus and destroy UI
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })

    -- Play sound
    PlaySoundFrontend(-1, "NAV", "HUD_AMMO_SHOP_SOUNDSET", 1)

    -- Run command
    --ExecuteCommand(data.action)
    TriggerEvent(data.action, data.parameters)

    -- Send ACK to callback function
    cb('ok')
end)

RegisterNetEvent("menu:menuexit")
AddEventHandler("menu:menuexit", function()
    showMenu = false
    SetNuiFocus(false, false)
end)

RegisterCommand("nui_false", function(source, args)
    showMenu = false
    SetNuiFocus(false, false)
    SendNUIMessage({
        state = 'destroy'
    })
end)





local TattoShops = {
	vector3(1322.6, -1651.9, 51.2),
	vector3(-1153.6, -1425.6, 4.9),
	vector3(322.1, 180.4, 103.5),
	vector3(-3170.0, 1075.0, 20.8),
	vector3(1864.6, 3747.7, 33.0),
	vector3(-293.7, 6200.0, 31.4)
}

local BarberShops = {
	vector3(-814.308, -183.823, 36.568),
	vector3(136.826, -1708.373, 28.291),
	vector3(-1282.604, -1116.757, 5.990),
	vector3(1931.513, 3729.671, 31.844),
	vector3(1212.840, -472.921, 65.208),
	vector3(-32.885, -152.319, 56.076),
	vector3(-278.077, 6228.463, 30.695),
}

local GasStations = {
	vector3(49.4187, 2778.793, 58.043),
	vector3(263.894, 2606.463, 44.983),
	vector3(1039.958, 2671.134, 39.550),
	vector3(1207.260, 2660.175, 37.899),
	vector3(2539.685, 2594.192, 37.944),
	vector3(2679.858, 3263.946, 55.240),
	vector3(2005.055, 3773.887, 32.403),
	vector3(1687.156, 4929.392, 42.078),
	vector3(1701.314, 6416.028, 32.763),
	vector3(179.857, 6602.839, 31.868),
	vector3(-94.4619, 6419.594, 31.489),
	vector3(-2554.996, 2334.40, 33.078),
	vector3(-1800.375, 803.661, 138.651),
	vector3(-1437.622, -276.747, 46.207),
	vector3(-2096.243, -320.286, 13.168),
	vector3(-724.619, -935.1631, 19.213),
	vector3(-526.019, -1211.003, 18.184),
	vector3(-70.2148, -1761.792, 29.534),
	vector3(265.648, -1261.309, 29.292),
	vector3(819.653, -1028.846, 26.403),
	vector3(1208.951, -1402.567,35.224),
	vector3(1181.381, -330.847, 69.316),
	vector3(620.843, 269.100, 103.089),
	vector3(2581.321, 362.039, 108.468),
	vector3(176.631, -1562.025, 29.263),
	vector3(176.631, -1562.025, 29.263),
	vector3(-319.292, -1471.715, 30.549),
	vector3(1784.324, 3330.55, 41.253)
}

local ClothingStores = {
    vector3(-1448.72, -238.91, 49.81),
    vector3(1693.54, 4830.79, 42.07),
    vector3(-1199.32, -769.85, 17.31),
    vector3(426.22, -798.37, 29.49),
    vector3(-165.53, -302.4, 39.73),
    vector3(74.64, -1400.79, 29.38),
    vector3(-829.6, -1076.86, 11.33),
    vector3(-1450.711, -236.83, 48.809),
    vector3(11.15, 6517.19, 31.88),
    vector3(612.51, 2756.6, 42.09),
    vector3(1188.79, 2710.86, 38.22),
    vector3(-3166.18, 1048.37, 20.86),
    vector3(-1107.81, 2705.86, 19.11),
    vector3(129.91, -218.86, 54.56), 
}

local Banks = {
    vector3(149.46, -1042.09, 29.37),
    vector3(313.84, -280.58, 54.16),
    vector3(241.44, 227.19, 106.29),
    vector3(-351.23, -51.28, 49.04),
    vector3(-1211.9, -331.9, 37.78),
    vector3(-2961.14, 483.09, 15.7),
    vector3(1174.8, 2708.2, 38.09),
    vector3(-110.77, 6469.91, 31.63),
}

local HardwareStores = {
    vector3(46.52, -1749.55, 29.64),
    vector3(2747.76, 3472.9, 55.6),
    vector3(-421.65, 6135.97, 31.88),

}

RegisterNetEvent("blips:gasstations", function()
    local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords
	for k,v in pairs(GasStations) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)
		if dstcheck < closest then
			closest = dstcheck
            closestCoords = v
        end
    end
    SetNewWaypoint(closestCoords)
end)
RegisterNetEvent("blips:clothings", function()
    local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords
	for k,v in pairs(ClothingStores) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)
		if dstcheck < closest then
			closest = dstcheck
            closestCoords = v
        end
    end
    SetNewWaypoint(closestCoords)
end)
RegisterNetEvent("blips:hardware", function()
    local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords
	for k,v in pairs(HardwareStores) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)
		if dstcheck < closest then
			closest = dstcheck
            closestCoords = v
        end
    end
    SetNewWaypoint(closestCoords)
end)
RegisterNetEvent("blips:banks", function()
    local currentGasBlip = 0
	local coords = GetEntityCoords(PlayerPedId())
	local closest = 1000
	local closestCoords
	for k,v in pairs(Banks) do
		local dstcheck = GetDistanceBetweenCoords(coords, v)
		if dstcheck < closest then
			closest = dstcheck
            closestCoords = v
        end
    end
    SetNewWaypoint(closestCoords)
end)