local QBCore = exports['qb-core']:GetCoreObject()
local doing = false
local emote = nil

RegisterNetEvent('Polar-Sub:Client:Item', function(bool)
    print('star')
    if not doing then
        doing = true

    if bool == 1 then
        emote = 'cake' -- birthday cake
    elseif bool == 2 then
        emote = 'cake2' -- baby cake
    elseif bool == 3 then
        emote = 'cake3' -- casino cake
    elseif bool == 4 then
        emote = 'cake4' -- love cake
    elseif bool == 5 then
        emote = 'h'
    elseif bool == 6 then
        emote = 'h'
    elseif bool == 7 then
        emote = 'h'
    elseif bool == 8 then
        emote = 'h'
    elseif bool == 9 then
        emote = 'h'
    elseif bool == 10 then
        emote = 'h'
       



    end
    exports["Polar-Emotes"]:EmoteCommandStart(emote, 1)
    else
        doing = false
        exports["Polar-Emotes"]:EmoteCancel(emote)
    end

end)