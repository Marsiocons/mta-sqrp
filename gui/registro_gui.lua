local x,y = guiGetScreenSize()

function createRegisterDraw()

    dxDrawRectangle ( (x/10)*3, (y/20)*1, (x/10)*4, (y/20)*18, tocolor ( 0, 0, 0, 150 ) )
    dxDrawRectangle ( (x/10)*3.05, (y/20)*1.11, (x/10)*3.9, (y/20)*17.78, tocolor ( 255, 255, 255, 255 ) )
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(0,0,0,255))
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(255,255,255,245))
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, x/15, 0.0, 360.0, tocolor(0,0,0,220))
    dxDrawImage( (x/10)*4.47, (y/20)*2, x/10, x/10, "resources/auth.png" )
    dxDrawLine( (x/20)*7, (y/20)*6, (x/20)*13, (y/20)*6, tocolor(0,0,0,255) )

    dxDrawText("USUarIO", (x/10)*5, (y/20)*7, (x/10)*5, (y/20)*7, tocolor(0,0,0,255), 1, "pricedown", "center", "center" )
    dxDrawText("EmaIl", (x/10)*5, (y/20)*9.5, (x/10)*5, (y/20)*9.5, tocolor(0,0,0,255), 1, "pricedown", "center", "center" )
    dxDrawText("PaSSWOrD", (x/10)*5, (y/20)*12, (x/10)*5, (y/20)*12, tocolor(0,0,0,255), 1, "pricedown", "center", "center" )


    dxDrawRectangle( (x/10)*3.5, (y/20)*15, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*15.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("COnTInUar", (x/10)*5, (y/20)*15.75, (x/10)*5, (y/20)*15.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")

    dxDrawLine( (x/20)*7, (y/20)*16.7, (x/20)*13, (y/20)*16.7, tocolor(0,0,0,255) )

    dxDrawRectangle( (x/10)*3.5, (y/20)*17, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*17.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("SalIr", (x/10)*5, (y/20)*17.75, (x/10)*5, (y/20)*17.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")
end
function createRegisterGui ()

    outputChatBox("Dentro de createRegisterGui")
    
    usuario = guiCreateEdit( 0.35, 0.385, 0.3, 0.05, "", true)
    guiEditSetMaxLength(usuario, 60)

    email = guiCreateEdit( 0.35, 0.515, 0.3, 0.05, "", true)
    guiEditSetMaxLength(email, 40)

    passTextRegister = guiCreateEdit( 0.35, 0.645, 0.3, 0.05, "", true)
    guiEditSetMaxLength(passTextRegister, 64)

    continuar = guiCreateButton( 0.35, 0.75, 0.3, 0.0695, "", true)
    guiSetAlpha(continuar, 0)
    
    backReg = guiCreateButton( 0.35, 0.85, 0.3, 0.0695, "", true)
    guiSetAlpha(backReg, 0)

    guiBringToFront(usuario)
    addEventHandler ( "onClientGUIClick", continuar, playerTryToRegister, false )
    addEventHandler ( "onClientGUIClick", usuario, function() guiBringToFront(usuario) end, false )
    addEventHandler ( "onClientGUIClick", passTextRegister, function() guiBringToFront(passTextRegister) end, false )
    addEventHandler ( "onClientGUIClick", email, function() guiBringToFront(email) end, false )

end

function createCharacterDraw()

    dxDrawRectangle ( (x/10)*3, (y/20)*1, (x/10)*4, (y/20)*18, tocolor ( 0, 0, 0, 150 ) )
    dxDrawRectangle ( (x/10)*3.05, (y/20)*1.11, (x/10)*3.9, (y/20)*17.78, tocolor ( 255, 255, 255, 255 ) )
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(0,0,0,255))
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(255,255,255,245))
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, x/15, 0.0, 360.0, tocolor(0,0,0,220))
    dxDrawImage( (x/10)*4.47, (y/20)*2, x/10, x/10, "resources/auth.png" )
    dxDrawLine( (x/20)*7, (y/20)*6, (x/20)*13, (y/20)*6, tocolor(0,0,0,255) )
    
    dxDrawText ( "Nombre", (x/10)*5, (y/20)*7, (x/10)*5, (y/20)*7, tocolor ( 0, 0, 0, 255 ), 1, "pricedown", "center", "center" )
    dxDrawText ( "Apellido", (x/10)*5, (y/20)*9.5, (x/10)*5, (y/20)*9.5, tocolor ( 0, 0, 0, 255 ), 1, "pricedown", "center", "center" )
    dxDrawText ( "Edad", (x/10)*5, (y/20)*12, (x/10)*5, (y/20)*12, tocolor ( 0, 0, 0, 255 ), 1, "pricedown", "center", "center" )


    dxDrawRectangle( (x/10)*3.5, (y/20)*15, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*15.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("COnTInUar", (x/10)*5, (y/20)*15.75, (x/10)*5, (y/20)*15.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")

    dxDrawLine( (x/20)*7, (y/20)*16.7, (x/20)*13, (y/20)*16.7, tocolor(0,0,0,255) )

    dxDrawRectangle( (x/10)*3.5, (y/20)*17, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*17.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("aTráS", (x/10)*5, (y/20)*17.75, (x/10)*5, (y/20)*17.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")
end
function createCharacterGui()
    outputChatBox("Dentro de createCharacterGui")

    nombre = guiCreateEdit( 0.35, 0.385, 0.3, 0.05, "", true)
    guiEditSetMaxLength(nombre, 60)

    apellido = guiCreateEdit( 0.35, 0.515, 0.3, 0.05, "", true)
    guiEditSetMaxLength(apellido, 40)

    edad = guiCreateEdit( 0.35, 0.645, 0.3, 0.05, "", true)
    guiEditSetMaxLength(edad, 64)

    guiBringToFront(nombre)
    
    ready = guiCreateButton( 0.35, 0.75, 0.3, 0.0695, "", true)
    guiSetAlpha(ready, 0)
    backCharacter = guiCreateButton( 0.35, 0.85, 0.3, 0.0695, "", true)
    guiSetAlpha(backCharacter, 0)

    addEventHandler ( "onClientGUIClick", ready, playerTryCharacter, false )
    addEventHandler ( "onClientGUIClick", nombre, function() guiBringToFront(nombre) end, false )
    addEventHandler ( "onClientGUIClick", apellido, function() guiBringToFront(apellido) end, false )
    addEventHandler ( "onClientGUIClick", edad, function() guiBringToFront(edad) end, false )

end

function createSkinSelectorDraw()

    dxDrawRectangle( 0.0, ((y/10)*0), x, ((y/10)*1), tocolor ( 0, 0, 0, 150 ) )
    dxDrawRectangle( 0.0, ((y/10)*9), x, ((y/10)*10), tocolor ( 0, 0, 0, 150 ) )

    dxDrawCircle( ((x/20)*9), ((y/20)*19), 19, 0.0, 360.0, tocolor ( 255, 255, 255, 250 ))
    dxDrawCircle( ((x/20)*11), ((y/20)*19), 19, 0.0, 360.0, tocolor ( 255, 255, 255, 250 ))

    dxDrawCircle( ((x/20)*9), ((y/20)*19), 18, 0.0, 360.0, tocolor ( 0, 0, 0, 250 ))
    dxDrawCircle( ((x/20)*11), ((y/20)*19), 18, 0.0, 360.0, tocolor ( 0, 0, 0, 250 ))

    dxDrawText("<", ((x/20)*9), ((y/20)*19.1), ((x/20)*9), ((y/20)*19.1), tocolor ( 255, 255, 255, 255 ), 1, "pricedown", "center", "center" )
    dxDrawText(">", ((x/20)*11), ((y/20)*19.1), ((x/20)*11), ((y/20)*19.1), tocolor ( 255, 255, 255, 255 ), 1, "pricedown", "center", "center" )

    dxDrawRectangle( ((x/20)*14), ((y/10)*4), ((x/20)*5.8), ((y/10)*4.9), tocolor ( 0, 0, 0, 150 ) )
    dxDrawRectangle( ((x/20)*14), ((y/10)*4), ((x/20)*5.8), ((y/10)*0.7), tocolor ( 0, 0, 0, 150 ) )

    dxDrawImage( ((x/10)*1), ((y/10)*6), x/11, x/11, "resources/menF.png" )
    dxDrawImage( ((x/10)*2), ((y/10)*6), x/11, x/11, "resources/womenF.png" )

    dxDrawRectangle( ((x/10)*0.98), ((y/10)*7.28), ((x/20)*3.93), ((y/20)*1.38), tocolor ( 255, 255, 255, 150 ) )
    dxDrawRectangle( ((x/10)*1), ((y/10)*7.3), ((x/20)*3.85), ((y/20)*1.3), tocolor ( 0, 0, 0, 200 ) )

    dxDrawText( "I n I c I a r", ((x/10)*2.93), ((y/10)*7.97), ((x/10)*1), ((y/10)*7.3), tocolor ( 255, 255, 255, 255 ),  1, "pricedown", "center", "center"  )


    local skinName = ""
    local descriptionSkin = {}

    if ( getElementData(localPlayer, "skin.sex.id") == "0" ) then
        if (getElementData(localPlayer, "skin.selector.id") == "1") then
            skinName = "El nómade"
            descriptionSkin[1] = "Siempre viviste de acá para"
            descriptionSkin[2] = "allá, saltando de trabajo en"
            descriptionSkin[3] = "trabajo, de ciudad en ciudad."
            descriptionSkin[4] = "Pero llegaste acá esperando una"
            descriptionSkin[5] = "nueva oportunidad,"
            descriptionSkin[6] = "un nuevo trabajo;"
            descriptionSkin[7] = "una nueva vida."
            descriptionSkin[8] = ""
            descriptionSkin[9] = ""
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
        if (getElementData(localPlayer, "skin.selector.id") == "2") then
            skinName = "El Sergio"
            descriptionSkin[1] = "Nunca trabajaste, nunca"
            descriptionSkin[2] = "estudiaste. Te echaron de casa"
            descriptionSkin[3] = "muy chico y por alguna razón"
            descriptionSkin[4] = "seguís vivo. Hace poco saliste"
            descriptionSkin[5] = "de rehabilitación. ¿Será que en"
            descriptionSkin[6] = "esta ocación todo va a salir bien?"
            descriptionSkin[7] = "La gente te grita 'Sergio'"
            descriptionSkin[8] = "porque en años anteriores te"
            descriptionSkin[9] = "vieron vivir junto a una"
            descriptionSkin[10] = "carretilla y una jauría de perros"
            descriptionSkin[11] = "liderada por vos."
        end
        if (getElementData(localPlayer, "skin.selector.id") == "3") then
            skinName = "Nene de mamá"
            descriptionSkin[1] = "Tuviste la suerte de nacer en"
            descriptionSkin[2] = "cuna de oro. Tuviste la"
            descriptionSkin[3] = "oportunidad de estudiar lo que"
            descriptionSkin[4] = "querías. Creés que sabés lo"
            descriptionSkin[5] = "necesario para sobrevivir solo,"
            descriptionSkin[6] = "pero no es así."
            descriptionSkin[7] = "¿o si?"
            descriptionSkin[8] = ""
            descriptionSkin[9] = ""
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
        if (getElementData(localPlayer, "skin.selector.id") == "4") then
            skinName = "El laburante"
            descriptionSkin[1] = "Te enseñaron a obrar desde"
            descriptionSkin[2] = "chico. Sabés como ganarte"
            descriptionSkin[3] = "la vida pero estás en busca"
            descriptionSkin[4] = "de algo más."
            descriptionSkin[5] = "¿Lo vas a encontrar acá?"
            descriptionSkin[6] = ""
            descriptionSkin[7] = ""
            descriptionSkin[8] = ""
            descriptionSkin[9] = ""
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
    end
    if ( getElementData(localPlayer, "skin.sex.id") == "1" ) then
        if (getElementData(localPlayer, "skin.selector.id") == "1") then
            skinName = "La nómade"
            descriptionSkin[1] = "Siempre viviste de acá para"
            descriptionSkin[2] = "allá, saltando de trabajo en"
            descriptionSkin[3] = "trabajo, de ciudad en ciudad."
            descriptionSkin[4] = "Pero llegaste acá esperando una"
            descriptionSkin[5] = "nueva oportunidad,"
            descriptionSkin[6] = "un nuevo trabajo;"
            descriptionSkin[7] = "una nueva vida."
            descriptionSkin[8] = ""
            descriptionSkin[9] = ""
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
        if (getElementData(localPlayer, "skin.selector.id") == "2") then
            skinName = "La Marta"
            descriptionSkin[1] = "Nunca trabajaste, nunca"
            descriptionSkin[2] = "estudiaste. Te echaron de casa"
            descriptionSkin[3] = "muy chica y por alguna razón"
            descriptionSkin[4] = "seguís viva. Hace poco saliste"
            descriptionSkin[5] = "de rehabilitación. ¿Será que en"
            descriptionSkin[6] = "esta ocación todo va a salir bien?"
            descriptionSkin[7] = "La gente te grita 'Marta'"
            descriptionSkin[8] = "porque en épocas anteriores te"
            descriptionSkin[9] = " la pasabas de gira entre boliches."
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
        if (getElementData(localPlayer, "skin.selector.id") == "3") then
            skinName = "Nena de mamá"
            descriptionSkin[1] = "Tuviste la suerte de nacer en"
            descriptionSkin[2] = "cuna de oro. Tuviste la"
            descriptionSkin[3] = "oportunidad de estudiar lo que"
            descriptionSkin[4] = "querías. Creés que sabés lo"
            descriptionSkin[5] = "necesario para sobrevivir sola,"
            descriptionSkin[6] = "pero no es así."
            descriptionSkin[7] = "¿o si?"
            descriptionSkin[8] = ""
            descriptionSkin[9] = ""
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
        if (getElementData(localPlayer, "skin.selector.id") == "4") then
            skinName = "La laburante"
            descriptionSkin[1] = "Te enseñaron a obrar desde"
            descriptionSkin[2] = "chica. Sabés como ganarte"
            descriptionSkin[3] = "la vida pero estás en busca"
            descriptionSkin[4] = "de algo más."
            descriptionSkin[5] = "¿Lo vas a encontrar acá?"
            descriptionSkin[6] = ""
            descriptionSkin[7] = ""
            descriptionSkin[8] = ""
            descriptionSkin[9] = ""
            descriptionSkin[10] = ""
            descriptionSkin[11] = ""
        end
    end

    dxDrawText(descriptionSkin[1], ((x/20)*14), ((y/10)*(5 + 0.35 * 0)), ((x/20)*20), ((y/10)*(5 + 0.35 * 0)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[2], ((x/20)*14), ((y/10)*(5 + 0.35 * 1)), ((x/20)*20), ((y/10)*(5 + 0.35 * 1)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[3], ((x/20)*14), ((y/10)*(5 + 0.35 * 2)), ((x/20)*20), ((y/10)*(5 + 0.35 * 2)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[4], ((x/20)*14), ((y/10)*(5 + 0.35 * 3)), ((x/20)*20), ((y/10)*(5 + 0.35 * 3)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[5], ((x/20)*14), ((y/10)*(5 + 0.35 * 4)), ((x/20)*20), ((y/10)*(5 + 0.35 * 4)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[6], ((x/20)*14), ((y/10)*(5 + 0.35 * 5)), ((x/20)*20), ((y/10)*(5 + 0.35 * 5)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[7], ((x/20)*14), ((y/10)*(5 + 0.35 * 6)), ((x/20)*20), ((y/10)*(5 + 0.35 * 6)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[8], ((x/20)*14), ((y/10)*(5 + 0.35 * 7)), ((x/20)*20), ((y/10)*(5 + 0.35 * 7)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[9], ((x/20)*14), ((y/10)*(5 + 0.35 * 8)), ((x/20)*20), ((y/10)*(5 + 0.35 * 8)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[10], ((x/20)*14), ((y/10)*(5 + 0.35 * 9)), ((x/20)*20), ((y/10)*(5 + 0.35 * 9)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )
    dxDrawText(descriptionSkin[11], ((x/20)*14), ((y/10)*(5 + 0.35 * 10)), ((x/20)*20), ((y/10)*(5 + 0.35 * 10)), tocolor(255, 255, 255, 255), 1, "default", "center", "center" )

    dxDrawText(skinName, ((x/20)*17), ((y/10)*4.35), ((x/20)*17), ((y/10)*4.35), tocolor(27, 140, 20, 255), 1, "default-bold", "center", "center" )
end

function createButtonsSkinSelector()

    buttonLeft = guiCreateButton( 0.4242, 0.9215, 0.051, 0.057, "", true)
    buttonRight = guiCreateButton( 0.5242, 0.9215, 0.051, 0.057, "", true)
    
    buttonMasc = guiCreateButton( 0.105, 0.615, 0.08, 0.095, "", true )
    buttonFem = guiCreateButton( 0.205, 0.615, 0.08, 0.095, "", true )
    selectSkin = guiCreateButton( 0.105, 0.730, 0.185, 0.065, "", true )
    
    guiSetAlpha(buttonLeft, 0)
    guiSetAlpha(buttonRight, 0)
    guiSetAlpha(buttonMasc, 0)
    guiSetAlpha(buttonFem, 0)
    guiSetAlpha(selectSkin, 0)

    addEventHandler("onClientGUIClick", buttonLeft, function() changeSkinPlayer(0) end)
    addEventHandler("onClientGUIClick", buttonRight, function() changeSkinPlayer(1) end)
    addEventHandler("onClientGUIClick", buttonMasc, function() changeSkinPlayer(2) end)
    addEventHandler("onClientGUIClick", buttonFem, function() changeSkinPlayer(3) end)
    addEventHandler("onClientGUIClick", selectSkin, function() changeSkinPlayer(4) end)
    
end

function changeSkinPlayer(option)
    
    if (option == 0) then
        for i = 1, 4, 1 
        do 
            if ( getElementData(localPlayer, "skin.selector.id") == tostring(i) ) then
                if (i-1 == 0) then setElementData(localPlayer, "skin.selector.id", "4")
                else setElementData(localPlayer, "skin.selector.id", tostring(i-1)) end
                break
            end 
        end
    end
    if (option == 1) then
        for i = 1, 4, 1 
        do
            if ( getElementData(localPlayer, "skin.selector.id") == tostring(i) ) then
                if (i+1 == 5) then setElementData(localPlayer, "skin.selector.id", "1")
                else setElementData(localPlayer, "skin.selector.id", tostring(i+1)) end
                break
            end
        end
    end
    if (option == 2) then setElementData(localPlayer, "skin.sex.id", "0") end
    if (option == 3) then setElementData(localPlayer, "skin.sex.id", "1") end
    if (option == 4) then
        local tumpButton = playSound("resources/tump.mp3")
        setSoundVolume(tumpButton, 0.5)
        triggerServerEvent("onPlayerSelectSkin", getLocalPlayer())
        return
    end
    local blipButton = playSound("resources/blip.mp3")
    setSoundVolume(blipButton, 0.5)
    triggerServerEvent("onPlayerClickSelectorSkin", getLocalPlayer(), "")
end


addEvent("playerConnectCreateRegisterGui", true)

addEvent("playerCreateSelectorSkin", true)


addEventHandler("playerConnectCreateRegisterGui", localPlayer, createRegisterGui)

addEventHandler("playerCreateSelectorSkin", localPlayer, createButtonsSkinSelector)

addCommandHandler("prueba", createRegisterGui, false, false)