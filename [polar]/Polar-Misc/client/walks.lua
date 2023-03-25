local QBCore = exports['qb-core']:GetCoreObject()

local PlayerData = {}
local currentWalk = 'default'

-- Walk Styles Menu --
RegisterNetEvent('Polar-Misc:client:Menu', function()
    local walkStyles = {}

   
        walkStyles[#walkStyles+1] = {
            header = 'Refresh Current Walk Style',
            params = {
                isServer = true,
                event = 'Polar-Misc:server:GetWalkStyle',
            }
        }

        for r = 1, #Config.Styles, 1 do
            walkStyles[#walkStyles+1] = {
                header = Config.Styles[r].name,
                params = {
                    event = 'Polar-Misc:client:SetWalkStyle',
                    args = Config.Styles[r].value
                }
            }
        end

        walkStyles[#walkStyles+1] = {
            header = 'Close Menu',
            params = {
                event = 'qb-menu:client:closeMenu',
            }
        }

        exports['qb-menu']:openMenu(walkStyles)
   
end)



-- Set Walk Style (Send to Server & Set Metadata) --
local function WalkStyle(walk)
	local ped = PlayerPedId()
	if walk == 'default' then
		ResetPedMovementClipset(ped)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	else
		RequestAnimSet(walk)
		while not HasAnimSetLoaded(walk) do Wait(0) end
		SetPedMovementClipset(ped, walk)
		ResetPedWeaponMovementClipset(ped)
		ResetPedStrafeClipset(ped)
	end
    TriggerServerEvent('Polar-Misc:server:SetWalkStyle', walk)
   
end

-- Reset Walking Style --
local function GetWalkStyle()
    TriggerServerEvent('Polar-Misc:server:GetWalkStyle')
end
exports('GetWalkStyle', GetWalkStyle)

-- Set Walk Style --
RegisterNetEvent('Polar-Misc:client:SetWalkStyle', function(walk)
    currentWalk = walk
	WalkStyle(walk)
end)

-- Menu Command --
RegisterCommand('walks', function()
    TriggerEvent('Polar-Misc:client:Menu')
end, false)

-- Constantly Reset Walk Style --
CreateThread(function()
    while true do
        Wait(1000)
        local walking = GetPedMovementClipset(PlayerPedId())
        if walking ~= joaat(currentWalk) or currentWalk == "default" then -- Gets integer value of currentWalk, compares it to current clipset
            GetWalkStyle()
            
        end
    end
end)

-- Player Shit --
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function(playerData)
	PlayerData = QBCore.Functions.GetPlayerData()
    Wait(500)
	GetWalkStyle()-- Get Walking Style on Player Load
end)
