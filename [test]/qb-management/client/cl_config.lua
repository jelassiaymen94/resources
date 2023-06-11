-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(359.54, -1590.94, 30.88),
    },
    ['ambulance'] = {
        vector3(311.89, -598.0, 43.57),
    },
    ['pawnshop'] = {
        vector3(167.5713, -1314.2074, 29.20683),
    },
   -- ['taxi'] = {
   --     vector3(907.24, -150.19, 74.17),
   -- },
    ['wuchang'] = {
      vector3(-819.7119, -698.0801, 28.1010),
    },
    ['tuner'] = {
        vector3(125.56, -3007.39, 6.86),
    },
    ['mechanic'] = {
        vector3(988.88, -135.67, 73.88),
    },
    ['pizzathis'] = {
        vector3(797.0854, -751.3807, 31.1964),
    },
    ['vu'] = {
        vector3(96.3458, -1292.7917, 29.0654),
    },
    ['taco'] = {
        vector3(11.0971, -1609.3677, 0.4835),
    },
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(359.54, -1590.94, 30.88), length = 0.35, width = 0.45, heading = 351.0, minZ =  29.88, maxZ =  31.88 } ,
    },
    ['ambulance'] = {
        { coords = vector3(311.89, -598.0, 43.57), length = 1.2, width = 0.6, heading = 0.0, minZ =  42.28, maxZ = 44.28 },
    },
    ['pawnshop'] = {
       { coords = vector3(167.5713, -1314.2074, 29.20683), length = 0.6, width = 1.0, heading = 150.0, minZ = 28.943, maxZ = 30.74 },
    },
   -- ['taxi'] = {
  --      { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
  --  },
    ['wuchang'] = {
        { coords = vector3(-819.7119, -698.0801, 28.1010), length = 1.2, width = 1.05, heading = 0.0, minZ = 27.407, maxZ = 29.67 },
   },
    ['tuner'] = {
        { coords = vector3(125.56, -3007.39, 6.86), length = 1.15, width = 2.6, heading = 353.0, minZ = 5.86, maxZ = 7.869 },
    },
    ['mechanic'] = {
        { coords = vector3(988.88, -135.67, 73.88), length = 1.15, width = 2.6, heading = 0.0, minZ = 72.86, maxZ = 75.869 },
    },
    ['pizzathis'] = {
        { coords = vector3(797.0854, -751.3807, 31.1964), length = 1.15, width = 2.6, heading = 191.0, minZ = 30.86, maxZ = 32.869 },
    },
    ['vu'] = {
        { coords = vector3(96.3458, -1292.7917, 29.0654), length = 1.15, width = 2.6, heading = 300.0, minZ = 28.86, maxZ = 29.869 },
    },
    ['taco'] = {
        { coords = vector3(11.0971, -1609.3677, 0.4835), length = 1.15, width = 2.6, heading = 300.0, minZ = -0.4, maxZ = 1.4869 },
    },
}
-- vector3(988.88, -135.67, 74.88)
Config.GangMenus = {
    ['aod'] = {
        vector3(-237.63, 6248.29, 35.02),
    },
 
   
}

Config.GangMenuZones = {
    
    ['aod'] = {
        { coords = vector3(-237.63, 6248.29, 35.02), length = 1.05, width = 1.05, heading = 119.0, minZ = 34.0, maxZ = 36.0 },
    },
   
}
