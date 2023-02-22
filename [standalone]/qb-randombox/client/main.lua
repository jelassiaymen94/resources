local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-randombox:BoxOpening")
AddEventHandler("qb-randombox:BoxOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local box = `hei_prop_heist_box`
    RequestModel(box)
    while (not HasModelLoaded(box)) do
        Wait(1)
    end
    local obj1 = CreateObject(box, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj1)
    SetEntityAsMissionEntity(obj1)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Box...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(obj1)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'randombox', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['randombox'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardBox')
    end)
end)

RegisterNetEvent("qb-randombox:CaseOpening")
AddEventHandler("qb-randombox:CaseOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local case = `bkr_prop_biker_case_shut`
    RequestModel(case)
    while (not HasModelLoaded(case)) do
        Wait(1)
    end
    local obj2 = CreateObject(case, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(obj2)
    SetEntityAsMissionEntity(obj2)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Case...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(obj2)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'randomcase', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['randomcase'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardCase')
    end)
end)

RegisterNetEvent("qb-randombox:BagOpening")
AddEventHandler("qb-randombox:BagOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local bag = `hei_prop_heist_binbag`
    RequestModel(bag)
    while (not HasModelLoaded(bag)) do
        Wait(1)
    end
    local bag1 = CreateObject(bag, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(bag1)
    SetEntityAsMissionEntity(bag1)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Bag...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(bag1)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'randombag', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['randombag'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardBag')
    end)
end)

RegisterNetEvent("qb-randombox:AmmoOpening")
AddEventHandler("qb-randombox:AmmoOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local ammo = `prop_box_ammo01a`
    RequestModel(ammo)
    while (not HasModelLoaded(ammo)) do
        Wait(1)
    end
    local ammo1 = CreateObject(ammo, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(ammo1)
    SetEntityAsMissionEntity(ammo1)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Ammo Case...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(ammo1)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'randomammo', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['randomammo'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardAmmo')
    end)
end)

RegisterNetEvent("qb-randombox:MedkitOpening")
AddEventHandler("qb-randombox:MedkitOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local medkit = `xm_prop_smug_crate_s_medical`
    RequestModel(medkit)
    while (not HasModelLoaded(medkit)) do
        Wait(1)
    end
    local med1 = CreateObject(medkit, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(med1)
    SetEntityAsMissionEntity(med1)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Medical Kit...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(med1)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'randommedkit', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['randommedkit'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardMedkit')
    end)
end)

RegisterNetEvent("qb-randombox:GunCaseOpening")
AddEventHandler("qb-randombox:GunCaseOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local guncase = `prop_box_guncase_03a`
    RequestModel(guncase)
    while (not HasModelLoaded(guncase)) do
        Wait(1)
    end
    local gun1 = CreateObject(guncase, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(gun1)
    SetEntityAsMissionEntity(gun1)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Gun Case...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(gun1)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'randomgun', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['randomgun'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardGunCase')
    end)
end)

RegisterNetEvent('qb-randombox:client:SetBagItems', function(BagItemList)
	Config.BagItemList = BagItemList
end)

RegisterNetEvent('qb-randombox:client:SetBoxItems', function(BoxItemList)
	Config.BoxItemList = BoxItemList
end)

RegisterNetEvent('qb-randombox:client:SetCaseItems', function(CaseItemList)
	Config.CaseItemList = CaseItemList
end)

RegisterNetEvent('qb-randombox:client:SetAmmoItems', function(AmmoItemList)
	Config.AmmoItemList = AmmoItemList
end)

RegisterNetEvent('qb-randombox:client:SetMedkitItems', function(MedkitItemList)
	Config.MedkitItemList = MedkitItemList
end)

RegisterNetEvent('qb-randombox:client:SetAmmoItems', function(GunItemList)
	Config.GunItemList = GunItemList
end)















RegisterNetEvent("qb-randombox:ShoeOpening")
AddEventHandler("qb-randombox:ShoeOpening", function()
    local playerPed = PlayerPedId()
    local coords    = GetEntityCoords(playerPed)
    local forward   = GetEntityForwardVector(playerPed)
    local x, y, z   = table.unpack(coords + forward * 1.0)

    local Shoe = `v_res_fa_shoebox1`
    RequestModel(Shoe)
    while (not HasModelLoaded(Shoe)) do
        Wait(1)
    end
    local Shoe1 = CreateObject(Shoe, x, y, z, true, false, true)
    PlaceObjectOnGroundProperly(Shoe1)
    SetEntityAsMissionEntity(Shoe1)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic3"})
    QBCore.Functions.Progressbar('name_here', 'Opening Shoe Box...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})

        DeleteEntity(shoe1)

        TriggerServerEvent('QBCore:Server:RemoveItem', 'shoebox', 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['shoebox'], "remove")

        TriggerServerEvent('qb-randombox:server:GetRewardShoe')
    end)
end)
RegisterNetEvent('qb-randombox:client:SetShoeItems', function(ShoeItemList)
	Config.ShoeItemList = ShoeItemList
end)











function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end