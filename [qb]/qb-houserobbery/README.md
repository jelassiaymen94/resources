# qb-houserobbery
House Robberies For QB-Core - Improved with more searchable locations, new interior shell and support for ps-dispatch

## Dependencies

- qb-lockpick: https://github.com/qbcore-framework/qb-lockpick
- qb-skillbar: https://github.com/qbcore-framework/qb-skillbar

- ps-dispatch: https://github.com/Project-Sloth/ps-dispatch

## Installation

Download and install all dependencies.

replace qb-houserobbery in your resources folder with this version.

Naviagte to qb-interior/client/main.lua

search for:      exports('CreateHouseRobbery', function(spawn)

and replace the entire export with this snippet below

```
exports('CreateHouseRobbery', function(spawn)
	local objects = {}
    local POIOffsets = {}
	POIOffsets.exit = json.decode('{"x": 4.90, "y": 4.35, "z": 1.16, "h": 176.61}')
	DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
	RequestModel(`modernhotel_shell`)
	while not HasModelLoaded(`modernhotel_shell`) do
	    Wait(1000)
	end
	local house = CreateObject(`modernhotel_shell`, spawn.x, spawn.y, spawn.z, false, false, false)
    FreezeEntityPosition(house, true)
    objects[#objects+1] = house
	TeleportToInterior(spawn.x + POIOffsets.exit.x, spawn.y + POIOffsets.exit.y, spawn.z + POIOffsets.exit.z, POIOffsets.exit.h)
    return { objects, POIOffsets }
end)

```

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>
