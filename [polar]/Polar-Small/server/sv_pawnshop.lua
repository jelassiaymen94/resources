local QBCore = exports['qb-core']:GetCoreObject()

local items = {

    ['rolex'] = {
        itemName = 'rolex',
        MinSellPrice = 20,
        MaxSellPrice = 50,
    },

    ['diamond_ring'] = {
        itemName = 'diamond_ring',
        MinSellPrice = 60,
        MaxSellPrice = 80,
    },

    ['diamond'] = {
        itemName = 'diamond',
        MinSellPrice = 90,
        MaxSellPrice = 120,
    },

    ['goldchain'] = {
        itemName = 'goldchain',
        MinSellPrice = 30,
        MaxSellPrice = 40,
    },

    ['10kgoldchain'] = {
        itemName = '10kgoldchain',
        MinSellPrice = 80,
        MaxSellPrice = 110,
    },

    ['goldbar'] = {
        itemName = 'goldbar',
        MinSellPrice = 220,
        MaxSellPrice = 260,
    },

    ['iphone'] = {
        itemName = 'iphone',
        MinSellPrice = 20,
        MaxSellPrice = 50,
    },

    ['samsungphone'] = {
        itemName = 'samsungphone',
        MinSellPrice = 15,
        MaxSellPrice = 35,
    },

    ['laptop'] = {
        itemName = 'laptop',
        MinSellPrice = 50,
        MaxSellPrice = 85,
    },

    ['cryptostick'] = {
        itemName = 'cryptostick',
        MinSellPrice = 50,
        MaxSellPrice = 60,
    },

    ['moneybag'] = {
        itemName = 'moneybag',
        MinSellPrice = 1250,
        MaxSellPrice = 1700,
    }
}






RegisterNetEvent('Pawnshop:Server:SellItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItem = nil
    for k, v in pairs(items) do


        local name = v.itemName
        local money = math.random(v.MinSellPrice,v.MaxSellPrice)
         

    
        if Player.Functions.GetItemByName(name) ~= nil then
            hasItem = true
            local amt = Player.Functions.GetItemByName(name).amount
            local pay = money * amt
            Player.Functions.AddMoney('cash', pay)
            Player.Functions.RemoveItem(name, amt)
        end

    end

    if hasItem then
        TriggerClientEvent('QBCore:Notify', src, 'The Dealer Likes Your Items', 'success')
    end

    if not hasItem then
        TriggerClientEvent('QBCore:Notify', src, 'None Of The Items Are In The Dealers Value', 'error')
    end

end)




