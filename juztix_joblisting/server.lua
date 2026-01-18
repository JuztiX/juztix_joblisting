local ESX = exports['es_extended']:getSharedObject()

-- Job setzen
RegisterServerEvent('juztix_joblisting:setJob')
AddEventHandler('juztix_joblisting:setJob', function(jobName, grade)
    local xPlayer = ESX.GetPlayer(source)
    if xPlayer then
        xPlayer.setJob(jobName, grade)
    end
end)
