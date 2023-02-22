print'Pug Fishing 1.0.0'
local QBCore = exports[Config.CoreName]:GetCoreObject()
local OpeningChest = false
local succededchestopen = false

--Put your drawtext option here
function DrawTextOption(text)
	exports['qb-core']:DrawText(text)
end
function HideTextOption()
	exports['qb-core']:HideText()
end
local function SellFishAnim()
	local random = math.random(1,5)
	if random == 1 then
		TriggerEvent('animations:client:EmoteCommandStart', {"wait"})
	elseif random == 2 then 
		TriggerEvent('animations:client:EmoteCommandStart', {"argue"})
	elseif random == 3 then 
		TriggerEvent('animations:client:EmoteCommandStart', {"argue2"})
	elseif random == 4 then 
		TriggerEvent('animations:client:EmoteCommandStart', {"lean2"})
	elseif random == 5 then 
		TriggerEvent('animations:client:EmoteCommandStart', {"danceslow"})
	end
end
local function LoadModel(model)
    if HasModelLoaded(model) then return end
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end
Citizen.CreateThread(function()
	if Config.UseDefaultPed then
		MainFisherMan = Config.TournamentPed
		LoadModel(MainFisherMan)
		FisherMan = CreatePed(2, MainFisherMan, Config.TournamentPedLoc, false, false)
		SetPedFleeAttributes(FisherMan, 0, 0)
		SetPedDiesWhenInjured(FisherMan, false)
		SetPedKeepTask(FisherMan, true)
		SetBlockingOfNonTemporaryEvents(FisherMan, true)
		SetEntityInvincible(FisherMan, true)
		FreezeEntityPosition(FisherMan, true)
	end
    exports['qb-target']:AddBoxZone("fishguy",vector3(Config.TournamentPedLoc.x, Config.TournamentPedLoc.y, Config.TournamentPedLoc.z), 1, 1, {
        name="fishguy",
        heading=0,
        debugPoly= Config.Debug,
        minZ=30.45,
        maxZ=32.45,
    }, {
        options = {
            {
				type = "client",
                event = "Pug:client:ViewTournamentMenu",
                icon = "fas fa-user-check",
                label = Translations.menu.Join,
            },
        },
        distance = 5.0
    })
    FisherManSellShop = Config.SellShopPed
    LoadModel(FisherManSellShop)
    FisherManShop = CreatePed(2, FisherManSellShop, Config.SellShopPedPedLoc, false, false)
    SetPedFleeAttributes(FisherManShop, 0, 0)
    SetPedDiesWhenInjured(FisherManShop, false)
    SetPedKeepTask(FisherManShop, true)
    SetBlockingOfNonTemporaryEvents(FisherManShop, true)
    SetEntityInvincible(FisherManShop, true)
    FreezeEntityPosition(FisherManShop, true)
    exports['qb-target']:AddBoxZone("sellfish", vector3(Config.SellShopPedPedLoc.x, Config.SellShopPedPedLoc.y, Config.SellShopPedPedLoc.z), 1, 1, {
        name="sellfish",
        heading=330,
        debugPoly= Config.Debug,
        minZ=47.55,
        maxZ=49.555,
    }, {
        options = {
            {
                event = "Pug:client:SellFishMenu",
                icon = "fas fa-fish",
                label = Translations.menu.sell_fish,
            }
        },
        distance = 5.0
    })
	FishSellBlip = AddBlipForCoord(-2196.83, 4272.38, 48.55)
    SetBlipSprite(FishSellBlip, 628)
    SetBlipDisplay(FishSellBlip, 4)
    SetBlipScale(FishSellBlip, 0.75)
    SetBlipColour(FishSellBlip, 33)
    SetBlipAsShortRange(FishSellBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Fish Market")
    EndTextCommandSetBlipName(FishSellBlip)
	if craftingbench == nil then
		RequestModel(GetHashKey("prop_tool_bench02"))
		while not HasModelLoaded(GetHashKey("prop_tool_bench02")) do Wait(1) end
		craftingbench = CreateObject(GetHashKey("prop_tool_bench02"),Config.CrafingRodLocation.x, Config.CrafingRodLocation.y, Config.CrafingRodLocation.z-1,false,false,false)
		SetEntityHeading(craftingbench,GetEntityHeading(craftingbench)-24.7)
		FreezeEntityPosition(craftingbench, true)
	end
    exports['qb-target']:AddBoxZone("CraftFishingRod",vector3(-679.03, 5790.79, 17.33), 1.4, 1, {
        name="CraftFishingRod",
		heading=335,
		debugPoly=Config.Debug,
		minZ=16.33,
		maxZ=17.53,
    }, {
        options = {
            {
                event = "Pug:client:CraftFishingRodMenu",
                icon = "fa-solid fa-pen-ruler",
                label = 'Craft Fishing Rod',
            }
        },
        distance = 5.0
    })
	GemsFisherMan = Config.GemsBuyingPed
    LoadModel(GemsFisherMan)
    GemsBuyer = CreatePed(2, GemsFisherMan, Config.GemsBuyingPedLoc, false, false)
    SetPedFleeAttributes(GemsBuyer, 0, 0)
    SetPedDiesWhenInjured(GemsBuyer, false)
    SetPedKeepTask(GemsBuyer, true)
    SetBlockingOfNonTemporaryEvents(GemsBuyer, true)
    SetEntityInvincible(GemsBuyer, true)
    FreezeEntityPosition(GemsBuyer, true)
    exports['qb-target']:AddBoxZone("gemsguy",vector3(Config.GemsBuyingPedLoc.x, Config.GemsBuyingPedLoc.y, Config.GemsBuyingPedLoc.z), 1, 1, {
        name="gemsguy",
		heading=330,
        debugPoly= Config.Debug,
		minZ=13.3,
		maxZ=15.3,
    }, {
        options = {
            {
				type = "client",
                event = "Pug:client:SellFishingGemsMenu",
                icon = "fas fa-user-check",
                label = Translations.menu.sell_gems,
            },
        },
        distance = 5.0
    })
end)
RegisterNetEvent('Pug:client:SellFishingGemsMenu', function()
    local menu = {
        {
            header = Translations.menu.sell_gems,
            txt = "ESC or click to go close",
            params = {
                event = " ",
            }
        }
    }
    for k, v in pairs(Config.SellGems) do
        menu[#menu+1] = {
            header = 'Sell '..QBCore.Shared.Items[k].label,
            icon = "fas fa-gem",
            text = 'between $'..v.pricemin..' and '..v.pricemax,
            params = {
                event = "Pug:client:SellFishingGems",
                args = k
            }
        }
    end
	exports[Config.Menu]:openMenu(menu)
end)
RegisterNetEvent("Pug:client:SellFishingGems")
AddEventHandler("Pug:client:SellFishingGems", function(item)
    QBCore.Functions.TriggerCallback('Pug:Fishing:check', function(hasitem)
        if hasitem then
			SellFishAnim()
            QBCore.Functions.Progressbar("selling_gems", Translations.details.selling_fish..' '..QBCore.Shared.Items[item].label, math.random(5000,10000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
				QBCore.Functions.TriggerCallback('Pug:ServerCB:SellGems', function(cansell)
					if cansell then
						
					else
						QBCore.Functions.Notify(Translations.error.no_gems, 'error')
					end
				end,item)
            end, function()
                QBCore.Functions.Notify(Translations.details.canceled, "error")
            end)
        else
            QBCore.Functions.Notify(Translations.error.no_gems, 'error')
        end
    end, item)
end)
RegisterNetEvent('Pug:client:CraftFishingRodMenu', function()
    local menu = {
        {
            header = Translations.menu.CraftRodHeader,
            txt = "ESC or click to go close",
            params = {
                event = " ",
            }
        }
    }
    for k, v in pairs(Config.CraftRods) do
        menu[#menu+1] = {
            header = v.name..' | '..v.repRequired..' Fishing Rep & $'..v.price,
            icon = "fas fa-fish",
            text = 'Required: '..v.item1Amount..'x '..QBCore.Shared.Items[v.item1].label..' | '..v.item2Amount..'x '..QBCore.Shared.Items[v.item2].label,
            params = {
                event = "Pug:client:CraftFishingRod",
                args = k
            }
        }
    end
	exports[Config.Menu]:openMenu(menu)
end)
RegisterNetEvent("Pug:client:CraftFishingRod")
AddEventHandler("Pug:client:CraftFishingRod", function(item)
    QBCore.Functions.TriggerCallback('Pug:ServerCB:CanCraftRod', function(cancraft)
        if cancraft then
			TriggerServerEvent('Pug:Server:RemoveItem', Config.CraftRods[item].item1, Config.CraftRods[item].item1Amount)
			TriggerServerEvent('Pug:Server:RemoveItem', Config.CraftRods[item].item2, Config.CraftRods[item].item2Amount)
			TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
            QBCore.Functions.Progressbar("crafint_rod", Translations.details.Crafting_rod, 7000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,	
            }, {}, {}, {}, function() -- Done
				TriggerServerEvent("Pug:server:FishingRemoveMoeny",	Config.CraftRods[item].price)
				TriggerServerEvent('Pug:server:GiveFish', item, 1)
				TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[item], "add")
				QBCore.Functions.Notify(Translations.details.crafted_rod.. Config.CraftRods[item].name)
            end, function()
				TriggerServerEvent('Pug:server:GiveFish', Config.CraftRods[item].item1, Config.CraftRods[item].item1Amount)
				TriggerServerEvent('Pug:server:GiveFish', Config.CraftRods[item].item2, Config.CraftRods[item].item2Amount)
                QBCore.Functions.Notify(Translations.details.canceled, "error")
            end)
        end
    end, item)
end)

