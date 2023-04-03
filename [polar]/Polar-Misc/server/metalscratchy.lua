local QBCore = exports['qb-core']:GetCoreObject()



RegisterNetEvent('qb-weapons:Server:scratch', function(weapon, weaponammo)
    local Player = QBCore.Functions.GetPlayer(source)
    local weaponInfo = QBCore.Shared.Weapons[weapon]
    local weaponName = weaponInfo["name"]
    if weaponInfo then
        weaponInfo = Player.Functions.GetItemByName(weaponName)
        if weaponInfo then
            local info = {
                ammo = weaponammo,
                serie="Scratched"
            }
            Player.Functions.RemoveItem(weaponName, 1)
            Player.Functions.AddItem(weaponName, 1, weaponInfo.slot, info)
             
        end
    end
end)

QBCore.Functions.CreateUseableItem("metalscratchy", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent('qb-weapons:Client:scratch', source)
    end
end)