NUI = {}
local QBCore = exports['qb-core']:GetCoreObject()

--- Open the NUI with playerdata setup
function NUI:Open()
    local headshot = GetHeadshot()
    local PlayerData = QBCore.Functions.GetPlayerData()

    local name = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
    local citizenid = PlayerData.citizenid

    if not headshot then
        print("Failed to get headshot")
        return
    end

    self:SetupLicenses()
    self:SetupJobs()
    self:SetupItems()

    SendNUIMessage({
        type = 'open',
        charinfo = {
            name = name,
            citizenid = citizenid,
            image = headshot
        }
    })

    SetNuiFocus(true, true)
end

--- Set the nui focus to false
function NUI:Close()
    SetNuiFocus(false, false)
end
local jobas = {
    {
        job = "taxi",
        label = "Taxi Driver",
    },
}
---Setup the jobs for the NUI
function NUI:SetupJobs()
    local jobs = {}
    
    for key = 1, #Config.jobs, 1 do
        jobs[#jobs + 1] = {
            name = Config.jobs[key].label,
            salary = QBCore.Shared.Jobs[Config.jobs[key].job].grades["0"].payment, -- Pulls the salary data from QBCore, Credit to 42MARTIN42 for the change, instead of using a set config value using - Config.jobs[key].salary,
            id = key
        }
    end

    SendNUIMessage({
        type = 'jobs',
        jobs = jobs
    })
end
local itemas = {
    {
        item = "id_card",
        meta = 'id',
        label = "Identification Card",
        price = 10
    }, {
        item = "driver_license",
        label = "Drivers License",
        meta = 'driver',
        price = 10
    }, {
        item = "weaponlicense",
        label = "Weapons License",
        meta = 'weapon',
        price = 1250
    },  
}
--- Setup the items for the NUI
function NUI:SetupItems()
    local items = {}
    items[1] = {
        name = "ID Card",
        price = 100,
        id = 1
    }

    local PlayerLicenses = QBCore.Functions.GetPlayerData().metadata["licences"]

    for key = 1, #itemas, 1 do
        for k, value in pairs(PlayerLicenses) do
            if (value == true and itemas[key].meta == k) then
                items[#items + 1] = {
                    name = itemas[key].label,
                    price = itemas[key].price,
                    id = key
                }
            end
        end
    end

    SendNUIMessage({
        type = 'items',
        items = items
    })
end
local licenas = {
    {
        item = 'id_card',
        label = 'Identification Card'
    }, {
        item = 'driver_license',
        label = 'Drivers License'
    }, {
        item = 'weaponlicense',
        label = 'Weapons License'
    },
}
--- Setup the licenses/information for the NUI
function NUI:SetupLicenses()
    local PlayerLicenses = QBCore.Functions.GetPlayerData().metadata["licences"]
    local LicenseItems = {}
    local Licenses = {}

    for i = 1, #licenas, 1 do
        local item = licenas[i]
        LicenseItems[#LicenseItems + 1] = {
            item = item.label,
            hasItem = QBCore.Functions.HasItem(item.item),
        }
    end

    for key, value in pairs(PlayerLicenses) do
        Licenses[#Licenses + 1] = {
            license = key,
            hasLicense = value
        }
    end
    
    SendNUIMessage({
        type = 'information',
        items = LicenseItems,
        licenses = Licenses
    })
end

