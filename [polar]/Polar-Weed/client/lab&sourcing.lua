local QBCore = exports[Config.Core]:GetCoreObject()


local playerPed = PlayerPedId()

local guards = nil
local done = false
local dead = 0
local src = source

local busy = false
local inmission = false
local mailman = nil
local mailguy = nil
local subjects = nil
local doubleup = nil
local coords = nil

local green = 'success'
local red = 'error'
local alerttime = math.random(1500,2500)

local TimeLeft = nil
local Left = 'Nothing Drying'

local Checked1 = false
local Checked2 = false
local Checked3 = false
local Pick1Check1 = false
local Pick2Check2 = false
local PackCheck1 = false
local rob = false
local PottyCheck = false
local PottyMouthCheck = false

local pick = 'HARDSTUFF'

local npcs = {  
    ['npcguards'] = {},
   
}

local cooldown1 = false

local setup = nil
local boat = nil
local boatlocation = nil
local facing = nil
local object = nil
local objectlocation = nil
local object2 = nil
local boatcar = nil

local animationdiction = "mini@cpr@char_a@cpr_str"
local animation = "cpr_pumpchest"

CreateThread(function()

    if Config.Debug then print('Script Started') end

   
       

     
        NewTarget()

end)

CreateThread(function()


   

   
    exports['qb-target']:AddBoxZone("mission", vector3(1045.2, -3194.85, -38.33), 1, 1, {
        name = "mission",
        heading = 0,
        debug = Config.Debug,
            minZ = -40.1956,
            maxZ =  -38.1956,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:Cops",
                    icon = "fa-solid fa-cannabis",
                    label = "Source Product",
                    excludejob = 'police'
                }
            },
            distance = 1.5
        })
    
    

    
   
      
    

  
    


    

    

end)
CreateThread(function()


    exports['qb-target']:AddBoxZone("enterlab2", vector3(2849.3, 4449.72, 48.52), 1, 1, {
        name = "enterlab3",
        heading = 0,
             debug = Config.Debug,
            minZ =  47.79,
            maxZ =  49.79,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:Enter",
                    icon = "fa-solid fa-cannabis",
                    label = "Enter",
                    excludejob = 'police'
                }
            },
            distance = 1.5
        })

    
    
    

    exports['qb-target']:AddBoxZone("exitlab5", vector3(1066.68, -3183.975, -39.03), 1, 1, {
        name = "exitlab4",
        heading = 0,
        debug = Config.Debug,
            minZ =  -40.00,
            maxZ =-38.7,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:Exit",
                    icon = "fa-solid fa-cannabis",
                    label = "Exit",
                    excludejob = 'police'
                }
            },
            distance = 1.5
        })




end)
CreateThread(function()
   
--[[
    exports['qb-target']:AddBoxZone("POT1", vector3(1049.38, -3195.28, -39.15), 1, 1, {
        name = "POT1",
        heading = 0,
        debug = Config.Debug,
            minZ =   -40.0,
            maxZ =   -37.0,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:POT1",
                    icon = "fa-solid fa-cannabis",
                    label = "Grab Pot",
                    excludejob = 'police'
                }
            },
            distance = 2.5
        })
        ]]
   
    exports['qb-target']:AddBoxZone("Pick3", vector3(1044.78, -3198.98, -38.45), 1.5, 2.0, { name="Pick3", heading = 0.0, debugPoly=Config.Debug, minZ=-39.3, maxZ=-37.3},
    { options = { {  event = "Polar-Weed:Client:Stash", icon = "fas fa-box-open", label = 'Open', excludejob = 'police', stash = "Storage", coords = vector3(1044.78, -3198.98, -38.45), }, },  distance = 2.0 })

    
    exports['qb-target']:AddBoxZone("Sort2", vector3(1034.56, -3206.16, -38.68), 1, 1, {
        name = "Sort2",
        heading = 0,
        debug = Config.Debug,
            minZ = -40.19,
            maxZ =  -38.19,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:Sort2",
                    icon = "fa-solid fa-cannabis",
                    label = "Process Low Quality Crop",
                    excludejob = 'police'
                }
            },
            distance = 1.5
        }) -- vector3(1039.37, -3205.9, -37.7)
        exports['qb-target']:AddBoxZone("Sort3", vector3(1032.64, -3206.14, -38.7), 1, 1, {
            name = "Sort3",
            heading = 0,
            debug = Config.Debug,
                minZ = -40.19,
                maxZ =  -38.19,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Weed:Client:Sort3",
                        icon = "fa-solid fa-cannabis",
                        label = "Process Decent Quality Crop",
                        excludejob = 'police'
                    }
                },
                distance = 1.5
            })
            exports['qb-target']:AddBoxZone("Sort5", vector3(1037.4, -3205.92, -38.69), 1, 1, {
                name = "Sort5",
                heading = 0,
                debug = Config.Debug,
                    minZ = -40.19,
                    maxZ =  -38.19,
                }, {
                    options = {
                        {
                            type = "Client",
                            event = "Polar-Weed:Client:Sort5",
                            icon = "fa-solid fa-cannabis",
                            label = "Process Good Quality Crop",
                            excludejob = 'police'
                        }
                    },
                    distance = 1.5
                })
            exports['qb-target']:AddBoxZone("Sort4", vector3(1039.37, -3205.9, -38.7), 1, 1, {
                name = "Sort4",
                heading = 0,
                debug = Config.Debug,
                    minZ = -40.19,
                    maxZ =  -38.19,
                }, {
                    options = {
                        {
                            type = "Client",
                            event = "Polar-Weed:Client:Sort4",
                            icon = "fa-solid fa-cannabis",
                            label = "Process Decent Quality Crop",
                            excludejob = 'police'
                        }
                    },
                    distance = 1.5
                })
        exports['qb-target']:AddBoxZone("Sort1", vector3(1033.41, -3203.77, -38.7), 1, 1, {
            name = "Sort1",
            heading = 0,
            debug = Config.Debug,
                minZ = -40.19,
                maxZ =  -38.19,
            }, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Weed:Client:Sort1",
                        icon = "fa-solid fa-cannabis",
                        label = "Process Low Quality Crop",
                        excludejob = 'police'
                    }
                },
                distance = 1.5
            })
end)
function camerastart()
    local sceneCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    if Config.UseCam then
    RenderScriptCams(true, false, 0, 1, 0)
    SetCamCoord(sceneCam, 1030.45, -3202.58, -37.2)
    PointCamAtEntity(sceneCam, playerPed, 0.0, 0.0, 0.0, 1)
    end

    --vector3(1030.45, -3202.58, -38.2)
end
function cameraend()

    if Config.UseCam then
        RenderScriptCams(false, false, 0, 1, 0)
        DestroyCam(sceneCam, false)
        end

end
RegisterNetEvent('Polar-Weed:Client:MissionStart', function()
    
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:MCooldownCheck', function(MissionCheck)
        cooldown1 = MissionCheck
    end)
    Wait(100)
    if not cooldown1 then

    TriggerServerEvent('Polar-Weed:Server:MCooldown2')
        inmission = true
    startmission()

    else
        QBCore.Functions.Notify("Someone is Already Sourcing Products", red, alerttime)
        if Config.Debug then print('Someone is Already Sourcing Products') end
    end
