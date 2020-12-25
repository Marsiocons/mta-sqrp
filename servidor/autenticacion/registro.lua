function registrarJugador(usuario)

    outputChatBox("Usuario registrado con éxito!")

    
end

function playerTryToRegister(usuario, email, pass)

    outputChatBox("dentro de playerTryToRegister(server-side)")
    if ( isEmpty(usuario) or isEmpty(email) or isEmpty(pass) ) then
        triggerClientEvent ( source, "passTextIncomplete", source )
        return
    end
    if ( string.len(usuario) < 4 ) or ( string.len(usuario) > 16 ) then
        outputChatBox("El nombre de usuario debe tener entre 4 y 16 carácteres.")
        return
    end
    if (emailIsInCorrect(email)) then outputChatBox("Mail wrong") return end
    if (isPassCorrect(pass) == false) then outputChatBox("La contraseña debe tener entre 6 y 32 carácteres") return end

    local qh = dbQuery(db_conn, "SELECT pass FROM usuarios_data WHERE user = '" ..tostring(usuario).. "'" )
    local result = dbPoll( qh, -1 )

    if (result[1] ~= nil) then 
        dbFree(qh)
        outputChatBox("El usuario ingresado ya existe en la base de datos")
        return
    end


    setElementData(source, "usuario", tostring(usuario))
    setElementData(source, "pass", tostring(pass))
    setElementData(source, "email", tostring(email))

    setElementData(source, "show.register.gui", "registerNotVisible")
    setElementData(source, "show.character.gui", "characterVisible")
    triggerClientEvent ( source, "hideClientRegisterGui", source )
end

function playerTryToCharacter(nombre, apellido, edad)

    if ( isEmpty(nombre) ) or ( isEmpty(apellido) ) or ( isEmpty(edad) ) then
        triggerClientEvent ( source, "passTextIncomplete", source )
        return
    end
    if ( string.len(nombre) < 4 ) or ( string.len(nombre) > 11 ) then
        outputChatBox("El nombre debe tener entre 4 y 11 carácteres")
        return
    end
    if ( string.len(apellido) < 4 ) or ( string.len(apellido) > 11 ) then
        outputChatBox("El apellido debe tener entre 4 y 11 carácteres")
        return
    end
    if ( tonumber(edad) == nil ) or ( tonumber(edad) < 16) or ( tonumber(edad) > 80 ) then
        outputChatBox("La edad tiene que ser un número entre 16 y 80")
        return
    end

    nameCharacter = tostring(nombre) .."_".. tostring(apellido)

    setElementData(source, "name", tostring(nameCharacter))
    setElementData(source, "edad", tostring(edad))

    local qh = dbQuery(db_conn, "INSERT INTO `usuarios_data` (user, name, email, edad, pass, current_skin, skin_one, skin_two) VALUES (?,?,?,?,?,?,?,?)",
     getElementData(source, "usuario"), getElementData(source, "name"), getElementData(source, "email"), tonumber(getElementData(source, "edad")), getElementData(source, "pass"),0,0,0)
    local result = dbPoll ( qh, -1 )
    if (result == nil) then outputChatBox("Usuario no registrado")
    else
        outputChatBox("Usuario registrado")

        setElementData(source, "show.character.gui", "characterNotVisible")
        selectorSkinPlayer(source)
        setPlayerName(source, nameCharacter)
        triggerClientEvent(source, "hideClientCharacterGui", source)

        removeElementData(source, "usuario")
        removeElementData(source, "pass")
        removeElementData(source, "email")
        removeElementData(source, "name")
        removeElementData(source, "edad")
        outputChatBox("ElementData eliminados")
    end
end

function selectorSkinPlayer(player)

    local xP = -1615.8623046875
    local yP = 2662.3291015625
    local zP = 55.007167816162
    local rP = 101.18835449219
    local xC = -1620.1328125
    local yC = 2661.939453125
    local zC = 56.000747680664

    spawnPlayer(player, xP, yP, zP, rP, 0, 0, 1)
    setCameraMatrix(player, xC, yC, zC, xP, yP, zP+0.5)
    setControlEnabled(player, false)
    hideOldHud(player)
    
    showChat(player, false)
    showCursor(player, true)

    setElementData(player, "show.selector.skin", "selectorSkinVisible")
    setElementData(player, "skin.selector.id", "1")
    setElementData(player, "skin.sex.id", "0")

    triggerEvent("onPlayerClickSelectorSkin", player)
    triggerClientEvent(player, "playerCreateSelectorSkin", player)
end

function changePlayerSelectorSkin()

    skinsClient = {}
    skinsClient[1] = {72, 134, 188, 158}
    skinsClient[2] = {169, 131, 192, 198}

    for i = 1, 4, 1
    do
        if ( getElementData(source, "skin.sex.id") == "0" ) then

            if ( getElementData(source, "skin.selector.id") == tostring(i) ) then
                setElementModel(source, skinsClient[1][i])
                break
            end
        end
        if ( getElementData(source, "skin.sex.id") == "1" ) then

            if ( getElementData(source, "skin.selector.id") == tostring(i) ) then
                setElementModel(source, skinsClient[2][i])
                break
            end
        end
    end
end
function playerSelectSkin()
    local skin = 0
    for i = 1, 4, 1
    do
        if ( getElementData(source, "skin.sex.id") == "0" ) then
            if ( getElementData(source, "skin.selector.id") == tostring(i) ) then
                skin = skinsClient[1][i]
                spawnThePlayer(source, -1465.200683, 2608.702148, 55.835937, 182, skin)
                break
            end
        end
        if ( getElementData(source, "skin.sex.id") == "1" ) then
            if ( getElementData(source, "skin.selector.id") == tostring(i) ) then
                skin = skinsClient[2][i]
                spawnThePlayer(source, -1465.200683, 2608.702148, 55.835937, 182, skin)
                break
            end
        end
    end
    setSkinPlayer(source, skin, 0)
    setElementData(source, "show.selector.skin", "selectorNotSkinVisible")
end

addEvent("onPlayerTryToRegister", true)
addEvent("onPlayerTryToCharacter", true)
addEvent("onPlayerClickSelectorSkin", true)
addEvent("onPlayerSelectSkin", true)

addEventHandler("onPlayerTryToRegister", getRootElement(), playerTryToRegister)
addEventHandler("onPlayerTryToCharacter", getRootElement(), playerTryToCharacter)
addEventHandler("onPlayerClickSelectorSkin", getRootElement(), changePlayerSelectorSkin)
addEventHandler("onPlayerSelectSkin", getRootElement(), playerSelectSkin)