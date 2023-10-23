local QBCore = exports['qb-core']:GetCoreObject()

local xSound = exports.xsound
previousSongs = {}
CurrentBooths = {}

RegisterNetEvent('qb-djbooth:server:playMusic', function(song, zoneNum)
    local src = source
	local coords = GetEntityCoords(ped)
	local Booth = Config.DJLocations[zoneNum]
	local zoneLabel = ""
	if Booth.job then zoneLabel = Config.DJLocations[zoneNum].job..zoneNum
	elseif Booth.gang then zoneLabel = Config.DJLocations[zoneNum].gang..zoneNum end
	if not previousSongs[zoneLabel] then previousSongs[zoneLabel] = { [1] = song, }
	elseif previousSongs[zoneLabel] then
		local songList = previousSongs[zoneLabel]
		--if not songList[#songList] == song then --Stopped adding NEW links to the list so disabled for now..
			songList[#songList+1] = song
			previousSongs[zoneLabel] = songList
		--end
	end
	local bCoords = Booth.coords
	if Booth.soundLoc then -- If soundLoc is found, change the location of the music
		bcoords = Booth.soundLoc
	end
	local vol = Booth.DefaultVolume
	if Booth.CurrentVolume then vol = Booth.CurrentVolume end
    xSound:PlayUrlPos(-1, zoneLabel, song, vol, bCoords)
    xSound:Distance(-1, zoneLabel, Booth.radius)
    Config.DJLocations[zoneNum].playing = true
    TriggerClientEvent('qb-djbooth:client:playMusic', src, { zone = zoneNum })
end)

RegisterNetEvent('qb-djbooth:server:stopMusic', function(data)
    local src = source
	local zoneLabel = ""
	if Config.DJLocations[data.zoneNum].job then zoneLabel = Config.DJLocations[data.zoneNum].job..data.zoneNum
	elseif Config.DJLocations[data.zoneNum].gang then zoneLabel = Config.DJLocations[data.zoneNum].gang..data.zoneNum end
    if Config.DJLocations[data.zoneNum].playing then
        Config.DJLocations[data.zoneNum].playing = nil
        Config.DJLocations[data.zoneNum].CurrentVolume = nil
        xSound:Destroy(-1, zoneLabel)
    end
    TriggerClientEvent('qb-djbooth:client:playMusic', src, { zone = data.zoneNum })
end)

RegisterNetEvent('qb-djbooth:server:pauseMusic', function(data)
    local src = source
	local zoneLabel = ""
	if Config.DJLocations[data.zoneNum].job then zoneLabel = Config.DJLocations[data.zoneNum].job..data.zoneNum
	elseif Config.DJLocations[data.zoneNum].gang then zoneLabel = Config.DJLocations[data.zoneNum].gang..data.zoneNum end
    if Config.DJLocations[data.zoneNum].playing then
        Config.DJLocations[data.zoneNum].playing = nil
        xSound:Pause(-1, zoneLabel)
    end
    TriggerClientEvent('qb-djbooth:client:playMusic', src, { zone = data.zoneNum })
end)

RegisterNetEvent('qb-djbooth:server:resumeMusic', function(data)
    local src = source
	local zoneLabel = ""
	if Config.DJLocations[data.zoneNum].job then zoneLabel = Config.DJLocations[data.zoneNum].job..data.zoneNum
	elseif Config.DJLocations[data.zoneNum].gang then zoneLabel = Config.DJLocations[data.zoneNum].gang..data.zoneNum end
    if not Config.DJLocations[data.zoneNum].playing then
        Config.DJLocations[data.zoneNum].playing = true
        xSound:Resume(-1, zoneLabel)
    end
    TriggerClientEvent('qb-djbooth:client:playMusic', src, { zone = data.zoneNum })
end)

RegisterNetEvent('qb-djbooth:server:changeVolume', function(volume, zoneNum)
    local src = source
	local zoneLabel = ""
	if Config.DJLocations[zoneNum].job then zoneLabel = Config.DJLocations[zoneNum].job..zoneNum
	elseif Config.DJLocations[zoneNum].gang then zoneLabel = Config.DJLocations[zoneNum].gang..zoneNum end
    if not tonumber(volume) then return end
    if Config.DJLocations[zoneNum].playing then
        xSound:setVolume(-1, zoneLabel, volume)
		Config.DJLocations[zoneNum].CurrentVolume = volume
    end
    TriggerClientEvent('qb-djbooth:client:playMusic', src, { zone = zoneNum })
end)

QBCore.Functions.CreateCallback('qb-djbooth:songInfo', function(source, cb) cb(previousSongs) end)

-- I was asked about adding support for a city blackout script
-- This is for that
RegisterNetEvent("qb-djbooth:server:DestoryAll", function()
	for i = 1, #Config.DJLocations do
		if Config.DJLocations[i].playing then
			local zoneLabel = ""
			if Config.DJLocations[i].job then zoneLabel = Config.DJLocations[i].job..i
			elseif Config.DJLocations[i].gang then zoneLabel = Config.DJLocations[i].gang..i end
			xSound:Destroy(-1, zoneLabel)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
	TriggerEvent("qb-djbooth:server:DestoryAll")
end)