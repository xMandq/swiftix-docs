# Functions

- [SendPacket](#sendpacket)
- [SendPacketRaw](#sendpacketraw)
- [SendPacketRawClient](#sendpacketrawclient)
- [SendVarlist](#sendvarlist)
- [log](#log)
- [HotKey](#hotkey)
- [Login](#login)
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
- [TranslateText](#translatetext)
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

---

## SendPacket
`SendPacket(int type, string packet)`

Sends text packet with selected type to server.

**Example**:
```lua
SendPacket(2, "action|respawn")
```
---

## SendPacketRaw
`SendPacketRaw(GamePacket packet)`

Sends `GamePacket` to server.

**Example**:
```lua
packet = {}
packet.type = 10 
packet.int_data = 1796
SendPacketRaw(packet)
```
---

## SendPacketRawClient
`SendPacketRawClient(GamePacket packet)`

Sends `GamePacket` to client.

**Example**:
```lua
packet = {}
packet.type = 13
packet.int_data = 1796
packet.count2 = 200
SendPacketRawClient(packet)
```
---

## SendVarlist
`SendVarlist(table varlist)`

**Example**:
```lua
var = {}
var[0] = "OnConsoleMessage"
var[1] = "Dababy!"
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

## HotKey
`HotKey(std::string key_name, void* function)`

**Example**:
```lua
function test()
    log('Clicked F1')
end
HotKey("F1", test)
```
---

## Login
`Login(std::string growid, password)`

**Example**:
```lua
Login("Mandq", "uhmmwhatthesigma123.")
```
---

## GetClient
`GetClient()`

**Example**:
``log(GetClient().server_ip)
log(GetClient().server_port)``
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

Gets local player.

**Example**:
```lua
log(GetLocal().netid)
```
---

## GetInventory
`GetInventory()`

Gets local inventory.

**Example**:
```lua
for i, v in pairs(GetInventory()) do
    log(v.id..":"..v.count)
end
```
---

## GetPlayers
`GetPlayers()`

Gets all players in the world.

**Example**:
```lua
for _, v in pairs(GetPlayers()) do
    log(v.name..":"..v.netid)
end
```
---

## GetObjects
`GetObjects()`

Gets all objects in the world.

**Example**:
```lua
for _, v in pairs(GetObjects()) do
    log(v.id..":"..v.x..","..v.y)
end
```
---

## GetWorld
`GetWorld()`

Gets current world.

**Example**:
```lua
log(GetWorld().name)
```
---

## GetTile
`GetTile(int x, int y)`

Gets specific tile.

**Example**:
```lua
log(GetTile(0, 0).fg)
```
---

## GetTiles
`GetTiles()`

Gets all tiles in the world.

**Example**:
```lua
for _, v in pairs(GetTiles()) do
    log(v.fg..":"..v.bg)
end
```
---

## IsReady
`IsReady()`

Checks if Growtopia is ready.

**Example**:
```lua
if IsReady() then
    log("Ready!")
end
```
---

## GetPing
`GetPing()`

Gets current ping.

**Example**:
```lua
log(GetPing())
```
---

## AddHook
`AddHook(string event, function callback)`

Adds a hook for an event.

**Example**:
```lua
function OnPacket()
    log("Packet received!")
end
AddHook("OnPacket", OnPacket)
```
---

## RunThread
`RunThread(function callback)`

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
Sleep(1000)
```
---

## TranslateText
`TranslateText(string text)`

Translates text.

**Example**:
```lua
log(TranslateText("hello"))
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
`RemoveHook(string event, function callback)`

Removes specific hook.

**Example**:
```lua
RemoveHook("OnPacket", OnPacket)
```
---

## IsSolid
`IsSolid(int id)`

Checks if a tile is solid.

**Example**:
```lua
log(IsSolid(8))
```
---

## SendWebhook
`SendWebhook(string url, table data)`

Sends webhook.

**Example**:
```lua
SendWebhook("https://discord.com/api/webhooks/.../...", {content = "Hello!"})
```
---

## CheckPath
`CheckPath(int x, int y)`

Checks path to x, y.

**Example**:
```lua
CheckPath(0, 0)
```
---

## EditToggle
`EditToggle(int x, int y)`

Edits toggleable blocks.

**Example**:
```lua
EditToggle(0, 0)
```
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
PathFind(0, 0)
```


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
| Number | `selected_item`    | Return selected item in inventory      |
| Number | `backpack_size`    | Return backpack size                   |
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
|       |                    |                                        |
| Bool   | `isEquipped`       | Is item equipped                       |
| Number | `hat`              | Player's hat                           |
| Number | `shirt`            | Player's shirt                         |
| Number | `pants`            | Player's pants                         |
| Number | `shoes`            | Player's shoes                         |
| Number | `face`             | Player's face                          |
| Number | `hand`             | Player's hand                          |
| Number | `wing`             | Player's wing                          |
| Number | `hair`             | Player's hair                          |
| Number | `chest`            | Player's chest                         |
| Number | `ances`            | Player's ances                         |

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
| Number | `item_type`       | Item's type                             |
| Number | `body_part`       | Body's part type                       |
| Number | `growtime`        | Item's growth time                     |
| Number | `rarity`          | Item's rarity                          |
| Number | `breakhit`        | Item's hits count                      |
| Number | `size`            | Items list size                        |
