
local QBCore = exports['qb-core']:GetCoreObject()

local pedname = {
    enabled = true,
    model = "a_m_m_hasjew_01",
    coords = vector4(-552.9, -201.5, 38.23-1, 322.46),
    label = "Open Cityhall",
    scenario = "WORLD_HUMAN_STAND_MOBILE",
}



CreateThread(function()
   

    RequestModel(joaat(pedname.model))
    while not HasModelLoaded(joaat(pedname.model)) do
        Wait(100)
    end

    local ped = CreatePed(4, joaat(pedname.model), pedname.coords, 0.0, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, pedname.coords.w)
    TaskStartScenarioInPlace(ped, pedname.scenario, true, true)

    -- Change to your target, ox_target should work because of the compatibility layer
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                event = "Polar-CityHall:client:open",
                icon = "fas fa-id-card",
                label = pedname.label,
            }
        },
        distance = 2.5
    })
end)