RegisterNetEvent('Pug:client:SellFishMenu', function()
    local menu = {
        {
            header = Translations.menu.sell_fish,
            txt = "ESC or click to go close",
            params = {
                event = " ",
            }
        }
    }
    for k, v in pairs(Config.SellFishies) do
        menu[#menu+1] = {
            header = 'Sell '..QBCore.Shared.Items[k].label,
            icon = "fas fa-fish",
            text = '$'..v.price,
            params = {
                event = "Pug:client:SellFish",
                args = k
            }
        }
    end
	exports[Config.Menu]:openMenu(menu)
end)
RegisterNetEvent("Pug:client:SellFish")
AddEventHandler("Pug:client:SellFish", function(item)
    QBCore.Functions.TriggerCallback('Pug:Fishing:check', function(hasitem)
        if hasitem then
			SellFishAnim()
            QBCore.Functions.Progressbar("selling_fish", Translations.details.selling_fish..' '..QBCore.Shared.Items[item].label, 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
				QBCore.Functions.TriggerCallback('Pug:ServerCB:SellFish', function(cansell)
					if cansell then
						
					else
						QBCore.Functions.Notify(Translations.error.no_fish, 'error')
					end
				end,item)
            end, function()
                QBCore.Functions.Notify(Translations.details.canceled, "error")
            end)
        else
            QBCore.Functions.Notify(Translations.error.no_fish, 'error')
        end
    end, item)
end)
-- Tournament first place item rewards
RegisterNetEvent('Pug:client:GiveFirstPlaceReward', function(k)
	local random = math.random(1,100)
	if random <= 10 then
		TriggerServerEvent("Pug:server:GiveFish", 'chestkey')
	elseif random > 10 and random <= 20 then
		TriggerServerEvent("Pug:server:GiveFish", 'bottlemap')
	elseif random > 20 and random <= 25 then
		TriggerServerEvent("Pug:server:GiveFish", 'pro-reel')
	end
	TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(30,50))