end)

function randommail()
    local math = math.random(1,15)

    if math == 1 then
        mailman = 'Hey Sonny get there, and grab my supplies'
    elseif math == 2 then
        mailman = "Check the GPS for the Location of the Guards! Kill them Bitches"
    elseif math == 3 then
        mailman = "Get your Ass over there and Kill them MFS"
    elseif math == 4 then
        mailman = "Grab the Product from the Guards Bitch"
    elseif math == 5 then
        mailman = "Ayo its Lamar, I need that shit for my Shop"
    elseif math == 6 then
        mailman = "See them Bitches on the GPS? Thats right Get to Work."
    elseif math == 7 then
        mailman = "Make sure you get my Product back, I want that Shit Sealed"
    elseif math == 8 then
        mailman = "Them Supplies stolen by the Lost, That shit belongs to me"
    elseif math == 9 then
        mailman = "I don't care how you get the Shit, Kill their Families if you have to."
    elseif math == 10 then
        mailman = "Grab my Product, but keep under the radar, those Cops be watching Heavy."
    elseif math == 11 then
        mailman = "Get there Now! They are smoking it as we Speak!"
    elseif math == 12 then
        mailman = "Ayo Homie, I need that shit, Kill Grab and Go!"
    elseif math == 13 then
        mailman = "Holmes, Those Ballas sold my shit to the Lost, Get me my Shit back"
    elseif math == 14 then
        mailman = "Get me it"
    elseif math == 15 then
        mailman = "Daddy"


    
    end
end
function subject()
    local math = math.random(1,6)

    if math == 1 then
        subjects = 'Weed'
    elseif math == 2 then
        subjects = "My Property"
    elseif math == 3 then
        subjects = "My Goods"
    elseif math == 4 then
        subjects = "Get my Shit"
    elseif math == 5 then
        subjects = "Hood Run Shit"
    elseif math == 6 then
        subjects = "DL"
    
    end
end
function makesuredead()
    local math = math.random(1,6)

    if math == 1 then
        doubleup = 'Thanks for getting my shit back holmes'
    elseif math == 2 then
        doubleup = "Bring me that back before I come after your dumb ass"
    elseif math == 3 then
        doubleup = "Get your ass back here"
    elseif math == 4 then
        doubleup = "Did you search them bodies? I bet they have some good shit on them. Anyways come back to the Lab"
    elseif math == 5 then
        doubleup = "Grab the shit and get back to the Lab!"
    elseif math == 6 then
        doubleup = "Thats right, Take that you Pussies! Get Back to the Lab"
    
    end
end
function mailguys()
    local math = math.random(1,17)

    if math == 1 then
        mailguy = 'Lamar'
    elseif math == 2 then
        mailguy = "Davey"
    elseif math == 3 then
        mailguy = "Rico"
    elseif math == 4 then
        mailguy = "Tim"
    elseif math == 5 then
        mailguy = "Victor"
    elseif math == 6 then
        mailguy = "Luke"
    elseif math == 7 then
        mailguy = "Damarqus Donquavious Bartholomuel III"
    elseif math == 8 then
        mailguy = "The Suave Family"
    elseif math == 9 then
        mailguy = "John Smith"
    elseif math == 10 then
        mailguy = "Nixon"
    elseif math == 11 then
        mailguy = "Balake"
    elseif math == 12 then
        mailguy = "A-A-Ron"
    elseif math == 13 then
        mailguy = "Jaquavius"
    elseif math == 14 then
        mailguy = "Ken"
    elseif math == 15 then
        mailguy = "Douge"
    elseif math == 16 then
        mailguy = "Jordan"
    elseif math == 17 then
        mailguy = "Julion"
    
    end
end
RegisterNetEvent('Polar-Weed:Client:DeathMail', function()
    
    local charinfo = QBCore.Functions.GetPlayerData().charinfo

    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Uknown",
        subject = "Death in the Family",
        message = "" ..charinfo.firstname.. ", " .. "There was a death man, I don't know how it happened but one Died",
    })

end)
local Mail = function()
   
    local charinfo = QBCore.Functions.GetPlayerData().charinfo

TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = mailguy,
    subject = subjects,
    message = "" ..charinfo.firstname.. ", " .. mailman,
 })


end
local MailEnd = function()
   
    local charinfo = QBCore.Functions.GetPlayerData().charinfo

TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = mailguy,
    subject = subjects,
    message = "" ..charinfo.firstname.. ", " .. doubleup,
 })


end
local MailSearch = function()
   
    local charinfo = QBCore.Functions.GetPlayerData().charinfo

TriggerServerEvent('qb-phone:server:sendNewMail', {
    sender = mailguy,
    subject = subjects,
    message = "" ..charinfo.firstname.. ", " .. "Did you search them bodies? I bet they have some good shit on them. Anyways Go Get that Package",
 })


end
function startmission()

    Wait(5)

    -- MAIL SHIT
    randommail()
    subject()
    mailguys()
    makesuredead()

    Wait(5)

    exit()

    Wait(150)

    Mail()

    Wait(50)

    locationbitch()

    Wait(50)

    SpawnPeds()

    Wait(5)

    

end



local function shallowCopy(original)
	local copy = {}
	for key, value in pairs(original) do
		copy[key] = value
	end
	return copy
end

function locationbitch()

    local math = math.random(1, 10)
    
    if math < 5 then
        -- Boat House
        setup = Config.BoatHouseGuards
        boat = Config.BoatHouseBoat
        boatlocation = Config.BoatHouseBoatLocation
        facing = 251.45
        object = Config.BoatHouseObject
        objectlocation = Config.BoatHouseObjectLocation
        coords = vector3(3816.87, 4461.33, 3.84)
    elseif math >= 5 then
        setup = Config.BeachGuards
        boat = Config.BeachBoat
        boatlocation = Config.BeachBoatLocation
        facing = 252.69
        object = Config.BeachObject
        objectlocation = Config.BeachObjectLocation
        coords = vector3(2822.08, -727.78, 29.31)
    end
end

