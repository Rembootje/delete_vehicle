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
        TriggerEvent('chat:addMessage', {
            args = { config.NoVehicle }
        })
    end
end, false)