---@class WorldContainer
---世界容器模块管理接口 WorldContainer
local WorldContainer = {}
_G.WorldContainer = WorldContainer

---检测是否是储物箱
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @是否是储物箱
function WorldContainer:CheckStorage(x, y, z)
    return true
end

---清空储物箱
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @操作是否成功
function WorldContainer:ClearStorageBox(x, y, z)
    return true
end

---检测储物箱空余格子,传入道具ID同时检测已存该道具的格子
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param itemid number|string @道具类型ID
---@return boolean @是否有空余格子
function WorldContainer:CheckStorageEmptyGrid(x, y, z, itemid)
    return true
end

---设置储物箱道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param offset number @仓库格子索引(从1开始)
---@param itemid number|string @道具类型ID
---@param num number @道具数量
---@return boolean @操作是否成功
function WorldContainer:SetStorageItem(x, y, z, offset, itemid, num)
    return true
end

---获取储物箱道具ID
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param offset number @仓库格子索引(从1开始)
---@return number,number @道具类型ID,道具数量
function WorldContainer:GetStorageItem(x, y, z, offset)
    return 0, 0
end

---给储物箱添加道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param itemid number|string @道具类型ID
---@param num number @道具数量
---@return number @成功添加数量
function WorldContainer:AddStorageItem(x, y, z, itemid, num)
    return 0
end

---移除储物箱内指定类型的道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param itemid number|string @道具类型ID
---@param num number @道具数量
---@return boolean @操作是否成功
function WorldContainer:RemoveStorageItemByID(x, y, z, itemid, num)
    return true
end

---移除储物箱内指定格子的道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param offset number @储物箱格子索引(从1开始)
---@param num number @道具数量
---@return boolean @操作是否成功
function WorldContainer:RemoveStorageItemByIndex(x, y, z, offset, num)
    return true
end

---将一定数量道具添加到储物箱中
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param itemid number|string @道具类型ID
---@param num number @道具数量
---@return number @成功添加数量
function WorldContainer:AddItemToContainer(x, y, z, itemid, num)
    return 0
end

---移除储物箱中一定数量道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param itemid number|string @道具类型ID
---@param num number @道具数量
---@return boolean @操作是否成功
function WorldContainer:RemoveContainerItemByID(x, y, z, itemid, num)
    return true
end

---清空指定位置的储物箱
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @操作是否成功
function WorldContainer:ClearContainer(x, y, z)
    return true
end

---给当前世界的储物箱添加道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param itemids table @道具数组(成员需含有itemId itemNum)
---@return number @成功添加数量
function WorldContainer:AddWorldStorageItems(x, y, z, itemids)
    return 0
end

---获取储物箱内指定格子的道具实例ID
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param offset number @仓库格子索引(从1开始)
---@return string @道具实例ID
function WorldContainer:GetStorageItemInstanceId(x, y, z, offset)
    return ""
end

---获取储物箱里所有的道具实例(只取通过接口创建的道具实例)
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return table @道具实例ID数组
function WorldContainer:GetAllStorageItemInstanceIds(x, y, z)
    return {}
end

---玩家和指定位置的储物箱或熔炉交换道具
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param grid number @Container格子索引(从1开始)
---@param uin number @玩家uin
---@param grid2 number @玩家格子索引
---@return boolean @操作是否成功
function WorldContainer:SwapContainerItem(x, y, z, grid, uin, grid2)
    return true
end

---获取格子属性
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param offset number @格子索引
---@param attrType number @属性类型
---@return number @属性值
function WorldContainer:GetGridAttr(x, y, z, offset, attrType)
    return 0
end