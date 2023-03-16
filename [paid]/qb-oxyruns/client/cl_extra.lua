local QBCore = exports['qb-core']:GetCoreObject()

function OxyPoliceCall()
  if Config.PoliceAlertChance >= math.random(1, 100) then 
      exports['qb-dispatch']:DrugSale()
  end
end

function OxyStartEmail()
  local player = QBCore.Functions.GetPlayerData()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = "Vanessa",
    subject = "Delivery Job",
    message = "Hello " .. player.charinfo.firstname .. ",<br><br>I will be your contact for the duration of your assignment. <br><br>You have just met with Jimmy, who will be contracting you a vehicle. <br><br>The keys will be inside along with your next assignment.<br><br>".."Your provided vehicle is a: <b>".. Config.VehicleLocations[exports["qb-oxyruns"]:GetLocation()].vehicle .. "</b><br>Check your GPS for the drop location."
  })
end

function OxyPickupEmail()
  local player = QBCore.Functions.GetPlayerData()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = "Vanessa",
    subject = "Pickup Product",
    message = "Hello " .. player.charinfo.firstname .. ",<br><br>Go meet Alex to pick up your packages. <br><br>Place as many as you can fit into your trunk and await further instructions. <br><br>Check your GPS for the his location.",
  })
end

function OxySellEmail()
  local player = QBCore.Functions.GetPlayerData()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = "Vanessa",
    subject = "Buyer Drop-Off",
    message = "Hello " .. player.charinfo.firstname .. ",<br><br>I have contacted a few select buyers for your deliveries. <br><br>You will place the package in the trunk of their vehicle. <br><br>I've sent you the location via GPS. Head there immediately.",
  })
end 

function OxyReturnVehEmail()
  local player = QBCore.Functions.GetPlayerData()
  TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = "Vanessa",
    subject = "Vehicle Return",
    message = "Hello " .. player.charinfo.firstname .. ",<br><br>Very good work. My clients are quite pleased. Your last task is to dispose of the contracted vehicle. Upon delivery of the vehicle, you will be paid for your services in cash. I have sent you a GPS location, don't be late.",
  })
end 

CreateThread(function()
  for k, v in pairs(Config.PackagePedLocations) do
      exports[Config.TargetExport]:AddCircleZone("qb-oxyruns:package-ped"..k, vector3(v.x, v.y, v.z), 0.4, { 
          name = "qb-oxyruns:package-ped"..k,
          debugPoly = false,
        }, {
          options = { 
            { 
              type = "client", 
              event = "qb-oxyruns:client:takePackages", 
              icon = 'fas fa-box', 
              label = 'Take Product', 
              CanInteract = function()
                if exports["qb-oxyruns"]:GetTask() == 'pickupPackage' then 
                    return true
                else 
                    return false
                end
              end
            }
          },
          distance = 2.5,
      })
  end
  Jimmy = exports[Config.TargetExport]:SpawnPed({
    model = Config.JobStartPed,
    coords = Config.JobStartPedLocation,  
    minusOne = true, 
    freeze = true, 
    invincible = true,
    blockevents = true,
    target = { 
      options = {
        { 
          type = "client", 
          event = "qb-oxyruns:client:jobMenu", 
          icon = 'fas fa-clipboard-list', 
          label = 'Delivery Job', 
        }
      },
      distance = 2.5,
    },
  })
  Vannessa = exports[Config.TargetExport]:SpawnPed({
    model = Config.JobEndPed,
    coords = Config.JobEndLocation,  
    minusOne = true, 
    freeze = true, 
    invincible = true,
    blockevents = true,
    target = { 
      options = {
        { 
          type = "client", 
          event = "qb-oxryuns:client:returnVehicle", 
          icon = 'fas fa-car', 
          label = 'Return Job Vehicle', 
          canInteract = function(entity)
              if (exports["qb-oxyruns"]:GetTask() == 'sellToBuyer' or exports["qb-oxyruns"]:GetTask() == 'jobDone' or exports["qb-oxyruns"]:GetTask() == nil) then 
                  return true
              else
                  return false
              end
          end
        },
        { 
          type = "client", 
          event = "qb-oxryuns:client:handleJobFinish", 
          icon = 'fas fa-clipboard-list', 
          label = 'Finish Job & Receive Payment', 
          canInteract = function(entity)
              if returned and (exports["qb-oxyruns"]:GetTask() == 'sellToBuyer' or exports["qb-oxyruns"]:GetTask() == 'jobDone' or exports["qb-oxyruns"]:GetTask() == nil) then 
                  return true
              else
                  return false
              end
          end
        }
      },
      distance = 2.5,
    },
  })
end)