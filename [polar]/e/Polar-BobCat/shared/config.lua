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


--============== CORE ================ Change if esx
Config.Notify = 'qb' -- or 'esx'
if Config.Notify == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Notify == 'esx' then
    ESX = nil
end
Config.CallBack =  QBCore.Functions.CreateCallback -- ESX.RegisterServerCallback
Config.TrigCallBack = QBCore.Functions.TriggerCallback -- ESX.TriggerServerCallback

       

Config.Debug = true -- debug for checks




--============== GENERAL ================

Config.UseProps = true -- use props?
Config.RequiredCops = 0
Config.CooldownTime = 30 -- minutes in between robberies
Config.Language = 'English' -- change with languages EX. 'French'


--============== OX ================
Config.OxTarget = false
Config.OxDoorlock = false

--============== BANK BLIP -=============

Config.UseBlip = true -- use a blip on the map?
Config.BlipName = "Bob Cat Security" -- blip name
Config.BlipLocation = vector3(888.39, -2130.36, 31.24) -- blip location
Config.BlipSprite = 106 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.BlipColor = 5  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip




--============== CLOTHING ================

---- DUFFLE BAG
Config.BagUseID = 82
Config.HideBagID = 0
--- GLOVES
Config.MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,}
Config.FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,}




--============== POLICE ================

function CallPolice() exports["ps-dispatch"]:CustomAlert({
        coords = vector3(-111.1, 6482.23, 31.47), message = "Bank Robbery",
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
       
        })         
     --   TriggerServerEvent('InteractSound_SV:PlayAtCoord', vector3(-106.67, 6466.64, 32.75), 50, 'warehousealert', 0.35) 
end





Config.Health = 200
Config.Accuracy = 50
Config.Range = 2
Config.AmmoCount = 50



--============== Vault ================
    
Config.FingerPrintPercent = 85
Config.FingerPrintDoor = vec4(1,2,3,4)
Config.FingerPrintDoorDoor = 'BobCatfinger'

Config.BobCat = true
Config.VaultDoorAnimation = vector4(-102.2, 6463.14, 31.63, 214.89)
Config.VaultDoorDoor = 'BobCatvault'
Config.VaultDoorThirdEye = vector3(-101.86, 6462.93, 32.0)




--============== Thermite Locations ================

Config.StartThirdEye =   vector3(870.46, -2134.83, 30.78)-- vector3(870.41, -2134.94, 30.7)
Config.StartThermite = vector4(870.34, -2134.82, 30.77, 264.66)
Config.StartPfx = vector3(870.33, -2133.80, 30.50)

Config.Door1Eye = vector3(908.56, -2119.78, 31.44)
Config.Door1Thermite = vector4(908.25, -2119.75, 31.47, 86.71)
Config.Door1Pfx = vector3(908.96, -2120.16, 31.23)

Config.Door2Eye = vector3(891.99, -2108.15, 31.23)
Config.Door2Thermite = vector4(891.98, -2107.93, 31.25, 0.07)
Config.Door2Pfx = vector3(891.34, -2108.36, 31.23)

Config.Door3Eye =  vector3(-1039999999.561, 6474.922, 31.63)
Config.Door3Thermite = vector4(-103999999999.51, 6474.86, 31.63, 41.54)
Config.Door3Pfx = vector3(-103.5299999999999, 6475.85, 31.63)
   




--============== Crypto Computers ================

Config.Pc1name = 'BobCatpc1'
Config.Pc1 = vector3(-103.82, 6460.3, 31.47)

Config.Pc2name = 'BobCatpc2'
Config.Pc2 = vector3(-106.44, 6473.9, 31.32)-- vector3(-104.3, 6476.88, 31.5)

Config.Pc3name = 'BobCatpc3'
Config.Pc3 = vector3(-98.11, 6466.09, 31.47)





--============== Key Card Locations ================
    
Config.doorcard1Eye = vector3(908.14, -2113.59, 31.23)
Config.doorcard1swipe = vector4(908.15, -2113.98, 31.23, 354.73)
   
Config.doorcard2Eye = vector3(-11199999999999.99, 6474.2, 31.63)
Config.doorcard2swipe = vector4(-1119999999999.55, 6473.83, 31.63, 49.81)
   








    
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

    
