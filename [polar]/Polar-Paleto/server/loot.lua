if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end

local item = nil
local item2 = nil
local item3 = nil
local item4 = nil
local amount = nil

local cashtable = {
    'markedbills',

}
local goldtable = {
    'goldbar',

}

local diamondtable = {
    'diamond',

}



RegisterNetEvent('Polar-Paleto:Server:RemoveItems', function(item, amount) local src = source local Player = QBCore.Functions.GetPlayer(src) Wait(150) if amount == nil then Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1) else Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount) end end)

function givet(item, min, max)
    if item == 'markedbills' then
        local chance = math.random(min, max)
        local src = source local Player = QBCore.Functions.GetPlayer(src)
        local info = {
            worth = math.random(1,100)
        }
        Player.Functions.AddItem('markedbills', chance, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add", chance)
        TriggerEvent("qb-log:server:CreateLog", "paleto", "Paleto Bank Robbery", "red", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got ' .. QBCore.Shared.Items[item] .. ' from robbin ' .. chance .. '')
    else
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    
    local chance = math.random(min, max)
    if Player.Functions.AddItem(item, chance) then TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", chance) end
    TriggerEvent("qb-log:server:CreateLog", "paleto", "Paleto Bank Robbery", "red", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got ' .. QBCore.Shared.Items[item] .. ' from robbin ' .. chance .. '')
    end
end 
function give(item, amount)
    if item == 'markedbills' then
        local src = source local Player = QBCore.Functions.GetPlayer(src)
        local info = {
            worth = math.random(1,100)
        }
        Player.Functions.AddItem('markedbills', 1, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add")
        TriggerEvent("qb-log:server:CreateLog", "paleto", "Paleto Bank Robbery", "red", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got ' .. QBCore.Shared.Items[item] .. ' from robbin ')
    else
        local src = source local Player = QBCore.Functions.GetPlayer(src)
        Wait(150)
        if amount == nil then
            Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
            TriggerEvent("qb-log:server:CreateLog", "paleto", "Paleto Bank Robbery", "red", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got ' .. QBCore.Shared.Items[item] .. ' from robbin ')
   
        else
            Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
            TriggerEvent("qb-log:server:CreateLog", "paleto", "Paleto Bank Robbery", "red", "**".. Player.PlayerData.name .. "** (citizenid: *"..Player.PlayerData.citizenid.."* | id: *"..src.."*)"..' Got ' .. QBCore.Shared.Items[item] .. ' from robbin ' .. amount .. '')
   
        end
    end
end

function pile(prop)
    if prop ==    'ex_cash_pile_005' then item = 'markedbills' amount = math.random(1,5) give(item, amount)
    elseif prop == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' amount = math.random(1,3) give(item, amount)
else
    print('' .. prop .. ' does not have a giveitem')
    end
end

function trolly(prop) 
    if prop ==   'ch_prop_gold_trolly_01a' then 
        local src = source
        local min = 1
        local max = 1
        item = goldtable[math.random(1, #goldtable)]
        local chance = math.random(1,100) if chance < 30 then givet(item, min, max) end
        --print(chance)
    elseif prop == 'ch_prop_ch_cash_trolly_01a' then 
        local src = source
        local min = 1
        local max = 1
        item = cashtable[math.random(1, #cashtable)]
        local chance = math.random(1,100) if chance < 50 then givet(item, min, max) end
        --print(chance)
    elseif prop == 'ch_prop_diamond_trolly_01a' then   
        local src = source
        local min = 1
        local max = 1
        item = diamondtable[math.random(1, #diamondtable)]
        local chance = math.random(1,100) if chance < 15 then givet(item, min, max) end
        --print(chance)
  
else
    print('' .. prop .. ' does not have a giveitem')
    end
end


function hiya(prop)
    if prop ==    'prop_cash_pile_01' then item = 'markedbills' amount = math.random(1,1) give(item, amount)
    elseif prop == 'prop_cash_pile_02' then  item = 'markedbills' amount = math.random(1,1) give(item, amount)
    elseif prop == 'prop_anim_cash_pile_01'then item = 'markedbills' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'prop_anim_cash_pile_02'then  item = 'markedbills' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'bkr_prop_bkr_cash_roll_01' then  item = 'markedbills' amount = math.random(1,1) give(item, amount)
    
    elseif prop ==  'ch_prop_gold_bar_01a' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'hei_prop_heist_gold_bar' then  item = 'goldbar' amount = math.random(1,1) give(item, amount)
    elseif prop ==  'prop_gold_bar' then item = 'goldbar' amount = math.random(1,1) give(item, amount)
    
    elseif prop ==    'prop_peyote_gold_01' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'ex_prop_exec_award_gold' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'xs_prop_trophy_goldbag_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_vw_pogo_gold_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'h4_prop_h4_gold_coin_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_egg_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_09a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_09b' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_09c' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==   'vw_prop_casino_art_miniature_05a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_05b' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_miniature_05c' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_car_09a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_bird_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_car_11a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_grenade_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_grenade_01b' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_casino_art_grenade_01c' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_art_pug_02a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_basketball_02a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_miniature_yacht_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_miniature_yacht_01b' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==    'vw_prop_miniature_yacht_01c' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==   'vw_prop_casino_art_horse_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_panther_01c' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    
    elseif prop ==     'v_res_r_fighorse' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'v_res_r_fighorsestnd' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'ch_prop_ch_trophy_monkey_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'ch_prop_ch_trophy_racer_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'ch_prop_ch_trophy_strife_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_skull_01b' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_skull_02b' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_figurines_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_figurines_02a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_casino_art_lampf_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_toy_sculpture_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_vw_chips_pile_01a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
    elseif prop ==     'vw_prop_vw_chips_pile_02a' then  item = 'goldbar' amount = math.random(1,5) give(item, amount)
 
else
    print('' .. prop .. ' does not have a giveitem')
    end
end






QBCore.Commands.Add("paleto", "Set Player Metadata (God Only)", {}, false, function(source, args)
    TriggerEvent('Polar-Paleto:Server:StartTargets')
    TriggerEvent('Polar-Paleto:Server:StartCooldown')
    TriggerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor1')
    TriggerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor2')
    TriggerEvent('Polar-Paleto:Server:StartInteract', 'paletodoor3')
    TriggerClientEvent('Polar-Paleto:Client:StartLoot', source)
end, "god") 