function SpawnPeds()
    local ped = PlayerPedId()
    if Config.Debug then print('Start Spawn Peds Function') end

        local boatcar = CreateVehicle(boat, boatlocation.x, boatlocation.y, boatlocation.z, facing, true, false)
        Wait(50)
        
        
        SetPedRelationshipGroupHash(ped, 'PLAYER')
        AddRelationshipGroup('npcguards')
    
        for k, v in pairs(setup) do
            --if Config.Debug then print('Setting Pairs') end
            local accuracy = Config.DefaultValues.accuracy
            if v.accuracy then
                accuracy = v.accuracy
            end
            local armor =  Config.DefaultValues.armor
            if v.armor then
                armor = v.armor
            end
            local guardPosition = v.coords
               
          
                    
        if setup.GuardPositions ~= nil then
            guardPosition = shallowCopy(setup.GuardPositions) -- these are used if random positions
        end
        
            
           
            RequestModel(v.model)
            --if Config.Debug then print('Requested Models') end
            npcs['npcguards'][k] = CreatePed(26, GetHashKey(v.model), guardPosition, true, true)
            if Config.Debug then print('Created Ped At ' .. guardPosition .. '') end
          
            SetPedRandomComponentVariation(npcs['npcguards'][k], 0)
            SetPedRandomProps(npcs['npcguards'][k])
            SetEntityAsMissionEntity(npcs['npcguards'][k])
            SetEntityVisible(npcs['npcguards'][k], true)
            SetPedRelationshipGroupHash(npcs['npcguards'][k], 'npcguards')
            SetPedAccuracy(npcs['npcguards'][k], accuracy)
            SetPedArmour(npcs['npcguards'][k], armor)
            SetPedCanSwitchWeapon(npcs['npcguards'][k], true)
            SetPedDropsWeaponsWhenDead(npcs['npcguards'][k], false)
            SetPedFleeAttributes(npcs['npcguards'][k], 0, false)
            SetPedCombatAttributes(npcs['npcguards'][k], 46, true)
            local weapon = 'WEAPON_PISTOL'
            if v.weapon then
                weapon = v.weapon
            end
            GiveWeaponToPed(npcs['npcguards'][k], v.weapon, 255, false, false)
            local random = math.random(1, 2)
            if random == 2 then
                TaskGuardCurrentPosition(npcs['npcguards'][k], 10.0, 10.0, 1)
            end
            Wait(1000) -- cheap way to fix npcs not spawning

           -- if Config.Debug then print('Given Blips') end
          
    

            SetRelationshipBetweenGroups(0, 'npcguards', 'npcguards')
            SetRelationshipBetweenGroups(5, 'npcguards', 'PLAYER')
            SetRelationshipBetweenGroups(5, 'PLAYER', 'npcguards')
            
             -- BLIP
             local blip = AddBlipForCoord(coords)
             SetBlipSprite (blip, 404)
             SetBlipDisplay(blip, 6) 
             SetBlipScale  (blip, 0.75)
             SetBlipAsShortRange(blip, true)
             SetBlipColour(blip, 16)
             BeginTextCommandSetBlipName("STRING")
             AddTextComponentSubstringPlayerName("Location")
             EndTextCommandSetBlipName(blip)
            
             
            -- BOAT BLIP
            local blip = AddBlipForEntity(boatcar)
            SetBlipSprite (blip, 404)
            SetBlipDisplay(blip, 6) 
            SetBlipScale  (blip, 0.75)
            SetBlipAsShortRange(blip, true)
            SetBlipColour(blip, 16)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName("Boat")
            EndTextCommandSetBlipName(blip)
            


            exports['qb-target']:AddTargetEntity(npcs['npcguards'][k], {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Weed:Client:SearchPed",
                        icon = "fa-solid fa-cannabis",
                        label = "Search",
                        excludejob = 'police'
                    },
                },
                distance = 2.0
            })

            CreateThread(function()
                if not done then
                while not done do
                    

                        if GetEntityHealth(npcs['npcguards'][k]) > 0 then
                            if Config.Debug then print('Alive') end
                            dead = 0
                    

                        elseif GetEntityHealth(npcs['npcguards'][k]) < 1 then
                            
                   

                            death()
                            if dead >= 10 then 
                                done = true 
                               
                                Wait(120000)

                                DeleteEntity(npcs['npcguards'][k])
                            
                                Wait(900000)

                                DeleteEntity(boatcar)
                                -- COOLDOWN ENDINGS
                               
                            end
                        end
                    Wait(1000)
                end
                
                end
            end)
            
        end 
end
function death()
    if dead < 10 then
        dead = dead+1
        if dead == 5 then
            
           

        end
    elseif dead >= 10 then
        done = true
        next()
        rob = true

       
    end
    if Config.Debug then print(dead) end
    if Config.Debug then print(done) end
end
function next()
    if done then
        if Config.Debug then print('Finished Killing') end
        
            rob = true

            Wait(50)
            MailSearch()


            local object2 = CreateObject(object, objectlocation.x, objectlocation.y, objectlocation.z - 1, 0, true, false)

            Wait(150)

             -- OBJECT BLIP
             local blip = AddBlipForEntity(object2)
             SetBlipSprite (blip, 501)
             SetBlipDisplay(blip, 6) 
             SetBlipScale  (blip, 0.75)
             SetBlipAsShortRange(blip, true)
             SetBlipColour(blip, 5)
             BeginTextCommandSetBlipName("STRING")
             AddTextComponentSubstringPlayerName("Package")
             EndTextCommandSetBlipName(blip)


             
            exports['qb-target']:AddTargetEntity(object2, {
                options = {
                    {
                        type = "Client",
                        event = "Polar-Weed:Client:GrabPackage",
                        icon = "fa-solid fa-cannabis",
                        label = "Grab Package",
                        excludejob = 'police'
                    },
                },
                distance = 2.0
            })
          

            Wait(300000)

            DeleteObject(object2)

            rob = false
            done = false
            dead = 0
            inmission = false

    end
