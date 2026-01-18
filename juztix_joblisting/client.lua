local ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        local dist = #(coords - Config.MarkerLocation)

        if dist < 10.0 then
            DrawMarker(
                Config.Marker.Type,
                Config.MarkerLocation.x, Config.MarkerLocation.y, Config.MarkerLocation.z - 1.0,
                0, 0, 0, 0, 0, 0,
                Config.Marker.Size.x, Config.Marker.Size.y, Config.Marker.Size.z,
                Config.Marker.Color.r, Config.Marker.Color.g, Config.Marker.Color.b, 100,
                false, true, 2, nil, nil, false
            )

            if dist < 1.5 then
                ESX.ShowHelpNotification("Arbeitsamt")
                if IsControlJustPressed(1, 51) then 
                    OpenJobMenu()
                end
            end
        end
    end
end)

function OpenJobMenu()
    local elements = {}
    for i=1, #Config.Jobs, 1 do
        table.insert(elements, {label = Config.Jobs[i].label, value = i})
    end

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'job_listing', {
        title    = 'Arbeitsamt',
        align    = 'top-left',
        css      = 'arbeitsamt',
        elements = elements
    }, function(data, menu)
        local selectedJob = Config.Jobs[data.current.value]
        TriggerServerEvent('juztix_joblisting:setJob', selectedJob.job, selectedJob.grade)
        ESX.ShowNotification("Du hast den Job ~g~"..selectedJob.label.."~s~ erhalten")
        menu.close()
    end, function(data, menu)
        menu.close()
    end)
end