end)
-- Tournament second place item rewards
RegisterNetEvent('Pug:client:GiveSecondPlaceReward', function(k)
	local random = math.random(1,100)
	if random <= 5 then
		TriggerServerEvent("Pug:server:GiveFish", 'bottlemap')
	elseif random > 5 and random <= 10 then
		TriggerServerEvent("Pug:server:GiveFish", 'skill-reel')
	end
	TriggerServerEvent("Pug:Server:GiveFishingRep", 20)
end)
-- Tournament third place item rewards
RegisterNetEvent('Pug:client:GiveThirdPlaceReward', function()
	local random = math.random(1,100)
	if random <= 5 then
		TriggerServerEvent("Pug:server:GiveFish", 'bottlemap')
	end
	TriggerServerEvent("Pug:Server:GiveFishingRep", 10)
end)
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
		DeleteEntity(craftingbench)
	end
end)

function GetFishingInfoOpen()
    local info = {
		opnchest = OpeningChest,
		success = succededchestopen
    }
    return info
end

function FishingRod1Loot() -- Starter fishing rod loot table
	local fish = "stripedbass"
	if GetFishingInfoClosed().intournarea and GetFishingInfoClosed().started then -- only true if in a fishing area during a fishing torunament
		local treasure = math.random(1,5000)
		if treasure == 50 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		local reel = math.random(1,5000)
		if reel == 60 then
			TriggerServerEvent("Pug:server:GiveFish", 'skill-reel')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		if luck >= 90 and luck <= 100 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "goldfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 80 and luck < 90 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "redfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 70 and luck < 80 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(2, 5)) -- gives points for the tournament
			fish = "bluefish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck >= 50 and luck < 70 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(2, 5)) -- gives points for the tournament
			fish = "stripedbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck < 50 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 4)) -- gives points for the tournament
			fish = "fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		TriggerServerEvent("Pug:server:GiveFish", fish)
	else
		local treasure = math.random(1,10000)
		if treasure <= 50 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(10,20))
		end
		local map = math.random(1,10000)
		if map <= 60 then
			TriggerServerEvent("Pug:server:GiveFish", 'bottlemap')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,10))
		end
		local luck = math.random(1,100)
		if luck >= 90 and luck <= 100 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
			fish = "goldfish"
		elseif luck >= 80 and luck < 90 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
			fish = "redfish"
		elseif luck >= 70 and luck < 80 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
			fish = "bluefish"
		elseif luck >= 50 and luck < 70 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
			fish = "stripedbass"
		elseif luck < 50 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
			fish = "fish"
			--local repluck = math.random(1,10)
			--if repluck <= 3 then
				--TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
			--end
		end
		TriggerServerEvent("Pug:server:GiveFish", fish)
	end
