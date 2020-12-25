function playerTryToRegister ()
    outputChatBox("Enviando información a server-side")
    triggerServerEvent("onPlayerTryToRegister", getLocalPlayer(), guiGetText(usuario), guiGetText(email), guiGetText(passTextRegister) )


end

function editTextUsuarioRegister ( button, state, absoluteX, absoluteY )
    setTimer(guiBringToFront, 150, 1, usuario)
end
function editTextEmailRegister ( button, state, absoluteX, absoluteY )
    setTimer(guiBringToFront, 150, 1, email)
end
function editTextPassRegister( button, state, absoluteX, absoluteY )
    setTimer(guiBringToFront, 150, 1, passTextRegister)
end

function playerTryCharacter()
    outputChatBox("Enviando información a server-side")
    triggerServerEvent("onPlayerTryToCharacter", getLocalPlayer(), guiGetText(nombre), guiGetText(apellido), guiGetText(edad) )
end

function editTextNameCharacter (button, state, absoluteX, absoluteY)
    setTimer(guiBringToFront, 150, 1, name)
end

function editTextSurnameCharacter (button, state, absoluteX, absoluteY)
    setTimer(guiBringToFront, 150, 1, surname)
end

function editTextAgeCharacter (button, state, absoluteX, absoluteY)
    setTimer(guiBringToFront, 150, 1, edad)
end