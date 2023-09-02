local QBCore = exports['qb-core']:GetCoreObject()

local src = source






RegisterNetEvent('Polar-Crafting:Server:IncreaseXp', function(amount)
    local inc = amount
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
  
    

   
   

end)
RegisterNetEvent('Polar-Crafting:Server:XpNil', function()

    xp = nil

end)

function next(itemname, xp, give)
 
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
  

    Wait(100)
    TriggerClientEvent('Polar-Crafting:Client:StartAnim', src)
    local packageTime = 15000
    TriggerClientEvent('Polar-Crafting:Client:Anim', src, itemname)
    SetTimeout(packageTime, function()
            TriggerClientEvent('Polar-Crafting:Client:EndAnim', src)
            TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            if itemname == 'weapon_fnx45' then
                local info = {
                    ammo = 0,
                    serie="No Serial Number"
                }
                Player.Functions.AddItem(itemname, give, nil, info, {["quality"] = 100}) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemname], "add", give)
            else
            Player.Functions.AddItem(itemname, give, nil, {["quality"] = 100}) 
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemname], "add", give)
            end
            
            local Player = QBCore.Functions.GetPlayer(src)
            local data = Player.PlayerData.metadata["craftingrep"] or 0
            local pp = (data + xp)
            Player.Functions.SetMetaData('craftingrep', pp)
            
    end)
  
end   


RegisterNetEvent('Polar-Crafting:Server:Hitup', function(data)
    local itemname = data.item
    local required = data.requires
    local itemamount = data.give
    local expneed = data.exp
    local givexp = data.giveexp
  
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasRequiredItems = true

    for _, itemData in ipairs(required) do
        local itemName, amount = itemData[1], itemData[2]
        local item = Player.Functions.GetItemByName(itemName)
    
        if item == nil or item.amount < amount then
            hasRequiredItems = false
            TriggerClientEvent('QBCore:Notify', src, "You don't have enough materials", 'red', alerttime)
            TriggerClientEvent('Polar-Crafting:Client:Busy', src)
            break
        end
    end
    
    if hasRequiredItems then
        for _, itemData in ipairs(required) do
            local itemName, amount = itemData[1], itemData[2]
            Player.Functions.RemoveItem(itemName, amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemName], "remove", amount)
        end


    
        Wait(100)
        TriggerClientEvent('Polar-Crafting:Client:StartAnim', src)
        local packageTime = 15000
       
        TriggerClientEvent('Polar-Crafting:Client:Anim', src, itemname)
        SetTimeout(packageTime, function()
                TriggerClientEvent('Polar-Crafting:Client:EndAnim', src)
                TriggerClientEvent('Polar-Crafting:Client:Busy', src)
                if checkweapon(itemname) then
                    local info = {
                        ammo = 0,
                        serie ="No Serial Number"
                    }
                    Player.Functions.AddItem(itemname, itemamount, nil, info, {["quality"] = 100}) 
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemname], "add", itemamount)
                else
                Player.Functions.AddItem(itemname, itemamount, nil, {["quality"] = 100}) 
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[itemname], "add", itemamount)
                end
                
                local Player = QBCore.Functions.GetPlayer(src)
                local data = Player.PlayerData.metadata["craftingrep"] or 0
             
                local pp = (data + givexp)
                Player.Functions.SetMetaData('craftingrep', pp)
           
                
        end)



    else
        TriggerClientEvent('QBCore:Notify', src, "You don't have enough materials", 'red', alerttime)
        TriggerClientEvent('Polar-Crafting:Client:Busy', src)
    end


end)


function checkweapon(itemName)
    for weaponName, _ in pairs(QBCore.Shared.Weapons) do
        if itemName == weaponName then
            return true
            
        end
    end
end






