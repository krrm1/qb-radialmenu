local QBCore = exports["qb-core"]:GetCoreObject()

RegisterNetEvent('Vehicle:SetVehicleExtra', function(extraid)
    local ped = PlayerPedId(source)
    local veh = GetVehiclePedIsIn(ped)
    local getextra = IsVehicleExtraTurnedOn(veh, extraid.extraid)

    if DoesExtraExist(veh, extraid.extraid) then 
        if getextra == false then
            SetVehicleAutoRepairDisabled(veh, true)
            SetVehicleExtra(veh, extraid.extraid, false)
            QBCore.Functions.Notify("Extra " .. extraid.extraid .. " Was Set", "success")
            Wait(50)
            TriggerEvent('vehcontrol:openExtraMenu')
        else
            SetVehicleExtra(veh, extraid.extraid, true)
            QBCore.Functions.Notify("Extra " .. extraid.extraid .. " Was Removed", "error")
            Wait(50)
            TriggerEvent('vehcontrol:openExtraMenu')
        end
    else
        QBCore.Functions.Notify("Extra " .. extraid.extraid .. " Dose Not Exist", "error")
    end
end)

RegisterNetEvent('vehcontrol:openExtraMenu', function()
    local extralist = {}
    extralist[#extralist + 1] = {
        isMenuHeader = true,
        header = 'Vehicle Extra',
        icon = 'fas fa-list-ol'
    }
    for i = 1, 12 do
        extralist[#extralist + 1] = {
                header = 'Extra '.. i,
                txt = '',
                icon = 'fas fa-car',
                params = {
                    event = 'Vehicle:SetVehicleExtra',
                    args = {
                        extraid = i,
                    }
                }
            }
    end
    exports['qb-menu']:openMenu(extralist)
end)