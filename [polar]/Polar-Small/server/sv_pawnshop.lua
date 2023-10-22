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
        MaxSellPrice = 11500,
    },





    ['tequillabottle2'] = {
        itemName = 'tequillabottle2',
        MinSellPrice = 7500,
        MaxSellPrice = 15000,
    },
    ['tequillabottle3'] = {
        itemName = 'tequillabottle3',
        MinSellPrice = 7500,
        MaxSellPrice = 15000,
    },
    ['tequillabottle1'] = {
        itemName = 'tequillabottle1',
        MinSellPrice = 7500,
        MaxSellPrice = 15000,
    },
    ['rubynecklace1'] = {
        itemName = 'rubynecklace1',
        MinSellPrice = 7500,
        MaxSellPrice = 15000,
    },
    ['pinkdiamond'] = {
        itemName = 'pinkdiamond',
        MinSellPrice = 7500,
        MaxSellPrice = 15000,
    },
    ['bluepanther'] = {
        itemName = 'bluepanther',
        MinSellPrice = 7500,
        MaxSellPrice = 15000,
    },





    ['alienegg'] = {
        itemName = 'alienegg',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['goldtower'] = {
        itemName = 'goldtower',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['exoticbird'] = {
        itemName = 'exoticbird',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['goldgrenade'] = {
        itemName = 'goldgrenade',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['goldbasketball'] = {
        itemName = 'goldbasketball',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['exoticdog'] = {
        itemName = 'exoticdog',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },





    ['exoticyacht'] = {
        itemName = 'exoticyacht',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['exotichorse'] = {
        itemName = 'exotichorse',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['exoticcat'] = {
        itemName = 'exoticcat',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['exoticskull'] = {
        itemName = 'exoticskull',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },

    ['exoticchips'] = {
        itemName = 'exoticchips',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
   


    ['diamond'] = {
        itemName = 'diamond',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['captainskull'] = {
        itemName = 'captainskull',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['saphire'] = {
        itemName = 'saphire',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['bluediamond'] = {
        itemName = 'bluediamond',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['redruby'] = {
        itemName = 'redruby',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },
    ['yellow-diamond'] = {
        itemName = 'yellow-diamond',
        MinSellPrice = 2500,
        MaxSellPrice = 7500,
    },



    ['gold_ring'] = {
        itemName = 'gold_ring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['diamond_ring'] = {
        itemName = 'diamond_ring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['ruby_ring'] = {
        itemName = 'ruby_ring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['sapphire_ring'] = {
        itemName = 'sapphire_ring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['emerald_ring'] = {
        itemName = 'emerald_ring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },



    
    ['silver_ring'] = {
        itemName = 'silver_ring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['diamond_ring_silver'] = {
        itemName = 'diamond_ring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['ruby_ring_silver'] = {
        itemName = 'ruby_ring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['sapphire_ring_silver'] = {
        itemName = 'sapphire_ring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['emerald_ring_silver'] = {
        itemName = 'emerald_ring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },




    ['diamond_necklace'] = {
        itemName = 'diamond_necklace',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['ruby_necklace'] = {
        itemName = 'ruby_necklace',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['sapphire_necklace'] = {
        itemName = 'sapphire_necklace',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['emerald_necklace'] = {
        itemName = 'emerald_necklace',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['silverchain'] = {
        itemName = 'silverchain',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['diamond_necklace_silver'] = {
        itemName = 'diamond_necklace_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['ruby_necklace_silver'] = {
        itemName = 'ruby_necklace_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['sapphire_necklace_silver'] = {
        itemName = 'sapphire_necklace_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['emerald_necklace_silver'] = {
        itemName = 'emerald_necklace_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },


    ['goldearring'] = {
        itemName = 'goldearring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['diamond_earring'] = {
        itemName = 'diamond_earring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['ruby_earring'] = {
        itemName = 'ruby_earring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['sapphire_earring'] = {
        itemName = 'sapphire_earring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['emerald_earring'] = {
        itemName = 'emerald_earring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },


    ['silverearring'] = {
        itemName = 'silverearring',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['diamond_earring_silver'] = {
        itemName = 'diamond_earring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['ruby_earring_silver'] = {
        itemName = 'ruby_earring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['sapphire_earring_silver'] = {
        itemName = 'sapphire_earring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
    ['emerald_earring_silver'] = {
        itemName = 'emerald_earring_silver',
        MinSellPrice = 150,
        MaxSellPrice = 300,
    },
}



RegisterNetEvent('Pawnshop:Server:SellItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    local hasitem = false
    for k, v in pairs(items) do
        local name = v.itemName
        local money = math.random(v.MinSellPrice, v.MaxSellPrice)
        local item = Player.Functions.GetItemByName(name)
        if item ~= nil and item.amount > 0 then
            hasitem = true
            local amt = item.amount
            local pay = money * amt
            Player.Functions.AddMoney('cash', pay)
            Player.Functions.RemoveItem(name, amt)
        end
    end
    if hasitem then 
        hasitem = false
        Wait(150)
        TriggerClientEvent('Pawnshop:Client:Lapa', src)
    end
end)

   
