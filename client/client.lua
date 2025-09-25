local function draw3dText(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(230, 230, 230, 255)
    SetTextScale(0.0, 0.4 * scale)
    SetTextFont(0)
    SetTextCentre(true)
    SetTextOutline()
    SetTextDropshadow(0, 0, 0, 0, 55)

    local offsetCoords = vector3(coords.x, coords.y, coords.z + 0.5)
    SetDrawOrigin(offsetCoords, 0)
    
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

RegisterNetEvent('player_statut:showDisconnect')
AddEventHandler('player_statut:showDisconnect', function(coords, sessionId, actionType, reason)
    -- actionType = "disconnect" | "kick" | "ban"
    local label = "Déconnexion"
    if actionType == "kick" then
        label = "Kick"
    elseif actionType == "ban" then
        label = "Ban"
    end

    local message = ("%s du joueur (%s)"):format(label, sessionId)
    if reason and reason ~= "" then
        message = message .. " : " .. reason
    end

    local displayTime = GetGameTimer() + 50000

    Citizen.CreateThread(function()
        while GetGameTimer() <= displayTime do
            Wait(0)
            draw3dText(coords, message)
        end
    end)
end)