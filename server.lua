AddEventHandler('playerJoining', function(source)
    TriggerClientEvent("ping", source, "/ping2")
    TriggerClientEvent("ping", -1, "/ping3")
end)
