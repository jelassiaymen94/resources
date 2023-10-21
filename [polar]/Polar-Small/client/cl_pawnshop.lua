local QBCore = exports['qb-core']:GetCoreObject()


CreateThread(function()
    RequestModel('u_m_y_proldriver_01')
      while not HasModelLoaded('u_m_y_proldriver_01') do
      Wait(1)
    end 
      local tc = CreatePed(2, 'u_m_y_proldriver_01', vec4(1645.78, 4841.47, 42.03, 96.49), false, false) 
      SetPedFleeAttributes(tc, 0, 0)
      SetPedDiesWhenInjured(tc, false)
      TaskStartScenarioInPlace(tc, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
      SetPedKeepTask(tc, true)
      SetBlockingOfNonTemporaryEvents(tc, true)
      SetEntityInvincible(tc, true)
      FreezeEntityPosition(tc, true)
end)
  

CreateThread(function()
   
        local pawnshop = AddBlipForCoord(vector3(1645.78, 4841.47, 42.03))
        SetBlipAsShortRange(pawnshop, true)
        SetBlipSprite(pawnshop, 431)
        SetBlipColour(pawnshop, 5)
        SetBlipScale(pawnshop, 0.6)
        SetBlipDisplay(pawnshop, 6)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('Larrys Pawnshop')
        EndTextCommandSetBlipName(pawnshop)
   
end)


local function shopMenu()
    local shop = {
        {
            header = 'Larrys Pawnshop',
            isMenuHeader = true,
        },
        {
            header = 'Try To Sell Items',
            icon = 'fas fa-hand-holding',
            params = {
                event = 'Pawnshop:Client:SellItems'
            }
        },
        {
            header = 'Close',
            icon = 'fas fa-xmark',

        }
    }
    exports['qb-menu']:openMenu(shop)
end



CreateThread(function()
    exports['qb-target']:AddTargetModel('u_m_y_proldriver_01', {
        options = {
            { 
                action = function()
			shopMenu()
		end,
                icon = "fas fa-circle-dollar-to-slot", 
                label = "What You Got For Me?",
            },
        },
        distance = 3.0 
    })
end)





RegisterNetEvent('Pawnshop:Client:SellItems', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar('show_items', 'Checking If Items Have Value', 10000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'amb@world_human_stand_impatient@male@no_sign@base',
        anim = 'base',
        flags = 16,
    }, {}, {}, function() 
        TriggerServerEvent('Pawnshop:Server:SellItems')
        ClearPedTasks(ped)
    end, function() 
        ClearPedTasks(ped)
    end)
end)

CreateThread(function()
	Wait(1000)
	local table = CreateObject(304964818, vec3(1644.39, 4841.32, 42.03), true, true, true)
	SetEntityHeading(table, 274)
	FreezeEntityPosition(table, true)
end)


