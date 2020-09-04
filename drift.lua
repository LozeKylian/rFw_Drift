------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
----------------------------------Touche de base I----------------------------------------------------
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

local drift = false
local kmh = 3.6
local drift_speed_limit = 130.00
CreateThread(function()
    while true do
        Wait(0)
        if IsPedInAnyVehicle(GetPed(), false) then

             local CarSpeed = GetEntitySpeed(GetCar()) * kmh

            if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then

                if CarSpeed <= 130.00 then  
                    if drift then
                        SetVehicleReduceGrip(GetCar(), true)
                    else
                        SetVehicleReduceGrip(GetCar(), false)
                    end
                end
            end
        end
    end
end)
RegisterCommand('+drift', function()
    --Presse I donc le drift s'active
    drift = true
    if IsPedInAnyVehicle(GetPed(), false) then
        ShowNotification("Le ~g~drift ~w~est disponible ~o~uniquement ~r~en dessous de 130 km/h.")
    end
end, false)
RegisterCommand('-drift', function()
    --Relachement de la touche drift donc le drift est off
    drift = false
end, false)
RegisterKeyMapping('+drift', 'Drift', 'keyboard', 'i')

-- Function
function GetPed() return GetPlayerPed(-1) end
function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end
