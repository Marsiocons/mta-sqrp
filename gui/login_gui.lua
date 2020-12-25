function createLoginDraw()
    local x,y = guiGetScreenSize()

    dxDrawRectangle ( (x/10)*3, (y/20)*1, (x/10)*4, (y/20)*18, tocolor ( 0, 0, 0, 150 ) )
    dxDrawRectangle ( (x/10)*3.05, (y/20)*1.11, (x/10)*3.9, (y/20)*17.78, tocolor ( 255, 255, 255, 255 ) )
    
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(0,0,0,255))
    dxDrawCircle((x/10)*4.98, (y/20)*3.5, (x/15)*1.1, 0.0, 360.0, tocolor(255,255,255,245))

    dxDrawCircle((x/10)*4.98, (y/20)*3.5, x/15, 0.0, 360.0, tocolor(0,0,0,220))
    dxDrawImage( (x/10)*4.47, (y/20)*2, x/10, x/10, "resources/auth.png" )

    dxDrawLine( (x/20)*7, (y/20)*6, (x/20)*13, (y/20)*6, tocolor(0,0,0,255) )

    dxDrawText("USUarIO", (x/10)*5, (y/20)*7, (x/10)*5, (y/20)*7, tocolor(0,0,0,255), 1, "pricedown", "center", "center" )
    dxDrawText("COnTraSEña", (x/10)*5, (y/20)*9.5, (x/10)*5, (y/20)*9.5, tocolor(0,0,0,255), 1, "pricedown", "center", "center" )


    dxDrawRectangle( (x/10)*3.5, (y/20)*12, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*12.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("InICIar", (x/10)*5, (y/20)*12.75, (x/10)*5, (y/20)*12.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")

    dxDrawLine( (x/20)*7, (y/20)*14, (x/20)*13, (y/20)*14, tocolor(0,0,0,255) )

 
    dxDrawRectangle( (x/10)*3.5, (y/20)*15, (x/10)*3, (y/20)*1.4, tocolor(0,0,0,255) )
    dxDrawRectangle( (x/10)*3.53, (y/20)*15.1, (x/10)*2.94, (y/20)*1.23, tocolor(255,255,255,245) )
    dxDrawText("aTráS", (x/10)*5, (y/20)*15.75, (x/10)*5, (y/20)*15.75, tocolor(0,0,0,255), 1, "pricedown", "center", "center")


end
function createLoginGui ()

    usuarioLog = guiCreateEdit( 0.35, 0.385, 0.3, 0.05, "", true)
    guiEditSetMaxLength(usuarioLog, 40)  
    
    passTextLog = guiCreateEdit( 0.35, 0.515, 0.3, 0.05, "", true)
    guiEditSetMaxLength(passTextLog, 40)

    guiBringToFront(usuarioLog)
    
    iniciar = guiCreateButton( 0.35, 0.601, 0.3, 0.0695, "", true)
    guiSetAlpha(iniciar, 0)
    atrasLog = guiCreateButton( 0.35, 0.75, 0.3, 0.0695, "", true)
    guiSetAlpha(atrasLog, 0)

    
    addEventHandler ( "onClientGUIClick", iniciar, playerTryToLogin, false )
    addEventHandler ( "onClientGUIClick", usuarioLog, function() guiBringToFront(usuarioLog) end, false )
    addEventHandler ( "onClientGUIClick", passTextLog, function() guiBringToFront(passTextLog) end, false )


end

addEvent( "playerConnectCreateLoginGui", true )
addEventHandler( "playerConnectCreateLoginGui", localPlayer, createLoginGui )