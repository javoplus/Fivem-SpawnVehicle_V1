-- replace "Rebel" with the name of the car you want..
-- for all vehicles: https://wiki.gtanet.work/index.php?title=Vehicle_Models
local vehicle = "Rebel"

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        -- replace "244" with index of Control you want..
        -- for all Controls: https://docs.fivem.net/docs/game-references/controls/
        if IsControlJustReleased(0, 244) then
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
            vehiclehash = GetHashKey(vehicle)
            RequestModel(vehiclehash)    
            Citizen.CreateThread(function()
                local id = PlayerPedId()
                local playerangle = GetEntityHeading(id)
                CreateVehicle(vehiclehash, x + 2, y + 2, z + 2, playerangle, 1, 0)
            end)
        end
    end
end)