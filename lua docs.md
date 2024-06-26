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
* [GetWorld](#getworld)
* [GetTile](#gettile)
* [GetTiles](#gettiles)
* [IsReady](#isready)
* [GetPing](#getping)
* [AddHook](#AddHook)
* [RunThread](#runthread)
* [Sleep](#sleep)
* [TranslateText](#translatetext)
* [MessageBox](#messagebox)
* [RemoveHooks](#RemoveHooks)
* [RemoveHook](#RemoveHook)
* [IsSolid](#issolid)
* [SendWebhook](#sendwebhook)
* [CheckPath](#checkpath)
* [EditToggle](#edittoggle)
* [GetItemCount](#getitemcount)
* [GetIteminfo](#GetIteminfo)
* [PathFind](#PathFind)


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

Sends [GamePacket](#gamepacket) to server.

Example:
```lua
-- Shatter 1 dl to 100 wls
packet = {}
packet.type = 10 
packet.int_data = 1796
SendPacketRaw(packet)
```

## SendPacketRawClient
`SendPacketRawClient(GamePacket packet)`

Sends [GamePacket](#gamepacket) to client.

Example:
```lua
-- Gives you visually 200 dls
packet = {}
packet.type = 13
packet.int_data = 1796
packet.count2 = 200
SendPacketRawClient(packet)
```

## SendVarlist
`SendVarlist(table varlist)`

Example:
```lua
var = {}
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
-- Logs "Hello!" to Growtopias console
log("Hello!")
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

Returns local [NetAvatar](##netavatar) struct

Example:
```lua
-- Logs local players name
me = GetLocal()
log(me.name)
```

## GetInventory
`GetInventory()`

Returns table of [InventoryItems](#inventoryitem)

Example:
```lua
-- Logs all item ids in your inventory
for _,cur in pairs(GetInventory()) do
	log(cur.id)
end
```

## GetPlayers
`GetPlayers()`

Returns table of [NetAvatars](#netavatar)

Example:
```lua
-- Logs current worlds players names
for _,player in pairs(GetPlayers()) do
	log(player.name)
end
```

## GetObjects
`GetObjects()`

Returns table of [WorldObjects](#worldobject)

Example:
```lua
-- Logs current worlds objects item id's
for _,object in pairs(GetObjects()) do
	log(object.id)
end
```

## GetWorld
`GetWorld()`

Returns [Current World](#CurrentWorld) information

Example:
```lua
-- Logs current worlds name
world = GetWorld().name
log(world)
```

## GetTile
`GetTile(int x, int y)`

Returns world [Tile](#tile) in selected position

Example:
```lua
-- Logs top left corners foreground block id
tile = GetTile(0, 0)
log(tile.fg)
```

## GetTiles
`GetTiles()`

Returns table of [Tiles](S#tile)

Example:
```lua
-- Logs current worlds all foreground block id's
for _,tile in pairs(GetTiles()) do
	log(tile.fg)
end
```

## RunThread
`RunThread(function)`

Run a function in a different thread

Example:
```lua
RunThread(function()
	log("Hello")
	Sleep(1000)
	log("World!")
end)
```

## Sleep
`Sleep(int ms)`

put a delay inside a [Thread](#runthread)

Example:
```lua
function wow(a, b)
	log(a)
	Sleep(1000)
	log(b)
end
RunThread(function()
	wow("Hello", "World")
end)
```

## AddHook
`AddHook(void* function, string name)`

Add a Hook to a selected function

Example:
```lua
-- Blocks all dialogs
function hook(varlist, packet)
	if varlist[0]:find("OnDialogRequest") then
		return true
	end
end

AddHook("OnVarlist", "hook", hook)

-- Blocks your chat
function hook(type, packet)
	if packet:find("actiont|input\n|text") then
		return true
	end
end

AddHook("OnPacket", "hook", hook)

-- Blocks your packet_state
function hook(packet)
	if packet.type == 0 then
		return true
	end
end

AddHook("OnRawPacket", "hook", hook)
```

## IsReady
`IsReady(int x, int y)`

Example:
```lua
IsReady(9, 45) -- return bool (true == harvestable)
```

## GetPing
`GetPing()`

Get ping ms from your peer

Example:
```lua
log("My ping is : "..tostring(GetPing()))
```

## TranslateText
`TranslateText(text, language to translate in, text language)`

Translate text messages and returns translated message

Example:
```lua
translated_text = TranslateText("apa", "en", "id")
log(translated_text) -- return ' What '
```

## MessageBox
`MessageBox(string title, string content, icon)`

Send a messagebox to your client!

Example:
```lua
MessageBox("This is title", "This is content", "Error")
```
## Module list:
* Success
* Warning
* Error
* Info

## RemoveHooks
`RemoveHooks()`

Remove all callbacks

## RemoveHook
`RemoveHook(string name)`

Remove spesific name on callback

Example:
```lua
function hook(varlist, packet)
	if varlist[0]:find("OnDialogRequest") then
		return true
	end
end
AddHook("OnVarlist", "hook", hook)

RemoveHook("Hook")
```

## IsSolid
`IsSolid(int x, int y)`

```lua
IsSolid(0, 0) -- return bool (true == block is solid)
```

## SendWebhook
`SendWebhook(string webhook, string json)`

Example:
```lua
payload = [[{
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
webhook = ""
SendWebhook(webhook, payload)
```


## CheckPath
`CheckPath(int x, int y)`

Example:
```lua
CheckPath(0, 0) -- return bool (true == found path)
```

## EditToggle
`EditToggle(string module, bool toggle)`

Example:
```lua
EditToggle("ModFly", true) -- activate modfly
```
## Module list:
* ModFly
* AntiBounce
* AutoCollect
* AutoCollectRange
* RightClickKick
* LeftClickPull
* FastDice
* FastRoshambo
* GemsChecker
* Scan
* PathFinder
* SafeMode

## GetItemCount
`GetItemCount(int id)`

Example:
```lua
log(GetItemCount(2)) -- return dirt count 
```
## GetIteminfo
`GetIteminfo(int id)`

Returns table of [ItemInfo](#ItemInfo)

Example:
```lua
log(GetIteminfo(2).name) -- return name of id block 2
```

## PathFind
`PathFind(int x, int y)`

Returns table of path to destination

Example:
```lua
path = PathFind(46, 10)
print(#path) -- how much block does it take to that destination
for i, v in pairs(path) do
	print(("%d, %d"):format(v.x, v.y))
end
```


# Structs

* [NetAvatar](#netavatar)
* [Current World](#CurrentWorld)
* [WorldObject](#worldobject)
* [InventoryItem](#inventoryitem)
* [Tile](#tile)
* [GamePacket](#gamepacket)
* [VariantList](#variantlist)
* [ItemInfo](#iteminfo)

## NetAvatar
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `name` | Player's name |
| String | `country` | Player's flag id |
| Number | `selected_item` | Return selected item in inventory |
| Number | `backpack_size` | Return backpack size |
| Number | `pos_x`  | Player's x position |
| Number | `pos_y`  | Player's y position |
| Number | `tile_x` | Player's x tile position |
| Number | `tile_y` | Player's y tile position |
| Number | `size_x` | Player's x size |
| Number | `size_y` | Player's x size |
| Number | `netid` | Player's netID |
| Number | `userid` | Player's userID |
| Number | `gems` | Player's gems |
| Bool | `facing_left` | Is player facing left |
| Number | `flags` | Player's flags |
| Number | `flags2` | Player's flags2 |

## CurrentWorld
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `name` | Current world name |
| Number | `size_x` | Current world size horizontally |
| Number | `size_y` | Current world size vertically |

## WorldObject
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Object's item ID |
| Number | `oid` | Object's index |
| Number | `pos_x` | Object's x position |
| Number | `pos_y` | Object's y position |
| Number | `count` | Object's item count |
| Number | `flags` | Object's flags |

## InventoryItem
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `id` | Item's ID |
| Number | `count` | Item count |
| Number | `flags` | Item flags |

## Tile
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `fg` | Foreground block's ID |
| Number | `bg` | Background block's ID |
| Number | `pos_x` |Tile's x position |
| Number | `pos_y` |Tile's y position |
| Number | `flags` | Tile's flags |

## GamePacket
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `type` | Packet type |
| Number | ` objtype` |  |
| Number | `count1 ` |  |
| Number | `count2 ` |  |
| Number | `netid ` | Packet netID |
| Number | `item ` |  |
| Number | `flags ` | Packet flags |
| Number | `float1` |  |
| Number | `int_data` |  |
| Number | `pos_x` |  |
| Number | `pos_y` |  |
| Number | `pos2_x` |  |
| Number | `pos2_y` |  |
| Number | `float2` |  |
| Number | `int_x` |  |
| Number | `int_y` |  |

## VariantList
| Type | Name | Description|
|:-----|:----:|:-----------|
| Number | `netid` | NetID |
| Number | `delay` | Delay |
| String | `[0]` | Variant function name |
| Any | `[1]` | Param 1 |
| Any | `[2]` | Param 2 |
| Any | `[3]` | Param 3 |
| Any | `[4]` | Param 4 |
| Any | `[5]` | Param 5 |

## ItemInfo
| Type | Name | Description|
|:-----|:----:|:-----------|
| String | `id` | item's id |
| String | `name` | item's name |
| Number | `item_type` | Item's type |
| Number | `body_part` | Body's part type |
| Number | `growtime` | Item's growth time |
| Number | `rarity` | Item's rarity |
| Number | `breakhit` | Item's hits count |
| Number | `size` | Items list size |