end


function FishingRod2Loot() -- skilled fishing rod loot table
	local fish = "stripedbass"
	if GetFishingInfoClosed().intournarea and GetFishingInfoClosed().started then -- only true if in a fishing area during a fishing torunament
		local luck = math.random(1,200)
		local treasure = math.random(1,4500)
		if treasure == 50 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		local reel = math.random(1,4500)
		if reel == 60 then
			TriggerServerEvent("Pug:server:GiveFish", 'pro-reel')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		if luck >= 195 and luck <= 200 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(15, 20)) -- gives points for the tournament
			fish = "killerwhale"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 7)
		elseif luck >= 185 and luck < 195 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(5, 11)) -- gives points for the tournament
			fish = "tigershark"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 175 and luck < 185 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(5, 11)) -- gives points for the tournament
			fish = "swordfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 165 and luck < 175 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 9)) -- gives points for the tournament
			fish = "tuna-fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 155 and luck < 165 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 9)) -- gives points for the tournament
			fish = "catfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 145 and luck < 155 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 9)) -- gives points for the tournament
			fish = "salmon"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 135 and luck < 145 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 8)) -- gives points for the tournament
			fish = "largemouthbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 120 and luck < 135 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "goldfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 105 and luck < 120 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "redfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 85 and luck < 105 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "bluefish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck >= 45 and luck < 85 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(2, 5)) -- gives points for the tournament
			fish = "stripedbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck < 45 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			fish = "fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		local otherfish = math.random(1,1200)
		if otherfish >= 90 and otherfish < 120 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "codfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(3,4))
		elseif otherfish >= 60 and otherfish < 90 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "gholfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(3,4))
		elseif otherfish >= 30 and otherfish < 60 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "rainbowtrout"
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(3,4))
		elseif otherfish >= 1 and otherfish < 30 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "eelfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		local gems = math.random(1,5000)
		if gems >= 20 and gems < 24 then 
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'diamond')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 16 and gems < 20 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'emerald')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 12 and gems < 16 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'sapphire')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 8 and gems < 12 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'ruby')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 5 and gems < 8 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'yellow-diamond')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems < 3 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'captainskull')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		end
		TriggerServerEvent("Pug:server:GiveFish", fish)
	else
		local fish = "stripedbass"
			local luck = math.random(1,200)
			local treasure = math.random(1,7500)
			if treasure == 50 then
				TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
				TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
			end
			local reel = math.random(1,7500)
			if reel == 60 then
				TriggerServerEvent("Pug:server:GiveFish", 'bottlemap')
				TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
			end
			if luck >= 195 and luck <= 200 then
				fish = "killerwhale"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 7)
			elseif luck >= 185 and luck < 195 then
				fish = "tigershark"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
			elseif luck >= 175 and luck < 185 then
				fish = "swordfish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
			elseif luck >= 165 and luck < 175 then
				fish = "tuna-fish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
			elseif luck >= 155 and luck < 165 then
				fish = "catfish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
			elseif luck >= 145 and luck < 155 then
				fish = "salmon"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
			elseif luck >= 135 and luck < 145 then
				fish = "largemouthbass"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
			elseif luck >= 120 and luck < 135 then
				fish = "goldfish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
			elseif luck >= 105 and luck < 120 then
				fish = "redfish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
			elseif luck >= 85 and luck < 105 then
				fish = "bluefish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
			elseif luck >= 45 and luck < 85 then
				fish = "stripedbass"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
			elseif luck < 45 then
				fish = "fish"
				TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
			end
		TriggerServerEvent("Pug:server:GiveFish", fish)
	end
