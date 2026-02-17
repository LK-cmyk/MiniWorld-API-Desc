---@class GameObject
---对象模块管理接口 - GameObject
local GameObject = {}
_G.GameObject = GameObject

---根据ID查找游戏对象
---@return string|nil @返回查找的方块对象，如果没有找到则返回nil
---@param id number|string @游戏对象的唯一标识
function GameObject:FindObject(id)
    return ""
end

---获取当前游戏UI对象
---@return string|nil @返回查找的UI对象，如果没有找到则返回nil
---@param id number|string @游戏对象的唯一标识
function GameObject:FindUIObject(id)
    return ""
end

---注意: 方块对象接口只能查找到 **编辑过的方块** 或 **自定义的方块**
---
---注意: 场景中 **至少有一个** 方块才能获取到!
---
---获取当前游戏方块类别对象
---@return string|nil @返回查找的方块类别对象，如果没有找到则返回nil
---@param id number|string @游戏对象的唯一标识
function GameObject:FindBlockObject(id)
    return ""
end

---创建预制实例
---@param prefabId string @预制体ID
---@param worldId number @星球ID(默认为当前主机所在星球)
---@param x number @X坐标
---@param y number @Y坐标
---@param z number @Z坐标
---@param trigger boolean @是否触发事件
---@return string|nil @返回创建的预制实例，如果创建失败则返回nil
function GameObject:CreatePrefabInst(prefabId, worldId, x, y, z, trigger)
    return ""
end

---创建对象
---
---如果需要objId，则需要用GetId()获取
---@param objectType number @对象类型枚举(ObjType)
---@param prefabId number|string @类型ID|预制体ID
---@param x number @X坐标
---@param y number @Y坐标
---@param z number @Z坐标
---@param num number @数量
---@param trigger? boolean @是否触发事件(可缺省)
---@param worldId number @星球ID(默认为当前主机所在星球)
---@return table|nil @返回创建对象的列表(Table), 如果创建失败则返回nil
function GameObject:CreatePrefab(objectType, prefabId, x, y, z, num, trigger, worldId)
    return {}
end

---删除对象
---
---(玩家，方块，世界，UI 对象 **不能** 删除)
---@param objId string @对象ID
---@return boolean @返回true表示成功删除，false表示失败
function GameObject:Destroy(objId)
    return true
end

---获取对象的预制ID
---@param objId string @对象ID (掉落物，投掷物，生物 **可用**)
---@return number|string|nil @返回预制ID(number/string)，如果没有找到则返回nil
---@return number @对象类型枚举(bjType)
function GetObjectPrefab(objId)
    return "" or 0, 0
end