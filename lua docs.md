# Functions
* [SendPacket](#sendpacket)
* [SendPacketRaw](#sendpacketraw)
* [print](#print)
* [FindPath](#findpath)
* [GetLocal](#getlocal)
* [GetInventory](#getinventory)
* [GetPlayers](#getplayers)
* [GetObjects](#getobjects)
* [GetTile](#gettile)
* [GetTiles](#gettiles)
* [Sleep](#sleep)
* [GetItemInfo](#GetItemInfo)

## SendPacket
`SendPacket(int type, string packet)`

Sends text packet with selected type to server.

Example:
```lua
-- Sends respawn packet to server
SendPacket(2, "action|respawn")
```

## SendPacketRaw
`SendPacketRaw(GamePacket packet)`

Sends Game packet to server.

Example:
```lua
-- Sends wear clothing packet to server
local packet = {}
packet.type = 10 
packet.int_data = 48 -- Clothing ID (Jeans)
SendPacketRaw(packet)
```

## print
`print(string message)`

Logs message to Growtopias console (only client side)

Example:
```lua
-- Logs "Hello!" to Growtopias console
print("Hello!")
```

## FindPath
`FindPath(int x, int y)`

Finds path to selected x,y

Example:
```lua
-- Finds path to top left corner of the world
FindPath(0, 0)
```

## GetLocal
`GetLocal()`

Returns local NetAvatar struct

Example:
```lua
-- Logs local players name
local me = GetLocal()
print(me.name)
```

## GetInventory
`GetInventory()`

Returns table of Inventory Items

Example:
```lua
-- Logs all item ids in your inventory
for _,cur in pairs(GetInventory()) do
	print(cur.id)
end
```

## GetPlayers
`GetPlayers()`

Returns table of NetAvatars

Example:
```lua
-- Logs current worlds players names
for _,player in pairs(GetPlayers()) do
	print(player.name)
end
```

## getObjects
`GetObjects()`

Returns table of World Objects

Example:
```lua
-- Logs current worlds objects item id
for _,object in pairs(GetObjects()) do
	print(object.id)
end
```

## GetTile
`GetTile(int x, int y)`

Returns world Tile in selected position

Example:
```lua
-- Logs top left corners foreground block id
local tile = GetTile(0, 0)
print(tile.fg)
```

## GetTiles
`GetTiles()`

Returns table of Tiles

Example:
```lua
-- Logs current worlds all foreground block id
for _,tile in pairs(GetTiles()) do
	print(tile.fg)
	Sleep(200)
end
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

## GetItemInfo
`GetItemInfo(int id)`

Returns table of Item Info

Example:
```lua
print(GetItemInfo(2).name)--return name of id block 2
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
