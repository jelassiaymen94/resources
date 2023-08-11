Config = {} or Config

--==========================================================================
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'inventory'
Config.Skillbar = 'qb-skillbar'
Config.img = "inventory/html/images/"
--==========================================================================

Config.Debug = false -- debug for checks

--============== GENERAL ================
Config.UseProps = true -- use props?
Config.RequiredCops = 0
Config.CooldownTime = 2 -- minutes in between robberies


--============== BANK BLIP -=============
Config.UseBlip = true -- use a blip on the map?
Config.BlipName = "Bay City Bank" -- blip name
Config.BlipLocation = vector3(-1308.48, -827.52, 17.15) -- blip location
Config.BlipSprite = 106 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.BlipColor = 6  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip

--============== CLOTHING ================
---- DUFFLE BAG
Config.BagUseID = 82
Config.HideBagID = 0
--- GLOVES
Config.MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,}
Config.FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,}



function CallPolice() exports["qb-dispatch"]:CustomAlert({
        coords = vector3(-1308.48, -827.52, 17.15), message = "Bank Robbery",
        dispatchCode = "10-90", description = "Bank Robbery", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
       
        })         
        TriggerServerEvent('InteractSound_SV:PlayAtCoord', vec3(-1308.48, -827.52, 17.15), 50, 'warehousealert', 0.35) 
end






-- SCRAMBLER MINIGAME
Config.RandomScrambler2 = {
    
        'alphabet',
        'numeric',
        'alphanumeric',
        'greek',
        'braille',
        'runes',
    
    } 
    Config.ScramblerMirrorMin2 = 0
    Config.ScramblerMirrorMax2 = 2
    Config.ScramblerSecondMin2 = 20
    Config.ScramblerSecondMax2 = 30