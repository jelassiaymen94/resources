local QBCore = exports['qb-core']:GetCoreObject()


--- Method to find all vehicles within 1 meter radius of a given location
--- @param coords vec3 - location
--- @return vehinarea array - array with all vehicle entities
local getVehiclesInArea = function(coords)
    local vehinarea = {}
    local vehicles = GetGamePool('CVehicle')
    for i=1, #vehicles, 1 do
        local vehicleCoords = GetEntityCoords(vehicles[i])
        local distance = #(vehicleCoords - coords)
        if distance < 1 then
            vehinarea[#vehinarea+1] = vehicles[i]
        end
    end
    return vehinarea
end

--- Method to spawn a vehicle at a certain showroom index location
--- @param input string | number - index number for location
--- @param model string - name of the vehicle model
--- @return nil
local SpawnVehicle = function(input, model)
    local position = tonumber(input)
    if position > (#Config.Dealership[PlayerJob.name].displays) then
        QBCore.Functions.Notify('Incorrect Input', 'error', 2500)
    else
        local vehinarea = getVehiclesInArea(Config.Dealership[PlayerJob.name].displays[position].xyz)
        if #vehinarea ~= 0 then
            for i=1, #vehinarea do 
                QBCore.Functions.DeleteVehicle(vehinarea[i])
            end
        end
        QBCore.Functions.SpawnVehicle(model, function(veh)
            SetEntityHeading(veh, Config.Dealership[PlayerJob.name]["displays"][position].w)
            SetVehicleNumberPlateText(veh, "FORSALE1")
            FreezeEntityPosition(veh, true)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        end, vector3(Config.Dealership[PlayerJob.name]["displays"][position].x, Config.Dealership[PlayerJob.name]["displays"][position].y, Config.Dealership[PlayerJob.name]["displays"][position].z), true)
    end
end

--- Method to spawn a vehicle with given model name at the platform location
--- @param model string - name of the vehicle model
--- @return nil
local PlacePlatform = function(model)
    local vehinarea = getVehiclesInArea(vector3(Config.Dealership[PlayerJob.name]["platform"].xyz))
    if #vehinarea ~= 0 then
        for i=1, #vehinarea do
            QBCore.Functions.DeleteVehicle(vehinarea[i])
        end
    end

    QBCore.Functions.SpawnVehicle(model, function(veh)
        SetEntityHeading(veh, Config.Dealership[PlayerJob.name]["platform"].w)
        SetVehicleNumberPlateText(veh, "DELIVERY")
        --FreezeEntityPosition(veh, true)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    end, vector3(Config.Dealership[PlayerJob.name]["platform"].xyz), true)
end

--- Method to clear the showroom of any vehicles
--- @return nil
local ClearShowroom = function()
    -- PLATFORM
    local vehinarea = getVehiclesInArea(vector3(Config.Dealership[PlayerJob.name]["platform"].xyz))
    if #vehinarea ~= 0 then
        for i=1, #vehinarea do
            QBCore.Functions.DeleteVehicle(vehinarea[i])
        end
    end

    -- DISPLAYS
    for k, v in pairs(Config.Dealership[PlayerJob.name]["displays"]) do
        vehinarea = getVehiclesInArea(vector3(v.x, v.y, v.z))
        for i=1, #vehinarea do
            QBCore.Functions.DeleteVehicle(vehinarea[i])
        end
    end
end

RegisterNetEvent('Polar-Dealership:client:menu:OpenBossMenu', function()
    local menu = {
        {
            header = "Dealership Boss Menu",
            txt = "ESC or click to close",
            icon = 'fas fa-angle-left',
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Manage Employees",
            txt = "",
            icon = "fas fa-address-book",
            params = {
                event = "Polar-Dealership:client:menu:OpenEmployees",
            }
        },
        {
            header = "Hire Employee",
            txt = "(Must be unemployed)",
            icon = "fas fa-universal-access",
            params = {
                event = "Polar-Dealership:client:menu:OpenHire",
            }
        },
        {
            header = "Order Vehicle",
            txt = "",
            icon = "fas fa-clipboard-list",
            params = {
                event = "Polar-Dealership:client:menu:OpenOrder",
            }
        }
    }
    if PlayerJob.grade.level >= Config.Dealership[PlayerJob.name].moneyMenuThreshold then
        menu[#menu+1] = {
            header = "Money Management",
            txt = "($ "..bank..")",
            icon = "fas fa-dollar-sign",
            params = {
                event = "Polar-Dealership:client:menu:OpenBank",
            }
        }
    end

    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:OpenEmployees', function()
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenBossMenu"
            }
        }
    }
    for k, v in pairs(employees) do
        menu[#menu+1] = {
            header = v.name,
            txt = v.citizenid.." - "..v.grade.name,
            icon = 'fas fa-address-card',
            params = {
                event = "Polar-Dealership:client:menu:FirePromote",
                args = {
                    employee = v
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:OpenHire', function()
    local menu = {
        {
            header = "Go Back",
            icon = 'fas fa-angle-left',
            txt = "",
            params = {
                event = "Polar-Dealership:client:menu:OpenBossMenu"
            }
        }
    }
    for k, v in pairs(unemployed) do
        menu[#menu+1] = {
            header = v.name,
            txt = v.citizenid,
            icon = 'fas fa-address-card',
            params = {
                event = "Polar-Dealership:client:menu:Hire",
                args = {
                    player = v
                }
            } 
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:OpenOrder', function()
    exports['qb-menu']:openMenu({
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenBossMenu"
            }
        },
        {
            header = "Check Orders",
            txt = "Check pending orders..",
            icon = 'fas fa-list-ul',
            params = {
                event = "Polar-Dealership:client:menu:OpenCheckOrder",
            }
        },
        {
            header = "Order Vehicle",
            txt = "Order new vehicle..",
            icon = "fas fa-clipboard-list",
            params = {
                event = "Polar-Dealership:client:menu:OpenOrderVehicle",
            }
        }
    })
end)

RegisterNetEvent('Polar-Dealership:client:menu:OpenCheckOrder', function()
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenOrder"
            }
        }
    }
    for k, v in pairs(orderTable) do
        menu[#menu+1] = {
            header = QBCore.Shared.Vehicles[v.vehicle]["brand"].." "..QBCore.Shared.Vehicles[v.vehicle]["name"],
            txt = "Expected delivery: "..v.date,
            icon = 'fas fa-hourglass-start',
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:OpenOrderVehicle', function()
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenOrder"
            }
        }
    }
    for k, v in pairs(Config.Dealership[PlayerJob.name].vehicles) do
        menu[#menu+1] = {
            header = k,
            txt = "",
            icon = 'fas fa-list-ul',
            params = {
                event = "Polar-Dealership:client:menu:OrderBrand",
                args = {
                    brand = k,
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:OrderBrand', function(data)
    local brand = data.brand
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenOrder"
            }
        }
    }

    for i=1, #Config.Dealership[PlayerJob.name].vehicles[brand], 1 do
        local modelname = Config.Dealership[PlayerJob.name].vehicles[brand][i]
        for k, v in pairs(stockPriceTable) do
            if v.vehicle == modelname then
                vehprice = tonumber(v.price)
                vehstock = tonumber(v.stock)
                break
            end
        end
        menu[#menu+1] = {
            header = QBCore.Shared.Vehicles[modelname]["brand"].." "..QBCore.Shared.Vehicles[modelname]["name"],
            txt = "Price: $"..tostring(vehprice).." (Stock: "..tostring(vehstock)..")",
            icon = 'fas fa-car',
            params = {
                event = "Polar-Dealership:client:menu:OrderVehicle",
                args = {
                    vehicle = modelname
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:OrderVehicle', function(data)
    local input = exports['qb-input']:ShowInput({
        header = "Order "..data.vehicle,
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'model',
                text = 'Enter Modelname To Confirm'
            }
        }
    })
    if input then
        if not input.model then return end
        answer = string.lower(input.model)
        if answer == data.vehicle then
            -- ORDER VEHICLE
            QBCore.Functions.TriggerCallback('Polar-Dealership:server:BuyStock',function(result)
                if result then
                    QBCore.Functions.Notify(QBCore.Shared.Vehicles[data.vehicle]["brand"].." "..QBCore.Shared.Vehicles[data.vehicle]["name"].." ordered", "error", 2500)
                else
                    QBCore.Functions.Notify("Insufficient funds..", "error", 2500)
                end
            end, PlayerJob.name, data.vehicle)
        else
            QBCore.Functions.Notify("Invalid argument", "error", 2500)
        end
    end
end)

