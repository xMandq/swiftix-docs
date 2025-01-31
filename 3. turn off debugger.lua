AddHook("OnPacket","OnPacket",function(type,packet)end) AddHook("OnIncomingPacket","OnIncomingPacket",function(type,packet)end) AddHook("OnRawPacket","OnRawPacket",function(packet)end) AddHook("OnIncomingRawPacket","OnIncomingRawPacket",function(packet)end) AddHook("OnTrackPacket","OnTrackPacket",function(packet)end) AddHook('OnGeigerSignal','OnGeigerSignal',function(color)log("Geiger signal color: "..color)end) AddHook('OnTouch','OnTouch',function(pos)end)

RemoveHook("OnPacket")
RemoveHook("OnRawPacket")
RemoveHook("OnIncomingRawPacket")
RemoveHook("OnIncomingPacket")
RemoveHook("OnTrackPacket")
RemoveHook("OnGeigerSignal")
RemoveHook("OnTouch")
