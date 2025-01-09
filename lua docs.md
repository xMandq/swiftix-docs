# Functions

- [SendPacket](#sendpacket)
- [SendPacketRaw](#sendpacketraw)
- [SendPacketRawClient](#sendpacketrawclient)
- [SendVarlist](#sendvarlist)
- [log](#log)
- [GetClient](#getclient)
- [FindPath](#findpath)
- [GetLocal](#getlocal)
- [GetInventory](#getinventory)
- [GetPlayers](#getplayers)
- [GetObjects](#getobjects)
- [GetWorld](#getworld)
- [GetTile](#gettile)
- [GetTiles](#gettiles)
- [IsReady](#isready)
- [GetPing](#getping)
- [AddHook](#addhook)
- [RunThread](#runthread)
- [Sleep](#sleep)
- [GetAccesslist](#getaccesslist)
- [MessageBox](#messagebox)
- [RemoveHooks](#removehooks)
- [RemoveHook](#removehook)
- [IsSolid](#issolid)
- [SendWebhook](#sendwebhook)
- [CheckPath](#checkpath)
- [EditToggle](#edittoggle)
- [GetItemCount](#getitemcount)
- [GetItemInfo](#getiteminfo)
- [PathFind](#pathfind)

## SendPacket
`SendPacket(int type, string packet)`

Sends text packet with selected type to server.

**Examples**:
```lua
SendPacket(2, "action|respawn")

world = "Start"
SendPacket(3, "action|join_request\nname|"..world.."\ninvitedWorld|0")

SendPacket(2, "action|input\n|text|/dance2")
```
---

## SendPacketRaw
`SendPacketRaw(GamePacket packet)`

Sends [GamePacket](#gamepacket) to server.

**Examples**:
```lua
EditToggle("SafeMode", true)

function hit(x, y)
    if GetWorld() then
        pkt = {}
        pkt.type = 3
        pkt.int_data = 18
        pkt.int_x = x
        pkt.int_y = y
        pkt.pos_x = GetLocal().pos_x
        pkt.pos_y = GetLocal().pos_y
        SendPacketRaw(pkt)
    else
        log("Can't hit in exit")
    end
end

function place(x, y, id)
    if GetWorld() then
        pkt = {}
        pkt.type = 3
        pkt.int_data = id
        pkt.netid = GetLocal().netid
        pkt.pos_x = GetLocal().pos_x
        pkt.pos_y = GetLocal().pos_y
        pkt.int_x = x
        pkt.int_y = y
        SendPacketRaw(pkt)
    else
        log("Can't place in exit")
    end
end

function door(x, y)
    pkt = {}
    pkt.type = 7
    pkt.int_data = 18
    pkt.int_x = x
    pkt.int_y = y
    pkt.pos_x = GetLocal().pos_x
    pkt.pos_y = GetLocal().pos_y
    SendPacketRaw(pkt)
end
```
---

## SendPacketRawClient
`SendPacketRawClient(GamePacket packet)`

Sends [GamePacket](#gamepacket) to client.

**Examples**:
```lua
packet = {}
packet.type = 13
packet.int_data = 1796
packet.count2 = 200
SendPacketRawClient(packet)

packet = {}
packet.type = 14
packet.int_data = 1796
packet.float1 = 200
packet.count1 = 2
packet.count2 = 2
packet.pos_x = GetLocal().pos_x - math.random(22,40)
packet.pos_y = GetLocal().pos_y
packet.netid = -1
SendPacketRawClient(packet)
```
---

## SendVarlist
`SendVarlist(VariantList varlist)`

Sends [VariantList](#variantlist) to server/client.

**Examples**:
```lua
text = "Swiftix is the best executor!"

var = {}
var[0] = "OnConsoleMessage"
var[1] = text
var.netid = -1
SendVarlist(var)

var = {}
var[0] = "OnTextOverlay"
var[1] = text
var.netid = -1
SendVarlist(var)

var[0] = "OnTalkBubble"
var[1] = math.floor(GetLocal().netid)
var[2] = text
var[3] = -1
var.netid = -1
SendVarlist(var)

var = {}
var[0] = "OnParticleEffect"
var[1] = 88
var[2] = { math.floor(GetLocal().pos_x // 32) * 32 + 16, math.floor(GetLocal().pos_y // 32) * 32 + 16 }
var.netid = -1
SendVarlist(var)
```
---

## log
`log(string message)`

Logs message to Growtopias console (only client side).

**Example**:
```lua
log("Hello!")
```
---

## GetClient
`GetClient()`

**Examples**:
```lua
log(GetClient().server_ip)
log(GetClient().server_port)
```
---

## FindPath
`FindPath(int x, int y)`

Finds path to selected x,y.

**Example**:
```lua
FindPath(0, 0)
```
---

## GetLocal
`GetLocal()`

Returns local [NetAvatar](#netavatar) struct

**Example**:
```lua
function string.removeColors(varlist)
	return varlist:gsub("`.", "")
end

log("My X position is: " .. math.floor(GetLocal().pos_x) .. ", My Y position is: " .. math.floor(GetLocal().pos_y) .. ", My Tile X position is: " .. math.floor(GetLocal().tile_x) .. ", My Tile Y position is: " .. math.floor(GetLocal().tile_y) ..", My UserID is: " ..math.floor( GetLocal().userid) .. ", My NetID is: " .. math.floor(GetLocal().netid) ..", My name is: " .. GetLocal().name:removeColors() .. ", and I have " .. math.floor(GetLocal().gems) .. " gems.")
```
---

## GetInventory
`GetInventory()`

Returns local [InventoryItem](#inventoryitem) struct

**Examples**:
```lua
for i, v in pairs(GetInventory()) do
    log(v.id..":"..v.count)
end

for _,item in pairs(GetInventory()) do
    if item.id == 242 then
        if item.count >= 100 then
            packet = {}
            packet.type = 10
            packet.int_data = 242
            SendPacketRaw(packet)
        end
    end
end
```
---

## GetPlayers
`GetPlayers()`

Gets all players in the world.

**Examples**:
```lua
for _, v in pairs(GetPlayers()) do
    log(v.name..":"..v.netid)
end

function string.removeColors(varlist)
	return varlist:gsub("`.", "")
end

for _, player in pairs(GetPlayers()) do
    player_name = player.name:removeColors()
    SendPacket(2, "action|input\n|text|/pull " .. player_name)
end
```
---

## GetObjects
`GetObjects()`

Gets all [WorldObject](#worldobject) in the world.

**Example**:
```lua
for _, v in pairs(GetObjects()) do
    log("" ..GetItemInfo(v.id).name.." is on: "..math.floor(v.pos_x // 32)..", "..math.floor(v.pos_y // 32))
end
```
---

## GetWorld
`GetWorld()`

Gets [Current World](#currentworld) information.

**Example**:
```lua
if GetWorld() then
    log("Im in world "..GetWorld().name)
else
    log("Im not in any world hmh.. Maybe exit?")
end
```
---

## GetTile
`GetTile(int x, int y)`

Gets specific [Tile](#tile) information.

**Example**:
```lua
log(GetTile(0, 0).fg)
```
---

## GetTiles
`GetTiles()`

Gets all [Tiles](#tile) in the world.

**Examples**:
```lua
for _, v in pairs(GetTiles()) do
    log(v.fg..":"..v.bg)
end

for _, tile in pairs(GetTiles()) do
    if tile.bg == 3556 or tile.bg == 298 or tile.bg == 9382 or tile.bg == 9390 then
        packet = {}
        packet.type = 3
        packet.int_data = 56
        packet.pos_x = GetLocal().pos_x
        packet.pos_y = GetLocal().pos_y
        packet.netid = math.floor(GetLocal().netid)
        packet.int_x = tile.pos_x
        packet.int_y = tile.pos_y
        SendPacketRawClient(packet)
    end
end

if GetTile(GetLocal().pos_x // 32, GetLocal().pos_y // 32).bg ~= 0 then
    log("Im standing on " ..GetItemInfo(GetTile(GetLocal().pos_x // 32, GetLocal().pos_y // 32).bg).name)
else
    log("There is no background on the tile you are at!")
end
```
---

## IsReady
`IsReady(int x, int y)`

**Example**:
```lua
IsReady(9, 45) -- return bool (true == harvestable)
```
---

## GetPing
`GetPing()`

Gets current ping.

**Example**:
```lua
log("My ping is : "..tostring(GetPing()))
```
---

## AddHook
`AddHook(string type, string name, function)`

Adds a hook for an event.

**Examples**:

`OnPacket(int type, string packet)`
```lua
function command_invisible(type, packet)
    if packet == ("action|input\n|text|/invisible") then
        for _,player in pairs(GetPlayers()) do
            var2 = {}
            var2[0] = "OnSetClothing"
            var2[1] =  {0,0,0}
            var2[2] =  {0,0,0}
            var2[3] = {0,0,0}
            var2[4] = 2
            var2[5] =  {0, 0, 0}
            var2.netid = player.netid
            SendVarlist(var2)
        end
    return true
    end
end

AddHook("OnPacket","command_invisible", command_invisible)
```

`OnRawPacket(GamePacket packet)`
```lua
function hook(packet)
	if packet.type == 0 then
		return true
	end
end

AddHook("OnRawPacket","hook", hook)
```

`OnIncomingRawPacket(GamePacket packet)`
```lua
function dice(packet)
    if packet.type == 8 and packet.int_data == 0 and GetTile(packet.int_x, packet.int_y).fg == 456 then
        dice_roll = tostring(packet.count2 + 1)
        log("Dice Will Spin On : " .. math.floor(dice_roll) .. "`" .. math.random(1, 9))
    end
end 
AddHook("OnIncomingRawPacket",'dice', dice)
```

`OnVarlist(VariantList varlist)`
```lua
function player_count(varlist)
    if varlist[0] == "OnConsoleMessage" and varlist[1]:find("Where would you like to go?") then
        online_count = varlist[1]:match("`w(.-)``")
        log("There Are " ..online_count.. " Players Online Now.")
        return true
    end
end
AddHook("OnVarlist", "player_count", player_count)
```

`OnIncomingPacket(int type, string packet)`
```lua
function AudioChecker(type, packet)
    if packet:find("action|play_sfx") then
        audio_file = packet:match("file|(.+)delayMS"):gsub("%s", "")
        log(audio_file)
    end
end 
AddHook('OnIncomingPacket','AudioChecker', AudioChecker)
```

`OnTrackPacket(string packet)`
```lua
function ShowDropped(packet)
    if packet:find("eventType|0") then
        OwnerID = packet:match("World_owner|(%d+)")
        log(OwnerID)
    end
end

AddHook("OnTrackPacket","ShowDropped", ShowDropped)
```

`OnGeigerSignal(color)`
```lua
function GeigerColors(color)
    log("Geiger signal color: "..color)
end

AddHook('OnGeigerSignal', 'GeigerColors', GeigerColors)

--[[
outputs:

Red
Yellow
Rapid Green
Green
Unknow
]]
```

`OnTouch(pos)`
```lua
local prev_x_tile, prev_y_tile

function PunchPlace(pos)
    x_tile = pos.x
    y_tile = pos.y
    
    if x_tile ~= prev_x_tile or y_tile ~= prev_y_tile then
        log("You just clicked on : " ..math.floor(x_tile).. ", " ..math.floor(y_tile))
    end
    
    prev_x_tile = x_tile
    prev_y_tile = y_tile
end

AddHook('OnTouch', 'PunchPlace', PunchPlace)
```
---

## RunThread
`RunThread(function)`

Runs a function as a thread.

**Example**:
```lua
RunThread(function()
    log("Thread started")
    Sleep(1000)
    log("Thread ended")
end)
```
---

## Sleep
`Sleep(int ms)`

Sleeps for specified milliseconds.

**Example**:
```lua
Talk("Hey!")
Sleep(1000)
Talk("bye :(")
```
---

## GetAccesslist
`GetAccesslist(int x, int y)`

Get lock's access userid list

**Example**:
```lua
for __,v in pairs(GetAccesslist(0,0)) do
	log(v.uid)
end
```
---

## MessageBox
`MessageBox(string title, string message)`

Shows a message box.

**Example**:
```lua
MessageBox("Title", "Message")
```
---

## RemoveHooks
`RemoveHooks()`

Removes all hooks.

**Example**:
```lua
RemoveHooks()
```
---

## RemoveHook
`RemoveHook(function)`

Removes specific hook.

**Example**:
```lua
function Dropping(varlist, packet)
    if varlist[0]:find("OnDialogRequest") then
        return true
    end
end
AddHook("OnVarlist", "Dropping", Dropping)

RemoveHook("Dropping")
```
---

## IsSolid
`IsSolid(int x, int y)`

**Example**:
```lua
IsSolid(0, 0) -- return bool (true == block is solid)
```
---

## SendWebhook
`SendWebhook(string webhook, string json)`

**Example**:
```lua
payload = [[{
    "content": "🚨 **System Report Update** 🚨",
    "embeds": [{
        "title": "🔧 **Server Maintenance**",
        "description": "Our server is undergoing maintenance. Here's a quick update on the current status.",
        "url": "https://status.discord.com",
        "color": 7506394,
        "fields": [{
            "name": "**Uptime**",
            "value": "⏳ 72 hours, 15 minutes",
            "inline": true
        }, {
            "name": "**Users Online**",
            "value": "👥 175 active users",
            "inline": true
        }, {
            "name": "**System Load**",
            "value": "💻 CPU: 30%, RAM: 40%",
            "inline": true
        }, {
            "name": "**Recent Alerts**",
            "value": "⚠️ No critical errors at the moment.",
            "inline": false
        }],
        "author": {
            "name": "System Monitoring Service 🛠️",
            "url": "https://www.example.com/monitoring",
            "icon_url": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Tool_Icon.svg/1200px-Tool_Icon.svg.png"
        },
        "footer": {
            "text": "Last updated: 2025-01-04 | 14:00 UTC",
            "icon_url": "https://upload.wikimedia.org/wikipedia/commons/6/65/Discord_logo_2021.svg"
        },
        "timestamp": "2025-01-04T14:00:00.000Z"
    }]
}]]
webhook = "https://discord.com/api/webhooks/"
SendWebhook(webhook, payload)
```
---

## CheckPath
`CheckPath(int x, int y)`

Checks path to x, y.

**Example**:
```lua
if CheckPath(0, 0) then
    FindPath(0, 0)
else
    log("The path for 0, 0 is blocked!")
end
```
---

## EditToggle
`EditToggle(string module, bool toggle)`

Example:
```lua
EditToggle("ModFly", true) -- activate modfly
```
## Module list:
* ModFly
* AntiPortal
* AntiBounce
* AutoCollect
* AutoCollectRange
* PathFinderWithSmoke ( Later )
* RightClickKick
* LeftClickPull
* FastDice
* FastRoshambo
* GemsChecker
* Scan
* PathFinder
* SafeMode
---

## GetItemCount
`GetItemCount(int id)`

Gets count of specific item.

**Example**:
```lua
log(GetItemCount(112))
```
---

## GetItemInfo
`GetItemInfo(int id)`

Gets info of specific item.

**Example**:
```lua
log(GetItemInfo(112).name)
```
---

## PathFind
`PathFind(int x, int y)`

Finds path.

**Example**:
```lua
path = PathFind(46, 10)
print(#path) -- how much block does it take to that destination
for i, v in pairs(path) do
	print(("%d, %d"):format(v.x, v.y))
end
```
---

# Structs

* [NetAvatar](#netavatar)
* [Current World](#currentworld)
* [WorldObject](#worldobject)
* [InventoryItem](#inventoryitem)
* [Tile](#tile)
* [GamePacket](#gamepacket)
* [VariantList](#variantlist)
* [ItemInfo](#iteminfo)

## NetAvatar
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Bool   | `facing_left`      | Is player facing left                  |
| Number | `tile_x`           | Player's x tile position               |
| Number | `tile_y`           | Player's y tile position               |
| Number | `pos_x`            | Player's x position                    |
| Number | `pos_y`            | Player's y position                    |
| String | `country`          | Player's flag id                       |
| Number | `size_x`           | Player's x size                        |
| Number | `size_y`           | Player's y size                        |
| Number | `userid`           | Player's userID                        |
| Number | `flags2`           | Player's flags2                        |
| Number | `netid`            | Player's netID                         |
| Number | `flags`            | Player's flags                         |
| String | `name`             | Player's name                          |
| Number | `gems`             | Player's gems                          |

## CurrentWorld
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Number | `size_x`           | Current world size horizontally        |
| Number | `size_y`           | Current world size vertically          |
| Number | `name`             | Current world name                     |

## WorldObject
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Number | `pos_x`           | Object's x position                    |
| Number | `pos_y`           | Object's y position                    |
| Number | `count`           | Object's item count                    |
| Number | `flags`           | Object's flags                         |
| Number | `id`              | Object's item ID                       |
| Number | `oid`             | Object's index                         |

## InventoryItem
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Number | `id`              | Item's ID                              |
| Number | `count`           | Item count                             |
| Bool | `untradeable`      | Is Item Tradable                       |
| Number | `selected_item`    | Return selected item in inventory      |
| Number | `backpack_size`    | Return backpack size                   |
| Number | `flags`           | Item flags                             |

## Tile
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Number | `fg`              | Foreground block's ID                  |
| Number | `bg`              | Background block's ID                  |
| Number | `pos_x`           | Tile's x position                      |
| Number | `pos_y`           | Tile's y position                      |
| Number | `item_price`      | Vends's item price                     |
| Number | `item_id`         | Vends's item id                        |
| Number | `flags`           | Tile's flags                           |

## GamePacket
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Number | `type`            | Packet type                            |
| Number | `flags`           | Packet flags                           |
| Number | `netid`           | Packet netID                           |
| Number | `objtype`         |                                         |
| Number | `count1`          |                                         |
| Number | `count2`          |                                         |
| Number | `item`            |                                         |
| Number | `float1`          |                                         |
| Number | `int_data`        |                                         |
| Number | `pos_x`           |                                         |
| Number | `pos_y`           |                                         |
| Number | `pos2_x`          |                                         |
| Number | `pos2_y`          |                                         |
| Number | `float2`          |                                         |
| Number | `int_x`           |                                         |
| Number | `int_y`           |                                         |

## VariantList
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| Number | `netid`           | NetID                                   |
| Number | `delay`           | Delay                                   |
| String | `[0]`             | Param 0                                 |
| Any    | `[1]`             | Param 1                                 |
| Any    | `[2]`             | Param 2                                 |
| Any    | `[3]`             | Param 3                                 |
| Any    | `[4]`             | Param 4                                 |
| Any    | `[5]`             | Param 5                                 |

## ItemInfo
| Type   | Name              | Description                            |
|:------|:------------------|:---------------------------------------|
| String | `id`              | item's id                              |
| String | `name`            | item's name                            |
| Bool   | `untradeable`       | Is Item Tradable                     |
| Number | `item_type`       | Item's type                            |
| Number | `body_part`       | Body's part type                       |
| Number | `growtime`        | Item's growth time                     |
| Number | `rarity`          | Item's rarity                          |
| Number | `breakhit`        | Item's hits count                      |
| Number | `size`            | Items list size                        |