RegisterNetEvent('Polar-Dealership:client:menu:OpenBank', function()
    exports['qb-menu']:openMenu({
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenBossMenu"
            }
        },
        {
            header = "Deposit",
            txt = "",
            icon = 'fas fa-plus',
            params = {
                event = "Polar-Dealership:client:menu:Deposit",
            }
        },
        {
            header = "Withdraw",
            txt = "",
            icon = 'fas fa-minus',
            params = {
                event = "Polar-Dealership:client:menu:Withdraw",
            }
        }
    })
end)

RegisterNetEvent('Polar-Dealership:client:menu:Deposit', function()
    local input = exports['qb-input']:ShowInput({
        header = "Deposit Money",
        submitText = "Submit",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount'
            }
        }
    })
    if input then
        if not input.amount then return end
        local amount = tonumber(input.amount)
        if amount > 0 then
            bank = bank + amount
            TriggerServerEvent('Polar-Dealership:server:depositBank', amount, PlayerJob.name)
            TriggerEvent('Polar-Dealership:client:menu:OpenBank')
        else
            QBCore.Functions.Notify('Invalid amount..', 'error', 2500)
        end
    end
end)

RegisterNetEvent('Polar-Dealership:client:menu:Withdraw', function(data)
    local input = exports['qb-input']:ShowInput({
        header = "Withdraw Money",
        submitText = "Submit",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount'
            }
        }
    })
    if input then
        if not input.amount then return end
        local amount = tonumber(input.amount)
        if amount > 0 then
            if bank >= amount then
                bank = bank - amount
                TriggerServerEvent('Polar-Dealership:server:withdrawBank', amount, PlayerJob.name)
            else
                QBCore.Functions.Notify("There is not enough money on the bank account.", "error", 2500)
            end
            TriggerEvent('Polar-Dealership:client:menu:OpenBank')
        else
            QBCore.Functions.Notify('Invalid amount..', 'error', 2500)
        end
    end
