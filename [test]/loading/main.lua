local loading_screen_start = false

AddEventHandler("playerSpawned", function ()
    if not loading_screen_start then
        ShutdownLoadingScreenNui()
        loading_screen_start = true
    end
end)
