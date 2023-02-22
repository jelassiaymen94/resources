local QBCore = exports[Config.Core]:GetCoreObject()


local playerPed = PlayerPedId()


local src = source

local gang = nil
local GangName = nil

local exp = 5
--[[
CreateThread(function()



   
       
   
    exports['qb-target']:AddBoxZone("gangcraft1", vector3(-252.9, -981.75, 32.01), 5, 5, {
        name = "gangcraft1",
        heading = 0,
        debug = true,
            minZ = 30.6,
            maxZ =  34.6,
        }, {
            options = {
                {
                    type = "Client",
                    event = "Polar-Crafting:Client:OpenGangMenu",
                    icon = "fa-solid fa-bolt",
                    label = "Open",
                    --job = 'police',
                    --gang = 'vatos',
                   -- excludejob = 'police'
                }
            },
            distance = 1.5
        })

     
     

end)
]]
RegisterNetEvent('Polar-Crafting:Client:OpenGangMenu', function()

    findgang()
    Wait(5)
    findexp()
    Wait(5)
    progressbar()
    Wait(5)
    animation()
    Wait(5)
    gangcrafting()

end)
function findexp()

    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:Info', function(expamount)
        exp = expamount
    end)

end
function findgang()

  
    QBCore.Functions.TriggerCallback('Polar-Crafting:Server:GetGang', function(number)
        gang = number

        Wait(50)

        if gang == 1 then 
            GangName = 'Vagos'
        elseif gang == 2 then
            GangName = 'Batos'
        elseif gang == 3 then
            GangName = 'Triads'
        elseif gang == 4 then
            GangName = 'Ballas'
        elseif gang == 5 then
            GangName = 'Niagras'
        else
            GangName = 'retard'
        end
    end)

   
end
function progressbar()


end
function animation()


end

function gangcrafting()

    if GangName == nil then

        findgang()
    
    elseif exp == nil then

        findexp()
        print(exp)
        Wait(5)
    
    elseif exp < 100 then
    exports[Config.Menu]:openMenu({
        { 
            header = 'Bench',
            txt = "Gang: ".. GangName .."",
            isMenuHeader = true
        },
        {
            header = 'Lockpick',
            txt = "Required: ".."<p> 2 Aluminum".."<p> 2 Copper ".."<p> 2 Plastic Bottles",
            params = {
                event = "Polar-Crafting:Client:Craft",
                args = 1
            }
        },

    })

    elseif exp < 200 then
        exports[Config.Menu]:openMenu({
            { 
                header = 'Bench',
                txt = "Gang: ".. GangName .."",
                isMenuHeader = true
            },
            {
                header = 'Lockpick',
                txt = "Required: ".."<p> 2 Aluminum".."<p> 2 Copper ".."<p> 2 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 1
                }
            },
            {
                header = 'Advanced Lockpick',
                txt = "Required: ".."<p> 8 Aluminum".."<p> 12 Metal Scrap ".."<p> 22 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 2
                }
            },
        })
    elseif exp < 300 then
        exports[Config.Menu]:openMenu({
            { 
                header = 'Bench',
                txt = "Gang: ".. GangName .."",
                isMenuHeader = true
            },
            {
                header = 'Lockpick',
                txt = "Required: ".."<p> 2 Aluminum".."<p> 2 Copper ".."<p> 2 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 1
                }
            },
            {
                header = 'Advanced Lockpick',
                txt = "Required: ".."<p> 8 Aluminum".."<p> 12 Metal Scrap ".."<p> 22 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 2
                }
            },
            {
                header = 'Thermite Powder',
                txt = "Required: ".."<p> 5 Aluminum".."<p> 1 Copper ".."<p> 6 Glass",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 3
                }
            },

        })
    elseif exp < 400 then
        exports[Config.Menu]:openMenu({
            { 
                header = 'Bench',
                txt = "Gang: ".. GangName .."",
                isMenuHeader = true
            },
            {
                header = 'Lockpick',
                txt = "Required: ".."<p> 2 Aluminum".."<p> 2 Copper ".."<p> 2 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 1
                }
            },
            {
                header = 'Advanced Lockpick',
                txt = "Required: ".."<p> 8 Aluminum".."<p> 12 Metal Scrap ".."<p> 22 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 2
                }
            },
            {
                header = 'Thermite Powder',
                txt = "Required: ".."<p> 5 Aluminum".."<p> 1 Copper ".."<p> 6 Glass",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 3
                }
            },
            
            {
                header = 'Thermite Charge',
                txt = "Required: ".."<p> 25 Aluminum".."<p> 34 Copper ".."<p> 21 Plastic Bottles",
                params = {
                    event = "Polar-Crafting:Client:Craft",
                    args = 4
                }
            },
        })
    elseif exp < 500 then

    elseif exp < 600 then

    elseif exp < 700 then

    elseif exp < 800 then

    elseif exp < 900 then

    elseif exp < 1000 then

    elseif exp < 1100 then
   
    elseif exp >= 1100 and gang == 1 then
        
    elseif exp >= 1100 and gang == 2 then
    
    elseif exp >= 1100 and gang == 3 then

    else
        exports[Config.Menu]:openMenu({
            { 
                header = 'Bench',
                txt = "Gang: ".. GangName .."",
                isMenuHeader = true
            },
        })
    end
end