end)

RegisterNetEvent('Polar-Dealership:client:menu:FirePromote', function(data)
    local citizenid = data.employee.citizenid
    local sourceGrade = PlayerJob.grade.level
    local targetGrade = data.employee.grade.level
    local input = exports['qb-input']:ShowInput({
        header = "Employee Management",
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'action',
                text = "Fire/Demote/Promote"
            }
        }
    })
    if input then
        if not input.action then return end
        local answer = string.lower(input.action)
        if answer == "fire" then
            if sourceGrade > targetGrade then
                TriggerServerEvent('Polar-Dealership:server:SetJob', data.employee, "fire", 0)
            else
                QBCore.Functions.Notify("You cannot fire employees with the same or higher rank", "error", 2500)
            end
        elseif answer == "promote" then
            -- CAN ONLY PROMOTE UNDER YOU
            if sourceGrade > targetGrade then
                TriggerServerEvent('Polar-Dealership:server:SetJob', data.employee, "promote", targetGrade+1)
            else
                QBCore.Functions.Notify("You cannot promote employees with the same or higher rank", "error", 2500)
            end
        elseif answer == "demote" then
            -- CAN ONLY DEMOTE UNDER YOU
            if sourceGrade > targetGrade then
                TriggerServerEvent('Polar-Dealership:server:SetJob', data.employee, "demote", targetGrade-1)
            else
                QBCore.Functions.Notify("You cannot demote employees with the same or higher rank", "error", 2500)
            end
        else
            QBCore.Functions.Notify("Invalid argument", "error", 2500)
        end
    end
