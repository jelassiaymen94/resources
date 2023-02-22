QBCore = exports[Config.QBCoreFolderName]:GetCoreObject()

AddEventHandler("entityCreating", function(handle) -- make ped not spawn anywhere else expect the place he should
    local entityModel = GetEntityModel(handle)
    for i, gang in next, Config.Gangs do
        if gang.ped  == entityModel then
            CancelEvent()
            break
        end
    end
end)

function GetSprayMoney(lvl, mutliplier, originalPrice)
    local price = 0
    price = math.pow(lvl, mutliplier) * originalPrice
    return price
end

QBCore.Functions.CreateUseableItem(Config.SprayItemName, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local spray = item.info.gang
    if spray then
        TriggerClientEvent("ol-spray:togglegraffiti", src, Config.Gangs[spray].spray, spray)
    else
        print('Please use the shop itself to get graffiti not using a command otherwise it will cause errors')
    end
end)

QBCore.Functions.CreateUseableItem(Config.GangMenuItem, function(source, item)
    local src = source
    TriggerClientEvent("ol-graffiti:openTurfMenu", src)
end)

RegisterNetEvent("ol-graffiti:OnGraffitiScratch", function()
    local src = source

end)

RegisterNetEvent("ol-graffiti:OnGraffitiCreated", function()
    local src = source

end)

RegisterNetEvent("ol-graffiti:OnNPCBeingRobbed", function()
    local src = source

end)