

local radioStations = {}
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    removeradios()
end)



CreateThread(function()
	
	
	removeradios()

end)


function removeradios()
    SetRadioStationIsVisible("RADIO_04_PUNK", false)
	  SetRadioStationIsVisible("RADIO_03_HIPHOP_NEW", true)
	  SetRadioStationIsVisible("RADIO_02_POP", true)
    SetRadioStationIsVisible("RADIO_01_CLASS_ROCK", true)
    SetRadioStationIsVisible("RADIO_05_TALK_01", false)
    SetRadioStationIsVisible("RADIO_06_COUNTRY", true)
    SetRadioStationIsVisible("RADIO_07_DANCE_01", false)
    SetRadioStationIsVisible("RADIO_08_MEXICAN", false)
    SetRadioStationIsVisible("RADIO_09_HIPHOP_OLD", false)
    SetRadioStationIsVisible("RADIO_12_REGGAE", false)
    SetRadioStationIsVisible("RADIO_13_JAZZ", false)
    SetRadioStationIsVisible("RADIO_14_DANCE_02", false)
    SetRadioStationIsVisible("RADIO_15_MOTOWN", false)
    SetRadioStationIsVisible("RADIO_16_SILVERLAKE", false)
    SetRadioStationIsVisible("RADIO_19_USER", false)
    SetRadioStationIsVisible("RADIO_18_90S_ROCK", true)
    SetRadioStationIsVisible("RADIO_17_FUNK", false)
    SetRadioStationIsVisible("RADIO_20_THELAB", false)
    SetRadioStationIsVisible("RADIO_11_TALK_02", false)
    SetRadioStationIsVisible("RADIO_21_DLC_XM17", false)
    SetRadioStationIsVisible("RADIO_22_DLC_BATTLE_MIX1_RADIO", false)
    SetRadioStationIsVisible("RADIO_35_DLC_HEI4_MLR", false)
    SetRadioStationIsVisible("hidden_radio_ifruit", false)
    SetRadioStationIsVisible("RADIO_37_MOTOMAMI", false)
    SetRadioStationIsVisible("RADIO_34_DLC_HEI4_KULT", false)
    SetRadioStationIsVisible("RADIO_36_AUDIOPLAYER", false)
    SetRadioStationIsVisible("RADIO_23_DLC_XM19_RADIO", true)
    
end