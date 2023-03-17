local QBCore = exports['qb-core']:GetCoreObject()
--==========================================================================
                    -- WEED CONFIG --
--==========================================================================

--------- GENERAL -----------
local pounddrugbagitemamount = 16 -- 16 ounces per pound means you need 16 bags
local poundamount = 1 -- amount of pounds to remove
local processitemamount = 1 -- amount of weed removed
local drugbagitem = 'drugbag' -- bag item
local drugbagitemamount = 1 -- bag item amount
local rollingpaper = 'rollingpaper' -- rollingpaper item
local rollingpaperamount = 1 -- rollingpaper item amount

--------- SMALL JOINT -----------
local smallounceamount = 1 -- amount of ounces to make small joint
local smalljointitem = 'smalljoint' -- smalljoint item
local smreturnamount = 1
--------- LARGE JOINT -----------
local largeounceamount = 4 -- amount of ounces to make large joint
local largejointitem = 'largejoint' -- largejoint item
local lareturnamount = 1
--------- LOW GRADE-----------
local processitem = 'wetbud'  -- shit weed
local poundlow = 'weedpound'
local ouncelow = '1ozlow'
local LowName = 'Low'
local lowpotencymin = 1
local lowpotencymax = 9

--------- MID GRADE -----------
local processitemmid = 'wetbud2'  -- mid weed
local poundmid = 'weedpound2'
local ouncemid = '1ozmid'
local MidName = 'Medium'
local midpotencymin = 10
local midpotencymax = 20

--------- HIGH GRADE -----------
local processitemgood = 'wetbud3' -- good weed
local poundgood = 'weedpound3'
local ouncegood = '1ozhigh'
local HighName = 'High'
local highpotencymin = 25
local highpotencymax = 45



--==========================================================================
                   -- WEED STRAINS --
--==========================================================================
local colortable = { 
    "Red", "Blue", "Purple", "Yellow","Dark Blue", "Light Blue", "Cyan","Green", "Light Green", "Dark Green", "Gold", "Silver", "Teal", "Olive", "Burgendy", "Ruby", "Coral", 
    "Peach", "Orange", "Gray", "Maroon", "Cream", "Peach",}
local straintable3 = { 
    "Russian","Asian","South African", "Honduras", "European", "North American", "Canadian", "Mexican", "Spanish", "French", "African", "Phillipino", "Afghanistan", "Sweden","Japan","Australian",
    "United Kingdom","Albanian","Tunisian","Burundian","Cuban","Iraqian","Pakistanian", "Porto Rican","Serbian","Soudan","Zimbabwian","Somalian","Samoan","Rwandan", }
local straintable4 = {
     " Cake",   " Kush",  " Splush", " Rush",  " Rub",   " Miama"," Hush", " Splush",   " Mama",  " Deez",  " Splash",    " Ocean", " Slush",  " Jack",  " Kush", " Loops", " Godess", 
     " Wine"," Cherry",  " Gorilla", " Monkey", " Haze", " Monster",  " Kush",  " Crack", " Fruit",  " Candy", " Fruit", " Glue", " Train", " Haze"," Gift",    " Dream", " Bean", 
     " Breath", " Kush",  " Diesel",   " Herer",  " Poison"," Crack", }
local straintable = {
    "Wedding","OG", "Gelato",  "Runtz", "Top of the Hill","AK 47","Purple", "Indigo", "Acer", "Galili","Corn","Haritige", "Miami","Hush","Monkey","Dragon", "Jurn", "Coconut","Power", "Girl Scout Cookies",  
    "Tripple-A","Orange", "Fruity","Green","Brandy","Skittles","Blue Berry Yum Yum","Chocolope","Alaskan Thunder Fuck", "Black","Black", "Chunky", "Candy", "Coolde",  "Corona","Devils","Dragon", 
    "Fresh", "Forbidded", "Galaxy","Glitter", "Ghost","Train", "Gods",   "Green", "Jilly", "Do-Si-Dos", "Zkittlez",   "Mendo", "Bubba", "Sour","Jack", "Durban", "Green", }
local typetable = { 
    "Abuscus","Orangatang","Hababa","Festivava","Shaman","NYC Diesel","Quebec Gold","Indica", "Sativa",}


