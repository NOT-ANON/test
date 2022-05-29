local pv = game.PlaceVersion

function notify(message,color,time)
    args = {
        [1] = message,
        [2] = color,
        [3] = time
    }
    firesignal(game.ReplicatedStorage.Events.SystemMessage.OnClientEvent, unpack(args))
end

if pv == 263 then
    notify("OPPOSER VR Hax Loaded", "blue", 10)
    loadstring()
else
    notify("OPPOSER VR HAS UPDATED WAIT FOR FIX", "red", 10)
end