end
RegisterNetEvent('Polar-Weed:Client:GrabPackage', function()
    local math = math.random(10000,15000)
    local packageitem = QBCore.Functions.HasItem(Config.PackageSearchItem, Config.PackageSearchItemAmount) 
        if packageitem then
    if Config.Debug then print('Grabbing Package') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:PackCheck2', function(PackCheck)
        PackCheck1 = PackCheck
    end)
    Wait(100)
    if not PackCheck1 then
        
        TriggerServerEvent('Polar-Weed:Server:Pack')
        TriggerEvent('animations:client:EmoteCommandStart', {"kneel2"})
    QBCore.Functions.Progressbar("searcing", "Searching Package...", math, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        inmission = false
        QBCore.Functions.Notify("Searched Package", green, alerttime)
        specialreward()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        MailEnd()
    end, function() -- Cancel
        
        QBCore.Functions.Notify("Canceled", red, alerttime)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
    else
        QBCore.Functions.Notify("Package Already Searched", red, alerttime)
        if Config.Debug then print('Package Already Searched') end
    end
    else
        QBCore.Functions.Notify("You Dont have " .. Config.PackageSearchItemAmount .. " " .. Config.PackageSearchItem .. "", red, alerttime)
        if Config.Debug then print("You Dont have " .. Config.PackageSearchItemAmount .. " " .. Config.PackageSearchItem .. "") end
    end
end)
RegisterNetEvent('Polar-Weed:Client:SearchPed', function()
    if rob then
    local math = math.random(10000,15000)
    local peditem = QBCore.Functions.HasItem(Config.PedSearchItem, Config.PedSearchItemAmount) 
        if peditem then
    if Config.Debug then print('Searching Ped') end
    TriggerEvent('animations:client:EmoteCommandStart', {"kneel2"})
    QBCore.Functions.Progressbar("searcing", "Searching Corpse...", math, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        QBCore.Functions.Notify("Searched Corpse", green, alerttime)
        searchreward()
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end, function() -- Cancel
        
        QBCore.Functions.Notify("Canceled", red, alerttime)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
    else
        QBCore.Functions.Notify("You Dont have " .. Config.PedSearchItemAmount .. " " .. Config.PedSearchItem .. "", red, alerttime)
        if Config.Debug then print("You Dont have " .. Config.PedSearchItemAmount .. " " .. Config.PedSearchItem .. "") end
    end
    else

        QBCore.Functions.Notify("Kill them all First", red, alerttime)
        if Config.Debug then print("Kill them all First") end
    
    end
end)
function specialreward()
    local math = math.random(1,100)

   
    if math > 0 then
        -- 100%
        QBCore.Functions.Notify("You Found Something Rare!", green, alerttime)
        if Config.Debug then print('You Found Something Rare!') end
        TriggerServerEvent('Polar-Weed:Server:SpecialSearchReward')

    
    end
end
function searchreward()
    local math = math.random(1,100)

    if math >= 50 then
        -- 50%
        QBCore.Functions.Notify("You Found Something!", green, alerttime)
        if Config.Debug then print('You Found Something') end
        TriggerServerEvent('Polar-Weed:Server:SearchReward')

    elseif math < 3 then
        -- 2%
        QBCore.Functions.Notify("You Found Something Rare!", green, alerttime)
        if Config.Debug then print('You Found Something Rare!') end
        TriggerServerEvent('Polar-Weed:Server:SpecialSearchReward')

    else
        -- 48% nothing
        QBCore.Functions.Notify("You Found Nothing", red, alerttime)
        if Config.Debug then print('You Found Nothing') end

    end
end
--------------- TELEPORT ----------------------
RegisterNetEvent('Polar-Weed:Client:Enter', function()

    if not inmission then


    enter()

        
    else
        
        QBCore.Functions.Notify("The Lab is Closed Until You Finish", red, alerttime)
        if Config.Debug then print('The Lab is Closed Until You Finish') end

    end
end)
RegisterNetEvent('Polar-Weed:Client:Exit', function()




    exit()
       
       
    

end)


function teleport(coord, heading)
    local haslabitem = QBCore.Functions.HasItem(Config.LabKeyCard, Config.LabKeyCardAmount) 
    
        if Config.Usekey then
            if haslabitem then
	DoScreenFadeOut(500)
	Wait(2000)
	SetEntityCoords(PlayerPedId(), coord.x, coord.y, coord.z-1.0)
	SetEntityHeading(PlayerPedId(), heading)
	DoScreenFadeIn(500)
        else
        QBCore.Functions.Notify('You Need A Key', red, alerttime)
    end
    else
        if Config.Debug then print('Key not On') end
    end
end
function enter()

    Wait(100)
        
    teleport(Config.InsideLabCord, Config.InsideLabHead)

end
function exit()

        Wait(100)

        teleport(Config.OutSideLabCord, Config.OutsideLabHead)

end
RegisterNetEvent('Polar-Weed:Client:Stash', function(data)  TriggerServerEvent("inventory:server:OpenInventory", "stash", ""..data.stash) TriggerEvent("inventory:client:SetCurrentStash", ""..data.stash) end)

RegisterNetEvent('Polar-Weed:Client:POT1', function()
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:PotCheck', function(PottyCheck)
        PottyMouthCheck = PottyCheck
    end)
    if not PottyCheck then
        TriggerServerEvent('Polar-Weed:Server:Pot1')
    local searchTime = math.random(4500,5000)
    local playerPed = PlayerPedId()
    local dict = 'amb@prop_human_bum_bin@base'
    local anim = 'base'
    RequestAnimDict(dict)
    --Play Serach animation
    TaskPlayAnim(playerPed, dict, anim, 2.0, 2.0, searchTime, 1, 1, 0, 0, 0)
    FreezeEntityPosition(playerPed, true)
    Wait(searchTime)
    --Stop Animation
    ClearPedTasks(playerPed)
    FreezeEntityPosition(playerPed, false)
    TriggerEvent('animations:client:EmoteCommandStart', {"box"})
          
    TriggerServerEvent('Polar-Weed:Server:GivePotItem')
    else
        
    QBCore.Functions.Notify('A Pot has been grabbed recently', red, alerttime)
    if Config.Debug then print('A Pot has been grabbed recently') end

    end
end)
RegisterNetEvent('Polar-Weed:Client:EmoteCancel', function()

    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

end)
RegisterNetEvent('Polar-Weed:Client:Pick1', function()
    local haspickitem = QBCore.Functions.HasItem(Config.NeededPickItem, Config.NeededPickItemAmount) 
            if haspickitem then
    if Config.Debug then print('Calling Back Pick 1') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Pick1Check', function(Pick1Check)
        Pick1Check1 = Pick1Check
    end)
    Wait(100)
    if not Pick1Check1 then
        if Config.Debug then print('Started Pick') end
        TriggerServerEvent('Polar-Weed:Server:Pick1')
    local coord = vector3(1056.61, -3192.5, -39.16)
    local heading = 354.6
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    SetEntityHeading(playerPed, heading)
    FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, coord.x, coord.y, coord.z - 1.0)
    TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
    Wait(15000)
   
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(playerPed)
    TriggerServerEvent('Polar-Weed:Server:UnPick1')
    if Config.Debug then print('Finished Picking') end
    QBCore.Functions.Notify('Trimmed Plant', green, alerttime)
    TriggerServerEvent('Polar-Weed:Server:GiveTrimItem')
    DestroyTarget()
    Wait(50)
    NewTarget()
    
    else

    QBCore.Functions.Notify('Someone is Trimming this Plant', red, alerttime)
    if Config.Debug then print('Someone is Trimming this Plant') end

   
        
    end
    else
    if Config.Debug then print('No Trim Item') end
    QBCore.Functions.Notify('You Need '.. Config.NeededPickItemAmount .. ' ' .. Config.NeededPickItem .. 's', red, alerttime)
    end
end)
RegisterNetEvent('Polar-Weed:Client:Pick2', function()
    local haspickitem = QBCore.Functions.HasItem(Config.NeededPickItem, Config.NeededPickItemAmount) 
            if haspickitem then
    if Config.Debug then print('Calling Back Pick 2') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Pick2Check', function(Pick2Check)
        Pick2Check2 = Pick2Check
    end)
    Wait(100)
    if not Pick2Check2 then
        
        if Config.Debug then print('Started Pick') end
        TriggerServerEvent('Polar-Weed:Server:Pick2')
    local coord = vector3(1057.23, -3197.22, -39.13)
    local heading = 169.59
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(10) end
    SetEntityHeading(playerPed, heading)
    FreezeEntityPosition(playerPed, true)
    SetEntityCoords(playerPed, coord.x, coord.y, coord.z - 1.0)
    TaskPlayAnim(playerPed, animDict, "weed_spraybottle_crouch_spraying_02_inspector", 8.0, 8.0, 1065353216, 0, 1, 0, 0, 0)
    Wait(15000)
 
    FreezeEntityPosition(playerPed, false)
    ClearPedTasks(playerPed)
    TriggerServerEvent('Polar-Weed:Server:UnPick2')
    if Config.Debug then print('Finished Picking') end
    QBCore.Functions.Notify('Trimmed Plant', green, alerttime)
    TriggerServerEvent('Polar-Weed:Server:GiveTrimItem')
    DestroyTarget()
    Wait(50)
    NewTarget()
    
    else

    QBCore.Functions.Notify('Someone is Trimming this Plant', red, alerttime)
    if Config.Debug then print('Someone is Trimming this Plant') end

        end
   
    else
    if Config.Debug then print('No Trim Item') end
    QBCore.Functions.Notify('You Need '.. Config.NeededPickItemAmount .. ' ' .. Config.NeededPickItem .. 's', red, alerttime)
    end
