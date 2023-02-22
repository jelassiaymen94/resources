# ivs-spawn

# Support Discord - https://discord.gg/ivs

## Usage
> TriggerEvent('ivs_spawns:openMenu', lastLocation)
<br>
"lastLocation" can be false or if you have the users last coords you can put them there

## Config

LastLocation (Boolean) - Determines whether the last location button is available

DefaultSpawn (vector3) - Default location, if player spawns without a last location set

Locations - table that holds all data for ui
- top - Margin from top (in pixels)
- left - Margin from left (in pixels)
- label - Pin label
- x,y,z - location coordinates
