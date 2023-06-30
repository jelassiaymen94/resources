

RegisterCommand("guard", function(source)  bodyguard(0, "npcguards") end, false)
RegisterCommand("enemy", function(source)  bodyguard(5, "npcenemy") end, false)

local model = "s_m_m_prisguard_01"
local weapon = 'weapon_smg'
local ammo = 50
local health = 200
local accuracy = 50
local range = 2

function bodyguard(what, guard)
    SetPedRelationshipGroupHash(PlayerPedId(), 'PLAYER')
    AddRelationshipGroup(guard)

    RequestModel(model) while not HasModelLoaded(model) do Wait(0) end
    local enemy = CreatePed(4, model, GetEntityCoords(PlayerPedId()).x, GetEntityCoords(PlayerPedId()).y, GetEntityCoords(PlayerPedId()).z, 0, true, true)
    GiveWeaponToPed(enemy, weapon, ammo, 0, 1)
    SetPedCombatAttributes(enemy, 46, true)
    SetPedCombatAttributes(enemy, 5, true)
    SetPedCombatAbility(enemy, 100)
    SetPedCombatMovement(enemy, 1)
    SetPedAsEnemy(enemy, true)
    SetEntityHealth(enemy, health) 
    SetPedAccuracy(enemy, accuracy) 
    SetPedCombatRange(enemy, range)
    SetPedRelationshipGroupDefaultHash(enemy, guard)
    SetPedRelationshipGroupHash(enemy, guard)
    SetCanAttackFriendly(enemy, true, true)
    SetEntityHeading(enemy, GetEntityCoords(PlayerPedId()).w)

    SetRelationshipBetweenGroups(0, guard, guard)
    SetRelationshipBetweenGroups(what, guard, 'PLAYER')
    SetRelationshipBetweenGroups(what, 'PLAYER', guard)
end