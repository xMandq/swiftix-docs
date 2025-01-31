IgnorePacketTypeZero = true
DontPrintZeros = true

PrintOnPacket = true
PrintOnRawPacket = true
PrintOnIncomingRawPacket = true
PrintOnIncomingPacket = true
PrintOnTrackPacket = true
PrintOnGeigerSignal = true
PrintOnTouch = true

function shouldPrintValue(value)
    if value == nil then
        return false
    end
    if DontPrintZeros and (value == 0 or value == 0.0) then
        return false
    end
    return true
end

function printPacketInfo(pkt, prefix)
    if pkt.type ~= 0 and not IgnorePacketTypeZero then
        print(prefix .. " type:     " .. pkt.type)
        
        if shouldPrintValue(pkt.objtype) then
            print("objtype:  " .. pkt.objtype)
        end
        if shouldPrintValue(pkt.count1) then
            print('count1 :'..pkt.count1)
        end
        if shouldPrintValue(pkt.count2) then
            print('count2 :'..pkt.count2)
        end
        if shouldPrintValue(pkt.netid) then
            print("netid:    " .. pkt.netid)
        end
        if shouldPrintValue(pkt.item) then
            print("item:     " .. pkt.item)
        end
        if shouldPrintValue(pkt.flags) then
            print("flags:    " .. pkt.flags)
        end
        if shouldPrintValue(pkt.int_data) then
            print("int_data: " .. pkt.int_data)
        end
        if shouldPrintValue(pkt.pos_x) then
            print("pos_x:    " .. pkt.pos_x)
        end
        if shouldPrintValue(pkt.pos_y) then
            print("pos_y:    " .. pkt.pos_y)
        end
        if shouldPrintValue(pkt.pos2_x) then
            print("pos2_x:   " .. pkt.pos2_x)
        end
        if shouldPrintValue(pkt.pos2_y) then
            print("pos2_y:   " .. pkt.pos2_y)
        end
        if shouldPrintValue(pkt.int_x) then
            print("int_x:    " .. pkt.int_x)
        end
        if shouldPrintValue(pkt.int_y) then
            print("int_y:    " .. pkt.int_y)
        end
        
        print("==================\n")
    end
end

AddHook("OnPacket", "OnPacket", function(type, packet)
    if shouldPrintValue(type) and shouldPrintValue(packet) and PrintOnPacket then
        if not ( packet:find("tankIDName|") and packet:find("tankIDPass|") ) then
            print("OnPacket type:     " .. type)
            print(packet)
            print("==================\n")
        end
    end
end)

AddHook("OnRawPacket", "OnRawPacket", function(pkt)
    if PrintOnRawPacket then
        printPacketInfo(pkt, "OnRawPacket")
    end
end)

AddHook("OnIncomingRawPacket", "OnIncomingRawPacket", function(pkt)
    if PrintOnIncomingRawPacket then
        printPacketInfo(pkt, "OnIncomingRawPacket")
    end
end)

AddHook("OnIncomingPacket", "OnIncomingPacket", function(type, packet)
    if shouldPrintValue(type) and shouldPrintValue(packet) and PrintOnIncomingPacket then
        print("OnIncomingPacket type:     " .. type)
        print("packet:    " .. packet)
        print("==================\n")
    end
end)

AddHook("OnTrackPacket", "OnTrackPacket", function(packet)
    if shouldPrintValue(packet) and PrintOnTrackPacket then
        print("OnTrackPacket packet:    " .. packet)
        print("==================\n")
    end
end)

AddHook("OnGeigerSignal", "OnGeigerSignal", function(color)
    if shouldPrintValue(color) and PrintOnGeigerSignal then
        print("OnGeigerSignal color: " .. color)
        print("==================\n")
    end
end)

local prev_x_tile, prev_y_tile
AddHook("OnTouch", "OnTouch", function(pos)
    if shouldPrintValue(pos.x) and shouldPrintValue(pos.y) and PrintOnTouch then
        if pos.x ~= prev_x_tile or pos.y ~= prev_y_tile then
            print("OnTouch pos:     " .. math.floor(pos.x) .. ", " .. math.floor(pos.y))
            prev_x_tile = pos.x
            prev_y_tile = pos.y
            print("==================\n")
        end
    end
end)