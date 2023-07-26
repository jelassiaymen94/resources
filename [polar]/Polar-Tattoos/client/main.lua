local QBCore = exports['qb-core']:GetCoreObject()
local currentTattoos = {}
local cam = nil
local opacity = 1
local Clothing = {}
local Tattoshopprice = {}
local Tattoshoppriceended = {}
local ClothingSaveAs = false
local AllTattooList = json.decode(LoadResourceFile(GetCurrentResourceName(), 'tattoos.json'))
local TattooCats = {
	{"ZONE_HEAD", "Head", {vec(0.0, 0.7, 0.7), vec(0.7, 0.0, 0.7), vec(0.0, -0.7, 0.7), vec(-0.7, 0.0, 0.7)}, vec(0.0, 0.0, 0.5)},
	{"ZONE_LEFT_LEG", "Left Leg", {vec(-0.2, 0.7, -0.7), vec(-0.7, 0.0, -0.7), vec(-0.2, -0.7, -0.7)}, vec(-0.2, 0.0, -0.6)},
	{"ZONE_LEFT_ARM", "Left Arm", {vec(-0.4, 0.5, 0.2), vec(-0.7, 0.0, 0.2), vec(-0.4, -0.5, 0.2)}, vec(-0.2, 0.0, 0.2)},
	{"ZONE_RIGHT_LEG", "Right Leg", {vec(0.2, 0.7, -0.7), vec(0.7, 0.0, -0.7), vec(0.2, -0.7, -0.7)}, vec(0.2, 0.0, -0.6)},
	{"ZONE_TORSO", "Torso", {vec(0.0, 0.7, 0.2), vec(0.0, -0.7, 0.2)}, vec(0.0, 0.0, 0.2)},
	{"ZONE_RIGHT_ARM", "Right Arm", {vec(0.4, 0.5, 0.2), vec(0.7, 0.0, 0.2), vec(0.4, -0.5, 0.2)}, vec(0.2, 0.0, 0.2)},
}
local targetlocs = {
	[1] = vector3(1322.14, -1656.16, 53.16 - 1.12),
    [2] = vector3(326.11, 181.97, 104.47 - 1.12),
    [3] = vector3(-1154.97, -1429.57, 5.84 - 1.12),
    [4] = vector3(-3171.14, 1079.47, 21.72 - 1.12),
  --  [5] = vector3(1867.09, 3747.26, 33.91 - 1.12), -- pillbox
  --  [6] = vector3(-296.83, 6199.8, 32.35 - 1.12), -- viceroy
}
local Shops = {
	vec(1322.6, -1651.9, 51.2),
	vec(-1153.6, -1425.6, 4.9),
	vec(322.1, 180.4, 103.5),
	vec(-3170.0, 1075.0, 20.8),
	vec(1864.6, 3747.7, 33.0),
	vec(-293.7, 6200.0, 31.4)
}
RegisterNetEvent('Polar-Tattoos:Client:ApplyTatoo')
AddEventHandler('Polar-Tattoos:Client:ApplyTatoo', function(tats)
    QBCore.Functions.TriggerCallback('Polar-Tattoos:GetPlayerTattoos', function(tattooList)
        if tattooList then
			ClearPedDecorations(PlayerPedId())
            for k, v in pairs(tattooList) do
                SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
            end
            currentTattoos = tattooList
        end
    end)
end)
--exports['Polar-Tattoos']:Refresh()
exports('Refresh', function()
    QBCore.Functions.TriggerCallback('Polar-Tattoos:GetPlayerTattoos', function(tattooList)
        if tattooList then
			ClearPedDecorations(PlayerPedId())
            for k, v in pairs(tattooList) do
                SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
            end
            currentTattoos = tattooList
        end
    end)
end)

local function refreshTattoos()
	QBCore.Functions.TriggerCallback('Polar-Tattoos:GetPlayerTattoos', function(tattooList)
        if tattooList then
			ClearPedDecorations(PlayerPedId())
            for k, v in pairs(tattooList) do
                SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
            end
            currentTattoos = tattooList
        end
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	Wait(5000)
	refreshTattoos()
	targets()
end)