end



--What fishing rewards the player gets when fishing with the highest tier fishing
function FishingRod3Loot()-- pro fishing rod loot table
	local fish = "stripedbass"
	if GetFishingInfoClosed().intournarea and GetFishingInfoClosed().started then -- only true if in a fishing area during a fishing torunament
		local luck = math.random(1,200)
		local treasure = math.random(1,4000)
		if treasure == 50 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		local reel = math.random(1,4000)
		if reel == 60 then
			TriggerServerEvent("Pug:server:GiveFish", 'yellow-diamond')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		if luck >= 190 and luck <= 200 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(15, 20)) -- gives points for the tournament
			fish = "killerwhale"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 7)
		elseif luck >= 180 and luck < 190 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(5, 11)) -- gives points for the tournament
			fish = "tigershark"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 170 and luck < 180 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(5, 11)) -- gives points for the tournament
			fish = "swordfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 160 and luck < 170 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 9)) -- gives points for the tournament
			fish = "tuna-fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 150 and luck < 160 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 9)) -- gives points for the tournament
			fish = "catfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 140 and luck < 150 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 9)) -- gives points for the tournament
			fish = "salmon"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 130 and luck < 140 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(4, 8)) -- gives points for the tournament
			fish = "largemouthbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 110 and luck < 130 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "goldfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 90 and luck < 110 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "redfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 70 and luck < 90 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(3, 6)) -- gives points for the tournament
			fish = "bluefish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck >= 40 and luck < 70 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(2, 5)) -- gives points for the tournament
			fish = "stripedbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck < 40 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			fish = "fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		local otherfish = math.random(1,900)
		if otherfish >= 90 and otherfish < 120 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "codfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(3,4))
		elseif otherfish >= 60 and otherfish < 90 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "gholfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(3,4))
		elseif otherfish >= 30 and otherfish < 60 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "rainbowtrout"
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(3,4))
		elseif otherfish >= 1 and otherfish < 30 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 2)) -- gives points for the tournament
			fish = "eelfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		local gems = math.random(1,4000)
		if gems >= 20 and gems < 24 then 
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'diamond')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 16 and gems < 20 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'emerald')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 12 and gems < 16 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'sapphire')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 8 and gems < 12 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'ruby')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems >= 5 and gems < 8 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'yellow-diamond')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		elseif gems < 3 then
			TriggerServerEvent("Pug:Server:UpdateFishingLeaderBoard", math.random(1, 3)) -- gives points for the tournament
			TriggerServerEvent("Pug:server:GiveFish", 'captainskull')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
		end
		TriggerServerEvent("Pug:server:GiveFish", fish)
	else
		local fish = "stripedbass"
		local luck = math.random(1,200)
		local treasure = math.random(1,5000)
		if treasure == 50 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		local reel = math.random(1,5000)
		if reel == 60 then
			TriggerServerEvent("Pug:server:GiveFish", 'diamond')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,7))
		end
		if luck >= 190 and luck <= 200 then
			fish = "killerwhale"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 7)
		elseif luck >= 180 and luck < 190 then
			fish = "tigershark"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 170 and luck < 180 then
			fish = "swordfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 160 and luck < 170 then
			fish = "tuna-fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 150 and luck < 160 then
			fish = "catfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 140 and luck < 150 then
			fish = "salmon"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 130 and luck < 140 then
			fish = "largemouthbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 110 and luck < 130 then
			fish = "goldfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 90 and luck < 110 then
			fish = "redfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 70 and luck < 90 then
			fish = "bluefish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck >= 40 and luck < 70 then
			fish = "stripedbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck < 40 then
			fish = "fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		TriggerServerEvent("Pug:server:GiveFish", fish)
	end
