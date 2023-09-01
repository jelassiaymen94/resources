
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('Polar-CityHall:server:ApplyJob', function(id)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end

    local job = Config.jobs[id]
    if not job then return end

    Player.Functions.SetJob(job.job, 0)
    
        exports['qb-phone']:hireUser(job.job, Player.PlayerData.citizenid, 0)
    
    TriggerClientEvent('QBCore:Notify', source, "You have been hired!", 'success')
end)
local itemas = {
    {
        item = "id_card",
        meta = 'id',
        label = "Identification Card",
        price = 10
    }, {
        item = "driver_license",
        label = "Drivers License",
        meta = 'driver',
        price = 10
    }, {
        item = "weaponlicense",
        label = "Weapons License",
        meta = 'weapon',
        price = 1250
    },  
}
RegisterNetEvent('Polar-CityHall:server:BuyIdentity', function(id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local item = itemas[id]
    if not item then return end

    if not Player.Functions.RemoveMoney('bank', item.price, "Cityhall purchase") then 
        TriggerClientEvent('QBCore:Notify', src, 'You aint got enough money', 'error')
        return 
    end

    local info = {}
    if item.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.type = "Class C Driver License"
    elseif item.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
    end

    Player.Functions.AddItem(item.item, 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], 'add')
  --  TriggerClientEvent('QBCore:Notify', src, "", 'success')
end)
