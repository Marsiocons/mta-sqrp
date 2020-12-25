function playerTryToLogin ()
    outputChatBox("Enviando información a server-side")
    local blipLogin = playSound("resources/sounds/tump.mp3")
    triggerServerEvent("onPlayerTryToLogin", getLocalPlayer(), guiGetText(usuarioLog), guiGetText(passTextLog))
end

function wrongPassword()
    outputChatBox("Usuario o contraseña incorrectos")
end

addEvent("passwordClientIsIN", true)


addEventHandler("passwordClientIsIN", localPlayer, wrongPassword)