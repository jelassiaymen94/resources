local QBCore = exports['qb-core']:GetCoreObject()




function ArmoredTruck()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 3 then
    

        exports['qb-banktrucks']:ArmoredCops()


    end
end
function Jewelry()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 2 then
    

        exports['qb-jewelery']:JewelryCops()


    end
end
function BankRob()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 4 then
    

        exports['qb-bankrobbery']:BankRobCops()


    end
end
function Store()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 2 then
    

        exports['qb-storerobbery']:StoreCops()


    end
end
function DrugSale()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 1 then
    

        exports['Polar-DrugSales']:DrugSaleCops()


    end
end
function Atm()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 1 then
    

        exports['Polar-Atms']:AtmCops()


    end
end
function House()
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    
    if amount >= 1 then
    

        exports['qb-houserobbery']:HouseCops()


    end
end


------------------- Armored Trucks ---------------------------------------------------------
-----------------------------------------------------------------------------------------------

local canrob = false

function ArmoredCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]

------------------- Jewelry ---------------------------------------------------------
-----------------------------------------------------------------------------------------------

local canrob = false

function JewelryCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]





------------------- BANK ---------------------------------------------------------
-----------------------------------------------------------------------------------------------

local canrob = false

function BankRobCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]




------------------- STORE ---------------------------------------------------------
-----------------------------------------------------------------------------------------------

local canrob = false

function StoreCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]





------------------- DRUG SALES ---------------------------------------------------------
-----------------------------------------------------------------------------------------------
local canrob = false

function DrugSaleCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]










------------------- HOUSE ---------------------------------------------------------
-----------------------------------------------------------------------------------------------

local canrob = false

function HouseCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]


------------------- ATM ---------------------------------------------------------
-----------------------------------------------------------------------------------------------
local canrob = false

function AtmCops()

    canrob = true


end

--[[ 
    
    if canrob then

    else
        -- not enough cops

    end

]]