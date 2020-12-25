function inicializarServidor ()

    db_conn = dbConnect( "mysql", "dbname=sqrp_mta_db;host=localhost", "root", "" )
    if (not db_conn) then
        outputDebugString("Error: No se pudo conectar con base de datos.")
    else
        outputDebugString("Éxito al conecetar con base de datos.")
    end
end

function jugadorConectado ()

    hideOldHud(source)
    --showChat(source, false)

    outputChatBox("Dentro de la función 'jugadorConectado'")

    fadeCamera(source, true)
    setCameraMatrix(source, -1378.125, 2612.2294921875, 54.48087310791, -1392.0166015625, 2615.44921875, 55.868511199951)

    setElementData(source, "show.auth.screen", "authVisible")
    triggerClientEvent(source, "playerConnectCreateAuthScreen", source)

end

addEventHandler("onResourceStart", resourceRoot, inicializarServidor)
addEventHandler ("onPlayerJoin", getRootElement(), jugadorConectado)