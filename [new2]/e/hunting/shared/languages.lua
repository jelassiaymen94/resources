

local English = {
    ["pickup_carcass"] =  "Pick up carcass",
    ["cant_carry_item"] =  "You can not carry this",
    ["sell_carcass"] =  "Sell carcass",
    ["sell_in_progress"] =  "Sell in progress ...",
    ["blip_name"] =  "Carcass Sell",
    ["too_far"] =  "You are too far from the carcass",
    ["stop_farm"] =  "Respect the biodiversity change of place",
    ["cant_hun"] =  "You can't hunt in this area!",
    ["near_human"] =  "You can't do this when you're near a person!",
    ["cooldown_bait"] =  "You can order new bait later",
    ["bait"] =  "Placing bait...",
    ["baited"] =  "Bait placed, now go away and wait patiently!",
    ["inventory_full"] =  "Your inventory full"
}
local French = {
    ["pickup_carcass"] =  "Pick up carcass",
    ["cant_carry_item"] =  "You can not carry this",
    ["sell_carcass"] =  "Sell carcass",
    ["sell_in_progress"] =  "Sell in progress ...",
    ["blip_name"] =  "Carcass Sell",
    ["too_far"] =  "You are too far from the carcass",
    ["stop_farm"] =  "Respect the biodiversity change of place",
    ["cant_hun"] =  "You can't hunt in this area!",
    ["near_human"] =  "You can't do this when you're near a person!",
    ["cooldown_bait"] =  "You can order new bait later",
    ["bait"] =  "Placing bait...",
    ["baited"] =  "Bait placed, now go away and wait patiently!",
    ["inventory_full"] =  "Your inventory full"
}





-- text('nopolice')
function text(entry)
	return English[entry] -- change to your language
end