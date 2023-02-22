Config = {}



Config.Locations = { -- Edit the various interaction points for players or create new ones
["bells"] = {
    [1] = vector3(-1193.44, -895.5, 14.50), -- burgershot
   -- [2] = vector3(-817.39, -1236.78, 7.34), -- viceroy
},
["gavels"] = {
    [1] = vector3(-576.19, -209.92, 38.77), -- burgershot
   -- [2] = vector3(-817.39, -1236.78, 7.34), -- viceroy
},
["tattoshops"] = {
    [1] = vector3(1322.14, -1656.16, 53.16 - 1.12),
    [2] = vector3(326.11, 181.97, 104.47 - 1.12),
    [3] = vector3(-1154.97, -1429.57, 5.84 - 1.12),
    [4] = vector3(-3171.14, 1079.47, 21.72 - 1.12),
    [5] = vector3(1867.09, 3747.26, 33.91 - 1.12), -- pillbox
    [6] = vector3(-296.83, 6199.8, 32.35 - 1.12), -- viceroy
},









}
Config.Debug = false
Config.Styles = {
    [1] = { name = 'Default', value = 'default' },
    [2] = { name = 'Alien', value = 'move_m@alien' },
    [3] = { name = 'Armored', value = 'anim_group_move_ballistic' },
    [4] = { name = 'Arrogant', value = 'move_f@arrogant@a' },
    [5] = { name = 'Brave', value = 'move_m@brave' },
    [6] = { name = 'Business', value = 'move_m@business@a' },
    [7] = { name = 'Business 2', value = 'move_m@business@b' },
    [8] = { name = 'Business 3', value = 'move_m@business@c' },
    [9] = { name = 'Casual', value = 'move_f@arrogant@a' },
    [10] = { name = 'Casual 2', value = 'move_m@casual@b' },
    [11] = { name = 'Casual 3', value = 'move_m@casual@c' },
    [12] = { name = 'Casual 4', value = 'move_m@casual@d' },
    [13] = { name = 'Casual 5', value = 'move_m@casual@e' },
    [14] = { name = 'Casual 6', value = 'move_m@casual@f' },
    [15] = { name = 'ChiChi', value = 'move_f@chichi' },
    [16] = { name = 'Chubby Male', value = 'move_chubby' },
    [17] = { name = 'Chubby Female', value = 'move_f@chubby@a' },
    [18] = { name = 'Confident', value = 'move_m@confident' },
    [19] = { name = 'Cop', value = 'move_m@business@a' },
    [20] = { name = 'Cop 2', value = 'move_m@business@b' },
    [21] = { name = 'Cop 3', value = 'move_m@business@c' },
    [22] = { name = 'Drunk', value = 'move_m@drunk@a' },
    [23] = { name = 'Drunk 2', value = 'move_m@drunk@slightlydrunk' },
    [24] = { name = 'Drunk 3', value = 'move_m@buzzed' },
    [25] = { name = 'Drunk 4', value = 'move_m@drunk@verydrunk' },
    [26] = { name = 'Femme', value = 'move_f@femme@' },
    [27] = { name = 'Fire', value = 'move_characters@franklin@fire' },
    [28] = { name = 'Fire 2', value = 'move_characters@michael@fire' },
    [29] = { name = 'Fire 3', value = 'move_m@fire' },
    [30] = { name = 'Flee', value = 'move_f@flee@a' },
    [31] = { name = 'Franklin', value = 'move_p_m_one' },
    [32] = { name = 'Gangster', value = 'move_m@gangster@generic' },
    [33] = { name = 'Gangster 2', value = 'move_m@gangster@ng' },
    [34] = { name = 'Gangster 3', value = 'move_m@gangster@var_e' },
    [35] = { name = 'Gangster 4', value = 'move_m@gangster@var_f' },
    [36] = { name = 'Gangster 5', value = 'move_m@gangster@var_i' },
    [37] = { name = 'Grooving', value = 'anim@move_m@grooving@' },
    [38] = { name = 'Guard', value = 'move_m@prison_gaurd' },
    [39] = { name = 'Heels', value = 'move_f@heels@c' },
    [40] = { name = 'Heels 2', value = 'move_f@heels@d' },
    [41] = { name = 'Hiking', value = 'move_m@hiking' },
    [42] = { name = 'Hipster', value = 'move_m@hipster@a' },
    [43] = { name = 'Hobo', value = 'move_m@hobo@a' },
    [44] = { name = 'Hurry', value = 'move_f@hurry@a' },
    [45] = { name = 'Injured', value = 'move_m@injured' },
    [46] = { name = 'Janitor', value = 'move_p_m_zero_janitor' },
    [47] = { name = 'Janitor 2', value = 'move_p_m_zero_janitor' },
    [48] = { name = 'Man Eater', value = 'move_f@maneater' },
    [49] = { name = 'Money', value = 'move_m@money' },
    [50] = { name = 'Muscle', value = 'move_m@muscle@a' },
    [51] = { name = 'Nonchalant', value = 'move_m@non_chalant' },
    [52] = { name = 'Posh', value = 'move_m@posh@' },
    [53] = { name = 'Posh 2', value = 'move_f@posh@' },
    [54] = { name = 'Quick', value = 'move_m@quick' },
    [55] = { name = 'Sad', value = 'move_m@sad@a' },
    [56] = { name = 'Sassy', value = 'move_m@sassy' },
    [57] = { name = 'Scared', value = 'move_f@scared' },
    [58] = { name = 'Shady', value = 'move_m@shadyped@a' },
    [59] = { name = 'Swagger', value = 'move_m@swagger' },
    [60] = { name = 'Tough', value = 'move_m@tough_guy@' },
    [61] = { name = 'Tough 2', value = 'move_f@tough_guy@' },
    [62] = { name = 'Wide', value = 'move_m@bag' },
}