end)
function DestroyTarget()
    if Config.Debug then print('Destroying Target' .. pick .. '') end
    exports['qb-target']:RemoveZone(pick)
    if Config.Debug then print('Destroyed Target' .. pick .. '') end
    
end

function NewTarget()
    if Config.Debug then print('Getting New Target') end
    local targetmath = math.random(1,10)

    if targetmath < 5 then
        if Config.Debug then print('Target 1') end
        pick =
    exports['qb-target']:AddBoxZone("pick1", vector3(1056.28, -3191.7, -39.15), 1, 1, {
        name = "pick1",
        heading = 0,
             Config.Debug,
            minZ =   -40.0,
            maxZ =   -37.0,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Weed:Client:Pick1",
                    icon = "fa-solid fa-cannabis",
                    label = "Trim",
                    excludejob = 'police'
                }
            },
            distance = 1.5
        })

        elseif targetmath >= 5 then
            if Config.Debug then print('Target 2') end
--- LARGE PLANT 1
pick =
exports['qb-target']:AddBoxZone("pick2", vector3(1057.43, -3198.3, -39.14), 1, 1, {
    name = "pick2",
    heading = 0,
         Config.Debug,
        minZ =   -40.0,
        maxZ =   -37.0,
    }, {
        options = {
            {
                type = "Client",
                event = "Polar-Weed:Client:Pick2",
                icon = "fa-solid fa-cannabis",
                label = "Trim",
                excludejob = 'police'
            }
        },
        distance = 1.5
    })



    end
end




















AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
    if Config.Debug then print('Stopping Resource') end
end)