local require = Config.BagOunces
RegisterNetEvent('Polar-Weed:Server:Process', function(args) 
	local src = source local Player = QBCore.Functions.GetPlayer(src) local args = tonumber(args) local packageTime = 50
    if args == 1 then elseif args == 2 then 
else
    local low = Player.Functions.GetItemByName(processitem) local mid = Player.Functions.GetItemByName(processitemmid) local good = Player.Functions.GetItemByName(processitemgood)
if low ~= nil then if low.amount >= processitemamount then if Config.Debug then print('bad weed') end
    next(processitem, processitemamount, Config.ProcessItemReturn, Config.ProcessItemReturnAmountMin, Config.ProcessItemReturnAmountMax)
elseif mid ~= nil then if mid.amount >= processitemamount then if Config.Debug then print('mid weed') end
    next(processitemmid, processitemamount, Config.ProcessItemReturn, Config.ProcessItemReturnAmountMin, Config.ProcessItemReturnAmountMax)
elseif good ~= nil then if mid.amount >= good then if Config.Debug then print('good weed') end
    next(processitemgood, processitemamount, Config.ProcessItemReturn, Config.ProcessItemReturnAmountMin, Config.ProcessItemReturnAmountMax)
    else
    TriggerClientEvent('QBCore:Notify', src, "You dont have any weed", 'error') end   else TriggerClientEvent('QBCore:Notify', src, "You dont have any weed", 'error') end  else TriggerClientEvent('QBCore:Notify', src, "You dont have any weed", 'error') end   else TriggerClientEvent('QBCore:Notify', src, "You dont have any weed", 'error') end    
end end)
function next(item, amount, returnitem, returnitemamountmin, returnitemamountmax)
        local src = source local Player = QBCore.Functions.GetPlayer(src) local packageTime = 50
        local baggies = Player.Functions.GetItemByName(drugbagitem) if baggies ~= nil then if baggies.amount >= drugbagitemamount then 
        SetTimeout(packageTime, function()
        if Player.Functions.AddItem(returnitem, math.random(returnitemamountmin, returnitemamountmax), nil, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[returnitem], "add", math.random(returnitemamountmin, returnitemamountmax))
        Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
        Player.Functions.RemoveItem(drugbagitem, drugbagitemamount) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[drugbagitem], "remove", drugbagitemamount)                            
        else
        TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error')
        end end)
        else TriggerClientEvent('QBCore:Notify', src, "You need atleast " .. drugbagitemamount ..  " baggies", 'error') end   else TriggerClientEvent('QBCore:Notify', src, "You need atleast" .. drugbagitemamount ..  " baggies", 'error') end
