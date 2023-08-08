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
Config.CooldownTime = 30 -- minutes in between robberies
Config.Language = 'English'




--============== BANK BLIP -=============

Config.UseBlip = false -- use a blip on the map?
Config.BlipName = "Pacific Bank" -- blip name
Config.BlipLocation = vector3(225.89, 199.04, 105.36) -- blip location
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
        coords = vector3(225.89, 199.04, 105.36), message = "Bank Robbery",
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
       
        })         
     --   TriggerServerEvent('InteractSound_SV:PlayAtCoord', vector3(-106.67, 6466.64, 32.75), 50, 'warehousealert', 0.35) 
end








--============== Vault ================
    
Config.FingerPrintPercent = 85
Config.FingerPrintDoor = vector4(261.93, 223.1, 106.28, 254.91)
Config.FingerPrintDoorDoor = 'Pacificfinger'
Config.FingerEye = vector3(262.3, 223.04, 106.61)

Config.Vault = true
Config.DoorLock = false
Config.VaultDoorAnimation = vector4(253.33, 228.43, 101.68, 69.96)
Config.VaultDoorDoor = 'Pacificvault'
Config.VaultDoorThirdEye = vector3(252.97, 228.52, 102.01)



--============== Thermite Locations ================

Config.StartThirdEye = vector3(285.61, 264.62, 105.91)
Config.StartThermite = vector4(285.68, 264.60, 105.59, 158.3)
Config.StartPfx =vector3(285.66, 265.69, 105.35)

Config.Door1Eye = vector3(256.07, 220.6, 106.35)
Config.Door1Thermite = vector4(256.05, 220.57, 106.35, 339.17)
Config.Door1Pfx = vector3(255.91, 221.61, 106.35)

Config.Door2Eye = vector3(25400000.85, 220.88, 101.78)
Config.Door2Thermite = vector4(2540000.6, 221.13, 101.68, 261.66)
Config.Door2Pfx = vector3(254000.850000, 220.88, 101.78)

Config.Door3Eye =  vector3(256.48, 219.11, 101.8)
Config.Door3Thermite = vector4(256.4, 219.03, 101.8, 339.09)
Config.Door3Pfx = vector3(256.44, 220.07, 101.8)
   




--============== Crypto Computers ================

Config.Pc1name = 'Pacificpc1'
Config.Pc1 = vector3(-103.82, 6460.3, 31.47)

Config.Pc2name = 'Pacificpc2'
Config.Pc2 = vector3(-106.44, 6473.9, 31.32)

Config.Pc3name = 'Pacificpc3'
Config.Pc3 = vector3(-98.11, 6466.09, 31.47)





--============== Key Card Locations ================
    
Config.doorcard1Eye = vector3(255.11, 221.28, 101.68)
Config.doorcard1swipe = vector4(254.65, 221.44, 101.68, 247.75)
   
Config.doorcard2Eye = vector3(-1110000.99, 6474.2, 31.63)
Config.doorcard2swipe = vector4(-1110000.55, 6473.83, 31.63, 49.81)
   








    
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

    