end)

RegisterNetEvent('Polar-Dealership:client:menu:Hire', function(data)
    local citizenid = data.employee.citizenid
    local input = exports['qb-input']:ShowInput({
        header = "Hire "..data.employee.charinfo.firstname.." "..data.employee.charinfo.lastname,
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'action',
                text = "Type 'Confirm'"
            }
        }
    })
    if input then
        if not input.action then return end
        local answer = string.lower(input.action)
        if answer == "confirm" then
            TriggerServerEvent('Polar-Dealership:server:SetJob', citizenid, PlayerJob.name, "hire")
        else
            QBCore.Functions.Notify("Invalid argument", "error")
        end
    end
end)

-- Showroom menu
RegisterNetEvent('Polar-Dealership:client:menu:OpenShowroomMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Showroom Menu",
            txt = "ESC or click to close",
            icon = 'fas fa-angle-left',
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Delivery",
            txt = "",
            icon = 'fas fa-star',
            params = {
                event = "Polar-Dealership:client:menu:Platform",
            }
        },
        {
            header = "Showroom",
            txt = "",
            icon = 'fas fa-car',
            params = {
                event = "Polar-Dealership:client:menu:Showroom",
            }
        },
        {
            header = "Clear Showroom",
            txt = "",
            icon = 'fas fa-ban',
            params = {
                event = "Polar-Dealership:client:menu:ClearShowroom",
            }
        },
    })
end)