end

--What fishing rewards the player gets when fishing with the fishinglure tier fishing
function FishRodLure1Loot()-- fishinglure rod loot table
	local fish = "tuna-fish"
	if GetFishingInfoClosed().intournarea and GetFishingInfoClosed().started then -- only true if in a fishing area during a fishing torunament
		QBCore.Functions.Notify(Translations.error.cant_use_in_tourn, 'error')
		return
	else
		--[[local treasure = math.random(1,10000)
		if treasure <= 10 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestItem)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(15,20))
		end
		local chestkey = math.random(1,10000)
		if chestkey <= 100 then
			TriggerServerEvent("Pug:server:GiveFish", Config.ChestKey)
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,10))
		end
		local bottlemap = math.random(1,10000)
		if bottlemap <= 100 then
			TriggerServerEvent("Pug:server:GiveFish", 'bottlemap')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(20,24))
		end
		--[[local lure1 = math.random(1,10000)
		if lure1 == 100 then
			TriggerServerEvent("Pug:server:GiveFish", 'fishinglure')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(7,10))
		end
		local lure2 = math.random(1,10000)
		if lure2 == 100 then
			TriggerServerEvent("Pug:server:GiveFish", 'fishinglure2')
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(7,10))
		end
		local reel = math.random(1,10000)
		if reel == 50 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(5,10))
			TriggerServerEvent("Pug:server:GiveFish", 'pro-reel')
		end
		local luck = math.random(1,200)
		if luck >= 192 and luck <= 200 then
			fish = "killerwhale"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 9)
		elseif luck >= 187 and luck < 192 then
			fish = "tigershark"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 8)
		elseif luck >= 181 and luck < 187 then
			fish = "swordfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 8)
		elseif luck >= 175 and luck < 181 then
			fish = "tuna-fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 7)
		elseif luck >= 169 and luck < 175 then
			fish = "catfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 7)
		elseif luck >= 163 and luck < 169 then
			fish = "salmon"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 157 and luck < 163 then
			fish = "largemouthbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 6)
		elseif luck >= 151 and luck < 157 then
			fish = "goldfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 5)
		elseif luck >= 146 and luck < 151 then
			fish = "redfish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 4)
		elseif luck >= 140 and luck < 146 then
			fish = "bluefish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 3)
		elseif luck >= 130 and luck < 140 then
			fish = "stripedbass"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 2)
		elseif luck < 130 then
			fish = "fish"
			TriggerServerEvent("Pug:Server:GiveFishingRep", 1)
		end
		local otherfish = math.random(1,300)
		if otherfish >= 9 and otherfish < 12 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
			fish = "codfish"
		elseif otherfish >= 6 and otherfish < 9 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
			fish = "gholfish"
		elseif otherfish >= 3 and otherfish < 6 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
			fish = "rainbowtrout"
		elseif otherfish >= 1 and otherfish < 3 then
			TriggerServerEvent("Pug:Server:GiveFishingRep", math.random(2,4))
			fish = "catfish"
		end]]
		TriggerServerEvent("Pug:server:GiveFish", fish)
	end
