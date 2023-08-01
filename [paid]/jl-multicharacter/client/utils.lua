local function SlotAllowed()
    local slot = lib.callback.await("jl-multicharacter:getPlayerSlots", false)
    return slot
end




return {
    SlotAllowed = SlotAllowed,
}
