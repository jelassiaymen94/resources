local QBCore = exports['qb-core']:GetCoreObject()

local items = {

 

    ['dirtyband'] = {
        itemName = 'dirtyband',
        MinSellPrice = 250,
        MaxSellPrice = 1000,
    },
    ['goldbar'] = {
        itemName = 'goldbar',
        MinSellPrice = 750,
        MaxSellPrice = 2500,
    },





    ['paintinga'] = {
        itemName = 'paintinga',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['paintingb'] = {
        itemName = 'paintingb',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['paintingd'] = {
        itemName = 'paintingd',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['paintingc'] = {
        itemName = 'paintingc',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },


    ['valuablegoods'] = {
        itemName = 'valuablegoods',
        MinSellPrice = 4500,
        MaxSellPrice = 7500,
    },





    ['tequillabottle2'] = {
        itemName = 'tequillabottle2',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['tequillabottle3'] = {
        itemName = 'tequillabottle3',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['tequillabottle1'] = {
        itemName = 'tequillabottle1',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['rubynecklace1'] = {
        itemName = 'rubynecklace1',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['pinkdiamond'] = {
        itemName = 'pinkdiamond',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },
    ['bluepanther'] = {
        itemName = 'bluepanther',
        MinSellPrice = 7500,
        MaxSellPrice = 12500,
    },





    ['alienegg'] = {
        itemName = 'alienegg',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['goldtower'] = {
        itemName = 'goldtower',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['exoticbird'] = {
        itemName = 'exoticbird',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['goldgrenade'] = {
        itemName = 'goldgrenade',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['goldbasketball'] = {
        itemName = 'goldbasketball',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['exoticdog'] = {
        itemName = 'exoticdog',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },





    ['exoticyacht'] = {
        itemName = 'exoticyacht',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['exotichorse'] = {
        itemName = 'exotichorse',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['exoticcat'] = {
        itemName = 'exoticcat',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['exoticskull'] = {
        itemName = 'exoticskull',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },

    ['exoticchips'] = {
        itemName = 'exoticchips',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
   


    ['diamond'] = {
        itemName = 'diamond',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['ruby'] = {
        itemName = 'ruby',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['captainskull'] = {
        itemName = 'captainskull',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['saphire'] = {
        itemName = 'saphire',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
    ['bluediamond'] = {
        itemName = 'bluediamond',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },

    ['yellow-diamond'] = {
        itemName = 'yellow-diamond',
        MinSellPrice = 1500,
        MaxSellPrice = 3000,
    },
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




