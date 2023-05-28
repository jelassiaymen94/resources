Config = Config or {}
 
Config.RenewedBanking = true
Config.PriceBrackets = {
    ["small"] = 250,
    ["medium"] = 250,
    ["large"] = 250,
}

Config.MaxMembers = 4 -- How many people can be in a group during the runs?
Config.MaxDeliver = 16 -- How many MAXIMUM Packages per location
Config.Deliver = {min = 2, max = 4} -- How many garbage bags per location?

Config.GroupPay = 1.5 -- How much more you get paid for doing a group run (5% more)
Config.GroupPayLimit = 3 -- How many people to get the Config.GroupPay bonus?

Config.Buffs = true -- Do u use ps or tnj buffs then enable this
Config.BuffExport = "qb-buffs" -- Some people still use tnj-buffs some uses qb-buffs they are the just edit the BuffExport to whatever you use
Config.BuffType = "luck" -- What buff type do u use for players to recieve more money?
Config.BuffPay = 1.15 -- How much more do they get paid for having the buff? (10% more)


Config.LeaderReturn = false -- If you want to make it so ONLY the group leader can return the truck then enable this