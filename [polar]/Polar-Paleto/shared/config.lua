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
Config.CooldownTime = 30 -- minutes in between robberies
Config.Language = 'English'




--============== BANK BLIP -=============

Config.UseBlip = false -- use a blip on the map?
Config.BlipName = "Paleto Bank" -- blip name
Config.BlipLocation = vector3(-106.67, 6466.64, 32.75) -- blip location
Config.BlipSprite = 267 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.BlipColor = 7  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip




--============== CLOTHING ================

---- DUFFLE BAG
Config.BagUseID = 82
Config.HideBagID = 0
--- GLOVES
Config.MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,}
Config.FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,}




--============== POLICE ================

function CallPolice() exports["qb-dispatch"]:CustomAlert({
        coords = vector3(-111.1, 6482.23, 31.47), message = "Bank Robbery",
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
       
        })         
     --   TriggerServerEvent('InteractSound_SV:PlayAtCoord', vector3(-106.67, 6466.64, 32.75), 50, 'warehousealert', 0.35) 
end








--============== Vault ================
    
Config.FingerPrintPercent = 85
Config.FingerPrintDoor = vec4(1,2,3,4)
Config.FingerPrintDoorDoor = 'paletofinger'

Config.Paleto = true
Config.VaultDoorAnimation = vector4(-102.2, 6463.14, 31.63, 214.89)
Config.VaultDoorDoor = 'paletovault'
Config.VaultDoorThirdEye = vector3(-101.86, 6462.93, 32.0)




--============== Thermite Locations ================

Config.StartThirdEye = vector3(-109.33, 6483.19, 31.47)
Config.StartThermite = vector4(-109.43, 6483.32, 31.47, 224.11)
Config.StartPfx = vector3(-109.46, 6484.36, 31.27)

Config.Door1Eye = vector3(-100.8, 6467.888, 31.63)
Config.Door1Thermite = vector4(-100.85, 6467.98, 31.63, 227.15)
Config.Door1Pfx = vector3(-100.84, 6468.97, 31.63)

Config.Door2Eye = vector3(-104.72, 6463.97, 31.63)
Config.Door2Thermite = vector4(-104.79, 6464.00, 31.63, 229.82)
Config.Door2Pfx = vector3(-104.76, 6465.0, 31.63)

Config.Door3Eye =  vector3(-103.561, 6474.922, 31.63)
Config.Door3Thermite = vector4(-103.51, 6474.86, 31.63, 41.54)
Config.Door3Pfx = vector3(-103.52, 6475.85, 31.63)
   




--============== Crypto Computers ================

Config.Pc1name = 'paletopc1'
Config.Pc1 = vector3(-103.82, 6460.3, 31.47)

Config.Pc2name = 'paletopc2'
Config.Pc2 = vector3(-106.44, 6473.9, 31.32)

Config.Pc3name = 'paletopc3'
Config.Pc3 = vector3(-98.11, 6466.09, 31.47)





--============== Key Card Locations ================
    
Config.doorcard1Eye = vector3(-98.97, 6473.1, 31.63)
Config.doorcard1swipe = vector4(-99.48, 6473.1, 31.63, 306.32)
   
Config.doorcard2Eye = vector3(-111.99, 6474.2, 31.63)
Config.doorcard2swipe = vector4(-111.55, 6473.83, 31.63, 49.81)
   








    
--============== Scrambler Minigame ================

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

    
