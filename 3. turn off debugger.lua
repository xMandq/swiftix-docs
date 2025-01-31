function OnPacket(type, packet)
end
AddHook("OnPacket","OnPacket", OnPacket)

function OnIncomingPacket(type, packet)
end
AddHook("OnPacket","OnIncomingPacket", OnIncomingPacket)

function OnRawPacket(packet)
end
AddHook("OnRawPacket","OnRawPacket", OnRawPacket)

function OnIncomingRawPacket(packet)
end
AddHook("OnIncomingRawPacket","OnIncomingRawPacket", OnIncomingRawPacket)

function OnTrackPacket(packet)
end
AddHook("OnTrackPacket","OnTrackPacket", OnTrackPacket)

function OnGeigerSignal(color)
    log("Geiger signal color: "..color)
end

AddHook('OnGeigerSignal', 'OnGeigerSignal', OnGeigerSignal)


function OnTouch(pos)
end
AddHook('OnTouch', 'OnTouch', OnTouch)

RemoveHook("OnPacket")
RemoveHook("OnRawPacket")
RemoveHook("OnIncomingRawPacket")
RemoveHook("OnIncomingPacket")
RemoveHook("OnTrackPacket")
RemoveHook("OnGeigerSignal")
RemoveHook("OnTouch")