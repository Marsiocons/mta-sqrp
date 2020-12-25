function isEmpty(text)
    if (text == "") or (text == nil) or (text == false) or (string.find(text, "%s") ) then return true
    else return false end
end

function emailIsInCorrect (email)
    if ( string.find(email, "@") )  and ( string.find(email, "%.") ) and ( string.len(email) >= 5 )  then return false
    else return true end
end

function isAFireWeapon(player, weapon)
    local armaBlanca = { 0,1,2,3,4,5,6,7,8,9,10,11,12,14,15 }

    local valido = false
    for i = 1, 16, 1
    do
        if (weapon == armaBlanca[i]) then valido = false
            break
        else valido = true end
    end
    return valido
end

function isPassCorrect(pass)
    if (string.len(pass) >= 6) and (string.len(pass) <= 32 ) then return true
    else return false end
end

function setControlEnabled(player, option)
    if (option) then
        toggleAllControls(player, true)
        outputChatBox("Controles activados!")
    else
        toggleAllControls(player, false)
        outputChatBox("Controles desactivados!")
    end
end

function spawnThePlayer (jugador, coorX, coorY, coorZ, coorR, skin)
    spawnPlayer (jugador, coorX, coorY, coorZ, coorR, skin)
    fadeCamera (jugador, true)
    setCameraTarget (jugador)
    hideOldHud(jugador)
    showCursor(jugador, false)
    showChat(jugador, true)
    setControlEnabled(jugador, true)

    local h = getElementHealth(jugador)
    local b = getPedArmor(jugador)
    setElementData(jugador, "health.player", tostring(h))
    setElementData(jugador, "armor.player", tostring(b))
    setElementData(source, "weapon.player", "0")
    setElementData(jugador, "show.hud.gui", "hudVisible")
end

function jugadorSpawneado (localPlayer)

    outputChatBox("Jugador spawneado!")

end

function hideOldHud(player)
    setPlayerHudComponentVisible(player, "all", false)
end
function showOldHud(player)
    setPlayerHudComponentVisible(player, "all", true)
end

function playerWeaponSwitch(previousWeaponID, currentWeaponID)
    setElementData(source, "weapon.player", tostring(currentWeaponID))
    if ( isAFireWeapon(source, currentWeaponID) ) then setElementData(source, "show.ammo", "ammoVisible")
    else setElementData(source, "show.ammo", "ammoNotVisible") end
end
function playerWeaponFire(weapon)
    local totalAmmo = getWeaponProperty(weapon, "poor", "maximum_clip_ammo")
    local ammo = getPedAmmoInClip(source)
    if (ammo == 1) then setElementData(source, "weapon.ammo.clip", "0") return end
    local drawAmmo = ((100 / totalAmmo) * ammo)/100
    setElementData(source, "weapon.ammo.clip", tostring(drawAmmo))
end
function playerChat(message, type)
    outputChatBox("Enviaste un mensaje")
end



addEventHandler ("onPlayerSpawn", root, jugadorSpawneado)
addEventHandler ("onPlayerWeaponSwitch", getRootElement(), playerWeaponSwitch)
addEventHandler ("onPlayerWeaponFire", getRootElement(), playerWeaponFire)
addEventHandler ("onPlayerChat", getRootElement(), playerChat)
