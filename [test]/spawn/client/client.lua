local QBCore = exports['qb-core']:GetCoreObject()


local camZPlus1 = 1000
local camZPlus2 = 50
local pointCamCoords = 75
local pointCamCoords2 = 0
local cam1Time = 500
local cam2Time = 1000
local _LastLocation = nil


local function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
end
--[[
RegisterCommand('spawnM', function()
  TriggerEvent('ivs_spawns:openMenu')
end)
]]

RegisterNetEvent('ivs_spawns:openMenu', function(lastLocation)

  toggleNuiFrame(true)
  --debugPrint('Show NUI frame')
  --print(Config.LastLocation)
  SendReactMessage('setLocations', {locations = Config.Locations,lastLocation = Config.LastLocation})
  _LastLocation = lastLocation

  cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", -206.19, -1013.78, 30.13 + camZPlus1, -85.00, 0.00, 0.00, 100.00, false, 0)
  SetCamActive(cam, true)
  RenderScriptCams(true, false, 1, true, true)
  

 
end)

RegisterNUICallback('hideFrame', function(_, cb)
  TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 20.0, "panicbutton", 0.35)
  toggleNuiFrame(false)
  --debugPrint('Hide NUI frame')
  cb({})
end)
RegisterNUICallback('spawnCharacter', function(data, cb)
  local ped = PlayerPedId()
  local PlayerData = QBCore.Functions.GetPlayerData()
  local insideMeta = PlayerData.metadata["inside"]

  if data.label == 'Last Location' then
    QBCore.Functions.GetPlayerData(function(pd)
      if pd ~= nil then
        spawnCoords = {x = pd.position.x, y = pd.position.y, z = pd.position.z}
      else
        spawnCoords = Config.DefaultSpawn
      end
    end)
  else
    spawnCoords = {x = data.x, y = data.y, z = data.z}
  end
  

  toggleNuiFrame(false)
  SpawnPlayer(spawnCoords)
  
end)

local cloudOpacity = 0.01
local muteSound = true

function ToggleSound(state)
    if state then
        StartAudioScene("MP_LEADERBOARD_SCENE");
    else
        StopAudioScene("MP_LEADERBOARD_SCENE");
    end
end

function ClearScreen()
    SetCloudHatOpacity(cloudOpacity)
    HideHudAndRadarThisFrame()
    SetDrawOrigin(0.0, 0.0, 0.0, 0)
end


function InitialSetup()
    ToggleSound(muteSound)
    SwitchOutPlayer(PlayerPedId(), 0, 1)
end
function SpawnPlayer(Location)
  local pos = Location
  local ped = PlayerPedId()
  FreezeEntityPosition(PlayerPedId(), true)
  SetNuiFocus(false, false)
  InitialSetup()
  Wait(500)
  SetEntityCoords(ped, pos.x, pos.y, pos.z-1.0)
  Wait(500)
  SetEntityCoords(ped, pos.x, pos.y, pos.z-1.0)
  RenderScriptCams(false, true, 500, true, true)
  SetCamActive(cam, false)
  DestroyCam(cam, true)
  SetCamActive(cam2, false)
  DestroyCam(cam2, true)
  SetEntityVisible(PlayerPedId(), true)
  Wait(500)
  SetNuiFocus(false, false)

  ShutdownLoadingScreen()
  
  ClearScreen()
  Wait(0)
  DoScreenFadeOut(0)

  ShutdownLoadingScreenNui()
  
  ClearScreen()
  Wait(0)
  ClearScreen()
  TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
  TriggerEvent('QBCore:Client:OnPlayerLoaded')
  TriggerServerEvent('qb-houses:server:SetInsideMeta', 0, false)
  TriggerServerEvent('qb-apartments:server:SetInsideMeta', 0, 0, false)
  DoScreenFadeIn(500)
  while not IsScreenFadedIn() do
      Wait(0)
      ClearScreen()
  end
  
  local timer = GetGameTimer()

  while true do
      ClearScreen()
      Wait(0)
      
      if GetGameTimer() - timer > 500 then
          
          ToggleSound(false)
          SwitchInPlayer(PlayerPedId())
          ClearScreen()
          while GetPlayerSwitchState() ~= 12 do
              Wait(0)
              ClearScreen()
          end

          break
      end
  end
  FreezeEntityPosition(PlayerPedId(), false)
  ClearDrawOrigin()

end