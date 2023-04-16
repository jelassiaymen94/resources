local QBCore = exports[Config.Core]:GetCoreObject()

local item = nil
local item2 = nil
local item3 = nil
local item4 = nil
local amount = nil

local cashtable = {
    'band',

}
local goldtable = {
    'goldbar',

}

local diamondtable = {
    'diamond',

}


function givet(item, min, max, number, item2, item3, item4)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    Wait(150)
    if number == 1 then
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", chance) end
    elseif number == 2 then
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", chance) end
    Wait(150)
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item2, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "add", chance) end
    elseif number == 3 then
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", chance) end
    Wait(150)
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item2, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "add", chance) end
    Wait(150)
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item3, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item3], "add", chance) end
    elseif number == 4 then
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", chance) end
    Wait(150)
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item2, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "add", chance) end
    Wait(150)
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item3, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item3], "add", chance) end
    Wait(150)
        local chance = math.random(min, max)
    if Player.Functions.AddItem(item4, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item4], "add", chance) end
  


    end
end 
function give(item, amount)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    Wait(150)
    if amount == nil then
    Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
    else
        Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
    end
end

function pile(prop)
    if prop ==    'ex_cash_pile_005' then item = 'band' amount = math.random(1,5) give(item, amount)
    elseif prop == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' amount = math.random(1,3) give(item, amount)
else
    print('' .. prop .. ' does not have a giveitem')
    end
end

function trolly(prop) 
        local src = source
        if prop ==    'ch_prop_gold_trolly_01a' then 
        local min = 1
        local max = 3
        item = goldtable[math.random(1, #goldtable)]
        item2 = goldtable[math.random(1, #goldtable)]
        item3 = goldtable[math.random(1, #goldtable)]
        item4 = goldtable[math.random(1, #goldtable)]
        local chance = math.random(1,100) if chance < 35 then givet(item, min, max, 1)
        elseif chance < 75 then givet(item, min, max, 2, item2)
        elseif chance < 90 then givet(item, min, max, 3, item2, item3)
        else givet(item, min, max, 4, item2, item3, item4) end
    
    elseif prop == 'ch_prop_ch_cash_trolly_01a' then 
        local src = source
        local min = 6
        local max = 15
        item = cashtable[math.random(1, #cashtable)]
        item2 = cashtable[math.random(1, #cashtable)]
        item3 = cashtable[math.random(1, #cashtable)]
        item4 = cashtable[math.random(1, #cashtable)]
        local chance = math.random(1,100) if chance < 35 then givet(item, min, max, 1)
        elseif chance < 75 then givet(item, min, max, 2, item2)
        elseif chance < 90 then givet(item, min, max, 3, item2, item3)
        else givet(item, min, max, 4, item2, item3, item4) end
    
    elseif prop == 'ch_prop_diamond_trolly_01a' then   
        local src = source
        local min = 1
        local max = 1
        item = diamondtable[math.random(1, #diamondtable)]
        item2 = diamondtable[math.random(1, #diamondtable)]
        item3 = diamondtable[math.random(1, #diamondtable)]
        item4 = diamondtable[math.random(1, #diamondtable)]
        local chance = math.random(1,100) if chance < 35 then givet(item, min, max, 1)
        elseif chance < 75 then givet(item, min, max, 2, item2)
        elseif chance < 90 then givet(item, min, max, 3, item2, item3)
        else givet(item, min, max, 4, item2, item3, item4) end
  
else
    print('' .. prop .. ' does not have a giveitem')
    end
end


function hiya(prop)
    if prop ==    'prop_cash_pile_01' then item = 'band' amount = math.random(1,1) give(item, amount)
    elseif prop == 'prop_cash_pile_02' then  item = 'band' amount = math.random(1,1) give(item, amount)
    elseif prop == 'prop_anim_cash_pile_01'then item = 'band' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'prop_anim_cash_pile_02'then  item = 'band' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'bkr_prop_bkr_cash_roll_01' then  item = 'band' amount = math.random(1,1) give(item, amount)
    
    elseif prop ==  'ch_prop_gold_bar_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'hei_prop_heist_gold_bar' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'prop_gold_bar' then item = 'goldbar' amount = math.random(1,1) give(item, amount)
    
    elseif prop ==    'prop_peyote_gold_01' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'ex_prop_exec_award_gold' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'xs_prop_trophy_goldbag_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_vw_pogo_gold_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'h4_prop_h4_gold_coin_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_egg_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_09a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_09b' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_09c' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==   'vw_prop_casino_art_miniature_05a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_05b' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_05c' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_car_09a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_bird_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_car_11a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_grenade_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_grenade_01b' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_grenade_01c' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_art_pug_02a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_basketball_02a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_miniature_yacht_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_miniature_yacht_01b' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==    'vw_prop_miniature_yacht_01c' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==   'vw_prop_casino_art_horse_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_panther_01c' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    
else
    print('' .. prop .. ' does not have a giveitem')
    end
end






QBCore.Commands.Add("paleto", "Set Player Metadata (God Only)", {}, false, function(source, args)
    TriggerEvent('Polar-Paleto:Server:SetupGrab1')
    TriggerEvent('Polar-Paleto:Server:SetupPickup1')
    TriggerEvent('Polar-Paleto:Server:SetupPile1')
    TriggerEvent('Polar-Paleto:Server:SetupTrolly1')
end, "god") 

