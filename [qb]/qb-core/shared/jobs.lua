QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Unemployed',
                payment = 150
            },
        },
	},
    ["gotur"] = {
		label = "Götür",
		defaultDuty = false,
		grades = {
            ['0'] = {
                name = "Messenger",
                payment = 0
            },
			['1'] = {
                name = "Manager",
				isboss = true,
                bankAuth = true,
                payment = 0
            },
        },
	},
    ['bakery'] = {
		label = 'Baker',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 100 },
			['1'] = { name = 'Novice', payment = 125 },
			['2'] = { name = 'Experienced', payment = 125 },
			['3'] = { name = 'Manager',  isboss = true,
                bankAuth = true,payment = 100 },
			['4'] = { name = 'Owner', isboss = true,
                bankAuth = true, payment = 50 },
        },
	},
	['police'] = {
		label = 'Law Enforcement',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'P1',
                payment = 5700
            },
            ['1'] = {
                name = 'P2',
                payment = 6000
            },
			['2'] = {
                name = 'Officer',
                payment = 6500
            },
			['3'] = {
                name = 'Sergeant',
                isboss = true,
                bankAuth = true,
                payment = 6750
            },
			['4'] = {
                name = 'Lieutenant',
                isboss = true,
                bankAuth = true,
                payment = 6875
            },
			['5'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
                payment = 7125
            },
            ['6'] = {
                name = 'State Prosecutor',
                payment = 4000
            },
            ['7'] = {
                name = 'Interceptor Driver',
                payment = 6500
            },
            ['8'] = {
                name = 'Commissioner',
                isboss = true,
                bankAuth = true,
                payment = 9500
            },
            
        },
	},
    ['taxi'] = {
        label = 'Los Santos Taxi',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Los Santos Taxi',
                payment = 1500
            },
            ['1'] = {
                name = 'Los Santos Taxi Manager',
                isboss = true,
                bankAuth = true,
                payment = 750
            },
            ['2'] = {
                name = 'Los Santos Taxi Owner',
                isboss = true,
                bankAuth = true,
              
                payment = 1000
                
            },
        },
    },
    ["vineyard"] = {
        label = "Vineyard", 
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = "Vineyard Worker",
                payment = 100
            },
            ['1'] = {
                name = "Vineyard Employee",
                payment = 100
            },
            ['2'] = {
                name = "Vineyard Manager",
                isboss = true,
                bankAuth = true,
                payment = 80
            },
            ['3'] = {
                name = "Vineyard Owner",
               
                isboss = true,
                bankAuth = true,
                payment = 60
            },
        },
    },
	['ambulance'] = {
		label = 'Emergency Medical Service',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 4000
            },
			['1'] = {
                name = 'Paramedic',
                payment = 5500
            },
			['2'] = {
                name = 'Doctor',
                isboss = true,
                bankAuth = true,
               
                payment = 5750
            },
			['3'] = {
                name = 'Surgeon',
                isboss = true,
                bankAuth = true,
               
                payment = 5875
            },
			['4'] = {
                name = 'Chief',
				isboss = true,
                bankAuth = true,
              
                payment = 6000
            },
        },
	},
    ['burgershot'] = {
        label = 'Burgershot',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 200
            },
            ['1'] = {
                name = 'Worker',
                payment = 1500
            },
            ['2'] = {
                name = 'Shift Manager',
                isboss = true,
                bankAuth = true,
              
                payment = 1475
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
             
                payment = 1450
            },
        },
    },
    
    ['catcafe'] = {
        label = 'UwU Cafe',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1800
            },
            ['1'] = {
                name = 'Worker',
                payment = 2000
            },
            ['2'] = {
                name = 'Shift Manager',
                isboss = true,
                bankAuth = true,
                payment = 2500
            },
            ['3'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
              
                payment = 3000
            },
        },
    },
    
    ['pizza'] = {
        label = 'Pizzaria',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 2500
            },
            ['1'] = {
                name = 'Worker',
                payment = 3000
            },
            ['2'] = {
                name = 'Shift Manager',
                isboss = true,
                bankAuth = true,
                payment = 3125
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 3250
            },
        
        },
    },
    
    ['beanmachine'] = {
        label = 'Bean Machine',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 100
            },
            ['1'] = {
                name = 'Worker',
                payment = 150
            },
            ['2'] = {
                name = 'Shift Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 50
            },
        
        },
    },
    
    ['vu'] = {
        label = 'Strip Club',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 100
            },
            ['1'] = {
                name = 'Worker',
                payment = 150
            },
            ['2'] = {
                name = 'Shift Manager',
                isboss = true,
                bankAuth = true,
                payment = 150
            },
            ['4'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 50
            },
        },
    },
    
    ['taco'] = {
        label = 'Taco Truck',
        defaultDuty = false,
        grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2200
            },
            ['1'] = {
                name = 'Employee',
                payment = 2500
            },
            ['2'] = {
                name = 'Manager',
                payment = 3000,
                isboss = true,
                bankAuth = true,
            },
            ['3'] = {
                name = 'Boss',
                payment = 3500,
                isboss = true,
                bankAuth = true,
            },
        },
    },
	['realtor'] = {
		label = 'Real Estate',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 3500
            },
			['1'] = {
                name = 'Salesman',
                payment = 4000
            },
            ['2'] = {
                name = 'Manager',
				isboss = true,
                bankAuth = true,
                payment = 4500
            },
            ['3'] = {
                name = 'Boss',
				isboss = true,
                bankAuth = true,
                payment = 5000
            },
        },
	},
	['cardealer'] = {
		label = 'Vehicle Salesman',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                
                payment = 3000
            },
			['1'] = {
                name = 'Salesman',
              
                payment = 3500
            },
            ['2'] = {
                name = 'Employee of The Month',
              
                payment = 3625
            },
            ['3'] = {
                name = 'Senior Salesman',
              
                payment = 3750
            },
			['4'] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 3875
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 4000
               
            },
        },
	},
    ['redline'] = {
		label = 'Redline Salesman',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                
                payment = 100
            },
			['1'] = {
                name = 'Salesman',
              
                payment = 100
            },
            ['2'] = {
                name = 'Employee of The Month',
              
                payment = 105
            },
            ['3'] = {
                name = 'Senior Salesman',
              
                payment = 110
            },
			['4'] = {
                name = 'Manager',
                isboss = true,
                bankAuth = true,
                payment = 80
            },
            ['5'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 80
               
            },
        },
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Lost MC Mechanic Recruit',
                payment = 3000
            },
            ['1'] = {
                name = 'Lost MC Mechanic',
                payment = 3250
            },
            ['2'] = {
                name = 'Lost MC Mechanic Manager',
                payment = 3375,
                isboss = true,
                bankAuth = true,
            },
            ['3'] = {
                name = 'Lost MC Mechanic Owner',
                payment = 3500,
                isboss = true,
                bankAuth = true,
            },
        },
    },

	['lostmech'] = { -- NOT USED!! Lost MC is using Mechanic so that the bank accounts link
		label = 'Mechanic',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Lost MC Mechanic Recruit',
                payment = 3000
            },
            ['1'] = {
                name = 'Lost MC Mechanic',
                payment = 3250
            },
            ['2'] = {
                name = 'Lost MC Mechanic Manager',
                payment = 3375,
                isboss = true,
                bankAuth = true,
            },
            ['3'] = {
                name = 'Lost MC Mechanic Owner',
                payment = 3500,
                isboss = true,
                bankAuth = true,
            },
        },
    },


   ['maxdamage'] = {
		label = 'Max Damage Firearms',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 2200
            },
            ['1'] = {
                name = 'Employee',
                payment = 2500
            },
            ['2'] = {
                name = 'Manager',
                payment = 3000,
                isboss = true,
                bankAuth = true,
            },
            ['3'] = {
                name = 'Boss',
                payment = 3500,
                isboss = true,
                bankAuth = true,
            },
        },
   },

   ['pinkmonkey'] = {
    label = 'Pink Monkey Deliveries',
    defaultDuty = false,
    offDutyPay = true,
    grades = {
        ['0'] = {
            name = 'Trainee',
            payment = 2200
        },
        ['1'] = {
            name = 'Employee',
            payment = 2500
        },
        ['2'] = {
            name = 'Manager',
            payment = 3000,
            isboss = true,
                            bankAuth = true,
        },
        ['3'] = {
            name = 'Boss',
            payment = 3500,
            isboss = true,
                            bankAuth = true,
        },
    },
},

        ['hayes'] = {
            label = 'Hayes Mechanic',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = {
                    name = 'Hayes Recruit',
                    payment = 100
                },
                ['1'] = {
                    name = 'Hayes Mechanic',
                    payment = 125
                },
                ['2'] = {
                    name = 'Hayes Manager',
                    payment = 125,
                    isboss = true,
                    bankAuth = true,
                },
                ['3'] = {
                    name = 'Hayes Owner',
                    payment = 200,
                    isboss = true,
                    bankAuth = true,
                },
               
            },
        },
        ['bennys'] = {
            label = 'Bennys Mechanic',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = {
                    name = 'Bennys Recruit',
                    payment = 100
                },
                ['1'] = {
                    name = 'Bennys Mechanic',
                    payment = 150
                },
                ['2'] = {
                    name = 'Bennys Manager',
                    payment = 150,
                    isboss = true,
                    bankAuth = true,
                },
                ['3'] = {
                    name = 'Bennys Owner',
                    payment = 200,
                    isboss = true,
                    bankAuth = true,
                },
               
            },
        },
        ['tuner'] = {
            label = 'Tuner Shop',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = {
                    name = 'Tuner Shop Recruit',
                    payment = 3000
                },
                ['1'] = {
                    name = 'Tuner Shop Mechanic',
                    payment = 3250
                },
                ['2'] = {
                    name = 'Tuner Shop Manager',
                    payment = 3375,
                    isboss = true,
                    bankAuth = true,
                },
                ['3'] = {
                    name = 'Tuner Shop Owner',
                    payment = 3500,
                    isboss = true,
                    bankAuth = true,
                },
               
            },
        },
        ['otto'] = {
            label = 'Ottos Autos',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = {
                        name = 'Ottos Recruit',
                        payment = 3000
                },
                ['1'] = {
                        name = 'Ottos Mechanic',
                        payment = 3250
                },
                ['2'] = {
                        name = 'Ottos Manager',
                        payment = 3375,
                        isboss = true,
                        bankAuth = true,
                },
                ['3'] = {
                        name = 'Ottos Owner',
                        payment = 3500,
                        isboss = true,
                        bankAuth = true,
                },     
            },
        },
	
        ['pawnshop'] = {
            label = 'Pawn Shop',
            defaultDuty = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 2000 },
                ['1'] = { name = 'Employee', payment = 2200 },
                ['2'] = { name = 'Experienced', payment = 2500 },
                ['3'] = { name = 'Manager', isboss = true,                bankAuth = true,payment = 3000 },
                ['4'] = { name = 'Owner', isboss = true,                bankAuth = true,payment = 3200 },
            },
        },
	--[[['judge'] = {
		label = 'Honorary',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                isboss = true,
                bankAuth = true,
                payment = 3000
            },
        },
	},]]
    ['council'] = {
		label = 'City Council',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Assistant',
                isboss = true,
                bankAuth = true,
                payment = 6500
            },
            ['1'] = {
                name = 'Council',
                isboss = true,
                bankAuth = true,
                payment = 7000
            },
            ['2'] = {
                name = 'Judge',
                isboss = true,
                bankAuth = true,
                payment = 10000
            },
            ['3'] = {
                name = 'Mayor',
                isboss = true,
                bankAuth = true,
                payment = 11500
            },
        },
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Lawyer',
                isboss = true,
                bankAuth = true,
                payment = 3000
            },
        },
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 150
            },
            ['1'] = {
                name = 'Manager',
                payment = 125,
                isboss = true,
                bankAuth = true,
            },
            ['2'] = {
                name = 'Co-owner',
                payment = 100,
                isboss = true,
                bankAuth = true,
            },
            ['3'] = {
                name = 'Owner',
                isboss = true,
                bankAuth = true,
                payment = 50
            },
        },
	},
    ['wuchang'] = {
		label = 'Wu Chang Records',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Intern',
                payment = 2500
            },
            ['1'] = {
                name = 'Actor',
                payment = 2625,
                isboss = false,
            },
            ['2'] = {
                name = 'Artist',
                payment = 2750,
                isboss = false,
            },
            ['3'] = {
                name = 'Project Lead',
                isboss = false,
                payment = 2875
            },
            ['4'] = {
                name = 'Executive Assistant',
                isboss = false,
                payment = 3000
            },
            ['5'] = {
                name = 'VP',
                isboss = true,
                bankAuth = true,
                payment = 3125
            },
            ['6'] = {
                name = 'CEO',
                isboss = true,
                bankAuth = true,
                payment = 3250
            },
            
        },
	},
    ['church'] = {
		label = 'Church of Rockford',
		defaultDuty = false,
		offDutyPay = true,
		grades = {
            ['0'] = {
                name = 'Acolyte',
                payment = 2000,
            },
            ['1'] = {
                name = 'Clergy',
                payment = 3125,
            },
            ['2'] = {
                name = 'Bishop',
                payment = 3250,
            },
            ['3'] = {
                name = 'Arch Bishop',
                isboss = true,
                bankAuth = true,
                payment = 3375
            },
            ['4'] = {
                name = 'Pope',
                isboss = true,
                bankAuth = true,
                payment = 3500
            },
            
        },
	},

