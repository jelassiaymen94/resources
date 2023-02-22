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
      vector3(-816.96, -699.1, 31.94),
    },
    ['tuner'] = {
        vector3(125.56, -3007.39, 6.86),
    },
    ['mechanic'] = {
        vector3(988.88, -135.67, 73.88),
    },
    ['organics'] = {
        vector3(-1217.9350, -1483.6053, 4.1716),
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
        { coords = vector3(-816.96, -699.1, 31.94), length = 1.2, width = 1.05, heading = 0.0, minZ = 31.07, maxZ = 34.67 },
   },
    ['tuner'] = {
        { coords = vector3(125.56, -3007.39, 6.86), length = 1.15, width = 2.6, heading = 353.0, minZ = 5.86, maxZ = 7.869 },
    },
    ['mechanic'] = {
        { coords = vector3(988.88, -135.67, 73.88), length = 1.15, width = 2.6, heading = 0.0, minZ = 72.86, maxZ = 75.869 },
    },
    ['organics'] = {
        { coords = vector3(-1217.9350, -1483.6053, 4.1716), length = 1.15, width = 2.6, heading = 191.0, minZ = 3.86, maxZ = 5.869 },
    },
}
-- vector3(988.88, -135.67, 74.88)
Config.GangMenus = {
    ['lostmc'] = {
        vector3(975.6773, -99.9515, 74.6541),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['triads'] = {
        vector3(-645.9340, -1242.7471, 10.5516),
    },
    ['cartel'] = {
        vector3(484.7737, -1536.0708, 29.1545),
    },
    ['family'] = {
        vector3(-325.26, -2432.27, 7.11),
    },
    ['gsf'] = {
        vector3(-165.2283, -1616.7988, 33.5),
    },
    ['scrappgang'] = {
        vector3(1247.8715, -1581.9985, 59.1745),
    },
}

Config.GangMenuZones = {
    
    ['triads'] = {
        { coords = vector3(-645.9340, -1242.7471, 11.5516), length = 1.05, width = 1.05, heading = 119.0, minZ = 10.0, maxZ = 12.0 },
    },
    ['family'] = {
        { coords = vector3(-325.26, -2432.27, 7.11), length = 1.05, width = 1.05, heading = 119.0, minZ = 6.0, maxZ = 8.0 },
    },
    ['lostmc'] = {
        { coords = vector3(975.6773, -99.9515, 74.6541), length = 1.05, width = 1.05, heading = 119.0, minZ = 74.0, maxZ = 76.0 },
    },
    ['cartel'] = {
        { coords = vector3(484.7737, -1536.0708, 29.1545), length = 1.05, width = 1.05, heading = 119.0, minZ = 29.0, maxZ = 31.0 },
    },
    ['gsf'] = {
        { coords = vector3(-165.2283, -1616.7988, 33.5), length = 1.05, width = 1.05, heading = 216.0, minZ = 33.0, maxZ = 35.0 },
    },
    ['scrappgang'] = {
        { coords = vector3(1247.8695, -1582.1065, 58.1745), length = 1.05, width = 1.05, heading = 117.0, minZ = 57.0, maxZ = 59.0 },
    },
}
