

Config.KitchenCash = {
    'prop_cash_pile_01',
    'prop_cash_pile_02',
    'prop_anim_cash_pile_01',
    'prop_anim_cash_pile_02', 
    'bkr_prop_bkr_cash_roll_01'
}
Config.KitchenGold = {
    'ch_prop_gold_bar_01a', 
    'hei_prop_heist_gold_bar', 
    'prop_gold_bar'
}
Config.KitchenExclusive = {
    'prop_peyote_gold_01', 
    'ex_prop_exec_award_gold',
    'xs_prop_trophy_goldbag_01a',
    'vw_prop_vw_pogo_gold_01a',
    'h4_prop_h4_gold_coin_01a',
    'vw_prop_casino_art_egg_01a',
    'vw_prop_casino_art_miniature_09a',
    'vw_prop_casino_art_miniature_09b',
    'vw_prop_casino_art_miniature_09c',
    'vw_prop_casino_art_miniature_05a',
    'vw_prop_casino_art_miniature_05b',
    'vw_prop_casino_art_miniature_05c',
    'vw_prop_casino_art_car_09a',
    'vw_prop_casino_art_bird_01a',
    'vw_prop_casino_art_car_11a',
    'vw_prop_casino_art_grenade_01a',
    'vw_prop_casino_art_grenade_01b',
    'vw_prop_casino_art_grenade_01c',
    'vw_prop_art_pug_02a',
    'vw_prop_casino_art_basketball_02a',
    'vw_prop_miniature_yacht_01a',
    'vw_prop_miniature_yacht_01b',
    'vw_prop_miniature_yacht_01c',
    'vw_prop_casino_art_horse_01a',
    'vw_prop_casino_art_panther_01c',
}
Config.KitchenLocations = {
   vector4(-1296.85, -820.21, 16.88, 304.38), -- d
   vector4(-1301.34, -817.36, 17.08, 120), 
   vector4(-1299.3, -814.44, 16.6, 303.48), 
}
Config.KitchenLocations2 = {
    vector4(-1295.58, -816.95, 17.15, 303.63), 
    vector4(-1297.0, -823.58, 17.15, 121.15), 
    vector4(-1293.38, -821.2, 17.15, 258.34)
}
Config.KitchenLocations3 = {
    vector4(-1296.82, -819.6, 16.88, 214.72),
    vector4(-1294.87, -817.97, 17.17, 303.25),
    vector4(-1297.76, -816.69, 16.57, 308.0)
}
Config.KitchenLocations4 = {
    vector4(-1293.56, -821.27, 17.17, 216.56),
    vector4(-1295.96, -820.5, 16.88, 31.64),
    vector4(-1301.92, -816.67, 17.09, 127.05)
}



local prop = nil
function bigroom() kitchenstuff5() kitchenstuff6() kitchenstuff7() kitchenstuff25() kitchenstuff26() kitchenstuff27() kitchenstuff28() kitchenstuff29()  end
function kitchenstuff() TriggerClientEvent('Polar-BayCityBank:Client:OpenDoor', -1) kitchenstuff2() kitchenstuff3() kitchenstuff4() end
function enterance() bigroom() office() setdoor() end
function staff()  kitchenstuff41()  kitchenstuff42()  kitchenstuff44() kitchenstuff45()  kitchenstuff46()  kitchenstuff47() kitchenstuff48() kitchenstuff49() kitchenstuff50()end
function office()  kitchenstuff30() kitchenstuff31() kitchenstuff32() kitchenstuff33() kitchenstuff34() kitchenstuff35() kitchenstuff36() kitchenstuff37() kitchenstuff38() kitchenstuff39() kitchenstuff40() end