['weazelnews'] = {
    label = 'Weazel News',
    defaultDuty = false,
    offDutyPay = true,
    grades = {
        ['0'] = {
            name = 'Intern',
            payment = 2500,
        },
        ['1'] = {
            name = 'Camera man',
            payment = 2625,
        },
        ['2'] = {
            name = 'Reporter / Anchor',
            payment = 2750,
        },
        ['3'] = {
            name = 'Producer / Manager',
            isboss = true,
                bankAuth = true,
            payment = 2875
        },
        ['4'] = {
            name = 'VP',
            isboss = true,
                bankAuth = true,
            payment = 3000
        },
        ['5'] = {
            name = 'CEO',
            isboss = true,
                bankAuth = true,
            payment = 3125
        },
        
    },
},

['pizzathis'] = {
    label = 'Pizza This!',
    defaultDuty = false,
    offDutyPay = true,
    grades = {
        ['0'] = {
            name = 'Trainee',
            payment = 2500,
        },
        ['1'] = {
            name = 'Cook',
            payment = 3000,
        },
        ['2'] = {
            name = 'Wait Staff',
            payment = 3125,
        },
        ['3'] = {
            name = 'Manager',
            isboss = true,
                bankAuth = true,
            payment = 3250
        },
        ['4'] = {
            name = 'Owner',
            isboss = true,
                bankAuth = true,
            payment = 3375
        },
        
    },
},

}