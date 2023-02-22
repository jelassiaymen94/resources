local Translations = {
    error = {
        ["missing_something"] = "You Don't Have The Required Items!",
        ["not_enough_police"] = "There Are Not enough Police On Duty!",
        ["door_open"] = "The Door Has Already Been Opened!",
        ["process_cancelled"] = "Your Hands Slipped & You Made A Noise!",
        ["didnt_work"] = "You Broke The Lockpick!",
        ["emty_box"] = "You Found Nothing Here!..",
    },
    success = {
        ["worked"] = "It worked! Now Be quick!",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
