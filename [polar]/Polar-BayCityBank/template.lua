
-- client



--- pickup or grab

RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop47', function(door, prop, var) loadModel(prop) buttonprop47 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop47, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton47 then DeleteEntity(buttonprop47) break end end end) end)
--- trolly

RegisterNetEvent('Polar-BayCityBank:Client:baybuttonprop47', function(door, prop, var) loadModel(prop) prop47 = prop buttonprop47 =  CreateObject(prop, var.x, var.y, var.z,  true,  true, true) SetEntityHeading(buttonprop47, var.w) 
    TriggerServerEvent('Polar-BayCityBank:Server:StartInteract', door) CreateThread(function() while true do Wait(100) if not Config.baybutton47 then DeleteEntity(buttonprop47) break end end end) end)
   


--[[
    function kitchenstuff47()
        local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
        local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
        local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
        local kitchenlocationtable = Config.MainRoomLocations47[math.random(1, #Config.MainRoomLocations47 )]
        local chance = math.random(1,100)  if chance<=75 then   prop = kitchencash  elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive
        end  TriggerEvent('Polar-BayCityBank:Server:Set47', prop) local baybutton47 = true TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 47,'baybutton47', baybutton47, prop, kitchenlocationtable, true) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop47', -1, 'baybutton47', prop, kitchenlocationtable) 
    end]]

    
    --- Shared PICKUP
    function kitchenstuff48()
        local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
        local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
        local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
        local kitchenlocationtable = Config.MainRoomLocations48[math.random(1, #Config.MainRoomLocations48 )]
        local chance = math.random(1,100)  if chance<=75 then   prop = kitchencash  elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive
        end  TriggerEvent('Polar-BayCityBank:Server:Set48', prop) 
        local baybutton48 = true 
        TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 48, 'baybutton48', baybutton48, prop, kitchenlocationtable) 
        TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop48', -1, 'baybutton48', prop, kitchenlocationtable) 
    end
    
    ------ SHARED GRAB

    function kitchenstuff47()
        local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
        local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
        local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
        local kitchenlocationtable = Config.MainRoomLocations47[math.random(1, #Config.MainRoomLocations47 )]
        local chance = math.random(1,100) if chance<=75 then   prop = kitchencash elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive end TriggerEvent('Polar-BayCityBank:Server:Set47', prop) local baybutton47 = true
        TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton47', baybutton47, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop47', -1, 'baybutton47', prop, kitchenlocationtable) 
    end

    ---- newTrolly

    function kitchenstuff47()
        local kitchencash = 'ch_prop_ch_cash_trolly_01a'
        local kitchengold = 'ch_prop_gold_trolly_01a'
        local kitchenexclusive = 'ch_prop_diamond_trolly_01a'
        local location = Config.CartLocations47[math.random(1, #Config.CartLocations47 )]
        local chance = math.random(1,100) if chance<=47 then   prop = kitchencash  elseif chance<=75 then  prop = kitchengold  elseif chance<=100 then   prop = kitchenexclusive end 
       
        TriggerEvent('Polar-BayCityBank:Server:Set47', prop) local baybutton47 = true
        TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton47', baybutton47, prop, location) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop47', -1, 'baybutton47', prop, location) 
    end



---- server

-- pickup or grab

local props47 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set47', function(prop) props47 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse47', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    print(props47)
    print('prop47')
    if props47 ==    'prop_cash_pile_01' then item = 'band' give(item)
    elseif props47 == 'prop_cash_pile_02' then  item = 'band' give(item)
    elseif props47 == 'prop_anim_cash_pile_01'then item = 'band' give(item)
    elseif props47 ==  'prop_anim_cash_pile_02'then  item = 'band' give(item)
    elseif props47 ==  'bkr_prop_bkr_cash_roll_01' then  item = 'band' give(item)
    
    elseif props47 ==  'ch_prop_gold_bar_01a' then  item = 'goldbar' give(item)
    elseif props47 ==  'hei_prop_heist_gold_bar' then  item = 'goldbar' give(item)
    elseif props47 ==  'prop_gold_bar' then item = 'goldbar' give(item)
    
    elseif props47 == 'prop_peyote_gold_01'then  item = 'goldbar' give(item)
    elseif props47 == 'ex_prop_exec_award_gold'then item = 'goldbar' give(item)
    elseif props47 == 'xs_prop_trophy_goldbag_01a'then item = 'goldbar' give(item)
    elseif props47 == 'vw_prop_vw_pogo_gold_01a'then item = 'goldbar' give(item)
    elseif props47 == 'h27_prop_h27_gold_coin_01a' then  item = 'goldbar' give(item)

end end)




---- pile
local props47 = nil
RegisterNetEvent('Polar-BayCityBank:Server:Set47', function(prop) props47 = prop end)
RegisterNetEvent('Polar-BayCityBank:Server:Synapse47', function(prop)  local src = source local Player = QBCore.Functions.GetPlayer(src)
    if props47 ==    'ex_cash_pile_005' then item = 'band' give(item, 5)
    elseif props47 == 'h4_prop_h4_gold_stack_01a' then  item = 'goldbar' give(item, 5) 
end end)



---- trolly
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



--- mainroom.lua


