Config = {}


Config.Framework = 'QBCORE' -- Change accordingly to your framework ( ESX // QBCORE)

Config.FrameworkTriggers = {        
    main = 'QBCore:GetObject',    --ESX = 'esx:getSharedObject'   QBCORE = 'QBCore:GetObject'
    load = 'QBCore:Client:OnPlayerLoaded',   --ESX = 'esx:playerLoaded'      QBCORE = 'QBCore:Client:OnPlayerLoaded'
    resource_name = 'qb-core'   --ESX = 'es_extended'           QBCORE = 'qb-core'
}

-- When creating any book remember that page1 should be the Cover and last page the backCover

Config.Items = {                     -- Add and create here your items, Your imagination is the Limi!!  The images uploaded to pages must have exactly the same name of your ['guide'] name item
    ['guide'] = {                       -- ITEMS NAME : Add your respective items to ESX - Database // QBcore items.lua
        name = 'Server Guide',           -- this is just for your info, use what you want inside of ''
        numberOfPages = 8,               -- Must be the exact number of pages you made for that book.
    },
    ['police_guide'] = {
        name = 'Police Guide',
        numberOfPages = 8,
    },
    ['bar'] = {
        name = 'News book',
        numberOfPages = 4,
    },
    ['welcomeguide'] = {
        name = 'Welcome Guide',
        numberOfPages = 4,
    },
    ['cluea'] = {
        name = 'Treasure Hunt Clue 1',
        numberOfPages = 4,
    },
    ['clueb'] = {
        name = 'Treasure Hunt Clue 2',
        numberOfPages = 4,
    },
    ['cluec'] = {
        name = 'Treasure Hunt Clue 3',
        numberOfPages = 4,
    },
    ['clued'] = {
        name = 'Treasure Hunt Clue 4',
        numberOfPages = 4,
    },
    ['cluee'] = {
        name = 'Treasure Hunt Clue 5',
        numberOfPages = 4,
    },
    ['cluef'] = {
        name = 'Treasure Hunt Clue 6',
        numberOfPages = 4,
    },
    ['cafemenu'] = {
        name = 'Cat Cafe Menu',
        numberOfPages = 6,
    },
    ['carcatalog'] = {
        name = 'LS Imports Car Catalog',
        numberOfPages = 6,
    },
    ['newsissueone'] = {
        name = 'Weekly Weazel Issue # 1',
        numberOfPages = 6,
    },
}