

local radioStations = {}

local waitTime = 100



CreateThread(function()
	
	for i = 0, GetNumUnlockedRadioStations() - 1 do
		radioStations[GetRadioStationName(i)] = 0
        
	end
	SetRadioStationIsVisible("RADIO_04_PUNK", false)
	
	
	while true do
		Wait(waitTime)
		
		SetRadioStationIsVisible("RADIO_02_POP", false)
					
			
	end
end)