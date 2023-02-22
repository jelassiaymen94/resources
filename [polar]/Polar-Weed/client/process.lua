
local QBCore = exports['qb-core']:GetCoreObject()

if Config.UseTrimmer then
-- grand senora desert
exports['qb-target']:AddTargetModel('a_m_m_farmer_01', {
    options = {
        {
            event = "Polar-Weed:Client:attemptTrimmer",
            icon = "fas fa-cut", 
            label = "Speak with Trimmer",
        },
    },
    distance = 2.5
})
end
RegisterNetEvent('Polar-Weed:Client:Anim', function()
    animation()
    print('penis')
    QBCore.Functions.Progressbar("crafting", "Rolling Joint... ", 12500, false, true, {
    
        -- what is disabled
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,

    },{

      
    }, {}, {}, function() -- Done
       
        endanimation()

    end, function()

        -- cancel notification
        QBCore.Functions.Notify('Canceled', 'error')
        endanimation()
        -- debug
        if Config.Debug then print('canceled') end

    end)  


end)
RegisterNetEvent('Polar-Weed:Client:attemptTrimmer', function()
  
    TriggerEvent("Polar-Weed:Client:TrimMenu")

end)

RegisterNetEvent('Polar-Weed:Client:stopBaggieMenu', function()
    

    endanimation()
end)

---- ANIMATIONS -----

---- ANIMATIONS -----
function animation()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
end
function endanimation()
    local playerPed = PlayerPedId()
    ClearPedTasks(playerPed)
end
RegisterNetEvent('Polar-Weed:Client:baggieMenu', function()
   
    exports['qb-menu']:openMenu({
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['largejoint'].image.." width=45px onerror='this.onerror=null; this.remove();'> Joints",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['croplow'].image.." width=45px onerror='this.onerror=null; this.remove();'> Bad Quality",
            txt = "Roll some shit quality joints",
            params = {
                event = "Polar-Weed:Server:Joint1",
              
            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['cropmid'].image.." width=45px onerror='this.onerror=null; this.remove();'> Decent Quality",
            txt = "Roll some decent quality joints",
            params = {
                event = "Polar-Weed:Server:Joint2",
               

            }
        },
        {
            header = "<img src=nui://"..Config.img..QBCore.Shared.Items['crophigh'].image.." width=45px onerror='this.onerror=null; this.remove();'> Good Quality",
            txt = "Roll some High Grade level joints",
            params = {
                event = "Polar-Weed:Server:Joint3",
               
            }
        },
        {
            header = "Exit",
            params = {
                event = "Polar-Weed:Client:stopBaggieMenu"
            }
        },
    })
end)



RegisterNetEvent('Polar-Weed:Server:Joint1', function()
    animation()
    TriggerServerEvent('Polar-Weed:Server:Joint', 1)
    Wait(12500)
    ClearPedTasks(PlayerPedId())
end)
RegisterNetEvent('Polar-Weed:Server:Joint2', function()
    animation()
    TriggerServerEvent('Polar-Weed:Server:Joint', 2)
    Wait(12500)
    ClearPedTasks(PlayerPedId())
end)
RegisterNetEvent('Polar-Weed:Server:Joint3', function()
    animation()
    TriggerServerEvent('Polar-Weed:Server:Joint', 3)
    Wait(12500)
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('Polar-Weed:Client:TrimMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Required: 3 Harvested Crops",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "1oz Bad Quality",
            txt = "",
            params = {
                event = "Polar-Weed:Server:process1ozMarijuana",
                isServer = true,
                args = 1
            }
        },
        {
            header = "1oz Decent Quality",
            txt = "",
            params = {
                event = "Polar-Weed:Server:process1ozMarijuana",
                isServer = true,
                args = 2

            }
        },
        {
            header = "1oz Good Quality",
            txt = "",
            params = {
                event = "Polar-Weed:Server:process1ozMarijuana",
                isServer = true,
                args = 3
            }
        },
        {
            header = "Leave",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