RegisterNetEvent('Polar-Dealership:client:menu:PlatformModels', function(data)
    local brand = data.brand
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:Platform"
            }
        }
    }
    for i=1, #Config.Dealership[PlayerJob.name].vehicles[brand], 1 do
        local modelname = Config.Dealership[PlayerJob.name].vehicles[brand][i]
        local vehprice = nil
        local vehstock = nil
        for k, v in pairs(stockPriceTable) do
            if v.vehicle == modelname then
                vehprice = math.floor(tonumber(v.price)/Config.Dealership[PlayerJob.name]["margin"])
                vehstock = tonumber(v.stock)
                break
            end
        end
        menu[#menu+1] = {
            header = QBCore.Shared.Vehicles[modelname]["brand"].." "..QBCore.Shared.Vehicles[modelname]["name"],
            txt = "Price: $"..tostring(vehprice).." (Stock: "..tostring(vehstock)..")",
            icon = 'fas fa-car',
            params = {
                event = "Polar-Dealership:client:menu:PlacePlatform",
                args = {
                    vehicle = modelname,
                    brand = data.brand
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:Platform', function()
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenShowroomMenu"
            }
        }
    }
    for k, v in pairs(Config.Dealership[PlayerJob.name].vehicles) do
        menu[#menu+1] = {
            header = k,
            txt = "",
            icon = 'fas fa-car',
            params = {
                event = "Polar-Dealership:client:menu:PlatformModels",
                args = {
                    brand = k,
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:ShowroomModels', function(data)
    local brand = data.brand
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:Showroom"
            }
        }
    }
    for i=1, #Config.Dealership[PlayerJob.name].vehicles[brand], 1 do
        local modelname = Config.Dealership[PlayerJob.name].vehicles[brand][i]
        menu[#menu+1] = {
            header = QBCore.Shared.Vehicles[modelname]["brand"].." "..QBCore.Shared.Vehicles[modelname]["name"],
            txt = "",
            icon = 'fas fa-car',
            params = {
                event = "Polar-Dealership:client:menu:ShowroomPosition",
                args = {
                    vehicle = modelname
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:PlacePlatform', function(data)
    local model = data.vehicle
    PlacePlatform(model)
    TriggerEvent('Polar-Dealership:client:menu:PlatformModels', data)
end)

RegisterNetEvent('Polar-Dealership:client:menu:Showroom', function()
    local menu = {
        {
            header = "Go Back",
            txt = "",
            icon = 'fas fa-angle-left',
            params = {
                event = "Polar-Dealership:client:menu:OpenShowroomMenu"
            }
        }
    }
    for k, v in pairs(Config.Dealership[PlayerJob.name].vehicles) do
        menu[#menu+1] = {
            header = k,
            txt = "",
            icon = 'fas fa-car',
            params = {
                event = "Polar-Dealership:client:menu:ShowroomModels",
                args = {
                    brand = k,
                }
            }
        }
    end
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:ShowroomPosition', function(data)
    local model = data.vehicle
    local input = exports['qb-input']:ShowInput({
        header = "Place "..QBCore.Shared.Vehicles[model]["brand"].." "..QBCore.Shared.Vehicles[model]["name"],
        submitText = "Submit",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'platform',
                text = 'Enter number of 1 to '..(#Config.Dealership[PlayerJob.name].displays)
            }
        }
    })
    if input then
        if not input.platform then return end
        SpawnVehicle(input.platform, model)
    end
    TriggerEvent('Polar-Dealership:client:menu:Showroom')
end)

RegisterNetEvent('Polar-Dealership:client:menu:ClearShowroom', function()
    local input = exports['qb-input']:ShowInput({
        header = "Clear Showroom",
        submitText = "Submit",
        inputs = {
            {
                type = 'text',
                isRequired = true,
                name = 'keyboard',
                text = "Enter 'Confirm'"
            }
        }
    })
    if input then
        if not input.keyboard then return end
        if string.lower(input.keyboard) == "confirm" then
            ClearShowroom()
        else
            QBCore.Functions.Notify("Invalid argument", "error", 2500)
        end
        TriggerEvent('Polar-Dealership:client:menu:OpenShowroomMenu')
    end
end)

-- Garage Menu
RegisterNetEvent('Polar-Dealership:client:menu:OpenGarageMenu', function()
    local menu = {
        {
            header = "Garage Menu",
            txt = "ESC or click to close",
            icon = 'fas fa-angle-left',
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Flatbed",
            txt = "",
            icon = 'fas fa-truck-moving',
            params = {
                event = "Polar-Dealership:client:menu:GarageSpawn",
                args = {
                    model = "flatbed", -- You can add extra vehicles by making more entries and changing this vehicle
                }
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:DeleteVehicleMenu', function()
    local menu = {
        {
            header = "Garage Menu",
            txt = "ESC or click to close",
            icon = 'fas fa-angle-left',
            params = {
                event = "qb-menu:closeMenu",
            }
        },
        {
            header = "Confirm",
            txt = "This deletes the vehicle",
            icon = 'fas fa-ban',
            params = {
                event = "Polar-Dealership:client:menu:DeleteVehicle",
            }
        }
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('Polar-Dealership:client:menu:DeleteVehicle', function()
    QBCore.Functions.DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
end)

RegisterNetEvent('Polar-Dealership:client:menu:GarageSpawn', function(data)
    local model = data.model
    local spawnLoc = Config.Dealership[PlayerJob.name].garage
    local spawnHeading = spawnLoc.w
    QBCore.Functions.SpawnVehicle(model, function(veh)
        SetEntityHeading(veh, spawnHeading)
        exports['qb-fuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
        SetVehicleEngineOn(veh, true, true)
    end, spawnLoc.xyz, true)
end)