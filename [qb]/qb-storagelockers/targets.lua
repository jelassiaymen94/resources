Citizen.CreateThread(function() -- Added this line for qb-target to work
    exports['qb-target']:AddBoxZone("Stash1", vector3(-2220.4, 4226.57, 46.97), 1, 2.8, {
    	name="Stash1",
    	heading=38,
        debugPoly=false,  -- set all these to false so green boxes don't show in the city
    	minZ=46.62,
    	maxZ=49.22
    }, {
    	options = {
            {
                event = "qb-stopragelockers:StashAvailability1",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
    	},
    	job = {"all"},
    	distance = 3.0 -- changed all the distances from 5 to 3.0 
    })

    exports['qb-target']:AddBoxZone("Stash2", vector3(-61.31, -1204.76, 28.08), 5.2, 0.6, {
        name="Stash2",
        heading=44,
    debugPoly=false,
        minZ=27.08,
        maxZ=31.08
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability2",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash3", vector3(-2217.94, 4228.45, 47.16), 1, 2.8, {
        name="Stash3",
        heading=37,
        debugPoly=false,
        minZ=46.61,
        maxZ=49.21
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability3",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash4", vector3(-2215.46, 4230.33, 47.28), 1, 2.8, {
        name="Stash4",
        heading=38,
        debugPoly=false,
        minZ=46.68,
        maxZ=49.18
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability4",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash5", vector3(-2214.03, 4233.47, 47.37), 0.6, 2.8, {
        name="Stash5",
        heading=37,
        debugPoly=false,
        minZ=46.97,
        maxZ=49.57
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability5",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash6", vector3(-2211.56, 4235.33, 47.38), 0.6, 2.8, {
        name="stash6",
        heading=37,
        debugPoly=false,
        minZ=46.93,
        maxZ=49.53
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability6",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash7", vector3(-2209.03, 4237.12, 47.49), 1, 2.8, {
       name="Stash7",
       heading=38,
       debugPoly=false,
       minZ=46.89,
       maxZ=49.49
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability7",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash8", vector3(-2207.55, 4240.27, 47.53), 1.0, 2.8, {
        name="123",
        heading=36,
        debugPoly=false,
        minZ=47.33,
        maxZ=49.93
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability8",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash9", vector3(-2205.12, 4242.2, 47.66), 1, 2.8, {
      name="1",
      heading=38,
      debugPoly=false,
      minZ=47.31,
      maxZ=49.91
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability9",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash10", vector3(-2202.68, 4244.12, 47.62), 1, 2.8, {
      name="1",
      heading=39,
      debugPoly=false,
      minZ=47.32,
      maxZ=49.92
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability10",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash11", vector3(-55.92, -1210.05, 28.57), 5.4, 1, {
      name="Stash11",
      heading=43,
      debugPoly=false,
      minZ=27.37,
      maxZ=31.37
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability11",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash12", vector3(-52.46, -1216.42, 28.7), 4.2, 1.0, {
      name="Stash12",
      heading=0,
      debugPoly=false,
      minZ=27.7,
      maxZ=31.7
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability12",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash13", vector3(-66.88, -1198.98, 27.98), 5.2, 1, {
      name="Stash13",
      heading=45,
      debugPoly=false,
      minZ=26.68,
      maxZ=30.68
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability13",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })

    exports['qb-target']:AddBoxZone("Stash14", vector3(-73.23, -1196.55, 27.67), 5.2, 1, {
      name="Stash14",
      heading=90,
      debugPoly=false,
      minZ=26.67,
      maxZ=30.67
    }, {
        options = {
            {
                event = "qb-stopragelockers:StashAvailability14",
                icon = "fas fa-briefcase",
                label = "Open Locker",
            },
        },
        job = {"all"},
        distance = 3.0
    })





















    exports['qb-target']:AddBoxZone("Stash15", vector3(-66.61, -1226.69, 28.84), 5.2, 1, {
        name="Stash15",
        heading=46.07,
        debugPoly=false,
        minZ=26.67,
        maxZ=30.67
      }, {
          options = {
              {
                  event = "qb-stopragelockers:StashAvailability15",
                  icon = "fas fa-briefcase",
                  label = "Open Locker",
              },
          },
          job = {"all"},
          distance = 3.0
      })



      exports['qb-target']:AddBoxZone("Stash16", vector3(-78.57, -1204.08, 27.63), 5.2, 1, {
        name="Stash16",
        heading=184.09,
        debugPoly=false,
        minZ=26.67,
        maxZ=30.67
      }, {
          options = {
              {
                  event = "qb-stopragelockers:StashAvailability16",
                  icon = "fas fa-briefcase",
                  label = "Open Locker",
              },
          },
          job = {"all"},
          distance = 3.0
      })



-- vector3(-70.99, -1206.32, 27.87)





exports['qb-target']:AddBoxZone("Stash17", vector3(-70.99, -1206.32, 27.87), 5.2, 1, {
    name="Stash17",
    heading=132.55,
    debugPoly=false,
    minZ=26.67,
    maxZ=30.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability17",
              icon = "fas fa-briefcase",
              label = "Open Locker",
          },
      },
      job = {"all"},
      distance = 3.0
  })




-- vector3(-65.81, -1211.57, 28.36)



exports['qb-target']:AddBoxZone("Stash18", vector3(-65.81, -1211.57, 28.36), 5.2, 1, {
    name="Stash18",
    heading=143.87,
    debugPoly=false,
    minZ=26.67,
    maxZ=30.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability18",
              icon = "fas fa-briefcase",
              label = "Open Locker",
          },
      },
      job = {"all"},
      distance = 3.0
  })




  exports['qb-target']:AddBoxZone("Stash19", vector3(-816.5521, -696.2584, 32.1409), 5.2, 1, {
    name="Stash19",
    heading=143.87,
    debugPoly=false,
    minZ=31.67,
    maxZ=32.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability19",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      job = {"wuchang"},
      distance = 5.0
  })



  exports['qb-target']:AddBoxZone("Stash38", vector3(-829.9359, -728.0553, 28.0601), 5.2, 1, {
    name="Stash38",
    heading=354.1063,
    debugPoly=false,
    minZ=26.67,
    maxZ=29.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability38",
              icon = "fas fa-briefcase",
              label = "Service Counter",
          },
      },
      distance = 2.0
  })


  exports['qb-target']:AddBoxZone("Stash39", vector3(-826.2382, -729.0773, 28.0601), 5.2, 1, {
    name="Stash39",
    heading=257.7837,
    debugPoly=false,
    minZ=27.67,
    maxZ=29.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability39",
              icon = "fas fa-briefcase",
              label = "Open Fridge",
          },
      },
      job = {"wuchang"},
      distance = 2.0
  })




  exports['qb-target']:AddBoxZone("Stash20", vector3(-781.1865, 1.8306, 42), 5.2, 1, {
    name="Stash20",
    heading=143.87,
    debugPoly=false,
    minZ=39.67,
    maxZ=44.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability20",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      job = {"church"},
      distance = 5.0
  })




  exports['qb-target']:AddBoxZone("Stash21", vector3(-574.6708, -939.2942, 28.8176), 5.2, 1, {
    name="Stash21",
    heading=187.7144,
    debugPoly=false,
    minZ=25.67,
    maxZ=30.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability21",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      job = {"weazelnews"},
      distance = 5.0
  })



  exports['qb-target']:AddBoxZone("Stash22", vector3(810.7077, -752.8966, 26.7808), 1.2, 1, {
    name="Stash22",
    heading=90.1063,
    debugPoly=false,
    minZ=23.67,
    maxZ=27.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability22",
              icon = "fas fa-briefcase",
              label = "Service Counter",
          },
      },
      distance = 2.0
  })


  exports['qb-target']:AddBoxZone("Stash23", vector3(803.6931, -757.0038, 26.9809), 1.2, 1, {
    name="Stash23",
    heading=342.7837,
    debugPoly=false,
    minZ=23.67,
    maxZ=27.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability23",
              icon = "fas fa-briefcase",
              label = "Open Fridge",
          },
      },
      distance = 2.0
  })


  exports['qb-target']:AddBoxZone("Stash24", vector3(796.4766, -749.0518, 31.2659), 2.2, 1, {
    name="Stash24",
    heading=353.5549,
    debugPoly=false,
    minZ=29.67,
    maxZ=34.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability24",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })


  exports['qb-target']:AddBoxZone("Stash25", vector3(-718.6044, 260.7003, 84.1378), 2.2, 1, {
    name="Stash25",
    heading=113.0089,
    debugPoly=false,
    minZ=82.67,
    maxZ=86.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability25",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 5.0
  })

  exports['qb-target']:AddBoxZone("Stash26", vector3(977.2809, -104.5429, 74.8452), 2.2, 1, {
    name="Stash26",
    heading=224.0089,
    debugPoly=false,
    minZ=72.67,
    maxZ=76.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability26",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })


  exports['qb-target']:AddBoxZone("Stash27", vector3(339.7540, -224.9531, 53.7563), 2.2, 1, {
    name="Stash27",
    heading=156.0089,
    debugPoly=false,
    minZ=52.67,
    maxZ=56.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability27",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })

  exports['qb-target']:AddBoxZone("Stash28", vector3(-186.0279, -1270.9005, 31.2956), 2.2, 1, {
    name="Stash28",
    heading=253.0089,
    debugPoly=false,
    minZ=29.67,
    maxZ=32.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability28",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })



  exports['qb-target']:AddBoxZone("Stash29", vector3(-646.5299, -1230.726, 12.3033), 2.2, 1, {
    name="Stash29",
    heading=126.0089,
    debugPoly=false,
    minZ=10.67,
    maxZ=13.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability29",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })



  exports['qb-target']:AddBoxZone("Stash30", vector3(123.9899, -3007.8616, 7.0409), 2.2, 1, {
    name="Stash30",
    heading=317.0089,
    debugPoly=false,
    minZ=5.67,
    maxZ=10.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability30",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })


  
  exports['qb-target']:AddBoxZone("Stash31", vector3(173.0225, -1324.6170, 29.3635), 2.2, 1, {
    name="Stash31",
    heading=110.0089,
    debugPoly=false,
    minZ=27.67,
    maxZ=31.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability31",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })











  exports['qb-target']:AddBoxZone("Stash32", vector3(495.59557, -1528.2304, 29.2874), 2.2, 1, {
    name="Stash32",
    heading=53.0089,
    debugPoly=false,
    minZ=27.67,
    maxZ=31.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability32",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  })




  exports['qb-target']:AddBoxZone("Stash33", vector3(-322.4852, -2451.0116, 1.7149), 2.2, 1, {
    name="Stash33",
    heading=49.0089,
    debugPoly=false,
    minZ=0.67,
    maxZ=2.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability33",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  })






  exports['qb-target']:AddBoxZone("Stash34", vector3(-340.0438, 53.3498, 44.2266), 2.2, 1, {
    name="Stash34",
    heading=356.0089,
    debugPoly=false,
    minZ=43.67,
    maxZ=45.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability34",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })










  exports['qb-target']:AddBoxZone("Stash35", vector3(-575.2627, -1066.4606, 27.240), 2.2, 1, {
    name="Stash35",
    heading=270.0089,
    debugPoly=false,
    minZ=26.07,
    maxZ=27.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability35",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })







  exports['qb-target']:AddBoxZone("Stash36", vector3(310.8187, -198.1813, 53.586), 2.2, 1, {
    name="Stash36",
    heading=153.0089,
    debugPoly=false,
    minZ=52.07,
    maxZ=54.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability36",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })












  exports['qb-target']:AddBoxZone("Stash37", vector3(1251.0874, -1580.7565, 58.4516), 2.2, 1, {
    name="Stash37",
    heading=303.0089,
    debugPoly=false,
    minZ=57.07,
    maxZ=59.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability37",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })



















  exports['qb-target']:AddBoxZone("Stash40", vector3(-162.9553, -1613.3641, 33.9494), 2.2, 1, {
    name="Stash40",
    heading=147.0089,
    debugPoly=false,
    minZ=33.07,
    maxZ=35.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability40",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })

















  exports['qb-target']:AddBoxZone("Stash41", vector3(347.1525, -204.9305, 53.8263), 2.2, 1, {
    name="Stash41",
    heading=156.0089,
    debugPoly=false,
    minZ=52.07,
    maxZ=54.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability41",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })











  exports['qb-target']:AddBoxZone("Stash42", vector3(121.3583, -3028.8293, 7.0409), 2.2, 1, {
    name="Stash42",
    heading=86.0089,
    debugPoly=false,
    minZ=6.07,
    maxZ=8.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability42",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })




    

  exports['qb-target']:AddBoxZone("Stash43", vector3(306.8703, -208.0832, 57.6233), 2.2, 1, {
    name="Stash43",
    heading=338.0089,
    debugPoly=false,
    minZ=57.07,
    maxZ=59.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability43",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })




-- -804.6722, 177.4873, 72.8348, 21.1147
exports['qb-target']:AddBoxZone("Stash44", vector3(-804.6722, 177.8873, 72.8348), 5.2, 1, {
    name="Stash44",
    heading=21.0089,
    debugPoly=false,
    minZ=70.07,
    maxZ=73.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability44",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })















  exports['qb-target']:AddBoxZone("Stash45", vector3(-12.7897, -1435.1010, 30.8016), 5.2, 1, {
    name="Stash45",
    heading=96.0089,
    debugPoly=false,
    minZ=30.07,
    maxZ=32.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability45",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })












  exports['qb-target']:AddBoxZone("Stash46", vector3(309.5018, -220.1472, 57.5245), 5.2, 1, {
    name="Stash46",
    heading=64.0089,
    debugPoly=false,
    minZ=57.07,
    maxZ=59.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability46",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })









  exports['qb-target']:AddBoxZone("Stash47", vector3(-827.1295, -736.5128, 23.5090), 2.2, 1, {
    name="Stash47",
    heading=255.0089,
    debugPoly=true,
    minZ=22.07,
    maxZ=24.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability47",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.5
  })








  exports['qb-target']:AddBoxZone("Stash48", vector3(-811.4306, -731.7914, 23.9790), 1, 1, {
    name="Stash48",
    heading=255.0089,
    debugPoly=true,
    minZ=22.07,
    maxZ=24.07
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability48",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  })








  exports['qb-target']:AddBoxZone("Stash49", vector3(-159.2257, -1608.2280, 33.2494), 1.5, 1.5, {
    name="Stash49",
    heading=339.0089,
    debugPoly=false,
    minZ=32.07,
    maxZ=34.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability49",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })











  exports['qb-target']:AddBoxZone("Stash50", vector3(-764.5685, 329.0948, 196.0860), 1.5, 1.5, {
    name="Stash50",
    heading=249.0089,
    debugPoly=false,
    minZ=195.07,
    maxZ=197.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability50",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })
















  exports['qb-target']:AddBoxZone("Stash51", vector3(933.8374, -1814.9750, 2.3817), 1.5, 1.5, {
    name="Stash51",
    heading=182.0089,
    debugPoly=false,
    minZ=1.07,
    maxZ=2.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability51",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })








--VU
exports['qb-target']:AddBoxZone("Stash52", vector3(130.2653, -1281.7045, 28.7693), 1.2, 1, {
    name="Stash52",
    heading=300.7837,
    debugPoly=false,
    minZ=27.67,
    maxZ=29.67
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability52",
              icon = "fas fa-briefcase",
              label = "Open Fridge",
          },
      },
      job = {"vu"},
      restricted = true,
      distance = 1.0
  })




  exports['qb-target']:AddBoxZone("Stash53", vector3(93.7243, -1290.7122, 29.2635), 1.5, 1.5, {
    name="Stash53",
    heading=21.0089,
    debugPoly=false,
    minZ=28.07,
    maxZ=30.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability53",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 2.0
  })   













  exports['qb-target']:AddBoxZone("Stash54", vector3(6.6246, -1099.1085, 29.2755), 1.0, 1.0, {
    name="Stash54",
    heading=21.0089,
    debugPoly=false,
    minZ=29.07,
    maxZ=31.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability54",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  })   











  exports['qb-target']:AddBoxZone("Stash55", vector3(1463.5881, -1677.3121, 37.0452), 1.0, 1.0, {
    name="Stash55",
    heading=104.0089,
    debugPoly=false,
    minZ=36.07,
    maxZ=38.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability55",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  }) 







  exports['qb-target']:AddBoxZone("Stash56", vector3(-859.6818, 674.4070, 149.0531), 1.0, 1.0, {
    name="Stash56",
    heading=104.0089,
    debugPoly=false,
    minZ=148.07,
    maxZ=149.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability56",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  }) 









  exports['qb-target']:AddBoxZone("Stash57", vector3(-773.6414, 324.6993, 176.8124), 1.0, 1.0, {
    name="Stash57",
    heading=165.0089,
    debugPoly=false,
    minZ=175.07,
    maxZ=177.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability57",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  }) 









  exports['qb-target']:AddBoxZone("Stash58", vector3(-773.7495, 324.7585, 223.2664), 1.0, 1.0, {
    name="Stash58",
    heading=165.0089,
    debugPoly=false,
    minZ=222.07,
    maxZ=224.07,
  }, {
      options = {
          {
              event = "qb-stopragelockers:StashAvailability58",
              icon = "fas fa-briefcase",
              label = "Open Vault",
          },
      },
      distance = 1.0
  }) 



































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    



































































































    
end) -- added this line for qb-target to work