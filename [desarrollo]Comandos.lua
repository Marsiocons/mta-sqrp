function obtenerCoordenadas (player)
    local pX, pY, pZ = getElementPosition(player)
    outputChatBox("X = ( " .. pX .. " ) Y = ( " .. pY .. " ) Z = ( " .. pZ .. " )")
end

function obtenerCamara(player)
    local rotX, rotY, rotZ = getElementRotation(player)
    outputChatBox("Tu rotación es: " .. rotZ)
end

function createVehicleFast(player)
    local vehicleID = 494
    local x, y, z = getElementPosition(player)
    local rotZ = getElementRotation(player)
    createVehicle (vehicleID, x, y, z, 0, 0, rotZ, "SQRP18")
end

function giveWeaponPlayer(player)
    giveWeapon(player, 31, 9999)
    giveWeapon(player, 24, 9999)
end



addCommandHandler("coor", obtenerCoordenadas, false, false)
addCommandHandler("rotation", obtenerCamara, false, false)
addCommandHandler("veh", createVehicleFast, false, false)
addCommandHandler("m4", giveWeaponPlayer, false, false)