RegisterNetEvent('Polar-Weed:Client:Sort1', function()
  local processitem = QBCore.Functions.HasItem(Config.ProcessItem, Config.ProcessItemAmount) 
    if processitem then
        local removeAmount = 1
       
        local lowGrade = QBCore.Functions.HasItem("croplow", removeAmount) 
            
               if lowGrade then
      
    if Config.Debug then print('Calling Back Sort 1') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Sort1Check', function(Check1)
        Checked1 = Check1
    end)
    Wait(100)
    if not Checked1 then
        if Config.Debug then print('Started Sort') end
        TriggerServerEvent('Polar-Weed:Server:Checked1')
        
    local heading = 0
    local coord =  vector3(1034.56, -3206.16, -37.68)
    local rotx = 0-- -0.60
    local roty = 0.75
    local rotz = -1.4
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_weed_dry_01a")
    RequestModel("bkr_prop_weed_leaf_01a")
    RequestModel("bkr_prop_weed_bag_01a")
    RequestModel("bkr_prop_weed_bud_02b")
    RequestModel("bkr_prop_weed_bud_02a")
    RequestModel("bkr_prop_weed_bag_pile_01a")
    RequestModel("bkr_prop_weed_bucket_open_01a")
    while not HasModelLoaded("bkr_prop_weed_dry_01a") and not HasModelLoaded("bkr_prop_weed_leaf_01a") and not HasModelLoaded("bkr_prop_weed_bag_01a") and not HasModelLoaded("bkr_prop_weed_bud_02b") and not HasModelLoaded("bkr_prop_weed_bud_02a") and not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and not HasModelLoaded("bkr_prop_weed_bucket_open_01a") do Citizen.Wait(50) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    camerastart()
    local packScene = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene3 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene4 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene5 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene6 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 0.0, 2, false, false, 1065353216, 0, 1.3)
    local dry = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local dry2 = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf2 = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_weed_bag_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bud = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud2 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud3 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud4 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud5 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud6 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud7 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud8 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud9 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_weed_bag_pile_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck2 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "sorter_right_sort_v3_sorter02", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(dry, packScene, animDict, "sorter_right_sort_v3_weeddry01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dry2, packScene, animDict, "sorter_right_sort_v3_weeddry01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf, packScene, animDict, "sorter_right_sort_v3_weedleaf01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf2, packScene2, animDict, "sorter_right_sort_v3_weedleaf01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag, packScene2, animDict, "sorter_right_sort_v3_weedbag01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud, packScene2, animDict, "sorter_right_sort_v3_weedbud02b", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud2, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud3, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud4, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud5, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud6, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^5", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud7, packScene4, animDict, "sorter_right_sort_v3_weedbud02a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud8, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud9, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag2, packScene5, animDict, "sorter_right_sort_v3_weedbagpile01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck, packScene6, animDict, "sorter_right_sort_v3_bucket01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck2, packScene6, animDict, "sorter_right_sort_v3_bucket01a^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    NetworkStartSynchronisedScene(packScene3)
    NetworkStartSynchronisedScene(packScene4)
    NetworkStartSynchronisedScene(packScene5)
    NetworkStartSynchronisedScene(packScene6)
    Citizen.Wait(24000)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    NetworkStopSynchronisedScene(packScene3)
    NetworkStopSynchronisedScene(packScene4)
    NetworkStopSynchronisedScene(packScene5)
    NetworkStopSynchronisedScene(packScene6)
    DeleteEntity(dry)
    DeleteEntity(dry2)
    DeleteEntity(leaf)
    DeleteEntity(leaf2)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(bud)
    DeleteEntity(bud2)
    DeleteEntity(bud3)
    DeleteEntity(bud4)
    DeleteEntity(bud5)
    DeleteEntity(bud6)
    DeleteEntity(bud7)
    DeleteEntity(bud8)
    DeleteEntity(bud9)
    DeleteEntity(buck)
    DeleteEntity(buck2)
    if Config.Debug then print('Finished Sort') end
    TriggerServerEvent('Polar-Weed:Server:UnChecked1')
    TriggerServerEvent('Polar-Weed:Server:ProcessBag', 1)
    cameraend()
   else

        QBCore.Functions.Notify('This Seat is Taken', red, alerttime)
        if Config.Debug then print('This Seat is Taken') end

    end
    else
         QBCore.Functions.Notify('You dont have enough', red, alerttime)
        if Config.Debug then print('You dont have enough') end
    end
    else
        QBCore.Functions.Notify('You dont have the right tool', red, alerttime)
        if Config.Debug then print('You dont have the right tool') end
    end
    
end)
RegisterNetEvent('Polar-Weed:Client:Sort2', function()
  local processitem = QBCore.Functions.HasItem(Config.ProcessItem, Config.ProcessItemAmount) 
    if processitem then
        local removeAmount = 1
       
        local lowGrade = QBCore.Functions.HasItem("croplow", removeAmount) 
            
               if lowGrade then
    if Config.Debug then print('Calling Back Sort 2') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Sort2Check', function(Check2)
        Checked2 = Check2
    end)
    Wait(100)
    if not Checked2 then
        if Config.Debug then print('Started Sort') end
        TriggerServerEvent('Polar-Weed:Server:Checked2')
    local heading = 90
    local coord =  vector3(1034.56, -3206.16, -37.68)
    local rotx =  -0.60
    local roty = 0--0.75
    local rotz = -1.4
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_weed_dry_01a")
    RequestModel("bkr_prop_weed_leaf_01a")
    RequestModel("bkr_prop_weed_bag_01a")
    RequestModel("bkr_prop_weed_bud_02b")
    RequestModel("bkr_prop_weed_bud_02a")
    RequestModel("bkr_prop_weed_bag_pile_01a")
    RequestModel("bkr_prop_weed_bucket_open_01a")
    while not HasModelLoaded("bkr_prop_weed_dry_01a") and not HasModelLoaded("bkr_prop_weed_leaf_01a") and not HasModelLoaded("bkr_prop_weed_bag_01a") and not HasModelLoaded("bkr_prop_weed_bud_02b") and not HasModelLoaded("bkr_prop_weed_bud_02a") and not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and not HasModelLoaded("bkr_prop_weed_bucket_open_01a") do Citizen.Wait(50) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    camerastart()
    local packScene = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene3 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene4 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene5 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene6 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local dry = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local dry2 = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf2 = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_weed_bag_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bud = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud2 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud3 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud4 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud5 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud6 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud7 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud8 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud9 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_weed_bag_pile_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck2 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "sorter_right_sort_v3_sorter02", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(dry, packScene, animDict, "sorter_right_sort_v3_weeddry01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dry2, packScene, animDict, "sorter_right_sort_v3_weeddry01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf, packScene, animDict, "sorter_right_sort_v3_weedleaf01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf2, packScene2, animDict, "sorter_right_sort_v3_weedleaf01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag, packScene2, animDict, "sorter_right_sort_v3_weedbag01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud, packScene2, animDict, "sorter_right_sort_v3_weedbud02b", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud2, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud3, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud4, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud5, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud6, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^5", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud7, packScene4, animDict, "sorter_right_sort_v3_weedbud02a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud8, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud9, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag2, packScene5, animDict, "sorter_right_sort_v3_weedbagpile01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck, packScene6, animDict, "sorter_right_sort_v3_bucket01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck2, packScene6, animDict, "sorter_right_sort_v3_bucket01a^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    NetworkStartSynchronisedScene(packScene3)
    NetworkStartSynchronisedScene(packScene4)
    NetworkStartSynchronisedScene(packScene5)
    NetworkStartSynchronisedScene(packScene6)
    Citizen.Wait(24000)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    NetworkStopSynchronisedScene(packScene3)
    NetworkStopSynchronisedScene(packScene4)
    NetworkStopSynchronisedScene(packScene5)
    NetworkStopSynchronisedScene(packScene6)
    DeleteEntity(dry)
    DeleteEntity(dry2)
    DeleteEntity(leaf)
    DeleteEntity(leaf2)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(bud)
    DeleteEntity(bud2)
    DeleteEntity(bud3)
    DeleteEntity(bud4)
    DeleteEntity(bud5)
    DeleteEntity(bud6)
    DeleteEntity(bud7)
    DeleteEntity(bud8)
    DeleteEntity(bud9)
    DeleteEntity(buck)
    DeleteEntity(buck2)
    if Config.Debug then print('Finished Sort') end
        TriggerServerEvent('Polar-Weed:Server:UnChecked2')
        TriggerServerEvent('Polar-Weed:Server:ProcessBag', 1)
        cameraend()
   else

        QBCore.Functions.Notify('This Seat is Taken', red, alerttime)
        if Config.Debug then print('This Seat is Taken') end

    end
    else
         QBCore.Functions.Notify('You dont have enough', red, alerttime)
        if Config.Debug then print('You dont have enough') end
    end
    else
        QBCore.Functions.Notify('You dont have the right tool', red, alerttime)
        if Config.Debug then print('You dont have the right tool') end
    end

    
end)
RegisterNetEvent('Polar-Weed:Client:Sort3', function()
  local processitem = QBCore.Functions.HasItem(Config.ProcessItem, Config.ProcessItemAmount) 
    if processitem then
        local removeAmount = 1
       
        local lowGrade = QBCore.Functions.HasItem("cropmid", removeAmount) 
            
               if lowGrade then
    if Config.Debug then print('Calling Back Sort 3') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Sort2Check', function(Check2)
        Checked2 = Check2
    end)
    Wait(100)
    if not Checked2 then
        if Config.Debug then print('Started Sort') end
        TriggerServerEvent('Polar-Weed:Server:Checked2')
    local heading = 270
    local coord =  vector3(1032.64, -3206.14, -37.7)
    local rotx =  0.85
    local roty = 0--0.75
    local rotz = -1.4
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_weed_dry_01a")
    RequestModel("bkr_prop_weed_leaf_01a")
    RequestModel("bkr_prop_weed_bag_01a")
    RequestModel("bkr_prop_weed_bud_02b")
    RequestModel("bkr_prop_weed_bud_02a")
    RequestModel("bkr_prop_weed_bag_pile_01a")
    RequestModel("bkr_prop_weed_bucket_open_01a")
    while not HasModelLoaded("bkr_prop_weed_dry_01a") and not HasModelLoaded("bkr_prop_weed_leaf_01a") and not HasModelLoaded("bkr_prop_weed_bag_01a") and not HasModelLoaded("bkr_prop_weed_bud_02b") and not HasModelLoaded("bkr_prop_weed_bud_02a") and not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and not HasModelLoaded("bkr_prop_weed_bucket_open_01a") do Citizen.Wait(50) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    camerastart()
    local packScene = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene3 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene4 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene5 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene6 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local dry = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local dry2 = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf2 = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_weed_bag_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bud = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud2 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud3 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud4 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud5 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud6 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud7 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud8 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud9 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_weed_bag_pile_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck2 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "sorter_right_sort_v3_sorter02", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(dry, packScene, animDict, "sorter_right_sort_v3_weeddry01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dry2, packScene, animDict, "sorter_right_sort_v3_weeddry01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf, packScene, animDict, "sorter_right_sort_v3_weedleaf01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf2, packScene2, animDict, "sorter_right_sort_v3_weedleaf01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag, packScene2, animDict, "sorter_right_sort_v3_weedbag01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud, packScene2, animDict, "sorter_right_sort_v3_weedbud02b", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud2, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud3, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud4, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud5, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud6, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^5", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud7, packScene4, animDict, "sorter_right_sort_v3_weedbud02a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud8, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud9, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag2, packScene5, animDict, "sorter_right_sort_v3_weedbagpile01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck, packScene6, animDict, "sorter_right_sort_v3_bucket01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck2, packScene6, animDict, "sorter_right_sort_v3_bucket01a^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    NetworkStartSynchronisedScene(packScene3)
    NetworkStartSynchronisedScene(packScene4)
    NetworkStartSynchronisedScene(packScene5)
    NetworkStartSynchronisedScene(packScene6)
    Citizen.Wait(24000)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    NetworkStopSynchronisedScene(packScene3)
    NetworkStopSynchronisedScene(packScene4)
    NetworkStopSynchronisedScene(packScene5)
    NetworkStopSynchronisedScene(packScene6)
    DeleteEntity(dry)
    DeleteEntity(dry2)
    DeleteEntity(leaf)
    DeleteEntity(leaf2)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(bud)
    DeleteEntity(bud2)
    DeleteEntity(bud3)
    DeleteEntity(bud4)
    DeleteEntity(bud5)
    DeleteEntity(bud6)
    DeleteEntity(bud7)
    DeleteEntity(bud8)
    DeleteEntity(bud9)
    DeleteEntity(buck)
    DeleteEntity(buck2)
    if Config.Debug then print('Finished Sort') end
        TriggerServerEvent('Polar-Weed:Server:UnChecked2')
        TriggerServerEvent('Polar-Weed:Server:ProcessBag', 2)
        cameraend()
   else

        QBCore.Functions.Notify('This Seat is Taken', red, alerttime)
        if Config.Debug then print('This Seat is Taken') end

    end
    else
         QBCore.Functions.Notify('You dont have enough', red, alerttime)
        if Config.Debug then print('You dont have enough') end
    end
    else
        QBCore.Functions.Notify('You dont have the right tool', red, alerttime)
        if Config.Debug then print('You dont have the right tool') end
    end
    

end)
RegisterNetEvent('Polar-Weed:Client:Sort4', function()
  local processitem = QBCore.Functions.HasItem(Config.ProcessItem, Config.ProcessItemAmount) 
    if processitem then
        local removeAmount = 1
       
        local lowGrade = QBCore.Functions.HasItem("cropmid", removeAmount) 
            
               if lowGrade then
    if Config.Debug then print('Calling Back Sort 4') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Sort3Check', function(Check3)
        Checked3 = Check3
    end)
    Wait(100)
    if not Checked3 then
        if Config.Debug then print('Started Sort') end
        TriggerServerEvent('Polar-Weed:Server:Checked3')
    local heading = 90
    local coord =  vector3(1039.37, -3205.9, -37.7)
    local rotx =  -0.85
    local roty = 0--0.75
    local rotz = -1.4
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_weed_dry_01a")
    RequestModel("bkr_prop_weed_leaf_01a")
    RequestModel("bkr_prop_weed_bag_01a")
    RequestModel("bkr_prop_weed_bud_02b")
    RequestModel("bkr_prop_weed_bud_02a")
    RequestModel("bkr_prop_weed_bag_pile_01a")
    RequestModel("bkr_prop_weed_bucket_open_01a")
    while not HasModelLoaded("bkr_prop_weed_dry_01a") and not HasModelLoaded("bkr_prop_weed_leaf_01a") and not HasModelLoaded("bkr_prop_weed_bag_01a") and not HasModelLoaded("bkr_prop_weed_bud_02b") and not HasModelLoaded("bkr_prop_weed_bud_02a") and not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and not HasModelLoaded("bkr_prop_weed_bucket_open_01a") do Citizen.Wait(50) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    camerastart()
    local packScene = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene3 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene4 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene5 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene6 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 90.0, 2, false, false, 1065353216, 0, 1.3)
    local dry = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local dry2 = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf2 = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_weed_bag_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bud = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud2 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud3 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud4 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud5 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud6 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud7 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud8 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud9 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_weed_bag_pile_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck2 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "sorter_right_sort_v3_sorter02", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(dry, packScene, animDict, "sorter_right_sort_v3_weeddry01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dry2, packScene, animDict, "sorter_right_sort_v3_weeddry01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf, packScene, animDict, "sorter_right_sort_v3_weedleaf01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf2, packScene2, animDict, "sorter_right_sort_v3_weedleaf01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag, packScene2, animDict, "sorter_right_sort_v3_weedbag01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud, packScene2, animDict, "sorter_right_sort_v3_weedbud02b", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud2, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud3, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud4, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud5, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud6, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^5", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud7, packScene4, animDict, "sorter_right_sort_v3_weedbud02a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud8, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud9, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag2, packScene5, animDict, "sorter_right_sort_v3_weedbagpile01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck, packScene6, animDict, "sorter_right_sort_v3_bucket01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck2, packScene6, animDict, "sorter_right_sort_v3_bucket01a^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    NetworkStartSynchronisedScene(packScene3)
    NetworkStartSynchronisedScene(packScene4)
    NetworkStartSynchronisedScene(packScene5)
    NetworkStartSynchronisedScene(packScene6)
    Citizen.Wait(24000)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    NetworkStopSynchronisedScene(packScene3)
    NetworkStopSynchronisedScene(packScene4)
    NetworkStopSynchronisedScene(packScene5)
    NetworkStopSynchronisedScene(packScene6)
    DeleteEntity(dry)
    DeleteEntity(dry2)
    DeleteEntity(leaf)
    DeleteEntity(leaf2)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(bud)
    DeleteEntity(bud2)
    DeleteEntity(bud3)
    DeleteEntity(bud4)
    DeleteEntity(bud5)
    DeleteEntity(bud6)
    DeleteEntity(bud7)
    DeleteEntity(bud8)
    DeleteEntity(bud9)
    DeleteEntity(buck)
    DeleteEntity(buck2)
    if Config.Debug then print('Finished Sort') end
        TriggerServerEvent('Polar-Weed:Server:UnChecked3')
        TriggerServerEvent('Polar-Weed:Server:ProcessBag', 2)
        cameraend()
   else

        QBCore.Functions.Notify('This Seat is Taken', red, alerttime)
        if Config.Debug then print('This Seat is Taken') end

    end
    else
         QBCore.Functions.Notify('You dont have enough', red, alerttime)
        if Config.Debug then print('You dont have enough') end
    end
    else
        QBCore.Functions.Notify('You dont have the right tool', red, alerttime)
        if Config.Debug then print('You dont have the right tool') end

    end

    
end)

