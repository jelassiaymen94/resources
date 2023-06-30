if cfg_framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif cfg_framework == 'esx' then
    ESX = nil
end

local wheelInUse = false





if cfg_framework == 'qb' then
  
    QBCore.Functions.CreateCallback('fox-wheelfitment_sv:setIsWheelFitmentInUse', function(source, cb , bool)
        wheelInUse = bool
    end)

    QBCore.Functions.CreateCallback('fox-wheelfitment_sv:getIsWheelFitmentInUse1', function(source, cb )
        cb(wheelInUse)
    end)

    QBCore.Functions.CreateCallback('fox-wheelfitment_sv:saveWheelfitment', function(source, cb , plate , data)
        if plate == nil or plate == 0 or plate == "" then return end
      --  print("31")
        MySQL.Async.insert("UPDATE player_vehicles SET wheels = @wheels WHERE plate = @plate", { 
            ['@wheels'] = json.encode(data),
            ['@plate'] = plate
        })
        cb(true)
    end)



elseif cfg_framework == 'esx' then
    

    ESX.RegisterServerCallback('fox-wheelfitment_sv:setIsWheelFitmentInUse', function(source, cb , bool)
        wheelInUse = bool
    end)
    
    ESX.RegisterServerCallback('fox-wheelfitment_sv:getIsWheelFitmentInUse1', function(source, cb )
        cb(wheelInUse)
    end)
    
    ESX.RegisterServerCallback('fox-wheelfitment_sv:saveWheelfitment', function(source, cb , plate , data)
        if plate == nil or plate == 0 or plate == "" then return end
      --  print("31")
        MySQL.Async.insert("UPDATE player_vehicles SET wheels = @wheels WHERE plate = @plate", { 
            ['@wheels'] = json.encode(data),
            ['@plate'] = plate
        })
        cb(true)
    end)

end
