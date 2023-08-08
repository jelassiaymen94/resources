

AD = {}
local QBCore = exports['qb-core']:GetCoreObject()


AD.Target = "qb-target"
AD.ProgressBar = "ad-progressbar"
AD.CrackIcon = "fas fa-recycle"
-- REWARD OPTIONS
AD.NormalCash = false -- if false it will use black money
AD.Cash = math.random(5000, 10000)
AD.NormalCashName = 'money' -- change this if using custom name
AD.BlackMoneyName = 'markedbills'

-- TIMES
AD.BrokeTime = math.random(25000, 45000)
AD.ProgressTime = 7000
AD.TextLength = 2000 -- 3d text leight

-- LOCALES
AD.TextCrack = "Crack ATM"
AD.TextPutToCar = "Putting Rope To Car"
AD.TextAttach = "Attaching Rope To Atm"
AD.TextTCrack = "Cracking ATM"
AD.Text = "Press E to attach atm | Press X to remove rope"
AD.TextGotCash = "You got "

-- ROPE ITEM

AD.UseRopeNotify = "You used rope"
AD.DontHaveRope = "You dont have rope"