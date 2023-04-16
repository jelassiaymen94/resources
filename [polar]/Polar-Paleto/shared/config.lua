Config = {} or Config

--==========================================================================
Config.Core = 'qb-core'
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.Input = 'qb-input'
Config.Inventory = 'qb-inventory'
Config.Skillbar = 'qb-skillbar'
Config.img = "qb-inventory/html/images/"
--==========================================================================

Config.Debug = false -- debug for checks

--============== GENERAL ================
Config.UseProps = true -- use props?
Config.RequiredCops = 0
Config.CooldownTime = 60 -- minutes in between robberies


--============== BANK BLIP -=============
Config.UseBlip = true -- use a blip on the map?
Config.BlipName = "Paleto Bank" -- blip name
Config.BlipLocation = vector3(-106.67, 6466.64, 32.75) -- blip location
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
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 75, scale = 1.0,  length = 1,
       
        })         
        TriggerServerEvent('InteractSound_SV:PlayAtCoord', vector3(-106.67, 6466.64, 32.75), 50, 'warehousealert', 0.35) 
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






    --- fingerprints 
    Config.FingerPrintPercent = 85





    --- hiest start
    Config.StartThirdEye = vector3(-109.33, 6483.19, 31.47)
    Config.StartThermite = vector4(-109.8, 6483.7, 31.47, 228.52)
    Config.StartPfx = vector3(-109.64, 6483.58, 31.47)

    Config.Door1Eye = vector3(-99.68, 6468.92, 31.63)
    Config.Door1Thermite = vector4(-100.08, 6469.09, 31.63, 233.49)
    Config.Door1Pfx = vector3(-100.07, 6469.09, 31.63)

    Config.Door2Eye = vector3(-105.73, 6462.84, 31.63)
    Config.Door2Thermite = vector4(-106.14, 6463.19, 31.63, 229.82)
    Config.Door2Pfx = vector3(-106.14, 6463.19, 31.63)

    Config.Door3Eye = vector3(-103.9, 6474.92, 31.63)
    Config.Door3Thermite = vector4(-103.58, 6474.53, 31.63, 42.13)
    Config.Door3Pfx = vector3(-103.58, 6474.53, 31.63)

    Config.Door4Eye = vector3(-93.06, 6468.02, 31.65)
    Config.Door4Thermite = vector4(-93.27, 6468.46, 31.65, 221.8)
    Config.Door4Pfx = vector3(-93.27, 6468.46, 31.65)

    Config.Pc1name = 'paletopc1'
    Config.Pc1 = vector3(-103.82, 6460.3, 31.47)

    Config.Pc2name = 'paletopc2'
    Config.Pc2 = vector3(-106.44, 6473.9, 31.32)

    Config.Pc3name = 'paletopc3'
    Config.Pc3 = vector3(-98.11, 6466.09, 31.47)

 
    
    Config.doorcard1Eye = vector3(-99.01, 6473.73, 31.63)
    Config.doorcard1swipe = vector4(-99.48, 6473.1, 31.63, 306.32)
   
    Config.doorcard2Eye = vector3(-111.99, 6474.2, 31.63)
    Config.doorcard2swipe = vector4(-111.55, 6473.83, 31.63, 49.81)
   