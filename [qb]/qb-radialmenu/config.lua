local QBCore = exports['qb-core']:GetCoreObject()
Config = {}
local isJudge = false
local isPolice = false
local isTow = false
local isTaxi = false
local isMedic = false
local isDead = false
local myJob = "Unemployed"
local isHandcuffed = false
local hasOxygenTankOn = false
local bennyscivpoly = false
local onDuty = false


rootMenuConfig =  {
    {
        id = "expressions",
        displayName = "Expressions",
        icon = "#expressions",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

         
            return not inlaststand and not isdead
        end,
        subMenus = { "expressions:normal", "expressions:drunk", "expressions:angry", "expressions:dumb", "expressions:electrocuted", "expressions:grumpy", "expressions:happy", "expressions:injured", "expressions:joyful", "expressions:mouthbreather", "expressions:oneeye", "expressions:shocked", "expressions:sleeping", "expressions:smug", "expressions:speculative", "expressions:stressed", "expressions:sulking", "expressions:weird", "expressions:weird2"}
    },
    {
        id = "blips",
        displayName = "GPS",
        icon = "#blips",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not isdead and not inlaststand
        end,
        subMenus = { "blips:gasstations", "blips:banks", "blips:clothings", "blips:hardware"}
    },
    {
        id = "General",
        displayName = "General",
        icon = "#globe-europe",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not inlaststand and not isdead
        end,
        subMenus = {"general:givenum", "refresh:skin", "general:unseatnearest", "housing:menu"}
    },
    {
        id = "Interaction",
        displayName = "Interaction",
        icon = "#general-contact",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not isdead and not inlaststand
        end,
        
        subMenus = {"general:cuff", "general:rob", "general:playerinvehicle", "general:playeroutvehicle", }
    },
    {
        id = "copDead",
         displayName = "11-A",
         icon = "#police-dead",
         functionName = "police:client:SendPoliceEmergencyAlert",
         enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return isPolice and inlaststand and isdead -- and onDuty 
          end,
     },
     {
     id = "k9",
     displayName = "K9",
     icon = "#k9",
     enableMenu = function()
         return (isPolice and not isDead)
     end,
     subMenus = {"k9:follow", "k9:vehicle",  "k9:sniffvehicle", "k9:huntfind", "k9:sit", "k9:stand", "k9:sniff", "k9:lay",  "k9:spawn", "k9:delete", }
    },
    {    
        id = "Police",
        displayName = "Police Interaction",
        icon = "#police-action",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return (isPolice and not isDead)
        end,
        subMenus = {"police:mdt", "general:cuff", "police:seizecash", "police:checkvehicle", "police:statuscheck", "police:searchplayer", "police:jail", "police:bill", "police:callsign"}--, "police:takeoffmask" }
    },
    --[[{    
        id = "PoliceObjects",
        displayName = "Police Objects",
        icon = "#police-action",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return isPolice and not isDead and onduty
        end,
        subMenus = {"police:spawn1", "police:spawn2", "police:spawn3", "police:del"}
        },]]
    {
    id = "Ambulance",
    displayName = "Ambulance",
    icon = "#hospital-amb",
    enableMenu = function()
        return isMedic and not isDead and onduty
    end,
    subMenus = {"medic:status", "medic:revive", "medic:treat"}
},


    {    
    id = "Escort",
    displayName = "Escort",
    icon = "#general-escort",
    functionName = "police:client:EscortPlayer",
    enableMenu = function()
        local src = source
        local Player = QBCore.Functions.GetPlayerData(src)
        local inlaststand = Player.metadata["inlaststand"]
        local isdead = Player.metadata["isdead"]

        return not isdead and not inlaststand
    end
    },
    --[[{   
        id = "Vehicle",
        displayName = "Vehicle",
        icon = "#general-car",
        functionName = "qb-carmenu:veh:options",
        enableMenu = function()
            return (not isDead and IsPedInAnyVehicle(PlayerPedId(), true))
        end
    },]]
    {    
        id = "Emotes",
        displayName = "Emotes",
        icon = "#general-emotes",
        functionName = "dp:RecieveMenu",
        enableMenu = function()
            local src = source
            local Player = QBCore.Functions.GetPlayerData(src)
            local inlaststand = Player.metadata["inlaststand"]
            local isdead = Player.metadata["isdead"]

            return not isdead and not inlaststand 
        end
    },
    {
        id = "general:parkvehicle",
        displayName = "Park Vehicle",
        icon = "#general-parking",
        functionName = "qb-garages:client:ParkVehicle",
        enableMenu = function()
            return (not isDead and inGarage() and IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "general:garage",
        displayName = "Garage",
        icon = "#general-garage",
        functionName = "qb-garages:client:OpenMenu",
        enableMenu = function()
            return (not isDead and inGarage() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
    
        id = "general:depots",
        displayName = "Open Impound Lot",
        icon = "#general-keys-give",
        functionName = "qb-garages:client:OpenMenu",
        enableMenu = function()
            return (not isDead and inImpound() and not IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
    
        id = "car:repair",
        displayName = "Repair Vehicle",
        icon =  "#general-car",
        functionName = "Polar-Bennys:Client:Transfer",
        enableMenu = function()
            return (not isDead and bennys() and IsPedInAnyVehicle(PlayerPedId(), false))
        end
    },
    {
        id = "housing:client:openManagePropertyAccessMenu",
        displayName = "Manage Property",
        icon =  "#judge-licenses-grant-house",
        functionName = "Polar-Radial:Client:GetHouseProperty",
        enableMenu = function()
            return (not isDead and inpropertyaccess())
        end
    },
    {
        id = "housing:client:openFurnitureMenu",
        displayName = "Furniture Menu",
        icon =  "#judge-licenses-grant-house",
        functionName = "Polar-Radial:Client:GetHouseFurniture",
        enableMenu = function()
            return (not isDead and furnitureaccess())
        end
    },
    
    
    
    
    
    
    
    -- add `,` after `}` if you gonna add new button but last button should ended w/o `,`

    -- NOTE
    -- for add a new function button to menu:
    -- {
    --     id = "generalgarage", -- type group id name, can be any name
    --     displayName = "Garage", -- Display Name
    --     icon = "#general-garage", -- Icon, should be with `#` cuz from HTML and check HTML for edits
    --     functionName = "qb-garages:takeout", -- THIS IS THE FUNCTION NAME THAT WILL BE TRIGGERED AFTER CLICKING THE BUTTON
    --     enableMenu = function()
    --         return (not isDead and inGarage and not isCloseVeh() and not IsPedInAnyVehicle(PlayerPedId(), false)) -- if person is dead or in vehicle. we don't want dead people to see this button if dead
    --     end
    -- }

    -- for open a new menu from the button:
    -- {
    --     id = "general", -- type group id name, can be any name
    --     displayName = "General", -- Display Name
    --     icon = "#globe-europe", -- Icon, should be with `#` cuz from HTML and check HTML for edits
    --     enableMenu = function()
    --         return not isDead -- if person is dead or in vehicle. we don't want dead people to see this button if dead
    --     end,
    --     subMenus = {"general:escort", "general:emotes", "general:putinvehicle", "general:unseatnearest"} -- add submenu names that will be shown after clicking General button
    -- }

    -- NOTE
    -- EXAMPLE:
    -- {
    --     id = "copDead",
    --     displayName = "11-A",
    --     icon = "#police-dead",
    --     enableMenu = function()
    --         return isPolice and isDead and onDuty -- here button checks if person is cop and dead and on duty. if 3 of them true then this will be shown
    --     end,
    --     subMenus = {"general:escort", "general:emotes", "general:putinvehicle", "general:unseatnearest"}
    -- }
}

newSubMenus = { -- NOTE basicly, what will be happen after clicking these buttons and icon of them
    ['general:givenum'] = {
        title = "Give contact",
        icon = "#general-contact",
        functionName = "qb-phone:client:GiveContactDetails" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    }, 
    ["expressions:angry"] = {
        title="Angry",
        icon="#expressions-angry",
        functionName = "expressions",
        functionParameters =  { "mood_angry_1" }
    },
    ["expressions:drunk"] = {
        title="Drunk",
        icon="#expressions-drunk",
        functionName = "expressions",
        functionParameters =  { "mood_drunk_1" }
    },
    ["expressions:dumb"] = {
        title="Dumb",
        icon="#expressions-dumb",
        functionName = "expressions",
        functionParameters =  { "pose_injured_1" }
    },
    ["expressions:electrocuted"] = {
        title="Electrocuted",
        icon="#expressions-electrocuted",
        functionName = "expressions",
        functionParameters =  { "electrocuted_1" }
    },
    ["expressions:grumpy"] = {
        title="Grumpy",
        icon="#expressions-grumpy",
        functionName = "expressions", 
        functionParameters =  { "mood_drivefast_1" }
    },
    ["expressions:happy"] = {
        title="Happy",
        icon="#expressions-happy",
        functionName = "expressions",
        functionParameters =  { "mood_happy_1" }
    },
    ["expressions:injured"] = {
        title="Injured",
        icon="#expressions-injured",
        functionName = "expressions",
        functionParameters =  { "mood_injured_1" }
    },
    ["expressions:joyful"] = {
        title="Joyful",
        icon="#expressions-joyful",
        functionName = "expressions",
        functionParameters =  { "mood_dancing_low_1" }
    },
    ["expressions:mouthbreather"] = {
        title="Mouth Breather",
        icon="#expressions-mouthbreather",
        functionName = "expressions",
        functionParameters = { "smoking_hold_1" }
    },
    ["expressions:normal"]  = {
        title="Normal",
        icon="#expressions-normal",
        functionName = "expressions:clear"
    },
    ["expressions:oneeye"]  = {
        title="One Eye",
        icon="#expressions-oneeye",
        functionName = "expressions",
        functionParameters = { "pose_aiming_1" }
    },
    ["expressions:shocked"]  = {
        title="Shocked",
        icon="#expressions-shocked",
        functionName = "expressions",
        functionParameters = { "shocked_1" }
    },
    ["expressions:sleeping"]  = {
        title="Sleeping",
        icon="#expressions-sleeping",
        functionName = "expressions",
        functionParameters = { "dead_1" }
    },
    ["expressions:smug"]  = {
        title="smug",
        icon="#expressions-smug",
        functionName = "expressions",
        functionParameters = { "mood_smug_1" }
    },
    ["expressions:speculative"]  = {
        title="Speculative",
        icon="#expressions-speculative",
        functionName = "expressions",
        functionParameters = { "mood_aiming_1" }
    },
    ["expressions:stressed"]  = {
        title="Stressed",
        icon="#expressions-stressed",
        functionName = "expressions",
        functionParameters = { "mood_stressed_1" }
    },
    ["expressions:sulking"]  = {
        title="Sulking",
        icon="#expressions-sulking",
        functionName = "expressions",
        functionParameters = { "mood_sulk_1" },
    },
    ["expressions:weird"]  = {
        title="Weird",
        icon="#expressions-weird",
        functionName = "expressions",
        functionParameters = { "effort_2" }
    },
    ["expressions:weird2"]  = {
        title="Weird2",
        icon="#expressions-weird2",
        functionName = "expressions",
        functionParameters = { "effort_3" }
    },


    ['blips:gasstations'] = {
        title = "Gas Station",
        icon = "#blips-gasstations",
        functionName = "blips:gasstations"
    },
    ['blips:banks'] = {
        title = "Bank",
        icon = "#banksb-bank",
        functionName = "blips:banks"
    },
    ['blips:clothings'] = {
        title = "Clothes Store",
        icon = "#blips-clothing",
        functionName = "blips:clothings"
    },
    ['blips:hardware'] = {
        title = "Hardware Store",
        icon = "#toolshop-tool",
        functionName = "blips:hardware"
    },
    ['animations:brave'] = {
        title = "Brave",
        icon = "#animation-brave",
        functionName = "AnimSet:Brave"
    },
    ['animations:hurry'] = {
        title = "Hurry",
        icon = "#animation-swagger",
        functionName = "AnimSet:Hurry"
    },
    ['animations:business'] = {
        title = "Business",
        icon = "#animation-business",
        functionName = "AnimSet:Business"
    },
    ['animations:tipsy'] = {
        title = "Tipsy",
        icon = "#animation-tipsy",
        functionName = "AnimSet:Tipsy"
    },
    ['animations:injured'] = {
        title = "Injured",
        icon = "#animation-injured",
        functionName = "AnimSet:Injured"
    },
    ['animations:tough'] = {
        title = "Tough",
        icon = "#animation-tough",
        functionName = "AnimSet:ToughGuy"
    },	
    ['animations:sassy'] = {
        title = "Sassy",
        icon = "#animation-sassy",
        functionName = "AnimSet:Sassy"
    },
    ['animations:sad'] = {
        title = "Sad",
        icon = "#animation-sad",
        functionName = "AnimSet:Sad"
    },
    ['animations:posh'] = {
        title = "Posh",
        icon = "#animation-posh",
        functionName = "AnimSet:Posh"
    },
    ['animations:alien'] = {
        title = "Alien",
        icon = "#animation-alien",
        functionName = "AnimSet:Alien"
    },
    ['animations:hobo'] = {
        title = "Hobo",
        icon = "#animation-hobo",
        functionName = "AnimSet:Hobo"
    },
    ['animations:money'] = {
        title = "Money",
        icon = "#animation-money",
        functionName = "AnimSet:Money"
    },
    ['animations:swagger'] = {
        title = "Swag",
        icon = "#animation-swagger",
        functionName = "AnimSet:Swagger"
    },
    ['animations:shady'] = {
        title = "Gangster",
        icon = "#animation-shady",
        functionName = "AnimSet:Shady"
    },
    ['animations:maneater'] = {
        title = "Sassy3",
        icon = "#animation-sassy",
        functionName = "AnimSet:ManEater"
    },
    ['animations:chichi'] = {
        title = "Sassy2",
        icon = "#animation-sassy",
        functionName = "AnimSet:ChiChi"
    },
    ['animations:default'] = {
        title = "Normal",
        icon = "#animation-default",
        functionName = "AnimSet:default"
    },
    ['general:rob'] = {
        title = "Rob",
        icon = "#general-contact",
        functionName = "police:client:RobPlayer" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    },
    ['general:playerinvehicle'] = {
        title = "Seat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:client:PutPlayerInVehicle" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    },
    ['general:playeroutvehicle'] = {
        title = "Unseat Vehicle",
        icon = "#general-put-in-veh",
        functionName = "police:client:SetPlayerOutVehicle" -- must be client event, work same as TriggerEvent('emotes:OpenMenu')
    }, 
    ['refresh:skin'] = {
        title = "Refresh",
        icon = "#cuffs-remove-mask",
        functionName = "Polar-Clothing:client:Refreshskin"
    },
    ['general:cuff'] = {
        title = "Cuff",
        icon = "#general-cuff",
        functionName = "police:client:CuffPlayer"
    },
    --  POLICE 
    ['police:statuscheck'] = {
        title = "Status Check",
        icon = "#police-checkplayerstatus",
        functionName = "hospital:client:CheckStatus"
    },
    ['police:searchplayer'] = {
        title = "Search player",
        icon = "#police-search",
        functionName = "police:client:SearchPlayer"
    },
    ['police:jail'] = {
        title = "Jail Player",
        icon = "#police-jail",
        functionName = "police:client:JailPlayer"
    },
    ['police:callsign'] = {
        title = "Set Call Sign",
        icon = "#police-revokelicense",
        functionName = "Polar-Police:client:CallSign"
    },
    ['police:seizecash'] = {
        title = "Seize Cash",
        icon = "#police-seize",
        functionName = "police:client:SeizeCash"
    },
    ['police:bill'] = {
        title = "Give Ticket",
        icon = "#general-cuff",
        functionName = "jim-payments:client:PolCharge"
    },  
    ['police:mdt'] = {
        title = "MDT",
        icon = "#mdt",
        functionName = "mdt:server:openMDT"    
    },
    ['police:takeoffmask'] = {
        title = "Mask",
        icon = "#cuffs-remove-mask",
        functionName = "police:client:takeoffmask" 
    },
    ['police:checkvehicle'] = {
        title = "Check Vehicle Status",
        icon = "#police-chechvehiclestatus",
        functionName = "qb-tunerchip:server:TuneStatus"     
    },  
    ['police:takedriverlicense'] = {
        title = "Revoke Drivers License",
        icon = "#police-revokelicense",
        functionName = "police:client:SeizeDriverLicense"     
    },  
    -- POLICE
    ['police:spawn1'] = {
        title = "Cone",
        icon = "#police-revokelicense",
        functionName = "police:client:spawnCone"     
    },   
['police:spawn2'] = {
    title = "Spikes",
    icon = "#police-revokelicense",
    functionName = "police:client:SpawnSpikeStrip" 
},
    ['police:del'] = {
        title = "Delete",
        icon = "#police-revokelicense",
        functionName = "police:client:deleteObjectw"     
    },
    -- HOSPITAL
    ['medic:status'] = {
        title = "StatusCheck",
        icon = "#general-cuff",
        functionName = "" 
    },
    ['medic:revive'] = {
        title = "Revive",
        icon = "#hospital-revivep",
        functionName = "hospital:client:RevivePlayer"
    },
    ['medic:treat'] = {
        title = "Heal wounds",
        icon = "#hospital-treat",
        functionName = "hospital:client:TreatWounds"
    },
    ['medic:stretcherspawn'] = {
        title = "Stretcher",
        icon = "#general-cuff",
        functionName = "hospital:client:TakeStretcher" 
    }, 
    ['medic:stretcherremove'] = {
        title = "Stretcher Remove",
        icon = "#general-cuff",
        functionName = "hospital:client:RemoveStretcher" 
    },  --TOW --TOW
    ['tow:togglenpc'] = {
        title = "Toggle Npc",
        icon = "#tow-mission",
        functionName = "jobs:client:ToggleNpc"
    }, 
    ['tow:vehicle'] = {
        title = "Tow vehicle",
        icon = "#tow-tow",
        functionName = "qb-tow:client:TowVehicle"
    },  -- Taxi
    ['taxi-meter'] = {
        title = "Toggle Npc",
        icon = "#tow-mission",
        functionName = "qb-taxi:client:toggleMeter"
    }, 
    ['taxi:npc'] = {
        title = "Taxi mission",
        icon = "#tow-tow",
        functionName = "qb-taxi:client:DoTaxiNpc"
    },  
    ['taxi:startmeter'] = {
        title = "Start/Stop meter",
        icon = "#tow-tow",
        functionName = "qb-taxi:client:enableMeter"
    },
    ['housing:menu'] = {
        title = "Housing Menu",
        icon = "#judge-licenses-grant-house",
        functionName = "bl-realtor:client:toggleUI"
    },

    ['k9:spawn'] = {
        title = "Summon",
        icon = "#k9-spawn",
        functionName = "K9:Create"
    },
    ['k9:delete'] = {
        title = "Dismiss",
        icon = "#k9-dismiss",
        functionName = "K9:Delete"
    },
    ['k9:follow'] = {
        title = "Follow",
        icon = "#k9-follow",
        functionName = "K9:Follow"
    },
    ['k9:vehicle'] = {
        title = "Get in/out",
        icon = "#k9-vehicle",
        functionName = "K9:Vehicle"
    },
    ['k9:sit'] = {
        title = "Sit",
        icon = "#k9-sit",
        functionName = "K9:Sit"
    },
    ['k9:lay'] = {
        title = "Lay",
        icon = "#k9-lay",
        functionName = "K9:Lay"
    },
    ['k9:stand'] = {
        title = "Stand",
        icon = "#k9-stand",
        functionName = "K9:Stand"
    },
    ['k9:sniff'] = {
        title = "Sniff Person",
        icon = "#k9-sniff",
        functionName = "K9:Sniff"
    },
    ['k9:sniffvehicle'] = {
        title = "Sniff Vehicle",
        icon = "#k9-sniff-vehicle",
        functionName = "sniffVehicle"
    },
    ['k9:huntfind'] = {
        title = "Hunt nearest",
        icon = "#k9-huntfind",
        functionName = "K9:Huntfind"
    },
}
    

RegisterNetEvent("isJudge") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isJudge", function()
    isJudge = true
end)

RegisterNetEvent("isJudgeOff") -- opposite of the above
AddEventHandler("isJudgeOff", function()
    isJudge = false
end)

RegisterNetEvent("isTow") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTow", function()
    isTow = true
end)