end

RegisterNetEvent("Pug:Fishing:ReloadSkin")
AddEventHandler("Pug:Fishing:ReloadSkin", function()
	for k, v in pairs(GetGamePool('CObject')) do
		if IsEntityAttachedToEntity(PlayerPedId(), v) then
			SetEntityAsMissionEntity(v, true, true)
			DeleteObject(v)
			DeleteEntity(v)
		end
	end
    if Config.PugSlingScript then
	    TriggerEvent("Pug:ReloadGuns:sling")
    end
end)

--Key Lock minigame
-- Events
RegisterNetEvent('Pug:client:UseKeyOnChest', function()
	OpeningChest = true
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = "openThermite",
        amount = math.random(1, 1),
    })
end)

RegisterNetEvent('Pug:client:Openbottlemap', function()
    RequestAnimDict("mp_arresting")
    while (not HasAnimDictLoaded("mp_arresting")) do
        Wait(0)
    end
    TaskPlayAnim(PlayerPedId(), "mp_arresting" ,"a_uncuff" ,8.0, -8.0, -1, 1, 0, false, false, false )
    local Coords = GetEntityCoords(PlayerPedId())
    bottle = CreateObject(GetHashKey('p_amb_bag_bottle_01'), Coords.x, Coords.y,Coords.z, true, true, true)
    AttachEntityToEntity(bottle, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 0xDEAD), 0.1, 0.05, 0.0, -40.0, 10.0, 90.0, false, false, false, false, 2, true)
    QBCore.Functions.Progressbar("opening_box", "Opening bottle", 3700, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Don
		TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
		TriggerEvent("Pug:Fishing:ReloadSkin")
		Wait(1000)
		DeleteEntity(bottle)
		Wait(1000)
		TriggerEvent('animations:client:EmoteCommandStart', {"map"})
		Wait(2000)
		TriggerEvent('animations:client:EmoteCommandStart', {"smoke"})
		TriggerEvent("Pug:Fishing:ReloadSkin")
		Wait(1300)
		TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
        TriggerServerEvent("Pug:server:GiveFish", "treasuremap", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["treasuremap"], "add")
        Wait(500)
    end, function() -- Cancel
		TriggerServerEvent("Pug:server:GiveFish", "bottlemap", 1)
        TriggerEvent("Pug:Fishing:ReloadSkin")
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Translations.details.canceled, "error")
        Wait(500)
    end)
end)

-- NUI Callbacks
RegisterNUICallback('TresureClick', function(_, cb)
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
    cb('ok')
end)

RegisterNUICallback('TresureFailed', function(_, cb)
	OpeningChest = false
	succededchestopen = false
    PlaySound(-1, "Place_Prop_Fail", "DLC_Dmod_Prop_Editor_Sounds", 0, 0, 1)
    cb('ok')
end)

RegisterNUICallback('TresureSuccess', function(_, cb)
	succededchestopen = true
	OpeningChest = false
    ClearPedTasks(PlayerPedId())
    cb('ok')
	Wait(4000)
	succededchestopen = false
end)

RegisterNUICallback('CloseTresure', function(_, cb)
	OpeningChest = false
    SetNuiFocus(false, false)
    cb('ok')
end)