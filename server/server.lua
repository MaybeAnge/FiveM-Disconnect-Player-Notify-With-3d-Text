AddEventHandler('playerDropped', function(reason)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    TriggerClientEvent('player_statut:showDisconnect', -1, coords, src)
end)

RegisterNetEvent("player_statut:displayKick")
AddEventHandler("player_statut:displayKick", function(targetId)
    if GetPlayerPed(targetId) and DoesEntityExist(GetPlayerPed(targetId)) then
        local coords = GetEntityCoords(GetPlayerPed(targetId))
        TriggerClientEvent("player_statut:showDisconnect", -1, coords, targetId, "kick")
    end
end)

RegisterNetEvent("player_statut:displayBan")
AddEventHandler("player_statut:displayBan", function(targetId)
    if GetPlayerPed(targetId) and DoesEntityExist(GetPlayerPed(targetId)) then
        local coords = GetEntityCoords(GetPlayerPed(targetId))
        TriggerClientEvent("player_statut:showDisconnect", -1, coords, targetId, "ban")
    end
end)