RegisterNetEvent("isTowOff") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTowOff", function()
    isTow = false
end)

RegisterNetEvent("isTaxi") -- these are all up to you and your job system, if person become Judge, script will see him as Judge too.
AddEventHandler("isTaxi", function()
    isTaxi = true
end)

RegisterNetEvent("isTaxiOff") -- opposite of the above
AddEventHandler("isTaxiOff", function()
    isTaxi = false
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate") -- dont edit this unless you don't use qb-core
AddEventHandler("QBCore:Client:OnJobUpdate", function(jobInfo)
    myJob = jobInfo.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if isTow and myJob ~= "tow" then isTow = false end
    if isTaxi and myJob ~= "taxi" then isTaxi = false end
    if myJob == "police" then isPolice = true end
    if myJob == "tow" then isTow = true end
    if myJob == "taxi" then isTaxi = true end
    if myJob == "ambulance" then isMedic = true end
end)

RegisterNetEvent('QBCore:Client:SetDuty') -- dont edit this unless you don't use qb-core
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    myJob = QBCore.Functions.GetPlayerData().job.name
    if isMedic and myJob ~= "ambulance" then isMedic = false end
    if isPolice and myJob ~= "police" then isPolice = false end
    if myJob == "police" then isPolice = true onDuty = duty end
    if myJob == "ambulance" then isMedic = true onDuty = duty end
end)

RegisterNetEvent('deathcheck') -- YOU SHOULD ADD THIS IN YOUR ambulancejob system, basically let the function trigger here when the ped playing anim and add this to
-- your revived function so everytime if person dies, this will be triggered to isDead = true, if he get revived this will be triggered to isDead = false
AddEventHandler('deathcheck', function()
    if not isDead then
        isDead = true
    else
        isDead = false
    end
end)


RegisterNetEvent("police:currentHandCuffedState") -- add this your police:client:GetCuffed @qb-policejob\client\interactions.lua
AddEventHandler("police:currentHandCuffedState", function(pIsHandcuffed)
    isHandcuffed = pIsHandcuffed
end)

RegisterNetEvent("menu:hasOxygenTank") -- add this to your oxygentank wear place, idk where is this for qb-inventory so find out please
AddEventHandler("menu:hasOxygenTank", function(pHasOxygenTank)
    hasOxygenTankOn = pHasOxygenTank
end)


RegisterNetEvent('police:client:PutInVehicle')
AddEventHandler('police:client:PutInVehicle', function()
    if isEscorted then
    end
end)




