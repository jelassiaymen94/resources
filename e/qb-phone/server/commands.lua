local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Commands.Add("p#", "Provide Phone Number", {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerPed = GetPlayerPed(src)
    local number = Player.PlayerData.charinfo.phone
	local PlayerCoords = GetEntityCoords(PlayerPed)
	for _, v in pairs(QBCore.Functions.GetPlayers()) do
		local TargetPed = GetPlayerPed(v)
		local dist = #(PlayerCoords - GetEntityCoords(TargetPed))

		if dist < 3.0 then
            TriggerClientEvent('chat:addMessage', v, {
                color = { 255, 0, 0},
                multiline = true,
                args = {"Phone #", number}
            })
		end
	end
end)
