local QBCore = exports['qb-core']:GetCoreObject()


local function generatePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    local result = MySQL.scalar.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        return generatePlate()
    else
        return plate:upper()
    end
end

QBCore.Commands.Add("givecar", "Gives Car", {{ name = 'Id', help = 'ID of player' }, { name = 'Car', help = 'Model of Car' },}, false,
function(source, args)
        local src = source
        local model = tostring(args[2])
        local id = tonumber(args[1])
        local plate = generatePlate()
        if id and model then
            local xAdmin = QBCore.Functions.GetPlayer(src)
            local aName = xAdmin.PlayerData.name
            local xTarget = QBCore.Functions.GetPlayer(id)
            if not xTarget then
                TriggerClientEvent('QBCore:Notify', src, "No Player with ID", { id = tostring(id) })
                return
            end
            local cid = xTarget.PlayerData.citizenid
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage, giver_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
                xTarget.PlayerData.license,
                cid,
                model,
                GetHashKey(model),
                '{}',
                plate,
                1,
                'apartments',
                aName
            })
          
                TriggerClientEvent('QBCore:Notify', src, "Car sent", { model = model, plate = plate, recipient = GetPlayerName(id) })
                TriggerClientEvent('QBCore:Notify', id, 'You got a CAR!', { model = model, plate = plate })
                Wait(5500)
               
           
        end
end, 'god')