function setSkinPlayer(jugador, skin, tipo)

    if (tipo == 0) then skinType="skin_one" end
    if (tipo == 1) then skinType="skin_two" end
    if (tipo == 3) then skinType="current_skin" end

    local qh = dbQuery(db_conn, "UPDATE `usuarios_data` SET "..skinType.." = ? WHERE name = ?", skin, getPlayerName(jugador))
    local result = dbPoll ( qh, -1 )
    if (result == nil) then outputChatBox("ERROR: Skin no actualizada")
    else outputChatBox("ÉXITO: Usuario registrado") end
    
    if (tipo == 0) or (tipo == 1) then setElementModel(jugador, skin) end
end
function getSkinPlayer(jugador, tipo)
    if (tipo == 0) then skinType = "skin_one" end
    if (tipo == 1) then skinType = "skin_two" end
    if (tipo == 2) then skinType = "current_skin" end
    local qh = dbQuery( db_conn, "SELECT "..skinType.." FROM usuarios_data WHERE name = '" .. getPlayerName(jugador) .. "'")
    local result = dbPoll ( qh, -1 )
    return result[1][skinType]
end
function playerHealth()
    local h = getElementHealth(source)
    local b = getPedArmor(source)
    setElementData(source, "health.player", tostring(h))
    setElementData(source, "armor.player", tostring(b))
    outputChatBox("VIDA = ".. tostring(h))
    outputChatBox("BLINDAJE = ".. tostring(b))
end




addEventHandler("onPlayerDamage", getRootElement(), playerHealth)