CreateThread(function()
	AddTextEntry("Tattoos", "Tattoo Shop")
	for k, v in pairs(Shops) do
		local blip = AddBlipForCoord(v)
		SetBlipSprite(blip, 75)
		SetBlipColour(blip, 0)
		SetBlipScale(blip, 0.6)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("Tattoos")
		EndTextCommandSetBlipName(blip)
	end
end)
CreateThread(function()
	targets()
end)
function targets()

	for k, v in pairs(targetlocs) do
        exports['qb-target']:AddBoxZone("tattoshops"..k, vector3(v.x, v.y, v.z), 1.5, 1.5, {
            name = "tattoshops"..k,
            heading = -72,
            debugPoly = false,
            minZ = v.z - 2,
            maxZ = v.z + 2,
        }, {
            options = {
                {
                    type = "client",
                    event = "Polar-Tattoos:Client:GoToMeno",
                    icon = "fa-solid fa-pen",
                    label = "Tattoo Shop",
                }
            },
            distance = 1.5
        })
    end


end


function DrawTattoo(collection, name)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
	for i = 1, opacity do
		SetPedDecoration(PlayerPedId(), collection, name)
	end
end

function GetNaked()
	if not ClothingSaveAs then
		ClothingSaveAs = true
		Clothing[0.1] = {}
		Clothing[0.1]["Prop"] = GetPedPropIndex(PlayerPedId(), 0)
		Clothing[0.1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), 0)

		Clothing[1.1] = {}
		Clothing[1.1]["Prop"] = GetPedPropIndex(PlayerPedId(), 1)
		Clothing[1.1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), 1)

		Clothing[2.1] = {}
		Clothing[2.1]["Prop"] = GetPedPropIndex(PlayerPedId(), 2)
		Clothing[2.1]["Texture"] = GetPedPropTextureIndex(PlayerPedId(), 2)

		Clothing[1] = {}
		Clothing[1]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 1)
		Clothing[1]["Texture"] = GetPedTextureVariation(PlayerPedId(), 1)

		Clothing[3] = {}
		Clothing[3]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 3)
		Clothing[3]["Texture"] = GetPedTextureVariation(PlayerPedId(), 3)

		Clothing[4] = {}
		Clothing[4]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 4)
		Clothing[4]["Texture"] = GetPedTextureVariation(PlayerPedId(), 4)

		Clothing[6] = {}
		Clothing[6]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 6)
		Clothing[6]["Texture"] = GetPedTextureVariation(PlayerPedId(), 6)

		Clothing[7] = {}
		Clothing[7]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 7)
		Clothing[7]["Texture"] = GetPedTextureVariation(PlayerPedId(), 7)

		Clothing[8] = {}
		Clothing[8]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 8)
		Clothing[8]["Texture"] = GetPedTextureVariation(PlayerPedId(), 8)

		Clothing[9] = {}
		Clothing[9]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 9)
		Clothing[9]["Texture"] = GetPedTextureVariation(PlayerPedId(), 9)

		Clothing[10] = {}
		Clothing[10]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 10)
		Clothing[10]["Texture"] = GetPedTextureVariation(PlayerPedId(), 10)

		Clothing[11] = {}
		Clothing[11]["Prop"] = GetPedDrawableVariation(PlayerPedId(), 11)
		Clothing[11]["Texture"] = GetPedTextureVariation(PlayerPedId(), 11)
	end
		if GetEntityModel(PlayerPedId()) == 'mp_m_freemode_01' then
			local nakedMale = {
				outfitData = {
					["pants"]       = { item = 14, texture = 0},  -- Broek
					["arms"]        = { item = 15, texture = 0},  -- Armen
					["t-shirt"]     = { item = 15, texture = 0},  -- T Shirt
					["vest"]        = { item = 0, texture = 0},  -- Body Vest
					["torso2"]      = { item = 15, texture = 0},  -- Jas / Vesten
					["shoes"]       = { item = 5, texture = 0},  -- Schoenen
					["decals"]      = { item = 0, texture = 0},  -- Decals
					["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
					["hat"]         = { item = -1, texture = -1},  -- Pet
					["glass"]       = { item = 0, texture = 0},  -- Bril
					["mask"]         = { item = 0, texture = 0},  -- Masker
				},
			}
			TriggerEvent('qb-clothing:Client:loadOutfit', nakedMale)
		else
			local nakedFemale = {
				outfitData = {
					["pants"]       = { item = 16, texture = 0},  -- Broek
					["arms"]        = { item = 15, texture = 0},  -- Armen
					["t-shirt"]     = { item = -1, texture = 0},  -- T Shirt
					["vest"]        = { item = 0, texture = 0},  -- Body Vest
					["torso2"]      = { item = 101, texture = 1},  -- Jas / Vesten
					["shoes"]       = { item = 5, texture = 0},  -- Schoenen
					["decals"]      = { item = 0, texture = 0},  -- Decals
					["accessory"]   = { item = 0, texture = 0},  -- Nek / Das
					["hat"]         = { item = -1, texture = -1},  -- Pet
					["glass"]       = { item = 0, texture = 0},  -- Bril
					["mask"]         = { item = 0, texture = 0},  -- Masker
				},
			}
			TriggerEvent('qb-clothing:Client:loadOutfit', nakedFemale)
		end
end

function ResetSkin()
	TriggerServerEvent("qb-clothes:loadPlayerSkin")
	Wait(100)
	ClearPedDecorations(PlayerPedId())
	for k, v in pairs(currentTattoos) do
		if v.Count ~= nil then
			for i = 1, v.Count do
				SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
			end
		else
			SetPedDecoration(PlayerPedId(), v.collection, v.nameHash)
		end
	end
end

function ResetSkin2()
	ClothingSaveAs = false
	if json.encode(Clothing) ~= "[]" then
		local resetSkin = {
			outfitData = {
				["pants"]       = { item = Clothing[4]["Prop"], texture = Clothing[4]["Texture"]},  -- Broek
				["arms"]        = { item = Clothing[3]["Prop"], texture = Clothing[3]["Texture"]},  -- Armen
				["t-shirt"]     = { item = Clothing[8]["Prop"], texture = Clothing[8]["Texture"]},  -- T Shirt
				["vest"]        = { item = Clothing[9]["Prop"], texture = Clothing[9]["Texture"]},  -- Body Vest
				["torso2"]      = { item = Clothing[11]["Prop"], texture = Clothing[11]["Texture"]},  -- Jas / Vesten
				["shoes"]       = { item = Clothing[6]["Prop"], texture = Clothing[6]["Texture"]},  -- Schoenen
				["decals"]      = { item = Clothing[10]["Prop"], texture = Clothing[10]["Texture"]},  -- Decals
				["accessory"]   = { item = Clothing[7]["Prop"], texture = Clothing[7]["Texture"]},  -- Nek / Das
				["hat"]         = { item = Clothing[0.1]["Prop"], texture = Clothing[0.1]["Texture"]},  -- Pet
				["glass"]       = { item = Clothing[1.1]["Prop"], texture = Clothing[1.1]["Texture"]},  -- Bril
				["mask"]        = { item = Clothing[1]["Prop"], texture = Clothing[1]["Texture"]},  -- Masker
			},
		}
		TriggerEvent('qb-clothing:Client:loadOutfit', resetSkin)
	end
end

function BuyTattoo(collection, name, label, price)
	QBCore.Functions.TriggerCallback('Polar-Tattoos:PurchaseTattoo', function(success)
		if success then
			table.insert(currentTattoos, {collection = collection, nameHash = name, Count = opacity})
		else
			refreshTattoos()
		end
	end, currentTattoos, price, {collection = collection, nameHash = name, Count = opacity}, GetLabelText(label))
end

function RemoveTattoo(name, label)
	for k, v in pairs(currentTattoos) do
		if v.nameHash == name then
			table.remove(currentTattoos, k)
		end
	end
	TriggerServerEvent("Polar-Tattoos:Server:RemoveTattoo", currentTattoos)
	QBCore.Functions.Notify("You have removed the " .. GetLabelText(label) .. " tattoo", 'success')
end

RegisterNetEvent('Polar-Tattoos:Client:SetaCameraForSell', function(data)
	for k, v in pairs(TattooCats) do
		if v[1] == data.db2[1] then
			if not DoesCamExist(cam) then
				cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
				SetCamActive(cam, true)
				RenderScriptCams(true, false, 0, true, true)
				StopCamShaking(cam, true)
			end
			if GetCamCoord(cam) ~= GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][1]) then
				SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][1]))
				PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), data.db2[4].x, data.db2[4].y, data.db2[4].z))
			end
		end
	end
	Tattoshoppriceended = {
		{
            header = '< Go Back',
            params = {
                event = 'Polar-Tattoos:Client:gobacktattolist'
            }
        },
		{
            header = '🔄 Change Camera',
            params = {
                event = 'Polar-Tattoos:Client:changecamera',
				args = data.db2[1]
            }
        },
	}
	Tattoshoppriceended[#Tattoshoppriceended+1] = {
		header = "Apply tatto",
		txt = "$"..data.db.Price,
		params = {
			event = "Polar-Tattoos:Client:EndOftattoIsaccept",
			args = {["price"] = data.db.Price, ["Collection"] = data.db.Collection, ["HashNameFemale"] = data.db.HashNameFemale, ["HashNameMale"] = data.db.HashNameMale, ["name"] = data.db.Name},
		}
	}

	if GetEntityModel(PlayerPedId()) == 'mp_m_freemode_01' then
		DrawTattoo(data.db.Collection, data.db.HashNameMale)
	else
		DrawTattoo(data.db.Collection, data.db.HashNameFemale)
	end
	exports['qb-menu']:openMenu(Tattoshoppriceended)
