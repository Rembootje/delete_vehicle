RegisterCommand(config.cmd, function()
    local playerPed = PlayerPedId()

    if IsPedInAnyVehicle(playerPed, false) then
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        -- Make sure the player is the driver
        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
            -- Check if vehicle is going too fast
            local speed = GetEntitySpeed(vehicle) * (config.Measurement == 'KPH' and 3.6 or 2.237) -- Convert to desired measurement
            if speed > config.AllowedSpeed then
                TriggerEvent('chat:addMessage', {
                    args = { config.ToFast }
                })
            else
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteVehicle(vehicle)
            end
        else
            TriggerEvent('chat:addMessage', {
                args = { config.NotDriver }
            })
        end
    else
        -- Delete nearby vehicle
        local playerCoords = GetEntityCoords(playerPed)
        local nearestVehicle = nil
        local nearestDistance = config.NearbyDistance

        -- Find nearest vehicle within distance
        local vehicles = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehicles) do
            if DoesEntityExist(vehicle) then
                local vehicleCoords = GetEntityCoords(vehicle)
                local distance = #(playerCoords - vehicleCoords)
                
                if distance < nearestDistance then
                    nearestDistance = distance
                    nearestVehicle = vehicle
                end
            end
        end

        if nearestVehicle then
            -- Check if any players are in the vehicle
            local hasPlayers = false
            for seat = -1, 7 do
                local ped = GetPedInVehicleSeat(nearestVehicle, seat)
                if ped ~= 0 and IsPedAPlayer(ped) then
                    hasPlayers = true
                    break
                end
            end

            if not hasPlayers then
                SetEntityAsMissionEntity(nearestVehicle, true, true)
                DeleteEntity(nearestVehicle)
                TriggerEvent('chat:addMessage', {
                    args = { "^2Nearest vehicle deleted!" }
                })
            else
                TriggerEvent('chat:addMessage', {
                    args = { "^1Error: Vehicle has players in it" }
                })
            end
        else
            TriggerEvent('chat:addMessage', {
                args = { config.NoNearbyVehicle }
            })
        end
    end
end, false)

-- Delete all vehicles command
RegisterCommand(config.Allcmd, function()
    -- Check if player has admin permissions
    if not IsPlayerAceAllowed(PlayerId(), "command") then
        TriggerEvent('chat:addMessage', {
            args = { config.NoPermission }
        })
        return
    end

    TriggerEvent('chat:addMessage', {
        args = { "^3Server", config.AllVehicles15 }
    })

    Wait(5000)
    TriggerEvent('chat:addMessage', {
        args = { "^3Server", config.AllVehicles10 }
    })

    Wait(5000)
    for i = 5, 1, -1 do
        local unit = i == 1 and "second" or "seconds"
        TriggerEvent('chat:addMessage', {
            args = { "^3Server", "^2" .. i .. " " .. unit .. config.AllVehiclesCountdown }
        })
        Wait(1000)
    end

    -- Delete all vehicles
    local vehicles = GetGamePool('CVehicle')
    for _, vehicle in ipairs(vehicles) do
        if DoesEntityExist(vehicle) then
            -- Check if any players (not NPCs) are in the vehicle
            local hasPlayers = false
            for seat = -1, 7 do
                local ped = GetPedInVehicleSeat(vehicle, seat)
                if ped ~= 0 and IsPedAPlayer(ped) then
                    hasPlayers = true
                    break
                end
            end
            
            -- Only delete if no players are in the vehicle (NPCs will be deleted with the vehicle)
            if not hasPlayers then
                SetEntityAsMissionEntity(vehicle, true, true)
                DeleteEntity(vehicle)
            end
        end
    end

    TriggerEvent('chat:addMessage', {
        args = { "^3Server", config.AllVehiclesDeleted }
    })
end, false)