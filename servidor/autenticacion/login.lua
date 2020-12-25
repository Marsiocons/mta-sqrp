function playerTryToLogin(usuario, password)

    if (isEmpty(password)) then triggerClientEvent ( source, "passTextIncomplete", source ) return end

    local qh = dbQuery( db_conn, "SELECT pass FROM usuarios_data WHERE user = '" .. usuario .. "'")
    local result = dbPoll ( qh, 10 )

    if ( result[1] == nil ) then
        triggerClientEvent ( source, "passwordClientIsIN", source )
        return
    end
    if ( password ~= result[1]["pass"] ) then
        triggerClientEvent(source, "passwordClientIsIn", source)
        return
    end

    qh = dbQuery( db_conn, "SELECT name FROM usuarios_data WHERE user = '" .. usuario .. "'" )
    result = dbPoll(qh, 10)

    local name = result[1]["name"]

    triggerClientEvent ( source, "hideClientLoginGui", source )
    setElementData(source, "show.login.gui", "loginNotVisible")
    setPlayerName(source, name)
    local skinActual = getSkinPlayer(source, 2)
    local skin = getSkinPlayer(source, skinActual)
    spawnThePlayer(source, -1465.200683, 2608.702148, 55.835937, 182, skin)
end


addEvent("onPlayerTryToLogin", true)


addEventHandler("onPlayerTryToLogin", getRootElement(), playerTryToLogin)