function kitchenstuff1()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.KitchenLocations[math.random(1, #Config.KitchenLocations )]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set', prop)
    local baybutton = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton', baybutton, prop, kitchenlocationtable) 
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop', -1, 'baybutton', prop, kitchenlocationtable) 
    
end


function kitchenstuff2()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.KitchenLocations2[math.random(1, #Config.KitchenLocations2 )]
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set2', prop)
    local baybutton2 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton2', baybutton2, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop2', -1, 'baybutton2', prop, kitchenlocationtable) 
    

end


function kitchenstuff3()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.KitchenLocations3[math.random(1, #Config.KitchenLocations3 )]
   
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set3', prop)
    local baybutton3 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton3', baybutton3, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop3', -1, 'baybutton3', prop, kitchenlocationtable) 
    

end


function kitchenstuff4()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.KitchenLocations4[math.random(1, #Config.KitchenLocations4 )]
   
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set4', prop)
    local baybutton4 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton4', baybutton4, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop4', -1, 'baybutton4', prop, kitchenlocationtable) 
    

end



function kitchenstuff5()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations5[math.random(1, #Config.MainRoomLocations5 )]
    print('5')
  
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set5', prop)
    local baybutton5 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton5', baybutton5, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop5', -1, 'baybutton5', prop, kitchenlocationtable) 
    

end






function kitchenstuff6()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations6[math.random(1, #Config.MainRoomLocations6 )]
    print('6')
    
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set6', prop)
    local baybutton6 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton6', baybutton6, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop6', -1, 'baybutton6', prop, kitchenlocationtable) 
    

end




function kitchenstuff7()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations7[math.random(1, #Config.MainRoomLocations7 )]
    print('7')
   
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set7', prop)
    local baybutton7 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton7', baybutton7, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop7', -1, 'baybutton7', prop, kitchenlocationtable) 
    

end






function kitchenstuff25()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations25[math.random(1, #Config.MainRoomLocations25 )]
    print('25')

    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set25', prop)
    local baybutton25 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton25', baybutton25, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop25', -1, 'baybutton25', prop, kitchenlocationtable) 
    

end


function kitchenstuff26()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations26[math.random(1, #Config.MainRoomLocations26 )]
    print('26')

    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set26', prop)
    local baybutton26 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton26', baybutton26, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop26', -1, 'baybutton26', prop, kitchenlocationtable) 
    

end



    
function kitchenstuff27()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations27[math.random(1, #Config.MainRoomLocations27 )]
    print('27')

    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set27', prop)
    local baybutton27 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 27,'baybutton27', baybutton27, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop27', -1, 'baybutton27', prop, kitchenlocationtable) 
    

end




function kitchenstuff28()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations28[math.random(1, #Config.MainRoomLocations28 )]
    print('28')

    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set28', prop)
    local baybutton28 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 28,'baybutton28', baybutton28, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop28', -1, 'baybutton28', prop, kitchenlocationtable) 
    

end

function kitchenstuff29()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations29[math.random(1, #Config.MainRoomLocations29 )]
    print('29')
    
    local chance = math.random(1,100) 
    if chance<=35 then   prop = kitchencash 
    elseif chance<=75 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set29', prop)
    local baybutton29 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 29,'baybutton29', baybutton29, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop29', -1, 'baybutton29', prop, kitchenlocationtable) 
    

end










function kitchenstuff30()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations30[math.random(1, #Config.MainRoomLocations30 )]
    print('30')

    local chance = math.random(1,100) 
    if chance<=75 then   prop = kitchencash 
    elseif chance<=95 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set30', prop)
    local baybutton30 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 30,'baybutton30', baybutton30, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop30', -1, 'baybutton30', prop, kitchenlocationtable) 
    

end


function kitchenstuff31()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations31[math.random(1, #Config.MainRoomLocations31 )]
    local chance = math.random(1,100) 
    if chance<=75 then   prop = kitchencash 
    elseif chance<=95 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set31', prop)
    local baybutton31 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 31,'baybutton31', baybutton31, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop31', -1, 'baybutton31', prop, kitchenlocationtable) 
end
function kitchenstuff32()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations32[math.random(1, #Config.MainRoomLocations32 )]
    local chance = math.random(1,100)  if chance<=75 then   prop = kitchencash  elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive
    end  TriggerEvent('Polar-BayCityBank:Server:Set32', prop) local baybutton32 = true TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 32,'baybutton32', baybutton32, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop32', -1, 'baybutton32', prop, kitchenlocationtable) 
end
function kitchenstuff33()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations33[math.random(1, #Config.MainRoomLocations33 )]
    local chance = math.random(1,100)  if chance<=75 then   prop = kitchencash  elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive
    end  TriggerEvent('Polar-BayCityBank:Server:Set33', prop) local baybutton33 = true TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 33,'baybutton33', baybutton33, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop33', -1, 'baybutton33', prop, kitchenlocationtable) 
end




function kitchenstuff34()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations34[math.random(1, #Config.MainRoomLocations34 )]
    print('34')

    local chance = math.random(1,100) 
    if chance<=75 then   prop = kitchencash 
    elseif chance<=95 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set34', prop)
    local baybutton34 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton34', baybutton34, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop34', -1, 'baybutton34', prop, kitchenlocationtable) 
    

end
function kitchenstuff35()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations35[math.random(1, #Config.MainRoomLocations35 )]
    local chance = math.random(1,100) 
    if chance<=75 then   prop = kitchencash 
    elseif chance<=95 then  prop = kitchengold
    elseif chance<=100 then   prop = kitchenexclusive
    end 
    TriggerEvent('Polar-BayCityBank:Server:Set35', prop)
    local baybutton35 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton35', baybutton35, prop, kitchenlocationtable)
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop35', -1, 'baybutton35', prop, kitchenlocationtable) 
    

end





-------- TROLLYS

function kitchenstuff36()
    local locations = {
        vector4(-1289.34, -840.95, 16.15, 35.8),
        vector4(-1294.2, -837.72, 16.15, 304.54),
    }
    local kitchencash = 'ch_prop_ch_cash_trolly_01a'
    local kitchengold = 'ch_prop_gold_trolly_01a'
    local kitchenexclusive = 'ch_prop_diamond_trolly_01a'
    local kitchenlocationtable = locations[math.random(1, #locations)]
    local chance = math.random(1,100) if chance<=40 then   prop = kitchencash  elseif chance<=90 then  prop = kitchengold  elseif chance<=100 then   prop = kitchenexclusive end 
   
    TriggerEvent('Polar-BayCityBank:Server:Set36', prop) local baybutton36 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton36', baybutton36, prop, kitchenlocationtable) 
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop36', -1, 'baybutton36', prop, kitchenlocationtable) 
end
function kitchenstuff37()
    local locations = {
        vector4(-1294.6, -826.79, 16.15, 258.37),
        vector4(-1296.38, -841.42, 16.15, 268.85),
    }
    local kitchencash = 'ch_prop_ch_cash_trolly_01a'
    local kitchengold = 'ch_prop_gold_trolly_01a'
    local kitchenexclusive = 'ch_prop_diamond_trolly_01a'
    local kitchenlocationtable = locations[math.random(1, #locations)]
    local chance = math.random(1,100) if chance<=40 then   prop = kitchencash  elseif chance<=90 then  prop = kitchengold  elseif chance<=100 then   prop = kitchenexclusive end 
   
    TriggerEvent('Polar-BayCityBank:Server:Set37', prop) local baybutton37 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton37', baybutton37, prop, kitchenlocationtable) 
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop37', -1, 'baybutton37', prop, kitchenlocationtable) 
end
function kitchenstuff38()
    local locations = {
        vector4(-1301.61, -833.3, 16.15, 274.3),
        vector4(-1299.84, -830.53, 16.15, 180.82),
        vector4(-1291.09, -826.44, 16.15, 127.96),
    }
    local kitchencash = 'ch_prop_ch_cash_trolly_01a'
    local kitchengold = 'ch_prop_gold_trolly_01a'
    local kitchenexclusive = 'ch_prop_diamond_trolly_01a'
    local kitchenlocationtable = locations[math.random(1, #locations)]
    local chance = math.random(1,100) if chance<=40 then   prop = kitchencash  elseif chance<=90 then  prop = kitchengold  elseif chance<=100 then   prop = kitchenexclusive end 
   
    TriggerEvent('Polar-BayCityBank:Server:Set38', prop) local baybutton38 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton38', baybutton38, prop, kitchenlocationtable) 
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop38', -1, 'baybutton38', prop, kitchenlocationtable) 
end




---- CASH PILE
function kitchenstuff39()
    local locations = {
        vector4(-1294.12, -825.29, 16.15, 36.19),
        vector4(-1293.06, -842.95, 16.15, 210.3),
        vector4(-1292.1, -842.27, 16.15, 214.0),
        vector4(-1293.98, -840.84, 16.15, 213.81),
    }
    local pileprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = pileprops[math.random(1, #pileprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local kitchenlocationtable = locations[math.random(1, #locations)]
    local chance = math.random(1,100)  if chance<= 75 then   prop = pileprop  else prop = goldprop end  
    TriggerEvent('Polar-BayCityBank:Server:Set39', prop) local baybutton39 = true TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 39,'baybutton39', baybutton39, prop, kitchenlocationtable, true) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop39', -1, 'baybutton39', prop, kitchenlocationtable) 
end

---- CASH PILE
function kitchenstuff41()
    local locations = {
        vector4(-1310.29, -812.76, 16.15, 310.88),
        vector4(-1311.37, -811.29, 16.15, 36.24),
        vector4(-1311.44, -819.92, 16.15, 36.85),
    }
    local pileprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = pileprops[math.random(1, #pileprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local kitchenlocationtable = locations[math.random(1, #locations)]
    local chance = math.random(1,100)  if chance<= 75 then   prop = pileprop  else prop = goldprop end  
    TriggerEvent('Polar-BayCityBank:Server:Set41', prop) local baybutton41 = true TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 41,'baybutton41', baybutton41, prop, kitchenlocationtable, true) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop41', -1, 'baybutton41', prop, kitchenlocationtable) 
end
---- CASH PILE
function kitchenstuff42()
    local locations = {
        vector4(-1308.36, -811.38, 16.15, 124.09),
        vector4(-1307.22, -812.61, 16.15, 219.67),
        vector4(-1309.22, -814.27, 16.15, 215.49),
    }
    local pileprops = {
        'ex_cash_pile_005',
    }
    local goldprops = {
        'h4_prop_h4_gold_stack_01a'
    }
    local pileprop = pileprops[math.random(1, #pileprops)]
    local goldprop = goldprops[math.random(1, #goldprops)]
    local kitchenlocationtable = locations[math.random(1, #locations)]
    local chance = math.random(1,100)  if chance<= 75 then   prop = pileprop  else prop = goldprop end  
    TriggerEvent('Polar-BayCityBank:Server:Set42', prop) local baybutton42 = true TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 42,'baybutton42', baybutton42, prop, kitchenlocationtable, true) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop42', -1, 'baybutton42', prop, kitchenlocationtable) 
end
----- ======== CASH STACK BIG ===========
function kitchenstuff40()
    local pileprop =  'h4_prop_h4_cash_stack_01a'
    local goldprop = 'h4_prop_h4_gold_stack_01a'
    local kitchenlocationtable =  vector4(-1289.91, -835.15, 16.95, 218.8) 
    local chance = math.random(1,100)  if chance<= 10 then   prop = pileprop  else prop = goldprop end 
    local baybutton40 = true 
    TriggerEvent('Polar-BayCityBank:Server:Set40', prop)
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton40', baybutton40, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop40', -1, 'baybutton40', prop, kitchenlocationtable) 
end












--------- ============ VAULT ===============
function kitchenstuff44()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations44[math.random(1, #Config.MainRoomLocations44 )]
    local chance = math.random(1,100) if chance<=75 then   prop = kitchencash elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive end TriggerEvent('Polar-BayCityBank:Server:Set44', prop) local baybutton44 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton44', baybutton44, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop44', -1, 'baybutton44', prop, kitchenlocationtable) 
end
function kitchenstuff45()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations45[math.random(1, #Config.MainRoomLocations45 )]
    local chance = math.random(1,100) if chance<=75 then   prop = kitchencash elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive end TriggerEvent('Polar-BayCityBank:Server:Set45', prop) local baybutton45 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton45', baybutton45, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop45', -1, 'baybutton45', prop, kitchenlocationtable) 
end
function kitchenstuff46()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations46[math.random(1, #Config.MainRoomLocations46 )]
    local chance = math.random(1,100) if chance<=75 then   prop = kitchencash elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive end TriggerEvent('Polar-BayCityBank:Server:Set46', prop) local baybutton46 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton46', baybutton46, prop, kitchenlocationtable) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop46', -1, 'baybutton46', prop, kitchenlocationtable) 
end
function kitchenstuff47()
    local kitchencash = Config.KitchenCash[math.random(1, #Config.KitchenCash )]
    local kitchengold = Config.KitchenGold[math.random(1, #Config.KitchenGold )]
    local kitchenexclusive = Config.KitchenExclusive[math.random(1, #Config.KitchenExclusive )]
    local kitchenlocationtable = Config.MainRoomLocations47[math.random(1, #Config.MainRoomLocations47 )]
    local chance = math.random(1,100)  if chance<=75 then   prop = kitchencash  elseif chance<=95 then  prop = kitchengold elseif chance<=100 then   prop = kitchenexclusive
    end  TriggerEvent('Polar-BayCityBank:Server:Set47', prop) 
    local baybutton47 = true 
    TriggerClientEvent('Polar-BayCityBank:Client:AddPickupTarget', -1, 47, 'baybutton47', baybutton47, prop, kitchenlocationtable) 
    TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop47', -1, 'baybutton47', prop, kitchenlocationtable) 
end
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
function kitchenstuff49()
    local kitchencash = 'ch_prop_ch_cash_trolly_01a'
    local kitchengold = 'ch_prop_gold_trolly_01a'
    local kitchenexclusive = 'ch_prop_diamond_trolly_01a'
    local location = Config.CartLocations49[math.random(1, #Config.CartLocations49 )]
    local chance = math.random(1,100) if chance<=30 then   prop = kitchencash  elseif chance<=65 then  prop = kitchengold  elseif chance<=100 then   prop = kitchenexclusive end 
   
    TriggerEvent('Polar-BayCityBank:Server:Set49', prop) local baybutton49 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton49', baybutton49, prop, location) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop49', -1, 'baybutton49', prop, location) 
end
function kitchenstuff50()
    local kitchencash = 'ch_prop_ch_cash_trolly_01a'
    local kitchengold = 'ch_prop_gold_trolly_01a'
    local kitchenexclusive = 'ch_prop_diamond_trolly_01a'
    local location = Config.CartLocations50[math.random(1, #Config.CartLocations50 )]
    local chance = math.random(1,100) if chance<=30 then   prop = kitchencash  elseif chance<=65 then  prop = kitchengold  elseif chance<=100 then   prop = kitchenexclusive end 
   
    TriggerEvent('Polar-BayCityBank:Server:Set50', prop) local baybutton50 = true
    TriggerClientEvent('Polar-BayCityBank:Client:AddTarget', -1, 'baybutton50', baybutton50, prop, location) TriggerClientEvent('Polar-BayCityBank:Client:baybuttonprop50', -1, 'baybutton50', prop, location) 
end


