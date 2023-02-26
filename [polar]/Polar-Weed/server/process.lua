local QBCore = exports['qb-core']:GetCoreObject()
--==========================================================================

local colortable = {

    "Red",
    "Blue",
    "Purple",
    "Yellow",
    "Dark Blue",
    "Light Blue",
    "Cyan",
    "Green",
    "Light Green",
    "Dark Green",
    "Gold",
    "Silver",
    "Teal",
    "Olive",
    "Burgendy",
    "Ruby",
    "Coral",
    "Peach",
    "Orange",
    "Gray",
    "Maroon",
    "Cream",
    "Peach",




}
local straintable3 = {

    "Russian",
    "Asian",
    "South African",
    "Honduras",
    "European",
    "North American",
    "Canadian",
    "Mexican",
    "Spanish",
    "French",
    "African",
    "Phillipino",
    "Afghanistan",
    "Sweden",
    "Japan",
    "Australian",
    "United Kingdom",
    "Albanian",
    "Tunisian",
    "Burundian",
    "Cuban",
    "Iraqian",
    "Pakistanian",
    "Porto Rican",
    "Serbian",
    "Soudan",
    "Zimbabwian",
    "Somalian",
    "Samoan",
    "Rwandan",



}
local straintable4 = {

     " Cake", 
     " Kush", 
    " Splush",
    " Rush", 
    " Rub",  
     " Miama",
    " Hush",
     " Splush",  
     " Mama",  
   " Deez", 
    " Splash",  
     " Ocean", 
    " Slush", 
    " Jack",
     " Kush",
    " Loops", 
    " Godess", 
     " Wine",
    " Cherry", 
     " Gorilla",
     " Monkey", 
    " Haze",
     " Monster",
     " Kush", 
    " Crack",
     " Fruit", 
    " Candy",
     " Fruit",
     " Glue",
   " Train", " Haze",
   " Gift",   
     " Dream",
     " Bean", 
    " Breath", 
    " Kush", 
     " Diesel", 
     " Herer", 
    " Poison",
    " Crack", 

}
local straintable = {

    "Wedding",
    "OG", 
    "Gelato",  
    "Runtz", 
    "Top of the Hill",
    "AK 47",
    "Purple", 
    "Indigo", 
    "Acer", 
    "Galili",
    "Corn",
    "Haritige", 
    "Miami",
    "Hush",
    "Monkey",
    "Dragon", 
    "Jurn", 
    "Coconut",
    "Power", 
    "Girl Scout Cookies",  
    "Tripple-A",
    "Orange", 
    "Fruity",
    "Green",
    "Brandy",
    "Skittles",
    "Blue Berry Yum Yum",
    "Chocolope",
    "Alaskan Thunder Fuck", 
    "Black",
    "Black", 
    "Chunky", 
    "Candy", 
    "Coolde", 
    "Corona",
    "Devils",
    "Dragon", 
    "Fresh", 
    "Forbidded", 
    "Galaxy",
    "Glitter", 
    "Ghost",
    "Train", 
    "Gods",   
    "Green", 
    "Jilly", 
    "Do-Si-Dos", 
    "Zkittlez",   
    "Mendo", 
    "Bubba", 
    "Sour",
    "Jack", 
    "Durban", 
    "Green", 


}
local typetable = {

    "Abuscus",
    "Orangatang",
    "Hababa",
    "Festivava",
    "Shaman",
    "NYC Diesel",
    "Quebec Gold",
    "Indica",
    "Sativa",

}
RegisterServerEvent('Polar-Weed:Server:Joint', function(args) 
   
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 1
    local returnAmount = 1
    local packageTime = 12500
    local baggieAmount = 1

	if args == 1 then 
        local lowGrade = Player.Functions.GetItemByName("croplow") 
        if lowGrade ~= nil then
            if lowGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("rollingpaper") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                Player.Functions.RemoveItem("croplow", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['croplow'], "remove", removeAmount)
                local number = math.random(1,2)
             
                --TriggerClientEvent('QBCore:Notify', src, "Rolling Joints", 'primary', packageTime)
                TriggerClientEvent('Polar-Weed:Client:Anim', src)
                SetTimeout(packageTime, function()
                if Player.Functions.AddItem('largejoint', number, nil, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["largejoint"], "add", number)
                    Player.Functions.RemoveItem("rollingpaper", baggieAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rollingpaper"], "remove", baggieAmount)
                   
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                    Player.Functions.AddItem("croplow", removeAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["croplow"], "add", removeAmount)
                   
                end
                end)
            else
                TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " Rolling Papers", 'error')
               
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You need atleast " .. baggieAmount ..  " Rolling Papers", "error")
           
        end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough low grade weed", 'error')
                TriggerClientEvent('Polar-Weed:Client:baggieMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any low grade weed", "error")
            TriggerClientEvent('Polar-Weed:Client:baggieMenu', src)
            
        end
    elseif args == 2 then 
        local midGrade = Player.Functions.GetItemByName("cropmid")
        if midGrade ~= nil then
            if midGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("rollingpaper") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                Player.Functions.RemoveItem("cropmid", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cropmid'], "remove", removeAmount)
                local number = math.random(2,4)
                
              
              
             
                --TriggerClientEvent('QBCore:Notify', src, "Rolling Joints", 'primary', packageTime)
                TriggerClientEvent('Polar-Weed:Client:Anim', src)
                    SetTimeout(packageTime, function()
                if Player.Functions.AddItem('largejoint', number, nil, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["1ozmid"], "add", number)
                    Player.Functions.RemoveItem("rollingpaper", baggieAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rollingpaper"], "remove", baggieAmount)
                   
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                    Player.Functions.AddItem("cropmid", removeAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cropmid"], "add", removeAmount)
                   
                end
                end)
            else
                TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " Rolling Papers", 'error')
               
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You need atleast " .. baggieAmount ..  " Rolling Papers", "error")
           
        end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough mid grade weed", 'error')
                 TriggerClientEvent('Polar-Weed:Client:baggieMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any mid grade weed", "error")
             TriggerClientEvent('Polar-Weed:Client:baggieMenu', src)
        end
    else
        local highGrade = Player.Functions.GetItemByName("crophigh")
        if highGrade ~= nil then
            if highGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("rollingpaper") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                Player.Functions.RemoveItem("crophigh", removeAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crophigh'], "remove", removeAmount)

                local number = math.random(3,6)
               
               
               
                --TriggerClientEvent('QBCore:Notify', src, "Rolling Joints", 'primary', packageTime)
                TriggerClientEvent('Polar-Weed:Client:Anim', src)
                    SetTimeout(packageTime, function()
                if Player.Functions.AddItem('largejoint', number, nil,  {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["largejoint"], "add", number)
                    Player.Functions.RemoveItem("rollingpaper", baggieAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["rollingpaper"], "remove", baggieAmount)
                   
                else
                   
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                    Player.Functions.AddItem("crophigh", removeAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["crophigh"], "add", removeAmount)
                end

                end)
            else
                TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " Rolling Papers", 'error')
               
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You need atleast " .. baggieAmount ..  " Rolling Papers", "error")
           
        end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough high grade weed", 'error')
                 TriggerClientEvent('Polar-Weed:Client:baggieMenu', src)
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any high grade weed", "error")
             TriggerClientEvent('Polar-Weed:Client:baggieMenu', src)
        end
    end
end)

--==========================================================================

--==========================================================================
RegisterNetEvent('Polar-Weed:Server:ProcessBag', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
    local removeAmount = 4
    local returnAmount = 2
    local baggieAmount = 2
    local packageTime = 50
   
	if args == 1 then 
       
        local lowGrade = Player.Functions.GetItemByName("croplow") 
        if lowGrade ~= nil then
            if lowGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("drugbag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                      
                        Player.Functions.RemoveItem("croplow", removeAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['croplow'], "remove", removeAmount)
                        local number = math.random(1,9)
               
                      
                      
                        local strains = straintable3[math.random(#straintable3)] .. " " .. straintable[math.random(#straintable)] .. straintable4[math.random(#straintable4)]
                        local types =  typetable[math.random(#typetable)]
                        local colorizer = colortable[math.random(#colortable)]

                        local randomInfo = { 
                       
                                    {strain = strains, potency = "Low", thc = number, color = colorizer, type = types},
                                  
                    
                           }
                      
                        local info = randomInfo[math.random(#randomInfo)]
                    --TriggerClientEvent('Polar-Weed:Client:AnimationStart')
                    --TriggerClientEvent('QBCore:Notify', src, "Bagging 3.5 Grams...", 'primary', packageTime)
                    SetTimeout(packageTime, function()
                if Player.Functions.AddItem('35weedlow', returnAmount, nil, info, {["quality"] = 100}) then
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["35weedlow"], "add", returnAmount)
                    Player.Functions.RemoveItem("drugbag", baggieAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["drugbag"], "remove", baggieAmount)
                  -- 
                else
                    TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                   --
                    Player.Functions.AddItem("croplow", removeAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["croplow"], "add", removeAmount)
                end
                    end)

                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " baggies", 'error')
                       
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast " .. baggieAmount ..  " baggies", "error")
                   
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough low grade weed", 'error')
                
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any low grade weed", "error")
             
        end
    elseif args == 2 then 
        local midGrade = Player.Functions.GetItemByName("cropmid") 
        if midGrade ~= nil then
            if midGrade.amount >= removeAmount then
                local baggies = Player.Functions.GetItemByName("drugbag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("cropmid", removeAmount)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cropmid'], "remove", removeAmount)
                        local number = math.random(1,9)
                       
                      
                       
                        local strains =straintable3[math.random(#straintable3)] .. " " .. straintable[math.random(#straintable)] .. straintable4[math.random(#straintable4)] local types =  typetable[math.random(#typetable)]
                        local types =  typetable[math.random(#typetable)]
                        local colorizer = colortable[math.random(#colortable)]
                        local randomInfo = { 
               
                            {strain = strains, potency = "Mid", thc = number,color = colorizer, type = types},
                            {strain = strains, potency =  "Mid", thc = number, color = colorizer,type = types},
                            {strain = strains, potency =  "Mid", thc = number,  color = colorizer, type = types},
                    
                           }
                       
                        local info = randomInfo[math.random(#randomInfo)]
                       -- TriggerClientEvent('Polar-Weed:Client:AnimationStart')
                        --TriggerClientEvent('QBCore:Notify', src, "Bagging 3.5 Grams...", 'primary', packageTime)
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('35weedmid', returnAmount, nil, info, {["quality"] = 100}) then
                                Player.Functions.RemoveItem("drugbag", baggieAmount)
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["drugbag"], "remove", baggieAmount)
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["35weedmid"], "add", returnAmount)
                               --
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                               --
                                Player.Functions.AddItem("cropmid", removeAmount)
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cropmid"], "add", removeAmount)
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " baggies", 'error')
                       
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " baggies", "error")
                   
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough mid grade weed", 'error')
                
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any mid grade weed", "error")
            
        end
    else
        local highGrade = Player.Functions.GetItemByName("crophigh") 
        if highGrade ~= nil then
            if highGrade.amount >= 1 then
                local baggies = Player.Functions.GetItemByName("drugbag") 
                if baggies ~= nil then
                    if baggies.amount >= baggieAmount then
                        Player.Functions.RemoveItem("crophigh", 1)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crophigh'], "remove", 1)
                        local number = math.random(1,9)
                       
                       
                        
                        local strains =straintable3[math.random(#straintable3)] .. " " .. straintable[math.random(#straintable)] .. straintable4[math.random(#straintable4)] local types =  typetable[math.random(#typetable)]
                       
                        local colorizer = colortable[math.random(#colortable)]
                        local randomInfo = { 
               
                            {strain = strains, potency = "High", thc = number,color = colorizer, type = types},
                            {strain = strains, potency = "High", thc = number, color = colorizer,type = types},
                            {strain = strains, potency = "High", thc = number,  color = colorizer, type = types},
                    
                           }
                       
                        local info = randomInfo[math.random(#randomInfo)]
                      --  TriggerClientEvent('Polar-Weed:Client:AnimationStart')
                        --TriggerClientEvent('QBCore:Notify', src, "Bagging 3.5 Grams...", 'primary', packageTime)
                        SetTimeout(packageTime, function()
                            if Player.Functions.AddItem('weedpound', returnAmount, nil, info, {["quality"] = 100}) then
                                Player.Functions.RemoveItem("drugbag", baggieAmount)
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["drugbag"], "remove", baggieAmount)
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weedpound"], "add", math.random(2,3))-- returnAmount)
                            --   
                            else
                                TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
                              -- 
                                Player.Functions.AddItem("crophigh", 1)
                                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["crophigh"], "add", 1)
                            end
                        end)
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " baggies", 'error')
                       
                    end
                else
                    TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. baggieAmount ..  " baggies", "error")
                   
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont have enough high grade weed", 'error')
               
            end
        else
            TriggerClientEvent('QBCore:Notify', src, "You dont have any high grade weed", "error")
            
        end
    end
end)






