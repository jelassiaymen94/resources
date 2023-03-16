Config = {}

Config.UseLanguage = "en"
Config.UseSoundEffect = true

Config.Elevators = {
    ["PillBoxOne"] = {
        Sound = "liftSoundBellRing",
        Name = "Elevator Two",
        Floors = {
            [1] = {
                Label = "Roof",
                FloorDesc = "Hospital Rooftop",
                Coords = vector3(338.51, -583.81, 74.16),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "First Floor",
                FloorDesc = "Hospital Upper Lobby",
                Coords = vector3(327.02, -603.85, 43.28),
                ExitHeading = "337.25"
            },
            [3] = {
                Label = "Ground Floor",
                FloorDesc = "Hospital Garage",
                Coords = vector3(340.18, -584.68, 28.8),
                ExitHeading = "104.87"
            },
        }
    },
    ["PillBoxTwo"] = {
        Sound = "liftSoundBellRing",
        Name = "Elevator One",
        Floors = {
            [1] = {
                Label = "First Floor",
                FloorDesc = "Hospital Upper Lobby",
                Require = "thermite",
                Coords = vector3(330.43, -601.16, 43.28),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Ground Floor",
                FloorDesc = "Hospital Lower Lobby",
                Coords = vector3(345.62, -582.54, 28.8),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Heli Pad",
                FloorDesc = "Hospital Rooftop",
                Coords = vector3(338.51, -583.81, 74.16),
                ExitHeading = "250.07"
            },
        }
    },



    ["morgue"] = {
        Sound = "liftSoundBellRing",
        Name = "Morgue",
        Floors = {
            [1] = {
                Label = "Inside",
                FloorDesc = "Go Inside",
                Coords = vector3(275.87, -1361.54, 24.54),
                ExitHeading = "47.11"
            },
            [2] = {
                Label = "Outside",
                FloorDesc = "Go Outside",
                Coords = vector3(241.08, -1378.93, 33.74),
                ExitHeading = "143.05"
            },
        }
    },

    ["mazebankoffice"] = {
        Sound = "liftSoundBellRing",
        Name = "Maze Bank",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-84.6282, -825.3384, 36.0281),
                ExitHeading = "47.11"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-57.7427, -805.1671, 44.2273),
                ExitHeading = "143.05"
            },
            [3] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-75.2359, -826.1776, 243.3858),
                ExitHeading = "47.11"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-67.7181, -821.6518, 321.2873),
                ExitHeading = "143.05"
            },
        }
    },

    ["ArcadiusOffice"] = {
        Sound = "liftSoundBellRing",
        Name = "Arcadius Business Center",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-142.7260, -572.7574, 32.4245),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-125.1997, -637.8832, 40.4911),
                ExitHeading = "165.86"
            },
            [3] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-141.4762, -621.4883, 168.8203),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-136.5980, -596.2886, 206.9156),
                ExitHeading = "255.07"
            },
        }
    },

    ["EclipseTower"] = {
        Sound = "liftSoundBellRing",
        Name = "Eclipse Tower",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-794.2119, 352.0416, 87.9982),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-777.0882, 319.6521, 85.6626),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-782.8201, 325.1305, 176.8037),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-787.3008, 315.6416, 217.6383),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "Apartment 3",
                Coords = vector3(-782.8654, 325.1047, 223.2576),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Apartment 4",
                FloorDesc = "Apartment 4",
                Coords = vector3(-774.5887, 333.4331, 160.0014),
                ExitHeading = "250.07"
            },
            [7] = {
                Label = "Apartment 5",
                FloorDesc = "Apartment 5",
                Coords = vector3(-773.5836, 342.1250, 196.6862),
                ExitHeading = "250.07"
            },
            [8] = {
                Label = "Apartment 6",
                FloorDesc = "Apartment 6",
                Coords = vector3(-774.1741, 333.0196, 207.6208),
                ExitHeading = "250.07"
            },
            [9] = {
                Label = "Apartment 7",
                FloorDesc = "Apartment 7",
                Coords = vector3(-785.1901, 323.6842, 211.9972),
                ExitHeading = "250.07"
            },
            [10] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-802.0498, 334.5964, 230.6369),
                ExitHeading = "250.07"
            },			
        }
    },

	["weedlab"] = {
        Sound = "liftSoundBellRing",
        Name = "Weed Lab",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(753.4214, -3182.3750, 7.4058),
                ExitHeading = "4.91"
            },
            [2] = {
                Label = "Inside",
                FloorDesc = "Interior",
                Coords = vector3(1065.6599, -3183.3489, -39.1635),
                ExitHeading = "91.86"
            },
		
        }
    },
	
	["Corporation1"] = {
        Sound = "liftSoundBellRing",
        Name = "Corporation 1",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-1027.6680, -409.5724, 33.4125),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-1032.3049, -421.9883, 39.6161),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-1032.2693, -434.2012, 63.8614),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Penthouse",
                FloorDesc = "Penthouse",
                Coords = vector3(-1032.3557, -434.9503, 72.4611),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-1023.4565, -432.6977, 77.3691),
                ExitHeading = "250.07"

            },			
        }
    },


	["Corporation2"] = {
        Sound = "liftSoundBellRing",
        Name = "Corporation 2",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(389.2958, -74.9291, 68.1805),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(371.7829, -56.6920, 103.3633),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Penthouse",
                FloorDesc = "Penthouse",
                Coords = vector3(371.0952, -57.1862, 111.9630),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(382.8412, -51.0517, 122.5352),
                ExitHeading = "250.07"

            },			
        }
    },
	
	["Corporation3"] = {
        Sound = "liftSoundBellRing",
        Name = "Corporation 3",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-589.4393, -708.2848, 36.2794),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-575.7850, -715.8172, 113.0053),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Penthouse",
                FloorDesc = "Penthouse",
                Coords = vector3(-575.4498, -715.1440, 121.6051),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-579.5606, -716.7724, 129.8830),
                ExitHeading = "250.07"

            },			
        }
    },
	
	["MazeBank2"] = {
        Sound = "liftSoundBellRing",
        Name = "Maze Bank 2",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "arage",
                Coords = vector3(-1364.0630, -472.2867, 31.5958),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-1370.2904, -502.9211, 33.1579),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-1392.5465, -480.7051, 72.0422),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-1369.4990, -472.0024, 84.4465),
                ExitHeading = "250.07"

            },			
        }
    },
	
	["DelPerroHeights"] = {
        Sound = "liftSoundBellRing",
        Name = "Del Perro Heights",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-1456.6584, -514.0865, 31.5830),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-1447.8058, -537.3853, 34.7409),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-1452.1377, -540.5954, 74.0443),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-1450.8102, -524.4114, 56.9290),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-1472.3524, -539.4390, 85.0730),
                ExitHeading = "130.07"
            },			
        }
    },

    ["brickhouse"] = {
        Sound = "liftSoundBellRing",
        Name = "Brick House Law",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-1001.0693, -784.9340, 16.3736),
                ExitHeading = "327.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-1038.5870, -756.3954, 19.8395),
                ExitHeading = "242.86"
            },
            [3] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-1002.1552, -773.5262, 61.8944),
                ExitHeading = "360.0"
            },
            [4] = {
                Label = "Penthouse",
                FloorDesc = "Penthouse",
                Coords = vector3(-998.5713, -773.8828, 70.4942),
                ExitHeading = "360.0"
            },
            [5] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-1017.6561, -766.4927, 76.5368),
                ExitHeading = "265.07"
            },			
        }
    },
	
	--[[["KaytonTowers1"] = {
        Sound = "liftSoundBellRing",
        Name = "Kayton Towers 1",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-813.5346, -586.0148, 30.6688),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-849.1313, -589.4407, 29.2216),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-831.3593, -580.9184, 44.9912),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-831.4833, -580.8693, 56.7856),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "partment 3",
                Coords = vector3(-831.3491, -580.7150, 68.5387),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Apartment 4",
                FloorDesc = "Apartment 4",
                Coords = vector3(-831.2684, -580.7346, 80.4179),
                ExitHeading = "250.07"
            },
            [7] = {
                Label = "Apartment 5",
                FloorDesc = "Apartment 5",
                Coords = vector3(-831.4624, -580.6996, 91.1296),
                ExitHeading = "250.07"
            },
            [8] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-841.8976, -585.5209, 96.5934),
                ExitHeading = "250.07"
            },			
        }
    },

	["KaytonTowers2"] = {
        Sound = "liftSoundBellRing",
        Name = "Kayton Towers 2",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-788.1710, -600.7195, 30.6706),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-817.2202, -621.5139, 29.2216),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-805.8164, -605.0599, 45.2314),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-805.8165, -605.0692, 56.9699),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "Apartment 3",
                Coords = vector3(-805.8137, -605.1179, 68.6784),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Apartment 4",
                FloorDesc = "Apartment 4",
                Coords = vector3(-805.8340, -605.0260, 80.4129),
                ExitHeading = "250.07"
            },
            [7] = {
                Label = "Apartment 5",
                FloorDesc = "Apartment 5",
                Coords = vector3(-805.7814, -605.0311, 92.1652),
                ExitHeading = "250.07"
            },
            [8] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-813.0634, -614.4650, 96.5933),
                ExitHeading = "250.07"
            },			
        }
    },
	
	["KaytonTowers3"] = {
        Sound = "liftSoundBellRing",
        Name = "Kayton Towers 3",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-763.2133, -618.0532, 30.4712),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-773.6165, -633.1741, 29.8210),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-770.9227, -612.2952, 44.9901),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-770.9791, -612.2953, 56.7703),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "Apartment 3",
                Coords = vector3(-771.0313, -612.2953, 68.5289),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Apartment 4",
                FloorDesc = "Apartment 4",
                Coords = vector3(-771.0261, -612.2941, 80.4151),
                ExitHeading = "250.07"
            },
            [7] = {
                Label = "Apartment 5",
                FloorDesc = "Apartment 5",
                Coords = vector3(-771.0193, -612.2941, 92.2158),
                ExitHeading = "250.07"
            },
            [8] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-773.6223, -625.0350, 96.5933),
                ExitHeading = "250.07"
            },			
        }
    },]]--
    
	
	["Building7302"] = {
        Sound = "liftSoundBellRing",
        Name = "Building 7302",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-472.4013, -724.0192, 30.5630),
                ExitHeading = "179.3965"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-470.4331, -679.5798, 32.7098),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-469.7559, -689.4738, 53.4058),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-465.8030, -708.7159, 77.0869),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-467.3677, -681.3798, 81.1864),
                ExitHeading = "250.07"
            },			
        }
    },
	
	["TinselTowers"] = {
        Sound = "liftSoundBellRing",
        Name = "Tinsel Towers",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-635.5909, 44.1489, 42.6974),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-614.5912, 46.6763, 43.5915),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-602.8945, 58.8979, 98.2002),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-596.4683, 57.7622, 108.0270),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "Apartment 3",
                Coords = vector3(-605.0408, 49.4050, 93.6261),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-624.0930, 59.3691, 116.5382),
                ExitHeading = "250.07"
            },			
        }
    },
	
     

	["RichardsMajestic"] = {
        Sound = "liftSoundBellRing",
        Name = "Richards Majestic",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-898.4000, -346.9120, 34.6802),
                ExitHeading = "295.7827"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-935.3912, -378.5305, 38.9613),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-922.2666, -380.0570, 85.4805),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-907.9150, -371.0338, 109.4403),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "Apartment 3",
                Coords = vector3(-912.5070, -364.9334, 114.2747),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-902.6067, -369.6868, 136.2821),
                ExitHeading = "250.07"
            },		
        }
    },
	
	["LomBank"] = {
        Sound = "liftSoundBellRing",
        Name = "Lom Bank",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-1539.2017, -575.0355, 25.7079),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-1581.0767, -558.6785, 34.9537),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(-1579.7549, -565.1794, 108.5229),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-1560.7012, -569.3096, 114.4484),
                ExitHeading = "250.07"
            },			
        }
    },
	


	["AltaSuites"] = {
        Sound = "liftSoundBellRing",
        Name = "Alta Suites",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-285.6647, -943.6407, 31.2176),
                ExitHeading = "25.07"
            },
            [2] = {
                Label = "Suite 1",
                FloorDesc = "Suite 1",
                Coords = vector3(-271.6804, -940.3582, 92.5109),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Suite 2",
                FloorDesc = "Suite 2",
                Coords = vector3(-271.6339, -967.9131, 77.2313),
                ExitHeading = "250.07"
            },		
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-275.2509, -963.1614, 130.6180),
                ExitHeading = "164.6086"
            },		
        }
    },
	
	["MovieLotOffice"] = {
        Sound = "liftSoundBellRing",
        Name = "Movie Lot Office",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                item = "moviekey",
                Coords = vector3(-1007.1678, -486.6226, 39.9704),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Office",
                FloorDesc = "Office",
                item = "moviekey",
                Coords = vector3(-1002.8056, -477.7257, 50.0273),
                ExitHeading = "250.07"
            },			
        }
    },
	
	["FIB"] = {
        Sound = "liftSoundBellRing",
        Name = "FIB Building",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(66.0691, -749.6367, 31.6345),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(138.4912, -764.3880, 45.7520),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Floor 47",
                FloorDesc = "Floor 47",
                Coords = vector3(136.6113, -763.0286, 234.1520),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Floor 49",
                FloorDesc = "Floor 49",
                Coords = vector3(135.6202, -762.8890, 242.1520),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Floor 50",
                FloorDesc = "Floor 50",
                Coords = vector3(133.6896, -733.1138, 246.1522),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Floor 51",
                FloorDesc = "Floor 51",
                Coords = vector3(133.6015, -733.1298, 250.1522),
                ExitHeading = "250.07"
            },
            [7] = {
                Label = "Floor 53",
                FloorDesc = "Floor 53",
                Coords = vector3(115.0609, -742.1865, 258.1523),
                ExitHeading = "250.07"
            },
            [8] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(132.1148, -727.3195, 258.1525),
                ExitHeading = "250.07"
            },			
        }
    },

    ["diamondcasino"] = {
        Sound = "liftSoundBellRing",
        Name = "Diamond Casino",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(936.0344, 1.1478, 78.7640),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(960.0049, 43.1231, 71.7008),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Nightclub",
                FloorDesc = "Nightclub",
                Coords = vector3(1546.1302, 254.2551, -46.0060),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Penthouses",
                FloorDesc = "Penthouses",
                Coords = vector3(980.8588, 56.3869, 116.1642),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Rooftop Lounge",
                FloorDesc = "Rooftop Lounge",
                Coords = vector3(964.6469, 58.7424, 112.5531),
                ExitHeading = "250.07"
            },
            [6] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(971.7829, 51.7569, 120.2407),
                ExitHeading = "250.07"
            },			
        }
    },
    
    ["IAA"] = {
        Sound = "liftSoundBellRing",
        Name = "IAA",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(139.7316, -614.3456, 44.2187),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Facility 1",
                FloorDesc = "Facility 1",
                Coords = vector3(2153.03, 2920.89, -61.9),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Server Room",
                FloorDesc = "Server Room",
                Coords = vector3(2156.5676, 2922.0498, -81.0753),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Office",
                FloorDesc = "Office",
                Coords = vector3(117.2040, -636.4240, 206.0466),
                ExitHeading = "250.07"
            },	
            [5] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(146.9827, -616.1884, 258.1493),
                ExitHeading = "250.07"
            },		
        }
    },

    ["Galaxynightclub"] = {
        Sound = "liftSoundBellRing",
        Name = "Galaxy Nightclub",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(97.0969, -2216.3208, 6.2268),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Nightclub",
                FloorDesc = "Nightclub",
                Coords = vector3(-1569.9529, -3017.4966, -74.4062),
                ExitHeading = "250.07"
            },			
        }
    },

    ["psychiatrist"] = {
        Sound = "liftSoundBellRing",
        Name = "Psychiatrist Office",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Item = "drkey",
                Coords = vector3(-1898.9296, -572.7844, 11.8445),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Office",
                FloorDesc = "Office",
                Item = "drkey",
                Coords = vector3(-1903.1045, -568.8754, 19.0972),
                ExitHeading = "142.07"
            },			
        }
    },
 
    ["ElkridgeHotel"] = {
        Sound = "liftSoundBellRing",
        Name = "Elkridge Hotel",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Item = "elkridgekey",
                Coords = vector3(304.4507, -939.1550, 29.4676),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Hotel Room",
                FloorDesc = "Hotel Room",
                Item = "elkridgekey",
                Coords = vector3(151.5743, -1007.2236, -99.0000),
                ExitHeading = "350.07"
            },			
            [3] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Item = "elkridgekey",
                Coords = vector3(295.6552, -933.4887, 56.4608),
                ExitHeading = "272"
            },	
        }
    },

    ["Bunker"] = {
        Sound = "liftSoundBellRing",
        Name = "Bunker",
        Floors = {
            [1] = {
                Label = "Outside",
                FloorDesc = "In the outside world",
                Coords = vector3(-3176.57, 1376.53, 19.65),
                ExitHeading = "90"
            },
            [2] = {
                Label = "Inside",
                FloorDesc = "The deep dark",
                Coords = vector3(896.48, -3247.02, -98.25),
                ExitHeading = "90"
            },			
        }
    },



    ["Ferry"] = {
        Sound = "liftSoundBellRing",
        Name = "Ferry Boat",
        Floors = {
            [1] = {
                Label = "Ferry Boat",
                FloorDesc = "Ferry Boat",
                Coords = vector3(-83.9978, -2722.6985, 8.7402),
                ExitHeading = "272.07"
            },
            [2] = {
                Label = "Aircraft Carrier",
                FloorDesc = "Aircraft Carrier",
                Coords = vector3(3083.0623, -4818.9883, 2.0385),
                ExitHeading = "250.07"
            },		
            [3] = {
                Label = "Submarine",
                FloorDesc = "Submarine",
                Coords = vector3(1561.3916, 392.0758, -49.6874),
                ExitHeading = "250.07"
            },		
        }
    },

    ["Ranch"] = {
        Sound = "liftSoundBellRing",
        Name = "Ranch House",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Item = "ranchkey",
                Coords = vector3(1395.5851, 1152.7365, 114.3482),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Item = "ranchkey",
                Coords = vector3(1396.3004, 1141.8755, 114.3337),
                ExitHeading = "250.07"
            },			
        }
    },
    ["ShadyGarage"] = {
        Sound = "liftSoundBellRing",
        Name = "Shady Garage",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(223.3539, 121.7455, 102.8370),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(-1508.8711, -3016.6155, -79.2422),
                ExitHeading = "250.07"
            },			
        }
    },

    ["2CarGarage"] = {
        Sound = "liftSoundBellRing",
        Name = "2 Car Garage",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-716.4183, -864.7119, 23.2072),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(179.1411, -1000.1368, -99.0000),
                ExitHeading = "165"
            },			
        }
    },

    ["6CarGarage"] = {
        Sound = "liftSoundBellRing",
        Name = "6 Car Garage",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-2026.3541, -264.9176, 23.3860),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(194.6502, -1007.5449, -99.0000),
                ExitHeading = "250.07"
            },			
        }
    },

    ["10CarGarage"] = {
        Sound = "liftSoundBellRing",
        Name = "10 Car Garage",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(208.7523, -937.7275, 24.1416),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(224.5896, -1006.6904, -99.0000),
                ExitHeading = "250.07"
            },			
        }
    },

    ["templar"] = {
        Sound = "liftSoundBellRing",
        Name = "Templar Hotel",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Item = "templarkey",
                Coords = vector3(296.0949, -1027.4756, 29.2108),
                ExitHeading = "262.86"
            },
            [2] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Item = "templarkey",
                Coords = vector3(347.1961, -1013.0463, -99.1962),
                ExitHeading = "250.07"
            },
            [3] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Item = "templarkey",
                Coords = vector3(285.6971, -1011.4364, 86.7461),
                ExitHeading = "250.07"
            },		
        }
    }, 

    ["WeazelPlaza2"] = {
        Sound = "liftSoundBellRing",
        Name = "Weazel Plaza",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-841.0975, -397.4863, 31.4714),
                ExitHeading = "302.7719"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-905.6164, -452.4895, 39.6053),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-889.2291, -452.1406, 95.4611),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-891.5187, -435.2871, 121.6071),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Apartment 3",
                FloorDesc = "Apartment 3",
                Coords = vector3(-907.7723, -455.8813, 126.5344),
                ExitHeading = "250.07"
            },	
            [6] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-908.4515, -444.7201, 168.1188),
                ExitHeading = "225"
            },	
        }
    }, 
    
    ["Integrityway2"] = {
        Sound = "liftSoundBellRing",
        Name = "Integrity Way",
        Floors = {
            [1] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-39.2049, -613.8367, 35.2694),
                ExitHeading = "70.91"
            },
            [2] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-44.3521, -586.9943, 38.1609),
                ExitHeading = "262.86"
            },
            [3] = {
                Label = "Apartment 1",
                FloorDesc = "Apartment 1",
                Coords = vector3(-31.5722, -595.4163, 80.0309),
                ExitHeading = "250.07"
            },
            [4] = {
                Label = "Apartment 2",
                FloorDesc = "Apartment 2",
                Coords = vector3(-17.1982, -590.7717, 90.1148),
                ExitHeading = "250.07"
            },
            [5] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-36.6475, -598.3381, 106.3226),
                ExitHeading = "338.07"
            },			
        }
    },

    ["churchroom"] = {
        Sound = "liftSoundBellRing",
        Name = "Back room",
        Group = {"church"},
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-783.2963, 5.0604, 41.5290),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(266.0311, -1007.2969, -101.0057),
                ExitHeading = "250.07"
            },			
        }
    },

    ["cokelab"] = {
        Sound = "liftSoundBellRing",
        Name = "Coke Lab",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(387.4596, 3585.0432, 33.2922),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(1088.6024, -3188.1460, -38.9935),
                ExitHeading = "250.07"
            },			
        }
    },

    --[[["churchalter"] = {
        Sound = "liftSoundBellRing",
        Name = "Alter",
        Group = {"church"},
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Restricted = true,
                Coords = vector3(-784.4364, 35.5354, 40.6469),
                ExitHeading = "250.07"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Restricted = true,
                Coords = vector3(-152.6356, 229.1537, 89.0814),
                ExitHeading = "97.9518"
            },			
        }
    },]]


    ["bahamamamas"] = {
        Sound = "liftSoundBellRing",
        Name = "Bahama Mamas",
        --Group = {"church"},
        Floors = {
            [1] = {
                Label = "Back Entrance",
                FloorDesc = "Back Entrance",
                --Restricted = true,
                Coords = vector3(-1392.4369, -640.2103, 28.6734),
                ExitHeading = "129.7197"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                --Restricted = true,
                Coords = vector3(-1402.9528, -609.6788, 30.3196),
                ExitHeading = "128.8159"
            },			
        }
    },

    ["bahamamamasEmployee"] = {
        Sound = "liftSoundBellRing",
        Name = "Employee Entrance",
        Floors = {
            [1] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-1383.0656, -639.8765, 28.6734),
                ExitHeading = "307.86"
            },
            [2] = {
                Label = "Main Bar",
                FloorDesc = "Main Bar",
                Coords = vector3(-1385.1377, -606.4789, 30.3195),
                ExitHeading = "306.07"
            },
            [3] = {
                Label = "Back Bar",
                FloorDesc = "Back Bar",
                Coords = vector3(-1371.3145, -625.8704, 30.8196),
                ExitHeading = "302.07"
            },		
        }
    }, 

    ["wuchang"] = {
        Sound = "liftSoundBellRing",
        Name = "Wu Chang Records",
        Floors = {
            [1] = {
                Label = "Subway",
                FloorDesc = "Subway",
                --Restricted = true,
                Coords = vector3(-763.9021, -690.7076, 11.6015),
                ExitHeading = "128.8159"
            },	
            [2] = {
                Label = "Garage",
                FloorDesc = "Garage",
                Coords = vector3(-817.6007, -709.4996, 23.7813),
                ExitHeading = "90.93"
            },
            --[[[3] = {
                Label = "Entrance",
                FloorDesc = "Entrance",
                Coords = vector3(-817.6382, -709.5163, 28.0620),
                ExitHeading = "196.27"
            },]]
            [3] = {
                Label = "Studio",
                FloorDesc = "Studio",
                Coords = vector3(-817.7, -709.51, 32.34),
                ExitHeading = "90.93"
            },
            [4] = {
                Label = "Roof",
                FloorDesc = "Roof",
                Coords = vector3(-820.55, -721.98, 121.27),
                ExitHeading = "180.27"
            },
        }
    },


    ["base"] = {
        Sound = "liftSoundBellRing",
        Name = "Secret Base",
        --Group = {"church"},
        Floors = {
            [1] = {
                Label = "Base Entrance",
                FloorDesc = "Base Entrance",
                Coords = vector3(-2051.9717, 3237.4282, 31.5012),
                ExitHeading = "60.7197"
            },
            [2] = {
                Label = "Interior",
                FloorDesc = "Interior",
                Coords = vector3(460.6374, 4815.9185, -59.0001),
                ExitHeading = "28.8159"
            },			
        }
    },




}





