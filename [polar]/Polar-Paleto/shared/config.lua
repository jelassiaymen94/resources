Config = {} or Config

--==========================================================================
Config.Core = 'qb-core' -- for escrowed part
Config.img = "inventory/html/images/"
--==========================================================================


Config.PolarWade = true

--============== CORE ================ Change if esx
Config.Framework = 'qb' -- or 'esx'
if Config.Framework == 'qb' then 
    QBCore = exports[Config.Core]:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = nil
end
Config.CallBack =  QBCore.Functions.CreateCallback -- ESX.RegisterServerCallback
Config.TrigCallBack = QBCore.Functions.TriggerCallback -- ESX.TriggerServerCallback





Config.Debug = false -- debug for checks




--============== GENERAL ================
Config.RequiredCops = 0
Config.CooldownTime = 30 -- minutes in between robberies
Config.Gabz = false -- gabz mlo?

--============== LAZERS ================
Config.Lazers = false -- enable lazers? -- adds 0.1-0.35 ms for a small period of time until lasers get disabled
Config.LazerPolice = true --  calls police if a player hits a lazer instead of regular bank robbery calls
Config.LazerPoliceDisableCall = true -- will call police only if Config.LazerPolice is true and when someone presses the disable lazers button. (this is good for delayed calls, so criminals get more time to rob)
Config.Lockdown = true -- if a player walks into it, it causes lockdown
Config.LazerSounds = true -- if a player walks into it, it causes a sound to play


--============== OX ================
Config.OxTarget = false -- fully supported
Config.OxTargetDistance = 1.5 -- should keep low to stop glitching through walls
Config.OxDoorlock = true -- fully supported
Config.OxIventory = false -- not fully supported yet



--============== BANK BLIP -=============
Config.UseBlip = false -- use a blip on the map?
Config.BlipName = "Paleto Bank" -- blip name
Config.BlipLocation = vector3(-106.67, 6466.64, 32.75) -- blip location
Config.BlipSprite = 267 -- https://docs.fivem.net/docs/game-references/blips/ -- picture of blip
Config.BlipColor = 7  -- https://gtaforums.com/topic/864881-all-blip-color-ids-pictured/ -- color of blip



Config.TrollySpam = true -- trolly gives 30 items, compared to 1 large

--============== CLOTHING ================
---- DUFFLE BAG
Config.BagUseID = 82
Config.HideBagID = 0
--- GLOVES
Config.MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,}
Config.FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,}

Config.Bag = 'ch_p_m_bag_var03_arm_s' -- hei_p_m_bag_var22_arm_s


--============== POLICE ================

function CallPolice() exports["ps-dispatch"]:CustomAlert({
        coords = vector3(-111.1, 6482.23, 31.47), message = "Bank Robbery",
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
       
        })         
end








--============== Vault ================
Config.FingerPrintPercent = 85
Config.FingerPrintDoor = vec4(1,2,3,4)
Config.FingerDoorName = 'paletofinger'
Config.FingerEye = vec4(1,2,3,4)

Config.VaultDoorlock= true
Config.VaultDoorAnimation = vector4(-102.2, 6463.14, 31.63, 214.89)
Config.VaultDoorName = 'paletovault'
Config.VaultDoorThirdEye = vector3(-101.86, 6462.93, 32.0)




--============== Thermite Locations ================

Config.StartDoor = 'paletostart'
Config.StartThirdEye = vector3(-109.33, 6483.19, 31.47)
Config.StartThermite = vector4(-109.43, 6483.32, 31.47, 224.11)
Config.StartPfx = vector3(-109.46, 6484.36, 31.27)

Config.Door1 = 'paletodoor1'
Config.Door1Eye = vector3(-100.8, 6467.888, 31.63)
Config.Door1Thermite = vector4(-100.85, 6467.98, 31.63, 227.15)
Config.Door1Pfx = vector3(-100.84, 6468.97, 31.63)

Config.Door2 = 'paletodoor2'
Config.Door2Eye = vector3(-104.72, 6463.97, 31.63)
Config.Door2Thermite = vector4(-104.79, 6464.00, 31.63, 229.82)
Config.Door2Pfx = vector3(-104.76, 6465.0, 31.63)

Config.Door3 = 'paletodoor3'
Config.Door3Eye =  vector3(-103.561, 6474.922, 31.63)
Config.Door3Thermite = vector4(-103.51, 6474.86, 31.63, 41.54)
Config.Door3Pfx = vector3(-103.52, 6475.85, 31.63)
   
Config.LazerName = 'PaletoLazerButton'
Config.LazerLocation = vector4(-94.82, 6463.06, 31.54, 128.47)



--============== Crypto Computers ================

Config.Pc1name = 'paletopc1'
Config.Pc1 = vector3(-103.82, 6460.3, 31.47)

Config.Pc2name = 'paletopc2'
Config.Pc2 = vector3(-106.44, 6473.9, 31.32)-- vector3(-104.3, 6476.88, 31.5)

Config.Pc3name = 'paletopc3'
Config.Pc3 = vector3(-98.11, 6466.09, 31.47)





--============== Key Card Locations ================
Config.doorcard1 = 'paletodoorcard1'
Config.doorcard1Eye = vector3(-98.97, 6473.1, 31.63)
Config.doorcard1swipe = vector4(-99.48, 6473.1, 31.63, 306.32)

Config.doorcard2 = 'paletodoorcard1'
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

    
