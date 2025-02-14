-- Toggles Invincibility
local visible = true
RegisterNetEvent('adminmenu:client:ToggleInvisible', function(data)
	if not CheckPerms(data.perms) then return end
	visible = not visible

	SetEntityVisible(cache.ped, visible, 0)
end)

-- God Mode
local godmode = false
RegisterNetEvent('adminmenu:client:ToggleGodmode', function(data)
	if not CheckPerms(data.perms) then return end
	godmode = not godmode

    if godmode then
        QBCore.Functions.Notify(locale("godmode", "enabled"), 'primary')
        while godmode do
            Wait(0)
            SetPlayerInvincible(cache.playerId, true)
        end
        SetPlayerInvincible(cache.playerId, false)
        QBCore.Functions.Notify(locale("godmode", "disabled"), 'primary')
    end
end)

-- Cuff/Uncuff
RegisterNetEvent('adminmenu:client:ToggleCuffs', function(player)
    local target = GetPlayerServerId(player)
    TriggerEvent("police:client:GetCuffed", target)
end)

-- Copy Coordinates
local function CopyCoords(data)
    local coords = GetEntityCoords(cache.ped)
	local heading = GetEntityHeading(cache.ped)
    local formats = { vector2 = "%.2f, %.2f", vector3 = "%.2f, %.2f, %.2f", vector4 = "%.2f, %.2f, %.2f, %.2f", heading = "%.2f" }
    local format = formats[data]

	local values = {coords.x, coords.y, coords.z, heading}
	lib.setClipboard(string.format(format, table.unpack(values, 1, #format)))
end

RegisterCommand("vector2", function()
	CopyCoords("vector2")
end, false)

RegisterCommand("vector3", function()
	CopyCoords("vector3")
end, false)

RegisterCommand("vector4", function()
	CopyCoords("vector4")
end, false)

RegisterCommand("heading", function()
	CopyCoords("heading")
end, false)

-- Infinite Ammo
local InfiniteAmmo = false
RegisterNetEvent('adminmenu:client:setInfiniteAmmo', function(data)
	if not CheckPerms(data.perms) then return end
    InfiniteAmmo = not InfiniteAmmo

    if GetAmmoInPedWeapon(cache.ped, cache.weapon) < 6 then
        SetAmmoInClip(cache.ped, cache.weapon, 10)
        Wait(50)
    end

    while InfiniteAmmo do
        SetPedInfiniteAmmo(cache.ped, true, cache.weapon)
        RefillAmmoInstantly(cache.ped)
        Wait(250)
    end

    SetPedInfiniteAmmo(cache.ped, false, cache.weapon)
end)

-- Toggle coords
local showCoords = false
local function showCoordsMenu()
    while showCoords do
        Wait(50)
        local coords = GetEntityCoords(PlayerPedId())
        local heading = GetEntityHeading(PlayerPedId())
        SendNUIMessage({
            action = "showCoordsMenu",
            data = {
                show = showCoords,
                x = QBCore.Shared.Round(coords.x, 2),
                y = QBCore.Shared.Round(coords.y, 2),
                z = QBCore.Shared.Round(coords.z, 2),
                heading = QBCore.Shared.Round(heading, 2)
            }
        })
    end
end

RegisterNetEvent('adminmenu:client:ToggleCoords', function(data)
    if not CheckPerms(data.perms) then return end

    showCoords = not showCoords

    if showCoords then
        CreateThread(showCoordsMenu)
    end
end)

-- Set Ammo
RegisterNetEvent('adminmenu:client:SetAmmo', function(data, selectedData)
    if not CheckPerms(data.perms) then return end

    local ammo = selectedData["Ammo Ammount"].value
    local weapon = GetSelectedPedWeapon(cache.ped)

    if weapon ~= nil then
        SetPedAmmo(cache.ped, weapon, ammo)
        QBCore.Functions.Notify(locale("set_wepaon_ammo", tostring(ammo)), 'success')
    else
        QBCore.Functions.Notify(locale("no_weapon"), 'error')
    end
end)

--Toggle Dev
local ToggleDev = false

RegisterNetEvent('adminmenu:client:ToggleDev', function(data)
    if not CheckPerms(data.perms) then return end

    ToggleDev = not ToggleDev

    TriggerEvent('adminmenu:client:ToggleCoords', data)    -- toggle Coords
    TriggerEvent('adminmenu:client:ToggleGodmode', data)   -- Godmode

    QBCore.Functions.Notify(locale("toggle_dev"), 'success')
end)
