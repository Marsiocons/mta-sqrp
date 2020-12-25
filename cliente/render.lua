function drawStuff()
    if (getElementData(localPlayer, "show.login.gui") == "loginVisible") then createLoginDraw() end
    if (getElementData(localPlayer, "show.register.gui") == "registerVisible") then createRegisterDraw() end
    if (getElementData(localPlayer, "show.selector.skin") == "selectorSkinVisible") then createSkinSelectorDraw() end
    if (getElementData(localPlayer, "show.hud.gui") == "hudVisible") then
        createHealthBarr()
        createIconWeapon()
        createArmorBarr()
        if (getElementData(localPlayer, "show.ammo") == "ammoVisible") then createAmmoWeapon() end
    end
    if (getElementData(localPlayer, "show.phone") == "phoneVisible") then createPhone() end
    if (getElementData(localPlayer, "show.character.gui") == "characterVisible") then createCharacterDraw() end
    if (getElementData(localPlayer, "show.auth.screen") == "authVisible") then authScreenDraw() end
end

addEventHandler("onClientRender", root, drawStuff)