RegisterNetEvent('Polar-Weed:Client:Sort5', function()
  local processitem = QBCore.Functions.HasItem(Config.ProcessItem, Config.ProcessItemAmount) 
    if processitem then
        local removeAmount = 1
       
        local lowGrade = QBCore.Functions.HasItem("crophigh", removeAmount) 
            
               if lowGrade then
    if Config.Debug then print('Calling Back Sort 5') end
    QBCore.Functions.TriggerCallback('Polar-Weed:Server:Sort3Check', function(Check3)
        Checked3 = Check3
    end)
    Wait(100)
    if not Checked3 then
        if Config.Debug then print('Started Sort') end
        TriggerServerEvent('Polar-Weed:Server:Checked3')
    local heading = 270
    local coord =  vector3(1037.4, -3205.92, -37.69)
    local rotx =  0.85
    local roty = 0--0.75
    local rotz = -1.4
    local playerPed = PlayerPedId()
    local animDict = "anim@amb@business@weed@weed_sorting_seated@"
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Citizen.Wait(10) end
    RequestModel("bkr_prop_weed_dry_01a")
    RequestModel("bkr_prop_weed_leaf_01a")
    RequestModel("bkr_prop_weed_bag_01a")
    RequestModel("bkr_prop_weed_bud_02b")
    RequestModel("bkr_prop_weed_bud_02a")
    RequestModel("bkr_prop_weed_bag_pile_01a")
    RequestModel("bkr_prop_weed_bucket_open_01a")
    while not HasModelLoaded("bkr_prop_weed_dry_01a") and not HasModelLoaded("bkr_prop_weed_leaf_01a") and not HasModelLoaded("bkr_prop_weed_bag_01a") and not HasModelLoaded("bkr_prop_weed_bud_02b") and not HasModelLoaded("bkr_prop_weed_bud_02a") and not HasModelLoaded("bkr_prop_weed_bag_pile_01a") and not HasModelLoaded("bkr_prop_weed_bucket_open_01a") do Citizen.Wait(50) end
    SetEntityHeading(playerPed, heading)
    Citizen.Wait(10)
    camerastart()
    local packScene = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene2 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene3 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene4 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene5 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local packScene6 = NetworkCreateSynchronisedScene(coord.x+rotx, coord.y+roty, coord.z+rotz, 0.0, 0.0, 270.0, 2, false, false, 1065353216, 0, 1.3)
    local dry = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local dry2 = CreateObject(GetHashKey("bkr_prop_weed_dry_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local leaf2 = CreateObject(GetHashKey("bkr_prop_weed_leaf_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bag = CreateObject(GetHashKey("bkr_prop_weed_bag_01a"), coord.x, coord.y, coord.z, true, false, false)
    local bud = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud2 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud3 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud4 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud5 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud6 = CreateObject(GetHashKey("bkr_prop_weed_bud_02b"), coord.x, coord.y, coord.z, true, false, false)
    local bud7 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud8 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bud9 = CreateObject(GetHashKey("bkr_prop_weed_bud_02a"), coord.x, coord.y, coord.z, true, false, false)
    local bag2 = CreateObject(GetHashKey("bkr_prop_weed_bag_pile_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    local buck2 = CreateObject(GetHashKey("bkr_prop_weed_bucket_open_01a"), coord.x, coord.y, coord.z, true, false, false)
    NetworkAddPedToSynchronisedScene(playerPed, packScene, animDict, "sorter_right_sort_v3_sorter02", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(dry, packScene, animDict, "sorter_right_sort_v3_weeddry01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(dry2, packScene, animDict, "sorter_right_sort_v3_weeddry01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf, packScene, animDict, "sorter_right_sort_v3_weedleaf01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(leaf2, packScene2, animDict, "sorter_right_sort_v3_weedleaf01a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag, packScene2, animDict, "sorter_right_sort_v3_weedbag01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud, packScene2, animDict, "sorter_right_sort_v3_weedbud02b", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud2, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud3, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud4, packScene3, animDict, "sorter_right_sort_v3_weedbud02b^3", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud5, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^4", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud6, packScene4, animDict, "sorter_right_sort_v3_weedbud02b^5", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud7, packScene4, animDict, "sorter_right_sort_v3_weedbud02a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud8, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^1", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bud9, packScene5, animDict, "sorter_right_sort_v3_weedbud02a^2", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(bag2, packScene5, animDict, "sorter_right_sort_v3_weedbagpile01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck, packScene6, animDict, "sorter_right_sort_v3_bucket01a", 4.0, -8.0, 1)
    NetworkAddEntityToSynchronisedScene(buck2, packScene6, animDict, "sorter_right_sort_v3_bucket01a^1", 4.0, -8.0, 1)
    NetworkStartSynchronisedScene(packScene)
    NetworkStartSynchronisedScene(packScene2)
    NetworkStartSynchronisedScene(packScene3)
    NetworkStartSynchronisedScene(packScene4)
    NetworkStartSynchronisedScene(packScene5)
    NetworkStartSynchronisedScene(packScene6)
    Citizen.Wait(24000)
    NetworkStopSynchronisedScene(packScene)
    NetworkStopSynchronisedScene(packScene2)
    NetworkStopSynchronisedScene(packScene3)
    NetworkStopSynchronisedScene(packScene4)
    NetworkStopSynchronisedScene(packScene5)
    NetworkStopSynchronisedScene(packScene6)
    DeleteEntity(dry)
    DeleteEntity(dry2)
    DeleteEntity(leaf)
    DeleteEntity(leaf2)
    DeleteEntity(bag)
    DeleteEntity(bag2)
    DeleteEntity(bud)
    DeleteEntity(bud2)
    DeleteEntity(bud3)
    DeleteEntity(bud4)
    DeleteEntity(bud5)
    DeleteEntity(bud6)
    DeleteEntity(bud7)
    DeleteEntity(bud8)
    DeleteEntity(bud9)
    DeleteEntity(buck)
    DeleteEntity(buck2)
    if Config.Debug then print('Finished Sort') end
        TriggerServerEvent('Polar-Weed:Server:UnChecked3')
        TriggerServerEvent('Polar-Weed:Server:ProcessBag', 3)
        cameraend()
   else

        QBCore.Functions.Notify('This Seat is Taken', red, alerttime)
        if Config.Debug then print('This Seat is Taken') end

    end
    else
         QBCore.Functions.Notify('You dont have enough', red, alerttime)
        if Config.Debug then print('You dont have enough') end
    end
    else
        QBCore.Functions.Notify('You dont have the right tool', red, alerttime)
        if Config.Debug then print('You dont have the right tool') end
    end
    

end)



RegisterNetEvent('Polar-Weed:Client:Cops', function()
    
    QBCore.Functions.TriggerCallback("Polar-Weed:Server:GetPolice", function(result)
        if result >= Config.MinimumPolice then
           
           
            TriggerEvent('Polar-Weed:Client:MissionStart')


        else if result < Config.MinimumPolice then
            QBCore.Functions.Notify('There are not enough police', 'error')
                -- debug
        if Config.Debug then print('not enough police') end
        return end

    end
    end)
end)
function breakphone()

    if Config.BreakPhone then
        local chance = math.random(1,100)
            if Config.BreakChance >= 75 then
                QBCore.Functions.Notify('Your Phone Broke', 'error')
                if Config.Debug then print('phone broke') end
                TriggerServerEvent('Polar-Weed:Server:RemovePhone')
            else
                QBCore.Functions.Notify('Your Phone Almost Broke', 'error')
                if Config.Debug then print('phone almost broke') end
            end
    end
end
function phone()
    TriggerEvent('animations:client:EmoteCommandStart', {"phonecall"})
    QBCore.Functions.Progressbar("searcing", "Calling LJT...", 7500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        
        breakphone()
        QBCore.Functions.Notify("Called LJT", green, alerttime)
        TriggerEvent('Polar-Weed:Client:MissionStart')
      

    end, function() -- Cancel
        
        QBCore.Functions.Notify("Canceled", red, alerttime)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    end)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

end
RegisterNetEvent('Polar-Weed:Client:BurnerCops', function()
    QBCore.Functions.TriggerCallback("Polar-Weed:Server:GetPolice", function(result)
        if result >= Config.MinimumPolice then

            phone()
          

        else if result < Config.MinimumPolice then
            QBCore.Functions.Notify('There are not enough police', 'error')
                -- debug
        if Config.Debug then print('not enough police') end
        return end

    end
    end)
end)