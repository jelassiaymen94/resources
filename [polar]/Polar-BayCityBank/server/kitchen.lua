local QBCore = exports[Config.Core]:GetCoreObject()


local item = nil

---- props = items
function hiya(prop)
    if prop ==    'prop_cash_pile_01' then item = 'band' give(item)
    elseif prop == 'prop_cash_pile_02' then  item = 'band' give(item)
    elseif prop == 'prop_anim_cash_pile_01'then item = 'band' give(item)
    elseif prop ==  'prop_anim_cash_pile_02'then  item = 'band' give(item)
    elseif prop ==  'bkr_prop_bkr_cash_roll_01' then  item = 'band' give(item)
    
    elseif prop ==  'ch_prop_gold_bar_01a' then  item = 'goldbar' give(item)
    elseif prop ==  'hei_prop_heist_gold_bar' then  item = 'goldbar' give(item)
    elseif prop ==  'prop_gold_bar' then item = 'goldbar' give(item)
    
    elseif prop ==    'prop_peyote_gold_01' then  item = 'goldbar' give(item)
    elseif prop ==    'ex_prop_exec_award_gold' then  item = 'goldbar' give(item)
    elseif prop ==    'xs_prop_trophy_goldbag_01a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_vw_pogo_gold_01a' then  item = 'goldbar' give(item)
    elseif prop ==    'h4_prop_h4_gold_coin_01a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_egg_01a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_miniature_09a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_miniature_09b' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_miniature_09c' then  item = 'goldbar' give(item)
    elseif prop ==   'vw_prop_casino_art_miniature_05a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_miniature_05b' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_miniature_05c' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_car_09a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_bird_01a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_car_11a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_grenade_01a' then  item = 'goldbar' give(item)
    elseif prop ==     'vw_prop_casino_art_grenade_01b' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_casino_art_grenade_01c' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_art_pug_02a' then  item = 'goldbar' give(item)
    elseif prop ==     'vw_prop_casino_art_basketball_02a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_miniature_yacht_01a' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_miniature_yacht_01b' then  item = 'goldbar' give(item)
    elseif prop ==    'vw_prop_miniature_yacht_01c' then  item = 'goldbar' give(item)
    elseif prop ==   'vw_prop_casino_art_horse_01a' then  item = 'goldbar' give(item)
    elseif prop ==     'vw_prop_casino_art_panther_01c' then  item = 'goldbar' give(item)
else
    print('' .. prop .. ' does not have a giveitem')
    end
end














RegisterNetEvent('Polar-BayCityBank:Server:StartButton', function() kitchenstuff() end)
RegisterNetEvent('Polar-BayCityBank:Server:StartEnterance', function() enterance() end)
RegisterNetEvent('Polar-BayCityBank:Server:StartStaffDoor', function() staff() end)
RegisterNetEvent('Polar-BayCityBank:Server:TargetRemove', function(door) TriggerClientEvent('Polar-BayCityBank:Client:TargetRemove', -1, door)   end)


function give(item, amount)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    Wait(150)
    if amount == nil then
    Player.Functions.AddItem(item, 1) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
    else
        Player.Functions.AddItem(item, amount) TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amount)
    end
end


local props = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set', function(prop) props = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props)
end)
local props2 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set2', function(prop) props2 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse2', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props2)
end)
local props3 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set3', function(prop) props3 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse3', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props3)
   end)
local props4 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set4', function(prop) props4 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse4', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props4)
   end)
local props5 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set5', function(prop) props5 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse5', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props5)  
   end)
local props6 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set6', function(prop) props6 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse6', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props6)
   end)
local props7 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set7', function(prop) props7 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse7', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props7)
   end)
local props25 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set25', function(prop) props25 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse25', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props25)
   end)
local props26 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set26', function(prop) props26 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse26', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props26)
   end)
local props27 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set27', function(prop) props27 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse27', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props27)
   end)
local props28 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set28', function(prop) props28 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse28', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props28)
   end)
