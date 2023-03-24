local QBCore = exports['qb-core']:GetCoreObject()
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() Wait(100) props() end)
AddEventHandler('onResourceStart', function(resource) if resource == GetCurrentResourceName() then Wait(100) if Config.Debug then print('Starting Props') end props() end end)
local cars2 = {
    'bulldozer',
    'bulldozer',
    'bulldozer',
    'utillitruck',
    'utillitruck2',
    'utillitruck2',
    'docktrailer',
    'trflat',
    'Biff',
    'bison3',
    'TipTruck2',
    'Rubble',
    'Utillitruck3',
}
function props() Wait(50)
    local loc = vector4(409.57, -1034.76, 29.36, 173.63) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(390.46, -1024.37, 29.38, 144.28) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(393.66, -1027.54, 29.29, 135.59) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(397.56, -1029.89, 29.48, 148.65) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(400.77, -1031.8, 29.45, 150.72) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(404.89, -1034.13, 29.26, 151.69) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(386.58, -962.07, 29.43, 267.66) local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(386.74, -957.61, 29.4, 267.0)local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(387.17, -953.04, 29.43, 264.71)local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(387.8, -948.62, 29.42, 264.44)local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(389.4, -944.57, 29.42, 249.96)local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(389.0, -944.58, 29.43, 57.37)local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(454.54, -870.32, 27.32, 230.09)local prop =  CreateObject(GetHashKey("prop_fnclink_04a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
   
    local loc = vector4(489.28, -943.3, 27.02, 1.23)local prop =  CreateObject(GetHashKey("prop_fnclink_04e"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(501.68, -943.32, 27.02, 50.72)local prop =  CreateObject(GetHashKey("prop_fnclink_04d"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(488.18, -1057.83, 28.64, 23.61)local prop =  CreateObject(GetHashKey("prop_fnclink_04e"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(499.48, -1053.31, 28.55, 22.51)local prop =  CreateObject(GetHashKey("prop_fnclink_04d"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(395.27, -878.95, 29.37, 19.14)local prop =  CreateObject(GetHashKey("prop_fnclink_04e"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(406.87, -875.33, 29.36, 9.57)local prop =  CreateObject(GetHashKey("prop_fnclink_04d"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
   
    local loc = vector4(494.16, -1047.56, 28.4, 137.06)local prop =  CreateObject(GetHashKey("prop_woodpile_01a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(501.88, -1043.2, 28.41, 165.83)local prop =  CreateObject(GetHashKey("prop_plywoodpile_01b"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(499.87, -974.5, 27.48, 216.88)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(481.06, -955.41, 27.5, 252.22)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(451.49, -943.46, 28.49, 358.2)local prop =  CreateObject(GetHashKey("prop_drywallpile_02"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(446.11, -961.46, 28.8, 252.11)local prop =  CreateObject(GetHashKey("prop_plywoodpile_01a"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(423.3, -954.18, 29.34, 284.22)local prop =  CreateObject(GetHashKey("prop_aircon_m_01"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(397.14, -999.72, 29.42, 352.61)local prop =  CreateObject(GetHashKey("xs_prop_arena_industrial_e"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(399.9, -976.56, 29.38, 312.14)local prop =  CreateObject(GetHashKey("cs1_12_building005"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
   
    local loc = vector4(402.81, -937.95, 29.45, 205.35)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(401.44, -884.66, 29.32, 105.19)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(399.37, -980.48, 29.4, 355.59)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(398.56, -1015.45, 29.46, 6.88)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(451.06, -1017.73, 28.51, 125.86)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(433.97, -1003.58, 26.49, 5.01)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    local loc = vector4(450.13, -995.13, 43.69, 57.7)local prop =  CreateObject(GetHashKey("prop_pile_dirt_03"),vector3(loc.x, loc.y, loc.z-1), false, false, false) SetEntityHeading(prop, loc.w)  -- back double
    
    peds('s_m_m_lathandy_01','WORLD_HUMAN_GUARD_STAND', vector4(409.7, -976.82, 29.42, 142.27))
    peds('s_m_m_gardener_01','WORLD_HUMAN_CLIPBOARD', vector4(443.69, -1025.26, 28.69, 154.77))
    peds('s_m_m_gaffer_01','WORLD_HUMAN_MUSCLE_FLEX', vector4(411.05, -978.28, 29.42, 92.96))
    peds('cs_floyd','WORLD_HUMAN_WELDING', vector4(428.89, -971.75, 30.71, 78.49))
    peds('a_m_m_tranvest_01','WORLD_HUMAN_JANITOR', vector4(426.72, -979.01, 30.71, 164.85))
    peds('s_m_y_dockwork_01','WORLD_HUMAN_GARDENER_LEAF_BLOWER', vector4(423.96, -1003.71, 30.71, 14.53))
    peds('mp_f_cocaine_01','WORLD_HUMAN_YOGA', vector4(396.36, -999.43, 56.23, 116.61))
    peds('S_M_Y_Construct_01','WORLD_HUMAN_HAMMERING', vector4(425.0, -955.02, 29.33, 34.34))
    peds('S_M_Y_Construct_02','WORLD_HUMAN_WELDING', vector4(422.68, -953.09, 29.32, 187.94))
    peds('s_m_m_dockwork_01','WORLD_HUMAN_HAMMERING', vector4(443.89, -1028.6, 28.89, 15.28))
    peds('a_m_m_hillbilly_01','WORLD_HUMAN_WELDING', vector4(443.69, -1025.26, 28.69, 154.77))
    peds('csb_trafficwarden','WORLD_HUMAN_CAR_PARK_ATTENDANT', vector4(407.14, -1035.66, 29.32, 167.04))


    car( cars2[math.random(1, #cars2)], vector4(407.87, -1021.43, 29.36, 99.04))
    car( cars2[math.random(1, #cars2)], vector4(427.04, -1018.19, 28.98, 319.42))
    car( cars2[math.random(1, #cars2)], vector4(439.26, -1017.55, 28.74, 26.53))
    car( cars2[math.random(1, #cars2)], vector4(444.39, -1026.85, 28.68, 277.65))
    car( cars2[math.random(1, #cars2)], vector4(408.09, -989.24, 29.27, 41.91))
    car( cars2[math.random(1, #cars2)], vector4(390.59, -966.64, 29.45, 353.45))
    car('trailers', vector4(413.73, -904.8, 29.42, 359.11))
    --car('tanker', vector4(432.46, -945.44, 29.15, 268.6))
    car( cars2[math.random(1, #cars2)], vector4(467.94, -958.37, 27.86, 270.87))
    --car('docktrailer', vector4(492.11, -976.15, 27.47, 177.29))
    car('dump', vector4(403.75, -952.13, 29.46, 308.17))
    car('hydra2', vector4(448.88, -981.65, 43.69, 84.55))
    car('hydra2', vector4(482.14, -982.11, 41.01, 268.45))
    car(  cars2[math.random(1, #cars2)],vector4(408.01, -922.46, 29.26, 356.18))
    car( cars2[math.random(1, #cars2)], vector4(407.06, -890.97, 29.43, 295.61))
    car( cars2[math.random(1, #cars2)], vector4(395.68, -904.37, 29.42, 144.24))
    car( cars2[math.random(1, #cars2)], vector4(436.56, -959.06, 28.99, 297.98))
   -- car('bison2', vector4(390.59, -966.64, 29.45, 353.45))
    car( cars2[math.random(1, #cars2)], vector4(457.45, -949.83, 28.16, 267.56))
    car( cars2[math.random(1, #cars2)], vector4(498.63, -947.72, 27.06, 243.98))
    car( cars2[math.random(1, #cars2)], vector4(500.25, -994.15, 27.76, 127.92))
    car( cars2[math.random(1, #cars2)], vector4(496.91, -1017.7, 27.97, 41.71))
   -- car('Caddy2', vector4(408.09, -989.24, 29.27, 41.91))
   -- car('armytrailer2', vector4(390.59, -966.64, 29.45, 353.45))



   
    -- Wait(5000) DeleteEntity(prop)
   Wait(50) FreezeEntityPosition(prop, true)   

end 


function car(name, v)
    cars = name 
    RequestModel(cars) while not HasModelLoaded(cars) do Wait(0) end
    veh = CreateVehicle(cars, v.x, v.y, v.z, v.w, false, false)
    SetVehicleOnGroundProperly(veh)
    SetEntityInvincible(veh, true) 
    FreezeEntityPosition(veh, true)   
    SetVehicleNumberPlateText(veh, "NTOS")
    SetVehicleNumberPlateTextIndex(veh, 3)

end


function peds(model, anim, v)
   
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(100)
    end
    local ped2 = CreatePed(27, model, v.x,v.y,v.z-1,v.w, 0, 0)

    
    TaskStartScenarioInPlace(ped2, anim, 0, true)
    
    
end
