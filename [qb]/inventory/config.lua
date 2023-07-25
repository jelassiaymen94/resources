Config = {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add 'setr UseTarget true' to use this and just that from true to false or the other way around)

Config.MaxInventoryWeight = 125000 -- Max weight a player can carry (default 120kg, written in grams)
Config.MaxInventorySlots = 35 -- Max inventory slots for a player

Config.CleanupDropTime = 5 * 60 -- How many seconds it takes for drops to be untouched before being deleted
Config.MaxDropViewDistance = 12.5 -- The distance in GTA Units that a drop can be seen
Config.UseItemDrop = true -- This will enable item object to spawn on drops instead of markers
Config.ItemDropObject ='p_ld_bs_bag_01' -- if Config.UseItemDrop is true, this will be the prop that spawns for the item

Config.Progressbar = {
    Enable = false,         -- True to Enable the progressbar while opening inventory
    minT = 250,             -- Min Time for Inventory to open
    maxT = 500              -- Max Time for Inventory to open
}

Config.VendingObjects = {
    
    ""
}

Config.BinObjects = {
    "prop_bin_05a",
}

Config.CraftingObject = ''

Config.VendingItem = {
   "water_bottle",
}

Config.CraftingItems = {
   
}

Config.AttachmentCraftingLocation = vector3(0, 0, 0)

Config.AttachmentCrafting = {
   
}

BackEngineVehicles = {
    ['ninef'] = true,
    ['adder'] = true,
    ['vagner'] = true,
    ['t20'] = true,
    ['infernus'] = true,
    ['zentorno'] = true,
    ['reaper'] = true,
    ['comet2'] = true,
    ['comet3'] = true,
    ['jester'] = true,
    ['jester2'] = true,
    ['cheetah'] = true,
    ['cheetah2'] = true,
    ['prototipo'] = true,
    ['turismor'] = true,
    ['pfister811'] = true,
    ['ardent'] = true,
    ['nero'] = true,
    ['nero2'] = true,
    ['tempesta'] = true,
    ['vacca'] = true,
    ['bullet'] = true,
    ['osiris'] = true,
    ['entityxf'] = true,
    ['turismo2'] = true,
    ['fmj'] = true,
    ['re7b'] = true,
    ['tyrus'] = true,
    ['italigtb'] = true,
    ['penetrator'] = true,
    ['monroe'] = true,
    ['ninef2'] = true,
    ['stingergt'] = true,
    ['surfer'] = true,
    ['surfer2'] = true,
    ['gp1'] = true,
    ['autarch'] = true,
    ['tyrant'] = true
}

Config.MaximumAmmoValues = {
    ["pistol"] = 60,
    ["smg"] = 120,
    ["shotgun"] = 20,
    ["rifle"] = 120,
}