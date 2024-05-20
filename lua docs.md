# Functions
* [SendPacket](#sendpacket)
* [SendPacketRaw](#sendpacketraw)
* [SendPacketRawClient](#sendpacketrawclient)
* [SendVarlist](#sendvarlist)
* [log](#log)
* [FindPath](#findpath)
* [GetLocal](#getlocal)
* [GetInventory](#getinventory)
* [GetPlayers](#getplayers)
* [GetObjects](#getobjects)
* [GetTile](#gettile)
* [GetTiles](#gettiles)
* [GetPing](#getping)
* [AddHook](#AddHook)
* [RemoveHook](#RemoveHook)
* [RemoveHooks](#RemoveHooks)
* [RunThread](#runthread)
* [Sleep](#sleep)
* [SendWebhook](#sendwebhook)
* [GetItemCount](#GetItemCount)
* [GetItemInfo](#GetItemInfo)

## SendPacket
`SendPacket(int type, string packet)`

Sends text packet with selected type to server.

Example:
```lua
--Sends respawn packet to server
SendPacket(2, "action|respawn")
```

## SendPacketRaw
`SendPacketRaw(GamePacket packet)`

Sends Game packet to server.

Example:
```lua
--Sends wear clothing packet to server
local packet = {}
packet.type = 10 
packet.int_data = 48 --Clothing ID (Jeans)
SendPacketRaw(packet)
```

## SendPacketRawClient
`SendPacketRawClient(GamePacket packet)`

Sends game packet to client.

Example:
```lua
local packet = {}
packet.type = 13
packet.int_data = 7188 -- item id
packet.count2 = 20 -- item count
SendPacketRawClient(packet)
```

## SendVarlist
`SendVarlist(table varlist)`

Example:
```lua
local var = {}
var[0] = "OnConsoleMessage"
var[1] = "Dababy!"
var.netid = -1
SendVarlist(var)
```

## log
`log(string message)`

Logs message to Growtopias console (only client side)

Example:
```lua
--Logs "Hello!" to Growtopias console
log("Hello!")
```

## FindPath
`FindPath(int x, int y)`

Finds path to selected x,y

Example:
```lua
--Finds path to top left corner of the world
FindPath(0, 0)
```

## GetLocal
`GetLocal()`

Returns local NetAvatar struct

Example:
```lua
--Logs local players name
local me = GetLocal()
log(me.name)
```

## GetInventory
`GetInventory()`

Returns table of Inventory Items

Example:
```lua
--Logs all item ids in your inventory
for _,cur in pairs(GetInventory()) do
	log(cur.id)
end
```

## GetPlayers
`GetPlayers()`

Returns table of NetAvatars

Example:
```lua
--Logs current worlds players names
for _,player in pairs(GetPlayers()) do
	log(player.name)
end
```

## GetObjects
`GetObjects()`

Returns table of World Objects

Example:
```lua
--Logs current worlds objects item id
for _,object in pairs(GetObjects()) do
	log(object.id)
end
```

## GetTile
`GetTile(int x, int y)`

Returns world Tile in selected position

Example:
```lua
--Logs top left corners foreground block id
local tile = GetTile(0, 0)
log(tile.fg)
```

## GetTiles
`GetTiles()`

Returns table of Tiles

Example:
```lua
--Logs current worlds all foreground block id
for _,tile in pairs(GetTiles()) do
	log(tile.fg)
	Sleep(200)
end
```

## RunThread
`RunThread(function)`
Run a function in a different thread

Example
```lua
RunThread(function()
	log("Hello")
	Sleep(1000)
	log("World!")
end)
```

## AddHook
`AddHook(void* function, string name)`
Add a hook to a selected function

Example:
```lua
function hook(type, packet)
	if packet:find("actiont|input\n|text") then
		return true
	end
end

AddHook("OnPacket", "hook", hook)
	
function hook(packet)
	if packet.type == 0 then
		return true
	end
end

AddHook("OnRawPacket", "hook", hook)

function hook(packet)
	if packet.type == 0 then
		return true
	end
end

AddHook("OnIncomingRawPacket", "hook", hook)

function hook(varlist, packet)
	if varlist[0]:find("OnDialogRequest") then
		return true
	end
end

AddHook("OnVarlist", "hook", hook)

function hook(packet)
	if packet.type == 0 then
		packet.flags = 0
	end
end

AddHook("OnIncomingPacket", "hook", hook)
```

## RemoveHooks
`RemoveHooks()`
Remove all hooks

## RemoveHook
`RemoveHook(string name)`
Remove spesific name on a hook

Example:
```lua
function hook(varlist, packet)
	if varlist[0]:find("OnDialogRequest") then
		return true
	end
end
AddHook("OnVarlist", "hook", hook)

RemoveHook("hook") --remove that hook
```


## GetPing
`GetPing()`
Get ping ms from your peer

Example:
```lua
log("My ping is : "..tostring(GetPing()))
```

## SendWebhook
`SendWebhook(string webhook, string json)`

Example:
```lua
local payload = [[{
    "content": "",
    "embeds": [{
        "title": "ytta",
        "description": "ytta :flushed:",
        "url": "https://avatarfiles.alphacoders.com/334/334449.png",
        "color": 5814783,
        "fields": [{
            "name": "Introduction",
            "value": "My name is Walter Hartwell White. I live at 308 Negra Arroyo Lane Albuquerque New Mexico 87104. This is my confession."
        }],
        "author": {
            "name": "kontol",
            "url": "https://avatarfiles.alphacoders.com/334/334449.png",
            "icon_url": "https://avatarfiles.alphacoders.com/334/334449.png"
        },
        "footer": {
            "text": "sended from !",
            "icon_url": "https://copypastatext.com/wp-content/uploads/2021/12/index-14.jpg"
        },
        "timestamp": "2023-02-14T17:00:00.000Z"
    }]
}]]
local webhook = ""
SendWebhook(webhook, payload)
```

## Sleep
`Sleep(int ms)`
put a delay in miliseconds

Example:
```lua
SendPacket(2, "action|input\n|text|`@send message in 2 secs !")
Sleep(2000)
SendPacket(2, "action|input\n|text|`9Done!")
```

## GetItemCount
`GetItemCount(int id)`

Example:
```lua
log(GetItemCount(2)) --return dirt count 
```

## GetItemInfo
`GetItemInfo(int id)`

Returns table of Item Info

Example:
```lua
log(GetItemInfo(2).name) --return name of id block 2
```


# Structs


## GamePacket
| Type | Name |
|:-----|:----:|
| String | `type` |
| String | `netid` |
| String | `country` |
| Number | `int_data`  |
| Number | `pos_x`  |
| Number | `pos_y` |
| Number | `int_x` |
| Number | `int_y` |
| Number | `flags` |

## GetLocal
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `name` | Player name |
| Number | `netid` | Player netid |
| Number | `userid` | Player userid |
| Number | `pos.x` | Player x position |
| Number | `pos.y` | Player y position |
| Boolean | `isleft` | Is player facing left |

## GetTile - GetTiles
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `fg` | Foreground block ID |
| Number | `bg` | Background block ID |
| Number | `pos.x` |Tile x position |
| Number | `pos.y` |Tile y position |
| Number | `tile.extra == "vending_machine"` | Tile flags |
| Number | `tile.extra == "admins"` | Tile flags |
| Number | `tile.extra.id` | Tile ID |
| Number | `tile.extra.price` | Tile flags |

## GetInventory
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Item id |
| Number | `amount` | Item amount |
| Number | `flags` | item flags |

## GetItemInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` | Item name |
| Number | `id` | Item ID |
| Number | `rarity` | Item rarity |
| Number | `growtime` | Item growth |
| Number | `breakhit` | Item break count |

## GetObjects
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | object id |
| Number | `amount` | object count |
| Number | `pos.x` | object x position |
| Number | `pos.y` | object y position |
| Number | `flags` | object flags |
| Number | `oid` | object oid |

## GetWorld
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` | World name |
| Number | `size.x` | World size x-axix |
| Number | `size.y` | World size y-axis |
