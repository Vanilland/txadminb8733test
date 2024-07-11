local function pingclient(_, args)
    TriggerEvent("chat:addMessage", {
        args = {
            "PONG!"
        },
        color = { 5, 255, 255 }
    })
end
RegisterCommand('ping1', pingclient)
RegisterCommand('ping2', pingclient)
RegisterCommand('ping3', pingclient)

CreateThread(function()
    TriggerEvent(
        'chat:addSuggestion',
        '/ping1',
    {
        { name="paramName1", help="param description 1" },
        { name="paramName2", help="param description 2" }
    })
end)

RegisterNetEvent("ping")
AddEventHandler("ping", function(data)
    TriggerEvent(
        'chat:addSuggestion',
        data,
    {
        { name="paramName1", help="param description 1" },
        { name="paramName2", help="param description 2" }
    })
end)