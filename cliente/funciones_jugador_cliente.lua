function setVisibleLoginGui (option)

    if (option) then
        guiSetVisible(usuarioLog, true)
        guiSetVisible(passTextLog, true)
        guiSetVisible(iniciar, false)
        guiSetVisible(atrasLog, false)
    else
        guiSetVisible(usuarioLog, false)
        guiSetVisible(passTextLog, false)
        guiSetVisible(iniciar, false)
        guiSetVisible(atrasLog, false)
        showCursor(false)
        stopSound(mainTheme)
    end
end

function setVisibleRegisterGui(option)
    if (option) then
        guiSetVisible(continuar, true)
        guiSetVisible(email, true)
        guiSetVisible(passTextRegister, true)
        guiSetVisible(usuario, true)
    else
        guiSetVisible(continuar, false)
        guiSetVisible(email, false)
        guiSetVisible(passTextRegister, false)
        guiSetVisible(usuario, false)
        createCharacterGui()
    end
end

function setVisibleCharacterGui(option)
    if (option) then
        guiSetVisible(ready, true)
        guiSetVisible(nombre, true)
        guiSetVisible(apellido, true)
        guiSetVisible(edad, true)
    else
        guiSetVisible(ready, false)
        guiSetVisible(nombre, false)
        guiSetVisible(apellido, false)
        guiSetVisible(edad, false)
    end
end

function editTextIncomplete ()
    outputChatBox("Algún campo está vacío o contiene espacios.")
end

function playerPressKey(button, press)
    if (press) and (button == "m") then
        if (getElementData(localPlayer, "show.selector.skin") == "selectorSkinVisible") then return end
        if (getElementData(localPlayer, "show.character.gui") == "characterVisible") then return end
        if (getElementData(localPlayer, "show.register.gui") == "registerVisible") then return end
        if (getElementData(localPlayer, "show.login.gui") == "loginVisible") then return end
        if (isChatBoxInputActive()) then return end
        
        if ( getElementData(localPlayer, "show.phone") == "phoneVisible") then
            setElementData(localPlayer, "show.phone", "phoneNotVisible")
            showCursor(false)
            showGuiApps(1)
        else setElementData(localPlayer, "show.phone", "phoneVisible")
            showCursor(true)
            showGuiApps(0)
        end
    end
end
function playerResourceStart()
    mainTheme = playSound("resources/sounds/main_theme_b.mp3", true)
    setSoundVolume(mainTheme, 0.2)
end

--====================================  Pantalla Inicio =====================================--

function authScreenDraw()
    local x,y = guiGetScreenSize()
    dxDrawRectangle ( (x/10)*3, (y/20)*1, (x/10)*4, (y/20)*18, tocolor ( 0, 0, 0, 150 ) )
    dxDrawRectangle ( (x/10)*3.05, (y/20)*1.11, (x/10)*3.9, (y/20)*17.78, tocolor ( 255, 255, 255, 255 ) )
    
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(0,0,0,255))
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(255,255,255,245))

    dxDrawCircle((x/10)*4.98, (y/20)*3.5, x/15, 0.0, 360.0, tocolor(0,0,0,220))
    dxDrawImage( (x/10)*4.47, (y/20)*2, x/10, x/10, "resources/auth.png" )

    dxDrawLine( (x/20)*7, (y/20)*6, (x/20)*13, (y/20)*6, tocolor(0,0,0,255) )


    -- INICIAR SESIÓN --
    dxDrawRectangle( (x/10)*3.5, (y/20)*7, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*7.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("InICIar SESIÓn", (x/10)*5, (y/20)*7.75, (x/10)*5, (y/20)*7.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")

    -- REGISTRAR CUENTA --
    dxDrawRectangle( (x/10)*3.5, (y/20)*8.6, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*8.68, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("rEGISTrarSE", (x/10)*5, (y/20)*9.3, (x/10)*5, (y/20)*9.3, tocolor(0,0,0,255), 1, "pricedown", "center", "center")


    dxDrawLine( (x/20)*7, (y/20)*11, (x/20)*13, (y/20)*11, tocolor(0,0,0,255) )

    -- SALIR --
    dxDrawRectangle( (x/10)*3.5, (y/20)*12, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*12.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("SalIr", (x/10)*5, (y/20)*12.75, (x/10)*5, (y/20)*12.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")

end
function authScreenGui()
    login = guiCreateButton( 0.35, 0.35, 0.3, 0.069, "", true )
    register = guiCreateButton( 0.35, 0.43, 0.3, 0.069, "", true )
    exit = guiCreateButton( 0.35, 0.6, 0.3, 0.069, "", true )

    guiSetAlpha(login, 0)
    guiSetAlpha(register, 0)
    guiSetAlpha(exit, 0)

    showCursor(true)

    outputChatBox("auth screen gui created")

    addEventHandler("onClientGUIClick", login, function() authButtonClick(0) end, false )
    addEventHandler("onClientGUIClick", register, function() authButtonClick(1) end, false )
    addEventHandler("onClientGUIClick", exit, function() authButtonClick(2) end, false )
end
function authButtonClick(option)

    if (option == 0) then
        outputChatBox("clickee INICIAR SESION")
        setElementData(getLocalPlayer(), "show.auth.screen", "authNotVisible")
        showAuthScreen(false)
        setElementData(getLocalPlayer(), "show.login.gui", "loginVisible")
        createLoginGui()
    end
    if(option == 1) then
        outputChatBox("clickee REGISTRARME")
        setElementData(getLocalPlayer(), "show.auth.screen", "authNotVisible")
        showAuthScreen(false)
        setElementData(getLocalPlayer(), "show.register.gui", "registerVisible")
        createRegisterGui()
    end
    if (option == 2) then
        outputChatBox("clickee SALIR")
    end

end
function showAuthScreen(option) 
    guiSetVisible(login, option)
    guiSetVisible(register, option)
    guiSetVisible(exit, option)
end


addEvent("hideClientLoginGui", true)
addEvent("hideClientRegisterGui", true)
addEvent("hideClientCharacterGui", true)
addEvent("passTextIncomplete", true)
addEvent("playerConnectCreateAuthScreen", true)


addEventHandler("passTextIncomplete", localPlayer, editTextIncomplete)
addEventHandler("hideClientLoginGui", localPlayer, function() setVisibleLoginGui(false) end)
addEventHandler("hideClientRegisterGui", localPlayer, function() setVisibleRegisterGui(false) end)
addEventHandler("hideClientCharacterGui", localPlayer, function() setVisibleCharacterGui(false) end)
addEventHandler("onClientKey", root, playerPressKey)
addEventHandler("onClientResourceStart", root, playerResourceStart)
addEventHandler("playerConnectCreateAuthScreen", localPlayer, authScreenGui)