end)

local cameraname = 1
RegisterNetEvent('Polar-Tattoos:Client:changecamera', function(data)
	for k, v in pairs(TattooCats) do
		if v[1] == data then
			if not DoesCamExist(cam) then
				cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
				SetCamActive(cam, true)
				RenderScriptCams(true, false, 0, true, true)
				StopCamShaking(cam, true)
			end
			if cameraname == 4 then
				cameraname = 1
			else
				cameraname = cameraname + 1
			end
			if GetCamCoord(cam) ~= GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][cameraname]) then
				SetCamCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[3][cameraname]))
				PointCamAtCoord(cam, GetOffsetFromEntityInWorldCoords(PlayerPedId(), v[4]))
			end
		end
	end
	exports['qb-menu']:openMenu(Tattoshoppriceended)
end)

RegisterNetEvent('Polar-Tattoos:Client:EndOftattoIsaccept', function(data)
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	if GetEntityModel(PlayerPedId()) == 'mp_m_freemode_01' then
		BuyTattoo(data.Collection, data.HashNameMale, data.name, data.price)
	else
		BuyTattoo(data.Collection, data.HashNameFemale, data.name, data.price)
	end
end)

RegisterNetEvent('Polar-Tattoos:Client:gobacktattolist', function()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	refreshTattoos()
	exports['qb-menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent('Polar-Tattoos:Client:Remove', function()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	GetNaked()
	exports['qb-menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent('Polar-Tattoos:Client:Wear', function()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end
	ResetSkin2()
	exports['qb-menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent('Polar-Tattoos:Client:OpenTattooMenu', function(data)
	Tattoshopprice = {
		{
			header = "Tattoos for "..data[2],
			isMenuHeader = true
		},
		{
            header = '< Go Back',
            params = {
                event = 'Polar-Tattoos:Client:GoToMeno'
            }
        },
		--[[{
            header = '✖ Remove clothes',
            params = {
                event = 'Polar-Tattoos:Client:Remove'
            }
        },
		{
            header = '♻ Wear clothes',
            params = {
                event = 'Polar-Tattoos:Client:Wear'
            }
        },]]
	}
	for _, tattoo in pairs(AllTattooList) do
		if tattoo.Zone == data[1] then
			if GetEntityModel(PlayerPedId()) == 'mp_m_freemode_01' then
				if tattoo.HashNameMale ~= '' then
					for k, v in pairs(currentTattoos) do
						if v.nameHash == tattoo.HashNameMale then
							Tattoshopprice[#Tattoshopprice+1] = {
								header = "[✔] "..GetLabelText(tattoo.Name).." (Already have)",
								txt = "Select to Remove",
								params = {
									event = "Polar-Tattoos:Client:DeleteTattoo",
									args = {db = tattoo, db2 = data},
								}
							}
							break
						end
					end
					Tattoshopprice[#Tattoshopprice+1] = {
						header = "["..(#Tattoshopprice+1).."] "..GetLabelText(tattoo.Name),
						txt = "$"..tattoo.Price,
						params = {
							event = "Polar-Tattoos:Client:SetaCameraForSell",
							args = {db = tattoo, db2 = data},
						}
					}
				end
			else
				if tattoo.HashNameFemale ~= '' then
					for k, v in pairs(currentTattoos) do
						if v.nameHash == tattoo.HashNameFemale then
							Tattoshopprice[#Tattoshopprice+1] = {
								header = "[✔] "..GetLabelText(tattoo.Name).." (Already have)",
								txt = "Select to Remove",
								params = {
									event = "Polar-Tattoos:Client:DeleteTattoo",
									args = {db = tattoo, db2 = data},
								}
							}
							break
						end
					end
					Tattoshopprice[#Tattoshopprice+1] = {
						header = "["..(#Tattoshopprice+1).."] "..GetLabelText(tattoo.Name),
						txt = "$"..tattoo.Price,
						params = {
							event = "Polar-Tattoos:Client:SetaCameraForSell",
							args = {db = tattoo, db2 = data},
						}
					}
				end
			end
		end
	end

	Tattoshopprice[#Tattoshopprice+1] = {
		header = "⬅ Leave Tatto Shop",
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	}
	exports['qb-menu']:openMenu(Tattoshopprice)
end)

RegisterNetEvent('Polar-Tattoos:Client:DeleteTattoo', function(data)
	refreshTattoos()
	Wait(100)
	if GetEntityModel(PlayerPedId()) == 'mp_m_freemode_01' then
		RemoveTattoo(data.db.HashNameMale, data.db.Name)
	else
		RemoveTattoo(data.db.HashNameFemale, data.db.Name)
	end
end)

RegisterNetEvent('Polar-Tattoos:Client:settattos', function()
	refreshTattoos()
end)

RegisterNetEvent('Polar-Tattoos:Client:GoToMeno', function(data)
	refreshTattoos()
	if DoesCamExist(cam) then
		DetachCam(cam)
		SetCamActive(cam, false)
		RenderScriptCams(false, false, 0, 1, 0)
		DestroyCam(cam, false)
	end

	local Tattoshoplocal = {
		{
			header = "Tattoo Shop",
			isMenuHeader = true
		},
	}
	for k, v in pairs(TattooCats) do
		Tattoshoplocal[#Tattoshoplocal+1] = {
			header = v[2],
			txt = "Tattoo for "..v[2],
			params = {
				event = "Polar-Tattoos:Client:OpenTattooMenu",
				args = v,
			}
		}
	end

	Tattoshoplocal[#Tattoshoplocal+1] = {
		header = "⬅ Leave Tatto Shop",
		txt = "",
		params = {
			event = "qb-menu:closeMenu",
		}
	}
	exports['qb-menu']:openMenu(Tattoshoplocal)
end)


local function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
