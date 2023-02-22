    Config = {}
Config.Zone = {}

Config.EventPrefix = 'QBCore' -- Core event prefix
Config.QBCoreFolderName = 'qb-core' -- Core folder name

Config.TargetFolderName = 'qb-target' -- name of the target folder

Config.MenuEventPrefix = 'qb-menu' -- event prefix of menu
Config.MenuFolderName = 'qb-menu' -- menu folder name

Config.DeveloperMod = false -- When server acvite and you not gonna restart the script, developermod off else it will cause issues
Config.usingNUI = true
Config.SPRAY_PROGRESSBAR_DURATION = 30 -- How long will it take to create the spray (in sec)
Config.SPRAY_REMOVE_DURATION = 30 -- How long will it take to remove the spray (in sec)
Config.MinPlayersForScratch = 0 -- How many gang member needed to be online so player can scratch a graffiti
Config.MinGangForRob = 100 -- How many gang member needed to be online so player can rob their NPC
Config.Radius = 80.0 -- Turf radius
Config.NPCRadius = 80.0 -- Radius that NPC will spawn
Config.oneGraffitiInRadius = true -- Can create only one graffiti inside a radius
Config.SellTime = 30 -- every X sec, it will sell an item
Config.SellOneItem = false -- Sell one item at the time (if item amount > 1)
Config.TimeForNPCRob = 15 -- Time to rob npc (in sec)
Config.EnableNPC = false -- Enable NPC to spawn
Config.AmountOfNPCInRadius = 1 -- Amount of NPC in a radius (not suggested more then 5, might cause crashes)
Config.NotInGameGang = 'none' -- Just check in your qb shared gangs see what is the default gang
Config.PlayerSQLTable = 'players' -- Players SQL in DataBase
Config.RadiusForRandomCoords = 30.0 -- Random coods that will be generate within the radius
Config.RadiusForNPCRobBlip = 500.0 -- Radius for the blip itself
Config.RobTimeBlip = 15 -- How long the rob blip will be exist in sec
Config.BlipOpacity = 85 -- the opacity of the blip (0-100)
Config.BlipSprite = 9 -- Blip itself Suggested 9 (can be found here https://docs.fivem.net/docs/game-references/blips/)

Config.UseItemBox = 'inventory:client:ItemBox' -- If using the event, change it as you want it, to disable set false
Config.AllowSellToAllPlayers = false -- Allowing random players (none gang or from other gangs to sell items at the npc)
Config.NPCSellItemsSlots = 3 -- How many slots each npc will have in his sell items
Config.NPCSellItemsWeight = 50 -- How much weight each npc will have in his sell items
Config.NPCInvItemsSlots = 20 -- How many slots each npc will have in his inventory
Config.NPCInvItemsweight = 100 -- How much weight each npc will have in his inventory
Config.PrecentForGang = 20 -- How much % the npc of the gang will get to disable set 0
Config.EnableNPCTarget = false -- enable the target on the npc, false means you will not able to use target on them

Config.ScratchRemoveMoney = false -- true scratching will make price decrease.
Config.AmountSprayCanBuy = 2 -- Amount of sprays that can be bought in a restart. Set false to disable

Config.SprayItemName = 'spray' -- SPRAY item name
Config.GangMenuItem = 'laptop' -- turf menu Item Name
Config.SprayRemover = 'sprayremover' -- spray remover, to disable set to false

Config.ShopCurrency = '$' -- shop currency


Config.Text = {
    SPRAY_ERRORS = {
        NOT_FLAT = 'This surface is not flat enough',
        TOO_FAR = 'The surface is too far',
        INVALID_SURFACE = 'It cannot be sprayed on this surface',
        AIM = 'Aim the spray at a flat wall',
    },
    PROGRESSBAR = {
        SPRAYING = "Spraying...",
        SCRATCHING = "Scratching Graffiti",
        ROBBING_NPC = "Robbing NPC...",
    },
    NPC_TEXT = {
        PEDHASNOTHING = "This ped has nothing",
        NPCGETROB = "Someone is robbing your npc, location set in GPS",
        NOMONEY = "This npc has no money!",
        NOENOUGHGANG = 'Not enough gang members online!',
        SHOP_HEAD_TEXT = "Graffiti Shop",
        SHOP_FAILED_NO_MONEY = 'You don\'t have enough money',
        SHOP_GRAFFITI = 'Graffiti Buy',
        SHOP_TURFOPTIONS = 'Bought Laptop',
        SHOP_REMOVERBOUGHT = 'Bought Spray Remover',
        NOITEMSTOSELL = 'You got no items to sell',
        NOTENOUGHTITEMS = "You don't have enough items",
        BOUGHTENOUGH = "You can buy only " .. Config.AmountSprayCanBuy .. ' sprays per a day'
    },
    GRAFFITI = {
        GRAF_ACTIVE = 'Activated Turfs!',
        NO_GRAFFITI = 'You haven\'t discover any graffiti',
        GRAF_DISABLE = 'Removed Turfs!',
        GRAFFITIERROR = 'You can not spray inside an existing turf',
        CREATE_GRAFFITI = 'Press ~r~ [E]~s~ to spray',
        ALREADY_DISCOVER = 'You already discovered this graffiti',
        NEW_DISCOVER = "You have discoverd new graffiti",
        GRAFFITI_SCRATCH = "Someone is scratching your graffiti, location set in GPS",
        MISSING_REMOVER = "You can not remove the spray you are missing and item"
    },
    TARGET_GRAFFITI = {
        DISCOVER = 'Discover',
        DIS_ICON = 'fas fa-search',
        SCRATCH = 'Scratch',
        SCRA_ICON = 'fas fa-tools',
        NPC_SHOP_TEXT = 'Open Shop',
        NPC_SHOP_ICON = 'fas fa-shopping-basket',
    }
}

Config.Gangs = {
    ['ballas'] = { -- Gang Name
        spray = 'sprays_ballas', -- spray name (ydr)
        blipcolor = 27, -- blip color on map (can be found here: https://docs.fivem.net/docs/game-references/blips/)
        ped = 'g_m_y_ballaorig_01', -- ped you want to spawn in your turf (can be found here: https://docs.fivem.net/docs/game-references/ped-models/)
        -- PAY ATTENTION adding a ped here will make him not spawn anywhere else expect the in the turfs
        graffitiRGB = {r = 148, g = 0, b = 211}, -- particals color for the spray itself
    },
    ['vagos'] = {
        spray = 'sprays_vagos',
        blipcolor = 5,
        ped = 'u_m_y_mani',
        graffitiRGB = {r = 255, g = 255, b = 0},
    },
    ['lostmc'] = {
        spray = 'sprays_lostmc',
        blipcolor = 22,
        ped = 'g_m_y_lost_01',
        graffitiRGB = {r = 105, g = 105, b = 105},
    },
    ['gsf'] = {
        spray = 'sprays_gsf',
        blipcolor = 43,
        ped = 'g_m_y_famca_01',
        graffitiRGB = {r = 0, g = 100, b = 0},
    },
    ['marabunta'] = {
        spray = 'sprays_marabunta',
        blipcolor = 32,
        ped = 'g_m_y_salvagoon_01',
        graffitiRGB = {r = 148, g = 0, b = 211},
    },
    ['triads'] = {
        spray = 'sprays_triads',
        blipcolor = 6,
        ped = 'g_m_y_korlieut_01',
        graffitiRGB = {r = 148, g = 38, b = 34},
    },
}

Config.ShopInfo = {
    [1] = { -- There can be multiple shops
        NPCSeller = 'a_m_m_og_boss_01', -- what ped will sell the spray
        NPCLocation = vector4(141.5036, -842.3974, 30.95848, 242.5168), -- Pay attention it vector4
        SprayPrice = 500, -- original spray price, price will be price * priceMulti ^ lvl
        SprayRemoverPrice = 500, -- Spray remover price
        TurfOtionsPrice = 2000, -- Price for the turf data
        SprayPriceMulti = 2, -- how much times will you pay more for each lvl, lvl 20 * 2.0 * 1000 = 30k for lvl 20
        ShowBlip = true, -- if you want blip to be shown
        Scale = 0.8, -- blip scale
        ShopBlip = false, -- can be found here https://docs.fivem.net/docs/game-references/blips/ or set false to disable
        ShopBlipColor = 1, -- can be found here https://docs.fivem.net/docs/game-references/blips/
        Title = "Spray Shop", -- the title of the blip
        DistanceSpawn = 50.0, -- if distance between npc and you > ... npc will dispawn
    },
}

Config.ItemsForSale = { -- Items that only gangs can sell to their npc
    ["band"] = 1500,
    ["cashstack"] = 500,
    ["headphones"] = 100,
    ["samsungphone"] = 100,
    ["iphone"] = 100,
    ["goldchain"] = 100,
    ["goldcoin"] = 150,
    ["diamond_ring"] = 150,
    ["goldbar"] = 500,
    ["rolex"] = 250,
    ["markedbills"] = 800,
    ["inkedmoneybag"] = 30000,
    ["fish_dolphin"] = 340,
    ["fish_shark"] = 375,
    ["fish_whale"] = 420,
    ["bobcatsecuritycard"] = 25000,
}

Config.SellItems = { -- Items that every player can sell
    ["cashstack"] = 500,
}