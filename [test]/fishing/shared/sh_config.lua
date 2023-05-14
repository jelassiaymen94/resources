Shared = {} or Shared

Shared.CastTimeMin = 5 -- Minimum Time in seconds between fishing and minigame
Shared.CastTimeMax = 8 -- Maximum Time in seconds between fishing and minigame

Shared.MinigameCirclesMin = 2 -- Minigame: Minimum amount of circles
Shared.MinigameCirclesMax = 3 -- Minigame: Maximum amount of circles
Shared.MinigameTime = 20 -- Minigame: Amount of time in seconds

Shared.SellLocation = vector4(1348.36, 4317.34, 37.04, 83.71)

Shared.FishingZones = {
    [1] = { -- Example of a BoxZone (box = true)
        coords = vector3(713.31, 4113.7, 35.78),
        heading = 179,
        length = 44.4,
        width = 5.0,
        minZ = 33.78,
        maxZ = 36.98,
        box = true,
    },
    [2] = { -- Example of a PolyZone (box = false)
        points = {
            vector2(-3343.94, 922.73),
            vector2(-3265.15, 759.09),
            vector2(-3131.82, 510.61),
            vector2(-3204.55, 268.18),
            vector2(-3143.94, 31.82),
            vector2(-2822.73, -143.94),
            vector2(-2350.00, -453.03),
            vector2(-2022.73, -816.67),
            vector2(-1810.61, -1089.39),
            vector2(-1950.00, -1210.61),
            vector2(-1816.67, -1386.36),
            vector2(-1634.85, -1222.73),
            vector2(-1471.21, -1659.09),
            vector2(-1374.24, -1950.00),
            vector2(-1883.33, -2234.85),
            vector2(-2222.73, -3156.06),
            vector2(-1519.70, -3701.52),
            vector2(-768.18, -3980.30),
            vector2(-646.97, -3119.70),
            vector2(-198.48, -2804.55),
            vector2(92.42, -3568.18),
            vector2(940.91, -3531.82),
            vector2(1571.21, -3459.09),
            vector2(1522.73, -2925.76),
            vector2(2431.82, -2768.18),
            vector2(2856.06, -1943.94),
            vector2(3146.97, -962.12),
            vector2(3474.24, 56.06),
            vector2(3195.45, 1850.00),
            vector2(3753.03, 2710.61),
            vector2(4104.55, 3522.73),
            vector2(4298.48, 4274.24),
            vector2(4153.03, 4965.15),
            vector2(3583.33, 5328.79),
            vector2(3837.88, 5777.27),
            vector2(3377.27, 6431.82),
            vector2(2237.88, 6953.03),
            vector2(1571.21, 6868.18),
            vector2(710.61, 6856.06),
            vector2(298.48, 7243.94),
            vector2(383.33, 7583.33),
            vector2(-4.55, 7874.24),
            vector2(-404.55, 7401.52),
            vector2(-137.88, 6940.91),
            vector2(-646.97, 6553.03),
            vector2(-1083.33, 6540.91),
            vector2(-1362.12, 6092.42),
            vector2(-901.52, 5740.91),
            vector2(-1180.30, 5583.33),
            vector2(-1677.27, 5692.42),
            vector2(-2222.73, 5571.21),
            vector2(-2598.48, 5074.24),
            vector2(-2828.79, 4431.82),
            vector2(-3083.33, 3740.91),
            vector2(-3313.64, 3316.67),
            vector2(-3556.06, 2165.15),
            vector2(-3616.67, 1268.18)
        },
        minZ = 100.43,
        maxZ = 0.6,
        box = false
    }
}
