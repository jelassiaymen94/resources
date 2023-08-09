Config	= {}

QBCore = exports['qb-core']:GetCoreObject()		-- If you are using an older QB-Core Version you may change that

Config.SpawnWheel = true							-- If your map does NOT have the wheel, set it to true. if your map has already a wheel set it to false
Config.WheelPos = {x = 1111.05, y = 229.81, z = -50.38, h = 0.0}	-- Where the wheel prop will spawn OR where wheel prop is

Config.VehiclePos = {x = 1099.95, y = 220.288, z = -48.9949, h = 202.3}
Config.VehicleRot = true										-- If true then the vehicle will rotate slowly
Config.VehicleWinPos = vector4(933.29, -3.33, 78.34, 149.51)	-- Where the vehicle will spawn if a player win it


Config.Cars = {
	[1]  = 'deveste',
	[2]  = 'italigto',
	[3]  = 'osiris',
	[4]  = 'nero2',
	[5]  = 'tezeract',
	[6]  = 'autarch',
	[7]  = 'tyrant',
	[8]  = 'visione',
	[9]  = 'zentorno',
	[10] = 'tempesta',
	[11] = 'italirsx',
	[12] = 'cheetah',
	[13] = 'prototipo',
	[14] = 'fmj',
}


-- First it will pick a random 
-- type: money, item, car (for money it will give only in bank)
-- name: the DB name, 
-- count: 

-- probability: the script will generate a number from 1 to 1000
-- if the random number is between a and b player will win
-- random number must be bigger than a and smaller or equal to b
-- if rnd > a and rnd <= b 

-- available sounds: 'car', 'cash', 'chips', 'clothes', 'mystery', 'win'
Config.Prices = {
	[1]  = {type = 'car', 		name = 'car', 			count = 1, 		sound = 'car', 		probability = {a =   0, b =   1}},	--  0.1 %   0.1 -- VEHICLE
	[2]  = {type = 'crypto', 		name = '5', 		count = 50000, 		sound = 'win', 			probability = {a =   1, b =   5}},	--  0.4 %   0.5 
	[3]  = {type = 'nothing', 		name = '0', 		count = 1, 		sound = 'win', 			probability = {a =   5, b =  10}},	--  0.5 %   1.0 
	[4]  = {type = 'drink', 		name = '4', 		count = 5, 		sound = 'win', 			probability = {a =  10, b =  20}},	--  1.0 %   2.0
	[5]  = {type = 'cash', 		name = '3', 		count = 25000, 		sound = 'win', 			probability = {a =  20, b =  40}},	--  2.0 %   4.0 
	[6]  = {type = 'crypto', 		name = '5', 		count = 20000, 		sound = 'win', 			probability = {a =  40, b =  60}},	--  2.0 %   6.0 
	[7]  = {type = 'nothing', 		name = '0', 		count = 1, 		sound = 'win', 			probability = {a =  60, b =  80}},	--  4.0 %   8.0 
	[8]  = {type = 'mystery2', 		name = '1', 		count = 1, 		sound = 'mystery', 			probability = {a =  80, b = 120}},	--  4.0 %  12.0 
	[9]  = {type = 'drink', 		name = '4', 		count = 3, 		sound = 'win', 			probability = {a = 120, b = 170}},	--  5.0 %  17.0
	[10] = {type = 'crypto', 		name = '5', 		count = 1000, 		sound = 'win', 			probability = {a = 170, b = 220}},	--  5.0 %  22.0 
	[11] = {type = 'nothing',		name = '0', 		count = 1, 		sound = 'win', 			probability = {a = 220, b = 280}},	--  6.0 %  28.0 
	[12] = {type = 'drink', 		name = '4', 		count = 2, 		sound = 'win', 			probability = {a = 280, b = 340}},	--  6.0 %  34.0
	[13] = {type = 'cash', 		name = '3', 		count = 2500, 		sound = 'win', 			probability = {a = 340, b = 410}},	--  7.0 %  41.0 
	[14] = {type = 'crypto', 		name = '5', 		count = 1000, 		sound = 'win', 			probability = {a = 410, b = 480}},	--  7.0 %  48.0 
	[15] = {type = 'nothing ', 		name = '2', 		count = 1, 		sound = 'mystery', 			probability = {a = 480, b = 560}},	--  8.0 %  56.0 
	[16] = {type = 'drink',		name = '4', 		count = 1, 		sound = 'win', 			probability = {a = 560, b = 640}},	--  8.0 %  64.0 
	[17] = {type = 'cash',		name = '3', 		count = 2500, 		sound = 'win', 			probability = {a = 640, b = 720}},	--  8.0 %  72.0 
	[18] = {type = 'crypto', 		name = '5', 		count = 1000, 		sound = 'win', 		probability = {a = 720, b = 810}},	--  9.0 %  81.0 
	[19] = {type = 'nothing', 		name = '0', 		count = 1, 		sound = 'win', 		probability = {a = 810, b = 900}},	--  9.0 %  90.0 
	[20] = {type = 'cash', 		name = '3', 		count = 1, 		sound = 'win', 		probability = {a = 900, b = 1000}},	-- 10.0 % 100.0 
}
