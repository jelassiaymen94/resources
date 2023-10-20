
--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.
Config = {
	Debug = false,  -- Enable to use debug features
	Notify = "qb",
	CarDespawn = true, -- Sends the vehicle to hell
	Locations = {
		{ 	zoneEnable = true,
			job = "ambulance",
			garage = {
				spawn = vector4(292.8095, -582.1111, 43.1896, 337.9262),  -- Where the car will spawn
				out = vector4(300.6049, -579.8707, 43.2609, 76.6546),	-- Where the parking stand is
				list = { -- 300.6049, -579.8707, 43.2609, 76.6546
					["emsnspeedo"] = {
						--colors = { 136, 137 },
						rank = {0,1,2,3,4,5},
						--livery = 1,
						--bulletproof = false,
						--extras = { 1, 4 },
						performance = "max",
					},
					["ambulance"] = {
						--colors = { 136, 137 },
						rank = {0,1,2,3,4,5},
						livery = 1,
						performance = "max",
						--bulletproof = false,
						--extras = { 1, 4 },
					},
				},
			},
		}, 
		
		{ 	zoneEnable = true,
		job = "ambulance",
		garage = {
			spawn = vector4(335.5130, -569.3240, 28.7968, 336.1238),  -- Where the car will spawn
			out = vector4(339.6877, -577.2753, 28.7969, 73.3906),	-- Where the parking stand is
			list = { -- 300.6049, -579.8707, 43.2609, 76.6546
				["emsnspeedo"] = {
					--colors = { 136, 137 },
					rank = {0,1,2,3,4,5},
					--livery = 1,
					--bulletproof = false,
					--extras = { 1, 4 },
					performance = "max",
				},
				["ambulance"] = {
					--colors = { 136, 137 },
					rank = {0,1,2,3,4,5},
					livery = 1,
					performance = "max",
					--bulletproof = false,
					--extras = { 1, 4 },
				},
			},
		},
	}, 







		-- 463.4001, -982.2531, 43.6916, 85.8971
		{ 	zoneEnable = true,
			job = "ambulance",
			garage = {
				spawn = vector4(351.1828, -588.0858, 74.1615, 331.2760),  -- Where the car will spawn
				out = vector4(337.8777, -586.0800, 74.1615, 256.7559),	-- Where the parking stand is
				list = { -- 300.6049, -579.8707, 43.2609, 76.6546
					["emsaw139"] = {
						--colors = { 136, 137 },
						rank = {0,1,2,3,4,5},
						performance = "max",
						--livery = 1,
						--bulletproof = false,
						--extras = { 1, 4 },
					}, -- polas350
					
					
				},
			},
		},



















		--------==========================================================================================
		--------==========================================================================================
		--------==========================================================================================
		--------==========================================================================================
		













		 -- 337.8777, -586.0800, 74.1615, 256.7559]]
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn =  vector4(381.46, -1625.76, 29.29, 319.89), -- dpd
				out = vector4(392.77, -1632.79, 29.29, 47.55), --  vector4(381.46, -1625.76, 29.29, 319.89)
				list = {
					["npolvic"] = { -- npolvic
						CustomName = "Crown Vic",
						livery = 1,
						rank = {0,1,2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 2,

					--	spoiler = 0,
					--	backbump = 1,
					--	skirt = 1,
					--	exaust = 1,
						chassis = 2,
					--	grill = 1,
						trunk = 3,
					--	wl = 1,
					--	wr = 1,
						--roof = 1,

						trunkItems = {
						
						},
					},
					["npolchar"] = { -- npolchar
						CustomName = "LSPD Dodge Charger",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 4,5,6,7,8,9,10,11,12,13,14,15 },
						colors = {0,0},
						--performance = "max",
                        frontbump = 1,
						
						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
						
						},
					},
					
					["npolexp"] = { -- npolexp
						CustomName = "Ford Explorer",
						livery = 1,
						rank = {1,2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 4,
						  
						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
						
						},
					},
					
					["npolmm"] = {
						CustomName = "Police Motorcycle",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 1,

						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
							
						},
					},
					["npolvette"] = {
						CustomName = "Chevy Corvette",
						livery = 1,
						rank = {3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 2,
						  
						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
						
						},
					},
					["npolstang"] = {
						CustomName = "Ford Mustang",
						livery = 1,
						rank = {3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 2,
						  
						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
						
						},
					},
					["npolchal"] = {
						CustomName = "Dodge Challenger",
						livery = 1,
						rank = {3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 3,
						
						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
						
						},
					},
					
					["npolblazer"] = {
						CustomName = "Sheriff Blazer",
						livery = 1,
						rank = {2, 3, 4, 5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                        frontbump = 1,
						  
						spoiler = 1,
						backbump = 1,
						skirt = 1,
						exaust = 1,
						chassis = 1,
						grill = 1,
						trunk = 1,
						wl = 1,
						wr = 1,
						roof = 1,
						
						trunkItems = {
							
						},
					},
					["npolcoach"] = {
						CustomName = "Police Bus",
						livery = 1,
						rank = {2, 3, 4, 5 },
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                          frontbump = 1,
						trunkItems = {
							
						},
					},
					["uccomet"] = {
						CustomName = "Undercover Comet",
						livery = 1,
						rank = { 2,3, 4, 5 },
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                          frontbump = 1,
						trunkItems = {
							
						},
					},
					["uccoquette"] = {
						CustomName = "Undercover Coquette",
						livery = 1,
						rank = { 2,3, 4, 5 },
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                          frontbump = 1,
						trunkItems = {
							
						},
					},
					["bcat"] = {
						CustomName = "Bear Cat",
						livery = 1,
						rank = {2, 3, 4, 5 },
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                          frontbump = 1,
						trunkItems = {
							
						},2,
					},
					["ucballer"] = {
						CustomName = "Undercover Baller",
						livery = 1,
						rank = { 2,3, 4, 5 },
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                          frontbump = 1,
						trunkItems = {
							
						},
					},
					["polas350"] = {
						CustomName = "Police Helicopter",
						livery = 1,
						rank = {2, 3,4,5},
						extras = {2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						performance = "max",
						trunkItems = {
						
						},
					},
					["17raptorpd"] = {
						CustomName = "Ford Raptor",
						livery = 1,
						rank = {1, 2,3 ,4 ,5},
						extras = {2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						--performance = "max",
                          frontbump = 1,
						trunkItems = {
						
						},
					},
				
				},
			},
		},
		
		
		


		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		--------==========================================================================================
		--------==========================================================================================
		--------==========================================================================================
		--------==========================================================================================
		
		
		
		
		
		
		
		{ 	zoneEnable = true, -- sheriff
			job = "police",
			garage = {
				spawn = vector4(381.96, -1624.11, 29.29, 323.57),  -- Where the car will spawn
				out = vector4(393.79, -1605.43, 29.29, 141.18),	-- Where the parking stand is
				list = { -- 300.6049, -579.8707, 43.2609, 76.6546
				["npolvic"] = {
					CustomName = "Sheriff Crown Vic",
					livery = 3,
					rank = {0,1,2,3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					colors = {0,0},
					--performance = "max",
                          frontbump = 1,
					trunkItems = {
					
					},
				},
				["npolchar"] = {
					CustomName = "Sheriff Dodge Charger",
					livery = 2,
					rank = {2,3,4,5},
					extras = { 1, 4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {0,0},
					trunkItems = {

					},
				},
				
				["npolexp"] = {
					CustomName = "Sheriff Ford Explorer",
					livery = 3,
					rank = {1,2,3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {0,0},
					trunkItems = {
					
					},
				},
				
				["npolmm"] = {
					CustomName = "Sheriff Police Motorcycle",
					livery = 2,
					rank = {2,3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {0,0},
					trunkItems = {
						
					},
				},
				["npolvette"] = {
					CustomName = "Sheriff Chevy Corvette",
					livery = 2,
					rank = {3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {0,0},
					trunkItems = {
					
					},
				},
				["npolstang"] = {
					CustomName = "Sheriff Ford Mustang",
					livery = 2,
					rank = {3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {0,0},
					trunkItems = {
					
					},
				},
				["polas350"] = {
					CustomName = "Sheriff Helicopter",
					livery = 1,
					rank = {2,3,4,5},
					extras = {2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					performance = "max",
					colors = {0,0},
					trunkItems = {
					
					},
				},
				["npolblazer"] = {
					CustomName = "Sheriff Blazer",
					livery = 1,
					rank = {2, 3, 4, 5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					trunkItems = {
						
					},
				},
				},
			},
		},
		
		
		
		
		
		
		
		
		
		
		
		
		--------==========================================================================================
		--------==========================================================================================
		--------==========================================================================================
		--------==========================================================================================
		
		
		{ 	zoneEnable = true, -- ranger
			job = "police",
			garage = {
				spawn = vector4(381.96, -1624.11, 29.29, 323.57),  -- Where the car will spawn
				out = vector4(392.89, -1604.64, 29.29, 140.73),	-- Where the parking stand is
				list = { -- 300.6049, -579.8707, 43.2609, 76.6546
				["npolvic"] = {
					CustomName = "Ranger Crown Vic",
					livery = 8,
					rank = {0,1,2,3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					colors = {112,50},
					--performance = "max",
                          frontbump = 1,
					trunkItems = {
					
					},
				},
				["npolchar"] = {
					CustomName = "Ranger Dodge Charger",
					livery = 5,
					rank = {2,3,4,5},
					extras = { 1, 4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {112,50},
					trunkItems = {

					},
				},
				
				["npolexp"] = {
					CustomName = "Ranger Ford Explorer",
					livery = 8,
					rank = {1,2,3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {112,50},
					trunkItems = {
					
					},
				},
			
				["npolvette"] = {
					CustomName = "Ranger Chevy Corvette",
					livery = 5,
					rank = {3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {112,112},
					trunkItems = {
					
					},
				},
				["npolstang"] = {
					CustomName = "Ranger Ford Mustang",
					livery = 5,
					rank = {3,4,5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {112,112},
					trunkItems = {
					
					},
				},
				
				["npolblazer"] = {
					CustomName = "Ranger Blazer",
					livery = 2,
					rank = {2, 3, 4, 5},
					extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
					--performance = "max",
                          frontbump = 1,
					colors = {50,50},
					trunkItems = {
						
					},
				},
				},
			},
		},






















































		


		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(650.49, -1840.44, 8.16, 172.23),
				out = vector4(643.15, -1827.67, 9.08, 267.16),
				list = {
					["predator"] = {
						CustomName = "Police Boat",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						performance = "max",
						trunkItems = {
						
						},
				
					},
				},
			},
		},
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(-785.62, -1513.18, -0.48, 102.96),
				out = vector4(-781.91, -1506.84, 1.6, 196.97),
				list = {
					["predator"] = {
						CustomName = "Police Boat",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						performance = "max",
						trunkItems = {
						
						},
				
					},
				},
			},
		},
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(-785.62, -1513.18, -0.48, 102.96),
				out = vector4(-781.91, -1506.84, 1.6, 196.97),
				list = {
					["predator"] = {
						CustomName = "Police Boat",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						performance = "max",
						trunkItems = {
						
						},
				
					},
				},
			},
		},
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(933.64, 3702.67, 29.56, 359.72),
				out = vector4(916.36, 3655.32, 32.49, 355.46),
				list = {
					["predator"] = {
						CustomName = "Police Boat",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						performance = "max",
						trunkItems = {
						
						},
				
					},
				},
			},
		},
		{ 	zoneEnable = true,
			job = "police",
			garage = {
				spawn = vector4(-913.19, 5796.73, 0.35, 34.47),
				out = vector4(-906.43, 5780.04, 1.94, 23.81),
				list = {
					["predator"] = {
						CustomName = "Police Boat",
						livery = 1,
						rank = {2,3,4,5},
						extras = { 1, 2,3,4,5,6,7,8,9,10,11,12,13,14,15 },
						performance = "max",
						trunkItems = {
						
						},
				
					},
				},
			},
		},
		
		
		
		
		
		
		
		
	},
}
