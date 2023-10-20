Citizen.CreateThread(function()
	local uptimeMinute, uptimeHour, uptime = 0, 0, ''

	

	while true do
		Citizen.Wait(1000 * 60) -- every minute
		uptimeMinute = uptimeMinute + 1

		if uptimeMinute == 60 then
			uptimeMinute = 0
			uptimeHour = uptimeHour + 1
		end

		uptime = string.format("%02dh %02dm", uptimeHour, uptimeMinute)
		SetConvarServerInfo('Age', "18+")
		SetConvarServerInfo('Discord', "https://discord.gg/EZrRne8Bt3")
		SetConvarServerInfo('Microphone', "Required")
		SetConvarServerInfo('Roleplay', "Serious RP")
		SetConvarServerInfo('Uptime', uptime)


	
	end
end)
