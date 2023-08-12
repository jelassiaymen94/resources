Config = {} or Config

local QBCore = exports['qb-core']:GetCoreObject()




--============== POLICE ================

function CallPolice(loc) exports["qb-dispatch"]:CustomAlert({
        coords = loc, message = "Store Robbery",
        dispatchCode = "10-90", description = "", radius = 10,
        sprite = 304,  color = 46, scale = 1.0,  length = 1,
       
        })         
end



Config = {
    img = "inventory/html/images/",

    PolarWade = true,

    Debug = false ,

    RequiredCops = 0,
    CooldownTime = 30,

    OxTarget = false,
    OxTargetDistance = 1.5,
    OxDoorlock = true,
    OxIventory = false,


    BlipColor = 7,
    BlipSprite = 267,
    BlipName = "Robbery" ,

    CallBack =  QBCore.Functions.CreateCallback ,
    TrigCallBack = QBCore.Functions.TriggerCallback,



    HideBagID = 0,
    BagUseID = 82,
    Bag = 'ch_p_m_bag_var03_arm_s',
    MaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [18] = true, [26] = true, [52] = true, [53] = true, [54] = true, [55] = true, [56] = true, [57] = true, [58] = true, [59] = true, [60] = true, [61] = true, [62] = true, [112] = true, [113] = true, [114] = true, [118] = true, [125] = true, [132] = true,},
    FemaleGloves = { [0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true, [7] = true, [8] = true, [9] = true, [10] = true, [11] = true, [12] = true, [13] = true, [14] = true, [15] = true, [19] = true, [59] = true, [60] = true, [61] = true, [62] = true, [63] = true, [64] = true, [65] = true, [66] = true, [67] = true, [68] = true, [69] = true, [70] = true, [71] = true, [129] = true, [130] = true, [131] = true, [135] = true, [142] = true, [149] = true, [153] = true, [157] = true, [161] = true, [165] = true,},



    Ped = {
        [1] = { -- recyclablematerial
        coords = vector4(705.93, -964.25, 30.41, 230.22),
        model = "s_m_o_busker_01",
        scene = "WORLD_HUMAN_AA_COFFEE",
        icon = 'fa-solid fa-bolt',
        label = 'Talk to Namir',
        product = {
        },
    },
    },







   
    ComputerName = 'pp',
    RegisterName = 'ppp',
    SafeName = 'pppp',

    Names = {





    ["Store1"] = {
        Door1Name = '1StoreDoor1',
        Door1Eye = vector3(19.13, -1335.45, 29.28),
        Door2Name = '1StoreDoor2',
        Door2Eye = vector3(25.27, -1341.93, 29.5),
        ComputerEye = vector3(29.48, -1340.3, 29.34),
        RegisterEye = vector3(25.42, -1345.59, 29.75),
        SafeLocation = vector3(31.19, -1339.26, 29.5),
        GrabLocations1 = {
            vector4(31.35, -1348.59, 30.29, 251.97),

        },
        GrabLocations2 = {
            vector4(32.1, -1348.53, 30.29, 169.17),

        },
        GrabLocations3 = {
            vector4(25.58, -1347.51, 30.57, 317.24),

        },
        GrabLocations4 = {
            vector4(28.19, -1340.23, 30.3, 198.17),

        },
        GrabLocations5 = {
            vector4(26.91, -1340.86, 30.39, 200.93),

        },
        PickupLocations1 = {
            vector4(27.73, -1339.06, 29.5, 308.27),

        },
        PickupLocations2 = {
            vector4(30.73, -1340.53, 29.5, 190.81),

        },
        PickupLocations3 = {
            vector4(24.42, -1346.51, 29.5, 173.27),

        },
        PickupLocations4 = {
            vector4(26.97, -1342.35, 29.5, 33.11),

        },
        PickupLocations5 = {
            vector4(33.57, -1343.2, 29.5, 300.61),

        },
        PileLocations = {
            vector4(24.85, -1339.68, 29.5, 61.33),

        },
    },



    },
    RandomScrambler2 = {
    
        'alphabet',
        'numeric',
        'alphanumeric',
        'greek',
        'braille',
        'runes',
    
    },
    ScramblerMirrorMin2 = 0,
    ScramblerMirrorMax2 = 2,
    ScramblerSecondMin2 = 20,
    ScramblerSecondMax2 = 30,
}






