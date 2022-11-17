RegisterNetEvent('nv_Crosshair:refreshMira')
AddEventHandler('nv_Crosshair:refreshMira', function(data, time)
    if time >= 5 then
        SendNUIMessage({
            type = "ui",
            status = data,
            color = 'black'
        })
    else
        SendNUIMessage({
            type = "ui",
            status = data,
            color = 'white'
        })
    end
end)

local aim_status = false
local display_lock = true

local _sleep = 1

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(_sleep)
        local time = GetClockHours()
        if IsPlayerFreeAiming(PlayerId()) then
            _sleep = 1
            if aim_status == false then
                aim_status = not aim_status
                TriggerEvent('nv_Crosshair:refreshMira', display_lock, time)
            end
        else
            _sleep = 200
            if aim_status then
                aim_status = not aim_status
                TriggerEvent('nv_Crosshair:refreshMira', false, time)
            end
        end
        HideHudComponentThisFrame(14)
    end
end)

function CrosshairDisplay(display)
    display_lock = display
end