end
RegisterNetEvent('Polar-Weed:Server:Ounces', function()
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    local low = Player.Functions.GetItemByName(poundlow) local mid = Player.Functions.GetItemByName(poundmid) local good = Player.Functions.GetItemByName(poundgood)
    local bags = Player.Functions.GetItemByName(drugbagitem)
    if bags ~= nil then if bags.amount >= pounddrugbagitemamount then
if low ~= nil then if low.amount >= poundamount then if Config.Debug then print('bad pound') end
    blake(poundlow, poundamount, LowName, lowpotencymin, lowpotencymax, ouncelow, pounddrugbagitemamount) end
elseif mid ~= nil then if mid.amount >= poundamount then if Config.Debug then print('mid pound') end
    blake(poundmid, poundamount, MidName, midpotencymin, midpotencymax, ouncemid, pounddrugbagitemamount) end
elseif good ~= nil then if mid.amount >= poundamount then if Config.Debug then print('good pound') end
    blake(poundgood, poundamount, HighName, highpotencymin, highpotencymax, ouncegood, pounddrugbagitemamount) end
else TriggerClientEvent('QBCore:Notify', src, 'You dont have a pound of weed', 'error') end
    else TriggerClientEvent('QBCore:Notify', src, 'You dont have ' .. pounddrugbagitemamount .. ' bags', 'error') end  else TriggerClientEvent('QBCore:Notify', src, 'You dont have ' .. pounddrugbagitemamount .. ' bags', 'error') end
end)
function blake(item, amount, Potency, min, max, returnitem, returnamount)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    local strains =straintable3[math.random(#straintable3)] .. " " .. straintable[math.random(#straintable)] .. straintable4[math.random(#straintable4)] local types =  typetable[math.random(#typetable)]
    local number = math.random(min,max)
    local colorizer = colortable[math.random(#colortable)] local randomInfo = { {strain = strains, potency = Potency, thc = number,color = colorizer, type = types}, {strain = strains, potency = Potency, thc = number, color = colorizer,type = types}, {strain = strains, potency = Potency, thc = number,  color = colorizer, type = types},}local info = randomInfo[math.random(#randomInfo)]
    if Player.Functions.AddItem(returnitem, returnamount, nil, info, {["quality"] = 100}) then
        TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[returnitem], "add", returnamount)
        Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
        if require then Player.Functions.RemoveItem(drugbagitem, pounddrugbagitemamount) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[drugbagitem], "remove", pounddrugbagitemamount) end     
    else TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error') end
end
RegisterNetEvent('Polar-Weed:Server:LargeJoints', function()
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    local low = Player.Functions.GetItemByName(ouncelow) local mid = Player.Functions.GetItemByName(ouncemid) local good = Player.Functions.GetItemByName(ouncegood)
    local paper = Player.Functions.GetItemByName(rollingpaper)
    if paper ~= nil then if paper.amount >= rollingpaperamount then
    if low ~= nil then if low.amount >= largeounceamount then if Config.Debug then print('bad large joint') end
        joint(ouncelow, largeounceamount, largejointitem, lareturnamount)
    end
    elseif mid ~= nil then if low.amount >= largeounceamount then if Config.Debug then print('mid large joint') end
        joint(ouncelow, largeounceamount, largejointitem, lareturnamount)
    end
    elseif good ~= nil then if mid.amount >= largeounceamount then if Config.Debug then print('high large joint') end
        joint(ouncelow, largeounceamount, largejointitem, lareturnamount)
    end
    else TriggerClientEvent('QBCore:Notify', src, 'You dont have ' .. largeounceamount ..' ounces', 'error') TriggerClientEvent('Polar-Weed:Client:Joint') end
    else TriggerClientEvent('QBCore:Notify', src, 'You dont have enough rolling paper', 'error') TriggerClientEvent('Polar-Weed:Client:Joint') end
    end
end)
RegisterNetEvent('Polar-Weed:Server:SmallJoints', function()
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    local paper = Player.Functions.GetItemByName(rollingpaper)
    local low = Player.Functions.GetItemByName(ouncelow) local mid = Player.Functions.GetItemByName(ouncemid) local good = Player.Functions.GetItemByName(ouncegood)
    if paper ~= nil then if paper.amount >= rollingpaperamount then
    if low ~= nil then if low.amount >= smallounceamount then if Config.Debug then print('bad small joint') end
        joint(ouncelow, smallounceamount, smalljointitem, smreturnamount)
    end
    elseif mid ~= nil then if low.amount >= smallounceamount then if Config.Debug then print('mid small joint') end
        joint(ouncemid, smallounceamount, smalljointitem, smreturnamount)
    end
    elseif good ~= nil then if mid.amount >= smallounceamount then if Config.Debug then print('high small joint') end
        joint(ouncegood, smallounceamount, smalljointitem, smreturnamount)
    end
    else TriggerClientEvent('QBCore:Notify', src, 'You dont have ' .. smallounceamount ..' ounce', 'error') TriggerClientEvent('Polar-Weed:Client:Joint') end
    else TriggerClientEvent('QBCore:Notify', src, 'You dont have enough rolling paper', 'error') TriggerClientEvent('Polar-Weed:Client:Joint') end
    end
end)
function joint(item, amount, returnitem, returnamount)
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.AddItem(returnitem, returnamount, nil, nil, {["quality"] = 100}) then
        TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[returnitem], "add", returnamount)
        Player.Functions.RemoveItem(item, amount) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[item], "remove", amount)
        Player.Functions.RemoveItem(rollingpaper, rollingpaperamount) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[rollingpaper], "remove", rollingpaperamount)   
    else TriggerClientEvent('QBCore:Notify', src, 'You have to much in your pockets', 'error') end
end
RegisterNetEvent('Polar-Weed:Server:RemoveTub', function()
    local src = source local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.TubItem, 1) TriggerClientEvent('inventory:Client:ItemBox', src, QBCore.Shared.Items[Config.TubItem], "remove", 1)   
end)