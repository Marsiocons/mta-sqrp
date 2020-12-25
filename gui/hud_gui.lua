local x,y = guiGetScreenSize()
function createHealthBarr()
    
    local h = tonumber(getElementData(localPlayer, "health.player")) / 100

    dxDrawRectangle( ((x/100)*82), ((y/100)*15), ((x/100)*15.4), ((y/100)*2.3), tocolor(0,0,0,255) )
    dxDrawRectangle( ((x/100)*82.2), ((y/100)*15.2), ((x/100)*15), ((y/100)*1.9), tocolor(255,255,255,190) )
    dxDrawRectangle( ((x/100)*82.2), ((y/100)*15.2), ((x/100)*(15 * h)), ((y/100)*1.9), tocolor(255,0,0,250) )
    
end
function createArmorBarr()
    local b = tonumber(getElementData(localPlayer, "armor.player")) / 100

    dxDrawRectangle( ((x/100)*82), ((y/100)*18), ((x/100)*15.4), ((y/100)*2.3), tocolor(0,0,0,255) )
    dxDrawRectangle( ((x/100)*82.2), ((y/100)*18.2), ((x/100)*15), ((y/100)*1.9), tocolor(255,255,255,190) )
    dxDrawRectangle( ((x/100)*82.2), ((y/100)*18.2), ((x/100)*(15 * b)), ((y/100)*1.9), tocolor(0,131,137,250) )
end
function createIconWeapon()
    dxDrawImage(((x/100)*84.5), ((y/100)*1), (x/10), (x/10), "resources/guns_icons/"..getElementData(localPlayer, "weapon.player")..".png")

end
function createAmmoWeapon()
    ammo = tonumber(getElementData(localPlayer, "weapon.ammo.clip"))
    dxDrawRectangle( ((x/100)*95.5), ((y/100)*1.9), ((x/100)*1.9), ((y/100)* 11), tocolor(0,0,0,255) )
    dxDrawRectangle( ((x/100)*95.7), ((y/100)*2.1), ((x/100)*1.5), ((y/100)* 10.6), tocolor(255,255,255,190) )
    dxDrawRectangle( ((x/100)*95.7), ((y/100)*2.1), ((x/100)*1.5), ((y/100)* (10.6 * ammo)), tocolor(13,163,22,250) )
end
function createPhone()    
    dxDrawRectangle( ((x/10)*8.55), ((y/10)*7.1), ((x/10)*1.15), ((y/10)*2.80), tocolor(0,0,0,150) )

    dxDrawImage( ((x/10)*8.975), ((y/10)*9.57), ((x/100)*3), ((x/100)*3), "resources/phone_icons/home.png", 0, 0, 0, tocolor(255,255,255,255), true )
    dxDrawImage( ((x/10)*8), ((y/10)*7), ((y/10)*3), ((y/10)*3), "resources/phone_icons/phoneSQRP.png", 0, 0, 0, tocolor(0,0,0,255), true)
    dxDrawRectangle( ((x/10)*8.55), ((y/10)*7.35), ((x/10)*1.15), ((y/10)*0.46), tocolor(0,0,0,150) )
    dxDrawText( "12:31", ((x/10)*9.13), ((y/10)*7.62), ((x/10)*9.13), ((y/10)*7.62), tocolor(255,255,255,255), 0.75, "pricedown", "center", "center"  )

    createApps()
   
end
function createApps()
    dxDrawImage( ((x/10)*8.71), ((y/10)*7.9), ((x/100)*3.5), ((x/100)*3.5), "resources/phone_icons/maps.png" )
    dxDrawImage( ((x/10)*9.19), ((y/10)*7.9), ((x/100)*3.5), ((x/100)*3.5), "resources/phone_icons/bank.png" )
    dxDrawImage( ((x/10)*8.71), ((y/10)*8.45), ((x/100)*3.5), ((x/100)*3.5), "resources/phone_icons/message.png" )
    dxDrawImage( ((x/10)*9.19), ((y/10)*8.45), ((x/100)*3.5), ((x/100)*3.5), "resources/phone_icons/phone.png" )
    dxDrawImage( ((x/10)*8.71), ((y/10)*9), ((x/100)*3.5), ((x/100)*3.5), "resources/phone_icons/maps.png" )
    dxDrawImage( ((x/10)*9.19), ((y/10)*9), ((x/100)*3.5), ((x/100)*3.5), "resources/phone_icons/maps.png" )
end
function createGuiApps()
    mapsButton = guiCreateRadioButton( 0.865, 0.77, 0.05, 0.06, "", true )
    bankButton = guiCreateRadioButton( 0.91, 0.77, 0.05, 0.06, "", true )
    messButton = guiCreateRadioButton( 0.865, 0.83, 0.05, 0.06, "", true )
    callButton = guiCreateRadioButton( 0.91, 0.83, 0.05, 0.06, "", true )
    showGuiApps(1)
    addEventHandler("onClientGUIClick", mapsButton, function() playerClickApp(0) end )
    addEventHandler("onClientGUIClick", bankButton, function() playerClickApp(1) end )
    addEventHandler("onClientGUIClick", messButton, function() playerClickApp(2) end )
    addEventHandler("onClientGUIClick", callButton, function() playerClickApp(3) end )
end
function showGuiApps(option)
    if (option == 0) then
        guiSetVisible(mapsButton, true)
        guiSetVisible(bankButton, true)
        guiSetVisible(messButton, true)
        guiSetVisible(callButton, true)
    end
    if (option == 1) then
        guiSetVisible(mapsButton, false)
        guiSetVisible(bankButton,false)
        guiSetVisible(messButton, false)
        guiSetVisible(callButton, false)
    end
end

function playerClickApp(button)
    if ( button == 0 ) then outputChatBox("presioné maps") end
    if ( button == 1 ) then outputChatBox("presioné bank") end
    if ( button == 2 ) then outputChatBox("presioné message") end
    if ( button == 3 ) then outputChatBox("presioné call") end
end
function showHealh()
    setPlayerHudComponentVisible("all", false)
    setElementData(localPlayer, "show.phone", "phoneVisible")
    showCursor(true)
end
function showOldHealth()
    setPlayerHudComponentVisible("all", true)
end