local props29 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set29', function(prop) props29 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse29', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props29)
end)
local props30 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set30', function(prop) props30 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse30', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props30)
 end)
local props31 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set31', function(prop) props31 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse31', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props31)
end)
local props32 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set32', function(prop) props32 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse32', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props32) end)
local props33 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set33', function(prop) props33 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse33', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props33) end)
local props34 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set34', function(prop) props34 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse34', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props34)
 end)
local props35 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set35', function(prop) props35 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse35', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props35) 
end)

-------- TROLLY
local props36 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set36', function(prop) props36 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse36', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    print(props36)
    print('prop36')
    if props36 ==    'ch_prop_ch_cash_trolly_01a' then item = 'band' give(item)
    elseif props36 == 'ch_prop_gold_trolly_01a' then  item = 'goldbar' give(item)
    elseif props36 == 'ch_prop_diamond_trolly_01a'then item = 'diamond' give(item)
    else item = 'markedbills' give(item)
end end) 
local props37 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set37', function(prop) props37 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse37', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    print(props37)
    print('prop37')
    if props37 ==    'ch_prop_ch_cash_trolly_01a' then item = 'band' give(item)
    elseif props37 == 'ch_prop_gold_trolly_01a' then  item = 'goldbar' give(item)
    elseif props37 == 'ch_prop_diamond_trolly_01a'then item = 'diamond' give(item)
    else item = 'markedbills' give(item)
end end) 
local props38 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set38', function(prop) props38 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse38', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    print(props38)
    print('prop38')
    if props38 ==    'ch_prop_ch_cash_trolly_01a' then item = 'band' give(item)
    elseif props38 == 'ch_prop_gold_trolly_01a' then  item = 'goldbar' give(item)
    elseif props38 == 'ch_prop_diamond_trolly_01a'then item = 'diamond' give(item)
    else item = 'markedbills' give(item)
end end) 






---- pile
local props39 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set39', function(prop) props39 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse39', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    if props39 ==    'ex_cash_pile_005' then item = 'band' give(item, 5)
    elseif props39 == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' give(item, 5) 
end end)
---- pile
local props42 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set42', function(prop) props42 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse42', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    if props42 ==    'ex_cash_pile_005' then item = 'band' give(item, 5)
    elseif props42 == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' give(item, 5) 
end end)
---- pile
local props43 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set43', function(prop) props43 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse43', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    if props43 ==    'ex_cash_pile_005' then item = 'band' give(item, 5)
    elseif props43 == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' give(item, 5) 
end end)
--- BIG CASH STACK
local props40 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set40', function(prop) props40 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse40', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(props40)
 end)




























--------- ============== VAULT   ==============
local props44 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set44', function(prop) props44 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse44', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(44)
end)
local props45 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set45', function(prop) props45 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse45', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(45)
end)
local props46 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set46', function(prop) props46 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse46', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(46)
end)
local props47 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set47', function(prop) props47 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse47', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(47)
end)
local props48 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set48', function(prop) props48 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse48', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    hiya(48)
end)
local props49 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set49', function(prop) props49 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse49', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    print(props49)
    print('prop49')
    if props49 ==    'ch_prop_ch_cash_trolly_01a' then item = 'band' give(item)
    elseif props49 == 'ch_prop_gold_trolly_01a' then  item = 'goldbar' give(item)
    elseif props49 == 'ch_prop_diamond_trolly_01a'then item = 'diamond' give(item)
    else item = 'markedbills' give(item)
end end) 
local props50 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set50', function(prop) props50 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse50', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    print(props50)
    print('prop50')
    if props50 ==    'ch_prop_ch_cash_trolly_01a' then item = 'band' give(item)
    elseif props50 == 'ch_prop_gold_trolly_01a' then  item = 'goldbar' give(item)
    elseif props50 == 'ch_prop_diamond_trolly_01a'then item = 'diamond' give(item)
    else item = 'markedbills' give(item)
end end) 
