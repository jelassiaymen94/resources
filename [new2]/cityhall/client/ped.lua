local pedname = {
    enabled = true,
    model = "a_m_m_indian_01",
    coords = vector4(-266.88833618164, -961.62231445313, 30.227128982544, 210.22946166992),
    label = "Open cityhall"
}



CreateThread(function()
   

    RequestModel(joaat(pedname.model))
    while not HasModelLoaded(joaat(pedname.model)) do
        Wait(100)
    end

    local ped = CreatePed(4, joaat(pedname.model), pedname.coords, 0.0, false, false)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedDiesWhenInjured(ped, false)
    SetPedCanPlayAmbientAnims(ped, true)
    SetPedCanRagdollFromPlayerImpact(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, pedname.coords.w)

    -- Change to your target, ox_target should work because of the compatibility layer
    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                event = "mtc-cityhall:client:open",
                icon = "fas fa-id-card",
                label = pedname.label,
            }
        },
        distance = 2.5
    })
end)