Config.PolyZone = false -- This will show the box zones | If set to false it will hide the box zones

Config.WaitTime = 2000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.ElevatorButton = {

    ------ / Pill Box Hospital
    -- UnRestricted
    [1] = { name = "Ground Floor", location = vector3(346.10, -581.00, 28.8), width = 0.1, length = 0.3, heading = 69.47, minz = 28.9, maxz = 29.3},
    [2] = { name = "First Floor", location = vector3(330.04, -602.7, 43.28), width = 0.2, length = 0.3, heading = 247.68, minz = 43.48, maxz = 43.78 },

    -- Restricted
    [3] = { name = "EMS Garage", location = vector3(339.70, -586.20, 28.8), width = 0.1, length = 0.3, heading = 246.66, minz = 28.9, maxz = 29.3},
    [4] = { name = "Main Floor", location = vector3(325.65, -603.39, 43.28), width = 0.1, length = 0.3, heading = 160.6, minz = 43.48, maxz = 43.78},
    [5] = { name = "Heli Pad", location = vector3(338.42, -583.71, 74.16), width = 0.5, length = 2.8, heading = 70.21, minz = 74.16 - 1, maxz = 74.16 + 1.5 },



    [10] = { name = "Leave Morgue", location = vector3(276.24, -1361.83, 24.54), width = 0.5, length = 2.8, heading = 47.11, minz = 24.54 - 1, maxz = 24.54 + 1.5 },
    [11] = { name = "Enter Morgue", location = vector3(241.42, -1378.56, 33.74), width = 0.5, length = 2.8, heading = 321.24, minz =  33.74 - 1, maxz =  33.74 + 1.5 },

    [12] = { name = "Maze Bank Garage", location = vector3(-84.6282, -825.3384, 36.0281), width = 0.5, length = 2.8, heading = 47.11, minz = 36.0280 - 1, maxz = 36.0280 + 1.5 },
    [13] = { name = "Maze Bank Entrance", location = vector3(-57.7427, -805.1671, 44.2273), width = 0.5, length = 2.8, heading = 321.24, minz =  44.2273 - 1, maxz =  44.2273 + 1.5 },
    [14] = { name = "Maze Bank Office", location = vector3(-75.2359, -826.1776, 243.3858), width = 0.5, length = 2.8, heading = 47.11, minz = 243.3858 - 1, maxz = 243.3858 + 1.5 },
    [15] = { name = "Maze Bank Roof", location = vector3(-67.7181, -821.6518, 321.2873), width = 0.5, length = 2.8, heading = 321.24, minz =  321.2873 - 1, maxz =  321.2873 + 1.5 },

    [16] = { name = "Arcadius Garage", location = vector3(-142.7260, -572.7574, 32.4245), width = 0.5, length = 2.8, heading = 47.11, minz = 32.4245 - 1, maxz = 32.4245 + 1.5 },
    [17] = { name = "Arcadius Entrance", location = vector3(-124.9352, -637.3966, 40.6858), width = 1.5, length = 3.8, heading = 68.8313, minz =  38.2355 - 1, maxz =  42.2355 + 1.5 },
    [18] = { name = "Arcadius Office", location = vector3(-141.6562, -621.8383, 168.9503), width = 0.5, length = 2.8, heading = 47.11, minz = 168.8203 - 1, maxz = 168.8203 + 1.5 },
    [19] = { name = "Arcadius Roof", location = vector3(-137.1509, -596.0025, 206.9156), width = 1.5, length = 2.8, heading = 74.24, minz =  204.7353 - 1, maxz =  208.7353 + 1.5 },

    [20] = { name = "Eclipse Tower Garage", location = vector3(-793.8719, 351.2416, 88.2982), width = 0.5, length = 2.8, heading = 260.3, minz = 87.9982 - 1, maxz = 87.9982 + 1.5 },
    [21] = { name = "Eclipse Tower Entrance", location = vector3(-777.0882, 322.6521, 85.6626), width = 5.5, length = 5.8, heading = 260.3, minz = 85.6626 - 1, maxz = 85.6626 + 1.5 },
    [22] = { name = "Eclipse Tower Apartment 1", location = vector3(-782.8201, 324.7305, 176.8037), width = 0.5, length = 2.8, heading = 260.3, minz = 176.8037 - 1, maxz = 176.8037 + 1.5 },
 --   [23] = { name = "Eclipse Tower Apartment 2", location = vector3(-785.2195, 323.6640, 211.9972), width = 0.5, length = 2.8, heading = 260.3, minz = 211.9972 - 1, maxz = 211.9972 + 1.5 },
    [24] = { name = "Eclipse Tower Apartment 2", location = vector3(-787.5008, 314.9416, 217.8383), width = 0.5, length = 2.8, heading = 260.3, minz = 217.6383 - 1, maxz = 217.6383 + 1.5 },
    [25] = { name = "Eclipse Tower Apartment 3", location = vector3(-782.8654, 324.7047, 223.2576), width = 0.5, length = 2.8, heading = 260.3, minz = 223.2576 - 1, maxz = 223.2576 + 1.5 },
    [26] = { name = "Eclipse Tower Apartment 4", location = vector3(-773.5887, 332.9331, 160.0014), width = 0.5, length = 2.8, heading = 260.3, minz = 160.0014 - 1, maxz = 160.0014 + 1.5 },
    [27] = { name = "Eclipse Tower Apartment 5", location = vector3(-773.4206, 342.9250, 196.7862), width = 0.5, length = 2.8, heading = 260.3, minz = 196.6862 - 1, maxz = 196.6862 + 1.5 },
    [28] = { name = "Eclipse Tower Apartment 6", location = vector3(-773.2741, 332.6196, 207.6908), width = 0.5, length = 2.8, heading = 260.3, minz = 207.6208 - 1, maxz = 207.6208 + 1.5 },
    [29] = { name = "Eclipse Tower Apartment 7", location = vector3(-785.4201, 322.7842, 212.2272), width = 0.5, length = 2.8, heading = 260.3, minz = 211.9972 - 1, maxz = 211.9972 + 1.5 },
    [30] = { name = "Eclipse Tower Roof", location = vector3(-802.4498, 334.9964, 230.8369), width = 0.5, length = 2.8, heading = 260.3, minz = 230.6369 - 1, maxz = 230.6369 + 1.5 },

    [31] = { name = "Weed Lab Entrance", location = vector3(753.9180, -3183.1766, 7.5771), width = 0.5, length = 2.8, heading = 221.3, minz = 6.2430 - 1, maxz = 8.2430 + 1.5 },
    [32] = { name = "Weed Lab Interior", location = vector3(1066.5866, -3183.9275, -39.0638), width = 0.5, length = 2.8, heading = 260.3, minz = -38.0156 - 1, maxz = -40.0156 + 1.5 },

    [33] = { name = "Corporation 1 Garage", location = vector3(-1027.6680, -409.5724, 33.4125), width = 0.5, length = 2.8, heading = 260.3, minz = 33.4125 - 1, maxz = 33.4125 + 1.5 },
    [34] = { name = "Corporation 1 Entrance", location = vector3(-1032.3049, -421.9883, 39.6161), width = 0.5, length = 2.8, heading = 260.3, minz = 39.6161 - 1, maxz = 39.6161 + 1.5 },
    [35] = { name = "Corporation 1 Office", location = vector3(-1032.2693, -434.2012, 63.8614), width = 0.5, length = 2.8, heading = 260.3, minz = 63.8614 - 1, maxz = 63.8614 + 1.5 },
    [36] = { name = "Corporation 1 Penthouse", location = vector3(-1032.3557, -434.9503, 72.4611), width = 0.5, length = 2.8, heading = 260.3, minz = 72.4611 - 1, maxz = 72.4611 + 1.5 },
    [37] = { name = "Corporation 1 Roof", location = vector3(-1023.4565, -432.6977, 77.3691), width = 0.5, length = 2.8, heading = 260.3, minz = 77.3691 - 1, maxz = 77.3691 + 1.5 },

    [75] = { name = "Corporation 2 Entrance", location = vector3(389.2958, -74.9291, 68.1805), width = 0.5, length = 2.8, heading = 260.3, minz = 68.1805 - 1, maxz = 68.1805 + 1.5 },
    [76] = { name = "Corporation 2 Office", location = vector3(371.7829, -56.6920, 103.3633), width = 0.5, length = 2.8, heading = 260.3, minz = 103.3633 - 1, maxz = 103.3633 + 1.5 },
    [77] = { name = "Corporation 2 Penthouse", location = vector3(371.0952, -57.1862, 111.9630), width = 0.5, length = 2.8, heading = 260.3, minz = 111.9630 - 1, maxz = 111.9630 + 1.5 },
    [78] = { name = "Corporation 2 Roof", location = vector3(382.8412, -51.0517, 122.5352), width = 0.5, length = 2.8, heading = 260.3, minz = 122.5352 - 1, maxz = 122.5352 + 1.5 },

    [38] = { name = "Corporation 3 Entrance", location = vector3(-589.4393, -708.2848, 36.2794), width = 0.5, length = 2.8, heading = 260.3, minz = 36.2794 - 1, maxz = 36.2794 + 1.5 },
    [39] = { name = "Corporation 3 Office", location = vector3(-575.7850, -715.8172, 113.0053), width = 0.5, length = 2.8, heading = 260.3, minz = 113.0053 - 1, maxz = 113.0053 + 1.5 },
    [40] = { name = "Corporation 3 Penthouse", location = vector3(-575.4498, -715.1440, 121.6051), width = 0.5, length = 2.8, heading = 260.3, minz = 121.6051 - 1, maxz = 121.6051 + 1.5 },
    [41] = { name = "Corporation 3 Roof", location = vector3(-579.5606, -716.7724, 129.8830), width = 0.5, length = 2.8, heading = 260.3, minz = 129.8830 - 1, maxz = 129.8830 + 1.5 },

    [42] = { name = "Maze Bank 2 Garage", location = vector3(-1364.0630, -472.2867, 31.5958), width = 0.5, length = 2.8, heading = 260.3, minz = 31.5958 - 1, maxz = 31.5958 + 1.5 },
    [43] = { name = "Maze Bank 2 Office", location = vector3(-1370.2904, -502.9211, 33.1579), width = 0.5, length = 2.8, heading = 260.3, minz = 33.1579 - 1, maxz = 33.1579 + 1.5 },
    [44] = { name = "Maze Bank 2 Penthouse", location = vector3(-1392.5465, -480.7051, 72.0422), width = 0.5, length = 2.8, heading = 260.3, minz = 72.0422 - 1, maxz = 72.0422 + 1.5 },
    [45] = { name = "Maze Bank 2 Roof", location = vector3(-1369.4990, -472.0024, 84.4465), width = 0.5, length = 2.8, heading = 260.3, minz = 84.4465 - 1, maxz = 84.4465 + 1.5 },

    [46] = { name = "Del Perro Heights Garage", location = vector3(-1457.5984, -514.3865, 31.5830), width = 0.5, length = 2.8, heading = 260.3, minz = 30.5830 - 1, maxz = 33.5830 + 1.5 },
    [47] = { name = "Del Perro Heights Entrance", location = vector3(-1448.0058, -537.0853, 34.7409), width = 0.5, length = 2.8, heading = 260.3, minz = 32.7409 - 1, maxz = 36.7409 + 1.5 },
    [48] = { name = "Del Perro Heights Apartment 1", location = vector3(-1451.3277, -540.3954, 74.2043), width = 0.5, length = 2.8, heading = 260.3, minz = 72.0443 - 1, maxz = 76.0443 + 1.5 },
    [49] = { name = "Del Perro Heights Apartment 2", location = vector3(-1450.2102, -524.0114, 57.1290), width = 0.5, length = 2.8, heading = 260.3, minz = 56.9290 - 1, maxz = 56.9290 + 1.5 },
    [50] = { name = "Del Perro Heights Roof", location = vector3(-1471.5547, -539.5511, 85.0729), width = 0.5, length = 2.8, heading = 260.3, minz = 83.0730 - 1, maxz = 87.0730 + 1.5 },

    --[[[51] = { name = "Garage", location = vector3(-813.5346, -586.0148, 30.6688), width = 0.5, length = 2.8, heading = 260.3, minz = 30.6688 - 1, maxz = 30.6688 + 1.5 },
    [52] = { name = "Kayton Towers 1 Entrance", location = vector3(-849.1313, -589.4407, 29.2216), width = 0.5, length = 2.8, heading = 260.3, minz = 29.2216 - 1, maxz = 29.2216 + 1.5 },
    [53] = { name = "Apartment 1", location = vector3(-831.3593, -580.9184, 44.9912), width = 0.5, length = 2.8, heading = 260.3, minz = 44.9912 - 1, maxz = 44.9912 + 1.5 },
    [54] = { name = "Apartment 2", location = vector3(-831.4833, -580.8693, 56.7856), width = 0.5, length = 2.8, heading = 260.3, minz = 56.7856 - 1, maxz = 56.7856 + 1.5 },
    [55] = { name = "Apartment 3", location = vector3(-831.3491, -580.7150, 68.5387), width = 0.5, length = 2.8, heading = 260.3, minz = 68.5387 - 1, maxz = 68.5387 + 1.5 },
    [56] = { name = "Apartment 4", location = vector3(-831.2684, -580.7346, 80.4179), width = 0.5, length = 2.8, heading = 260.3, minz = 80.4179 - 1, maxz = 80.4179 + 1.5 },
    [57] = { name = "Apartment 5", location = vector3(-831.4624, -580.6996, 91.1296), width = 0.5, length = 2.8, heading = 260.3, minz = 91.1296 - 1, maxz = 91.1296 + 1.5 },
    [58] = { name = "Roof", location = vector3(-841.8976, -585.5209, 96.5934), width = 0.5, length = 2.8, heading = 260.3, minz = 96.5934 - 1, maxz = 96.5934 + 1.5 },

    [59] = { name = "Kayton Towers 2 Garage", location = vector3(-788.1710, -600.7195, 30.6706), width = 0.5, length = 2.8, heading = 260.3, minz = 30.6706 - 1, maxz = 30.6706 + 1.5 },
    [60] = { name = "Kayton Towers 2 Entrance", location = vector3(-817.2202, -621.5139, 29.2216), width = 0.5, length = 2.8, heading = 260.3, minz = 29.2216 - 1, maxz = 29.2216 + 1.5 },
    [61] = { name = "Kayton Towers 2 Apartment 1", location = vector3(-805.8164, -605.0599, 45.2314), width = 0.5, length = 2.8, heading = 260.3, minz = 45.2314 - 1, maxz = 45.2314 + 1.5 },
    [62] = { name = "Kayton Towers 2 Apartment 2", location = vector3(-805.8165, -605.0692, 56.9699), width = 0.5, length = 2.8, heading = 260.3, minz = 56.9699 - 1, maxz = 56.9699 + 1.5 },
    [63] = { name = "Kayton Towers 2 Apartment 3", location = vector3(-805.8137, -605.1179, 68.6784), width = 0.5, length = 2.8, heading = 260.3, minz = 68.6784 - 1, maxz = 68.6784 + 1.5 },
    [64] = { name = "Kayton Towers 2 Apartment 4", location = vector3(-805.8340, -605.0260, 80.4129), width = 0.5, length = 2.8, heading = 260.3, minz = 80.4129 - 1, maxz = 80.4129 + 1.5 },
    [65] = { name = "Kayton Towers 2 Apartment 5", location = vector3(-805.7814, -605.0311, 92.1652), width = 0.5, length = 2.8, heading = 260.3, minz = 92.1652 - 1, maxz = 92.1652 + 1.5 },
    [66] = { name = "Kayton Towers 2 Roof", location = vector3(-813.0634, -614.4650, 96.5933), width = 0.5, length = 2.8, heading = 260.3, minz = 96.5933 - 1, maxz = 96.5933 + 1.5 },

    [67] = { name = "Kayton Towers 3 Garage", location = vector3(-763.2133, -618.0532, 30.4712), width = 0.5, length = 2.8, heading = 260.3, minz = 30.4712 - 1, maxz = 30.4712 + 1.5 },
    [68] = { name = "Kayton Towers 3 Entrance", location = vector3(-773.6165, -633.1741, 29.8210), width = 0.5, length = 2.8, heading = 260.3, minz = 29.8210 - 1, maxz = 29.8210 + 1.5 },
    [69] = { name = "Kayton Towers 3 Apartment 1", location = vector3(-770.9227, -612.2952, 44.9901), width = 0.5, length = 2.8, heading = 260.3, minz = 44.9901 - 1, maxz = 44.9901 + 1.5 },
    [70] = { name = "Kayton Towers 3 Apartment 2", location = vector3(-770.9791, -612.2953, 56.7703), width = 0.5, length = 2.8, heading = 260.3, minz = 56.7703 - 1, maxz = 56.7703 + 1.5 },
    [71] = { name = "Kayton Towers 3 Apartment 3", location = vector3(-771.0313, -612.2953, 68.5289), width = 0.5, length = 2.8, heading = 260.3, minz = 68.5289 - 1, maxz = 68.5289 + 1.5 },
    [72] = { name = "Kayton Towers 3 Apartment 4", location = vector3(-771.0261, -612.2941, 80.4151), width = 0.5, length = 2.8, heading = 260.3, minz = 80.4151 - 1, maxz = 80.4151 + 1.5 },
    [73] = { name = "Kayton Towers 3 Apartment 5", location = vector3(-771.0193, -612.2941, 92.2158), width = 0.5, length = 2.8, heading = 260.3, minz = 92.2158 - 1, maxz = 92.2158 + 1.5 },
    [74] = { name = "Kayton Towers 3 Roof", location = vector3(-773.6223, -625.0350, 96.5933), width = 0.5, length = 2.8, heading = 260.3, minz = 96.5933 - 1, maxz = 96.5933 + 1.5 },]]--

    
    [169] = { name = "7302 Garage", location = vector3(-472.3735, -723.6739, 30.9630), width = 1.5, length = 2.8, heading = 1.8659, minz = 28.6974 - 1, maxz = 32.6974 + 1.5 },
    [85] = { name = "7302 Entrance", location = vector3(-470.4331, -679.9798, 32.7098), width = 0.5, length = 2.8, heading = 260.3, minz = 30.7098 - 1, maxz = 34.7098 + 1.5 },
    [86] = { name = "7302 Apartment 1", location = vector3(-469.5559, -688.6738, 53.6058), width = 0.5, length = 2.8, heading = 260.3, minz = 52.4058 - 1, maxz = 54.4058 + 1.5 },
    [87] = { name = "7302 Apartment 2", location = vector3(-465.8330, -709.5459, 77.3069), width = 0.5, length = 2.8, heading = 260.3, minz = 76.0869 - 1, maxz = 78.0869 + 1.5 },
    [88] = { name = "7302 Roof", location = vector3(-467.9677, -681.5798, 81.3864), width = 0.5, length = 2.8, heading = 260.3, minz = 81.1864 - 1, maxz = 81.1864 + 1.5 },

    [89] = { name = "TT Garage", location = vector3(-635.0909, 44.1489, 42.6974), width = 0.5, length = 2.8, heading = 260.3, minz = 42.6974 - 1, maxz = 42.6974 + 1.5 },
    [90] = { name = "Tinsel Towers Entrance", location = vector3(-613.1912, 46.9763, 43.9915), width = 1, length = 3, heading = 260.3, minz = 44.5915 - 1, maxz = 48.5915 + 1.5 },
    [91] = { name = "TT Apartment 1", location = vector3(-602.6245, 59.7979, 98.4202), width = 0.5, length = 2.8, heading = 260.3, minz = 98.2002 - 1, maxz = 98.2002 + 1.5 },
    [92] = { name = "TT Apartment 2", location = vector3(-595.5383, 57.7622, 108.2270), width = 0.5, length = 2.8, heading = 260.3, minz = 108.0270 - 1, maxz = 108.0270 + 1.5 },
    [93] = { name = "TT Apartment 3", location = vector3(-605.7858, 49.4050, 93.9261), width = 0.5, length = 2.8, heading = 260.3, minz = 93.6261 - 1, maxz = 93.6261 + 1.5 },
    [94] = { name = "TT Roof", location = vector3(-624.5530, 59.8291, 116.7382), width = 0.5, length = 2.8, heading = 260.3, minz = 116.5382 - 1, maxz = 116.5382 + 1.5 },

   
    [171] = { name = "Richards Majestic Garage", location = vector3(-898.9053, -347.2275, 34.9802), width = 1.5, length = 3.8, heading = 120.6507, minz = 33.9613 - 1, maxz = 35.9613 + 1.5 },
    [95] = { name = "Richards Majestic Entrance", location = vector3(-935.3912, -378.5305, 38.9613), width = 0.5, length = 2.8, heading = 260.3, minz = 38.9613 - 1, maxz = 38.9613 + 1.5 },
    [96] = { name = "RM Apartment 1", location = vector3(-923.3066, -380.1970, 85.4805), width = 0.5, length = 2.8, heading = 260.3, minz = 85.4805 - 1, maxz = 85.4805 + 1.5 },
    [97] = { name = "RM Apartment 2", location = vector3(-906.95000, -370.9338, 109.8403), width = 0.5, length = 2.8, heading = 260.3, minz = 109.4403 - 1, maxz = 109.4403 + 1.5 },
    [98] = { name = "RM Apartment 3", location = vector3(-912.5070, -364.0334, 114.4947), width = 0.5, length = 2.8, heading = 260.3, minz = 114.2747 - 1, maxz = 114.2747 + 1.5 },
    [99] = { name = "RM Roof", location = vector3(-902.4067, -369.2868, 136.2821), width = 0.5, length = 2.8, heading = 260.3, minz = 136.2821 - 1, maxz = 136.2821 + 1.5 },

    [100] = { name = "LB Garage", location = vector3(-1539.2017, -575.0355, 25.7079), width = 0.5, length = 2.8, heading = 260.3, minz = 25.7079 - 1, maxz = 25.7079 + 1.5 },
    [101] = { name = "Lom Bank Entrance", location = vector3(-1581.0767, -558.6785, 34.9537), width = 0.5, length = 2.8, heading = 260.3, minz = 34.9537 - 1, maxz = 34.9537 + 1.5 },
    [102] = { name = "LB Office", location = vector3(-1579.7549, -565.1794, 108.5229), width = 0.5, length = 2.8, heading = 260.3, minz = 108.5229 - 1, maxz = 108.5229 + 1.5 },
    [103] = { name = "LB Roof", location = vector3(-1560.7012, -569.3096, 114.4484), width = 0.5, length = 2.8, heading = 260.3, minz = 114.4484 - 1, maxz = 114.4484 + 1.5 },
	
    [104] = { name = "Alta Suites Entrance", location = vector3(-285.0989, -944.0886, 31.4183), width = 2.5, length = 4.8, heading = 243.2100, minz = 29.2190 - 1, maxz = 35.2190 + 1.5 },
    [105] = { name = "AS Suite 1", location = vector3(-270.9904, -939.63582, 92.7109), width = 0.5, length = 2.8, heading = 260.3, minz = 91.5109 - 1, maxz = 93.5109 + 1.5 },
    [106] = { name = "AS Suite 2", location = vector3(-272.0339, -968.6531, 77.4313), width = 0.5, length = 2.8, heading = 260.3, minz = 77.2313 - 1, maxz = 77.2313 + 1.5 },
    [170] = { name = "AS Roof", location = vector3(-274.509, -962.3614, 130.6880), width = 0.5, length = 2.8, heading = 260.3, minz = 129.6086 - 1, maxz = 131.2313 + 1.5 },
  

    [107] = { name = "Movie Lot Office Entrance", location = vector3(-1007.7678, -485.6526, 40.704), width = 1.5, length = 4, heading = 260.3, minz = 38.9704 - 1, maxz = 42.9704 + 1.5 },
    [108] = { name = "ML Office", location = vector3(-1002.8056, -477.7257, 50.0273), width = 0.5, length = 2.8, heading = 260.3, minz = 50.0273 - 1, maxz = 50.0273 + 1.5 },

    [109] = { name = "FIB Garage", location = vector3(66.0691, -749.6367, 31.6345), width = 0.5, length = 2.8, heading = 260.3, minz = 31.6345 - 1, maxz = 31.6345 + 1.5 },
    [110] = { name = "FIB Entrance", location = vector3(138.4912, -764.3880, 45.7520), width = 0.5, length = 2.8, heading = 260.3, minz = 45.7520 - 1, maxz = 45.7520 + 1.5 },
    [134] = { name = "Floor 47", location = vector3(136.6113, -763.0286, 234.1520), width = 0.5, length = 2.8, heading = 260.3, minz = 234.1520 - 1, maxz = 234.1520 + 1.5 },
    [111] = { name = "Floor 49", location = vector3(135.6202, -762.8890, 242.1520), width = 0.5, length = 2.8, heading = 260.3, minz = 242.1520 - 1, maxz = 242.1520 + 1.5 },
    [112] = { name = "Floor 50", location = vector3(133.6896, -733.1138, 246.1522), width = 0.5, length = 2.8, heading = 260.3, minz = 246.1522 - 1, maxz = 246.1522 + 1.5 },
    [113] = { name = "Floor 51", location = vector3(133.6015, -733.1298, 250.1522), width = 0.5, length = 2.8, heading = 260.3, minz = 250.1522 - 1, maxz = 250.1522 + 1.5 },
    [114] = { name = "Floor 53", location = vector3(115.0609, -742.1865, 258.1523), width = 0.5, length = 2.8, heading = 260.3, minz = 258.1523 - 1, maxz = 258.1523 + 1.5 },
    [115] = { name = "FIB Roof", location = vector3(132.1148, -727.3195, 258.1525), width = 0.5, length = 2.8, heading = 260.3, minz = 258.1525 - 1, maxz = 258.1525 + 1.5 },

    [116] = { name = "DC Garage", location = vector3(936.0344, 1.1478, 78.7640), width = 0.5, length = 2.8, heading = 260.3, minz = 78.7640 - 1, maxz = 78.7640 + 1.5 },
    [117] = { name = "Diamond Casino Entrance", location = vector3(960.0049, 43.1231, 71.7008), width = 0.5, length = 2.8, heading = 260.3, minz = 71.7008 - 1, maxz = 71.7008 + 1.5 },
    [135] = { name = "Diamond Casino Nightclub", location = vector3(1546.1302, 254.2551, -46.0060), width = 0.5, length = 2.8, heading = 260.3, minz = -46.0060 - 1, maxz = -46.0060 + 1.5 },
    [118] = { name = "DC Penthouses", location = vector3(980.8588, 56.3869, 116.1642), width = 0.5, length = 2.8, heading = 260.3, minz = 116.1642 - 1, maxz = 116.1642 + 1.5 },
    [119] = { name = "Rooftop Villa", location = vector3(964.6469, 58.7424, 112.5531), width = 0.5, length = 2.8, heading = 260.3, minz = 112.5531 - 1, maxz = 112.5531 + 1.5 },
    [120] = { name = "DC Roof", location = vector3(971.7829, 51.7569, 120.2407), width = 0.5, length = 2.8, heading = 260.3, minz = 120.2407 - 1, maxz = 120.2407 + 1.5 },

	[121] = { name = "IAA Entrance", location = vector3(139.7316, -614.3456, 44.2187), width = 0.5, length = 2.8, heading = 260.3, minz = 44.2187 - 1, maxz = 44.2187 + 1.5 },
	[122] = { name = "IAA Facility", location = vector3(2153.03, 2920.89, -61.9), width = 0.5, length = 2.8, heading = 260.3, minz = -61.9 - 1, maxz = -61.9 + 1.5 },
	--[123] = { name = "IAA Facility 2", location = vector3(462.0664, 4816.0762, -59.0005), width = 0.5, length = 2.8, heading = 260.3, minz = -59.0005 - 1, maxz = -59.0005 + 1.5 },
	[124] = { name = "IAA Server Room", location = vector3(2156.5676, 2922.0498, -81.0753), width = 0.5, length = 2.8, heading = 260.3, minz = -81.0753 - 1, maxz = -81.0753 + 1.5 },
	[125] = { name = "IAA Office", location = vector3(117.2040, -636.4240, 206.0466), width = 0.5, length = 2.8, heading = 260.3, minz = 206.0466 - 1, maxz = 206.0466 + 1.5 },
	[144] = { name = "IAA Roof", location = vector3(146.9827, -616.1884, 258.1493), width = 0.5, length = 2.8, heading = 260.3, minz = 258.1493 - 1, maxz = 258.1493 + 1.5 },
    
    [126] = { name = "Galaxy Nightclub Entrance", location = vector3(97.0969, -2216.3208, 6.2268), width = 0.5, length = 2.8, heading = 260.3, minz = 6.2268 - 1, maxz = 6.2268 + 1.5 },
	[127] = { name = "Galaxy Nightclub", location = vector3(-1569.9529, -3017.4966, -74.4062), width = 0.5, length = 2.8, heading = 260.3, minz = -74.4062 - 1, maxz = -74.4062 + 1.5 },

	[128] = { name = "Beach Office Entrance", location = vector3(-1899.2296, -572.6844, 11.8445), width = 0.5, length = 2.8, heading = 260.3, minz = 11.8445 - 1, maxz = 11.8445 + 1.5 },
	[129] = { name = "Beach Office ", location = vector3(-1903.6045, -567.7754, 19.0972), width = 0.5, length = 2.8, heading = 142.3, minz = 18.0972 - 1, maxz = 20.0972 + 1.5 },

	[130] = { name = "Elkridge Hotel Entrance", location = vector3(304.6207, -938.8550, 29.4676), width = 0.5, length = 2.8, heading = 260.3, minz = 29.4676 - 1, maxz = 30.4676 + 1.5 },
	[131] = { name = "Hotel Room", location = vector3(151.7201, -1008.2116, -98.900), width = 1.5, length = 3.3, heading = 260.3, minz = -97.0000 - 1, maxz = -100.0000 + 1.5 },
    [172] = { name = "Hotel Room Roof", location = vector3(296.2552, -933.4887, 56.4608), width = 0.5, length = 2.8, heading = 272.3, minz = 54.0000 - 1, maxz = 58.0000 + 1.5 },
    
	
	[132] = { name = "Bunker Entrance", location = vector3(-3175.96, 1376.60, 18.87), width = 1.0, length = 2.8, heading = 90, minz = 19.0 - 1, maxz = 19.8458 + 2.5 },
	[133] = { name = "Bunker", location = vector3(896.83, -3245.83, -97.79), width = 0.5, length = 2.8, heading = 90, minz = -98.2431 - 1, maxz = -98.2431 + 1.5 },

	[137] = { name = "Ferry Boat", location = vector3(-83.5978, -2722.6985, 8.7402), width = 0.5, length = 2.8, heading = 272.3, minz = 7.4107 - 1, maxz = 9.4107 + 1.5 },	
	[138] = { name = "Aircraft Carrier", location = vector3(3082.6623, -4818.7883, 2.2985), width = 0.5, length = 2.8, heading = 260.3, minz = 2.0385 - 1, maxz = 2.0385 + 1.5 },
	[139] = { name = "Sub Interior", location = vector3(1561.3916, 392.3258, -49.0874), width = 0.5, length = 2.8, heading = 260.3, minz = -49.6874 - 1, maxz = -49.6874 + 1.5 },

    [140] = { name = "2 Car Garage", location = vector3(179.4211, -999.8568, -98.8500), width = 0.5, length = 2.8, heading = 345.3, minz = -99.0000 - 1, maxz = -99.0000 + 1.5 },	
    [141] = { name = "6 Car Garage", location = vector3(194.6502, -1007.5449, -99.0000), width = 0.5, length = 2.8, heading = 260.3, minz = -99.0000 - 1, maxz = -99.0000 + 1.5 },
 	[142] = { name = "10 Car Garage", location = vector3(224.5896, -1006.6904, -99.0000), width = 0.5, length = 2.8, heading = 260.3, minz = -99.0000 - 1, maxz = -99.0000 + 1.5 },

    [147] = { name = "2 Car Garage Entrance", location = vector3(-716.9183, -864.2119, 23.4572), width = 0.5, length = 2.8, heading = 165.3, minz = 23.2072 - 1, maxz = 23.2072 + 1.5 },	
    [148] = { name = "6 Car Garage Entrance", location = vector3(-2026.3541, -264.9176, 23.3860), width = 0.5, length = 2.8, heading = 260.3, minz = 23.3860 - 1, maxz = 23.3860 + 1.5 },
    [149] = { name = "10 Car Garage Entrance", location = vector3(211.1203, -934.5561, 24.6759), width = 0.5, length = 2.8, heading = 34.3, minz = 22.1416 - 1, maxz = 26.1416 + 1.5 },
 
	[143] = { name = "Ranch House", location = vector3(1396.3004, 1141.8755, 114.3337), width = 1.5, length = 2.8, heading = 260.3, minz = 113.3337 - 1, maxz = 115.3337 + 1.5 },
	[145] = { name = "Ranch House Entrance", location = vector3(1395.5851, 1152.7365, 114.3482), width = 0.5, length = 2.8, heading = 260.3, minz = 114.3482 - 1, maxz = 114.3482 + 1.5 },
 
    [136] = { name = "Shady Garage", location = vector3(-1508.8711, -3016.6155, -79.2422), width = 0.5, length = 2.8, heading = 260.3, minz = -79.2422 - 1, maxz = -79.2422 + 1.5 },
	[146] = { name = "Shady Garage Entrance", location = vector3(223.2739, 121.8255, 103.0370), width = 0.5, length = 2.8, heading = 260.3, minz = 100.8370 - 1, maxz = 104.8370 + 1.5 },
 
    [150] = { name = "Integrity Way Garage", location = vector3(-39.9049, -613.6367, 35.6694), width = 1.5, length = 2.8, heading = 260.3, minz = 33.2694 - 1, maxz = 37.2694 + 1.5 },	
    [151] = { name = "IW Entrance", location = vector3(-43.5521, -586.2043, 38.7609), width = 0.5, length = 2.8, heading = 260.3, minz = 38.1609 - 1, maxz = 38.1609 + 1.5 },
    [82] = { name = "IW Apartment 1", location = vector3(-32.0722, -595.7263, 80.2309), width = 0.5, length = 2.8, heading = 260.3, minz = 80.0309 - 1, maxz = 80.0309 + 1.5 },
	[83] = { name = "IW Apartment 2", location = vector3(-17.1082, -590.2717, 90.4148), width = 0.5, length = 2.8, heading = 260.3, minz = 90.1148 - 1, maxz = 90.1148 + 1.5 },
	[81] = { name = "IW Roof", location = vector3(-37.3475, -599.3381, 106.6226), width = 1.5, length = 2.8, heading = 338.3, minz = 105.3226 - 1, maxz = 107.3226 + 1.5 },
 
    [155] = { name = "Templar Hotel Entrance", location = vector3(296.0949, -1027.4756, 29.2108), width = 0.5, length = 2.8, heading = 260.3, minz = 29.2108 - 1, maxz = 29.2108 + 1.5 },	
    [157] = { name = "TH Apartment 2", location = vector3(347.1961, -1013.0463, -99.1962), width = 0.5, length = 2.8, heading = 260.3, minz = -99.1962 - 1, maxz = -99.1962 + 1.5 },
	[158] = { name = "TH Roof", location = vector3(285.6971, -1011.4364, 86.7461), width = 0.5, length = 2.8, heading = 260.3, minz = 85.7088 - 1, maxz = 85.7088 + 1.5 },
 
    [79] = { name = "Weazel Plaza Garage", location = vector3(-842.0875, -398.0863, 31.4714), width = 0.5, length = 2.8, heading = 302.3, minz = 29.7651 - 1, maxz = 32.7651 + 1.5 },
    [159] = { name = "Weazel Plaza  Entrance", location = vector3(-905.3664, -452.4895, 40.1053), width = 0.5, length = 2.8, heading = 260.3, minz = 39.6053 - 1, maxz = 39.6053 + 1.5 },
    [160] = { name = "WP Apartment 1", location = vector3(-889.1291, -453.0406, 95.6611), width = 0.5, length = 2.8, heading = 260.3, minz = 95.4611 - 1, maxz = 95.4611 + 1.5 },
    [161] = { name = "WP Apartment 2", location = vector3(-890.6187, -434.8871, 121.8071), width = 0.5, length = 2.8, heading = 260.3, minz = 121.6071 - 1, maxz = 121.6071 + 1.5 },
    [162] = { name = "WP Apartment 3", location = vector3(-907.7723, -455.3813, 126.7744), width = 0.5, length = 2.8, heading = 260.3, minz = 126.5344 - 1, maxz = 126.5344 + 1.5 },
    [166] = { name = "WP Roof", location = vector3(-907.9515, -444.7201, 168.1188), width = 0.5, length = 2.8, heading = 112.3, minz = 167.1188 - 1, maxz = 169.1188 + 1.5 },

    [156] = { name = "Back room", location = vector3(266.0311, -1007.2969, -101.0057), width = 0.5, length = 2.8, heading = 260.3, minz = -101.0057 - 1, maxz = -101.0057 + 1.5 },
    [163] = { name = "Back room Entrance", location = vector3(-783.2963, 5.5304, 42.5290), width = 0.5, length = 2.8, heading = 260.3, minz = 41.5290 - 1, maxz = 41.5290 + 1.5 },

   --[[ [164] = { name = "Alter", location = vector3(-151.6356, 229.1537, 89.0814), width = 0.5, length = 2.8, heading = 260.3, minz = 89.0815 - 1, maxz = 89.0815 + 1.5 },
    [165] = { name = "Alter Entrance", location = vector3(-784.4532, 35.5162, 40.6469), width = 0.5, length = 2.8, heading = 260.3, minz = 40.6469 - 1, maxz = 40.6469 + 1.5 },]]
   
    [167] = { name = "Bahama Mamas Interior", location = vector3(-1402.9528, -610.1988, 30.3196), width = 0.5, length = 2.8, heading = 129.3, minz = 28.8196 - 1, maxz = 32.8196 + 1.5 },
    [168] = { name = "BM Back Entrance", location = vector3(-1392.0369, -640.1103, 28.6234), width = 0.9, length = 2.8, heading = 307.9846, minz = 28.6734 - 1, maxz = 28.6734 + 1.5 },
    
    [174] = { name = "Labexit", location = vector3(441.0599, 4824.05, -58.6511), width = 0.5, length = 2.8, heading = 3.3, minz = -60.0005 - 1, maxz = -58.0005 + 1.5 },
   
    [175] = { name = "Bahama Mamas Main Bar", location = vector3(-1385.1377, -605.7789, 30.3195), width = 0.5, length = 2.8, heading = 306.3, minz = 28.8196 - 1, maxz = 32.8196 + 1.5 },
    [176] = { name = "BM Employee Entrance", location = vector3(-1383.0656, -639.2765, 28.6734), width = 0.9, length = 2.8, heading = 307.9846, minz = 26.6734 - 1, maxz = 30.6734 + 1.5 },
    [177] = { name = "Bahama Mamas Back Bar", location = vector3(-1371.3145, -625.39504, 30.8196), width = 0.5, length = 2.8, heading = 302.3, minz = 28.8196 - 1, maxz = 32.8196 + 1.5 },


    [180] = { name = "Corporation 4 Garage", location = vector3(-1000.9693, -784.7340, 16.3736), width = 0.5, length = 2.8, heading = 327.3, minz = 15.4125 - 1, maxz = 17.4125 + 1.5 },
    [181] = { name = "Corporation 4 Entrance", location = vector3(-1038.1870, -756.3954, 19.8395), width = 0.5, length = 2.8, heading = 242.3, minz = 17.6161 - 1, maxz = 20.6161 + 1.5 },
    [182] = { name = "Corporation 4 Office", location = vector3(-1002.1552, -773.2262, 62.2944), width = 0.5, length = 2.8, heading = 360, minz = 60.8614 - 1, maxz = 63.8614 + 1.5 },
    [183] = { name = "Corporation 4 Penthouse", location = vector3(-998.5713, -773.3828, 70.8942), width = 0.5, length = 2.8, heading = 360, minz = 69.4611 - 1, maxz = 71.4611 + 1.5 },
    [184] = { name = "Corporation 4 Roof", location = vector3(-1017.4561, -766.4927, 76.5368), width = 0.5, length = 2.8, heading = 265.3, minz = 75.3691 - 1, maxz = 77.3691 + 1.5 },


    [185] = { name = "Wuchang Subway", location = vector3(-763.5021, -690.2076, 11.6015), width = 0.5, length = 0.8, heading = 260.3, minz = 11.6015 - 1, maxz = 11.6015 + 1 },
    [186] = { name = "Wuchang Garage", location = vector3(-819.4704, -710.6462, 23.9101), width = 0.5, length = 0.8, heading = 260.3, minz = 23.9101 - 1, maxz = 23.9101 + 1 },
    --[187] = { name = "Wuchang Entrance", location = vector3(-819.5204, -710.6462, 28.301), width = 0.5, length = 0.8, heading = 260.3, minz = 28.301 - 1, maxz = 28.301 + 1 },
    [188] = { name = "Wuchang Studio", location = vector3(-819.5204, -710.6462, 32.5301), width = 0.5, length = 0.8, heading = 260.3, minz = 32.5301 - 1, maxz = 32.5301 + 1 },
    [189] = { name = "Wuchang Roof", location = vector3(-820.25, -721.58, 121.44), width = 0.5, length = 0.8, heading = 260.3, minz = 121.44 - 1, maxz = 121.44 + 1 },
--1088.16, -3187.18, -38.85
    [190] = { name = "Coke Lab Inside", location = vector3(1088.16, -3187.18, -38.85), width = 0.5, length = 2.8, heading = 260.3, minz = -39.0057 - 1, maxz = -37.0057 + 1.5 },
    [191] = { name = "Coke Lab Entrance", location = vector3(386.9, 3584.2, 33.5), width = 0.5, length = 2.8, heading = 260.3, minz = 32.5290 - 1, maxz = 34.5290 + 1.5 },


    [192] = { name = "Base Inside", location = vector3(462.2964, 4815.7762, -58.7505), width = 0.5, length = 2.8, heading = 260.3, minz = -59.0005 - 1, maxz = -59.0005 + 1.5 },
    [193] = { name = "Base Entrance", location = vector3(-2054.5969, 3237.1632, 31.8989), width = 0.5, length = 2.8, heading = 209.3, minz = 30.5290 - 1, maxz = 31.5290 + 1.5 },
    
    
   -- [194] = { name = "Base Exit", location = vector3(441.0599, 4824.05, -58.6511), width = 0.5, length = 2.8, heading = 3.3, minz = -60.0005 - 1, maxz = -58.0005 + 1.5 },

    -- NEXT # [195] 

    -- vector3(-819.86, -710.67, 32.34)
}

Config.Language = {
    ["en"] = {
        Waiting = "Waiting for the Elevator...",
        Restricted = "Access Restricted!",
        Item = "Access Restricted!",
        CurrentFloor = "Current Floor: ",
        Unable = "You Can't Use The Elevator...",
    },
    ["pt"] = {
        Waiting = "À espera do Elevador...",
        Restricted = "Piso restrito!",
        CurrentFloor = "Piso Atual: "
    }
}