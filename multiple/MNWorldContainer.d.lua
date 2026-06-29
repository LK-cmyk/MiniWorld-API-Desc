--- @class WorldContainer
--- 世界容器模块管理接口 WorldContainer
local WorldContainer = {}
_G.WorldContainer = WorldContainer

--- 检测是否是储物箱
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @是否是储物箱
function WorldContainer:CheckStorage(x, y, z, worldId) return true end

--- 清空储物箱
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:ClearStorageBox(x, y, z, worldId) return true end

--- 检测储物箱空余格子,传入道具ID同时检测已存该道具的格子
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemId number|string @道具类型ID
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @是否有空余格子
function WorldContainer:CheckStorageEmptyGrid(x, y, z, itemId, worldId) return true end

--- 设置储物箱道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @仓库格子索引(从1开始)
--- @param itemId number|string @道具类型ID
--- @param num number @道具数量
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:SetStorageItem(x, y, z, offset, itemId, num, worldId) return true end

--- 获取储物箱道具ID
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @仓库格子索引(从1开始)
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return number|string|nil, number|string|nil @道具类型ID,道具数量
function WorldContainer:GetStorageItem(x, y, z, offset, worldId) return 0, 0 end

--- 向储物箱按堆叠规则添加道具，返回实际加入的数量
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemId number|string @道具类型ID
--- @param num number @道具数量
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return number|boolean|nil @成功添加数量
function WorldContainer:AddStorageItem(x, y, z, itemId, num, worldId) return 0 end

--- 移除储物箱内指定类型的道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemId number|string @道具类型ID
--- @param num number @道具数量
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:RemoveStorageItemByID(x, y, z, itemId, num, worldId) return true end

--- 移除储物箱内指定格子的道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @储物箱格子索引(从1开始)
--- @param num number @道具数量
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:RemoveStorageItemByIndex(x, y, z, offset, num, worldId) return true end

--- 将一定数量道具添加到储物箱中
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return number @成功添加数量
function WorldContainer:AddItemToContainer(x, y, z, itemid, num, worldId) return 0 end

--- 移除储物箱中一定数量道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:RemoveContainerItemByID(x, y, z, itemid, num, worldId) return true end

--- 清空指定位置的储物箱
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:ClearContainer(x, y, z, worldId) return true end

--- 给当前世界的储物箱添加道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemIds table @道具数组({itemId itemNum}...)
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return number @成功添加数量
function WorldContainer:AddWorldStorageItems(x, y, z, itemIds, worldId) return 0 end

--- 获取储物箱内指定格子的道具实例ID
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @仓库格子索引(从1开始)
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return string @道具实例ID
function WorldContainer:GetStorageItemInstanceId(x, y, z, offset, worldId) return "" end

--- 获取储物箱里所有的道具实例(只取通过接口创建的道具实例)
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return table @道具实例ID数组
function WorldContainer:GetAllStorageItemInstanceIds(x, y, z, worldId) return {} end

--- 玩家和指定位置的储物箱或熔炉交换道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param grid number @Container格子索引(从1开始)
--- @param uin number @玩家uin
--- @param grid2 number @玩家格子索引
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return boolean @操作是否成功
function WorldContainer:SwapContainerItem(x, y, z, grid, uin, grid2, worldId) return true end

--- 获取格子属性
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @格子索引
--- @param attrType number @属性类型
--- @param worldId? number|nil @世界ID (默认当前主机所在星球)
--- @return number @属性值
function WorldContainer:GetGridAttr(x, y, z, offset, attrType, worldId) return 0 end