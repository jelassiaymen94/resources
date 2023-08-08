

Config = {}
local QBCore = exports['qb-core']:GetCoreObject()


Config.Target = "qb-target"
Config.ProgressBar = "ad-progressbar"
Config.CrackIcon = "fas fa-recycle"
-- REWARD OPTIONS
Config.NormalCash = false -- if false it will use black money
Config.Cash = math.random(5000, 10000)
Config.NormalCashName = 'money' -- change this if using custom name
Config.BlackMoneyName = 'markedbills'

-- TIMES
Config.BrokeTime = math.random(25000, 45000)
Config.ProgressTime = 7000
Config.TextLength = 2000 -- 3d text leight

-- LOCALES
Config.TextCrack = "Crack ATM"
Config.TextPutToCar = "Putting Rope To Car"
Config.TextAttach = "Attaching Rope To Atm"
Config.TextTCrack = "Cracking ATM"
Config.Text = "Press E to attach atm | Press X to remove rope"
Config.TextGotCash = "You got "

-- ROPE ITEM

Config.UseRopeNotify = "You used rope"
Config.DontHaveRope = "You dont have rope"