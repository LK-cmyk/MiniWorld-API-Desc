--- @class WorldContainer
--- 世界容器(熔炉/储物箱)管理接口 WorldContainer
local WorldContainer = {}
_G.WorldContainer = WorldContainer

--- 新增熔炉
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:addFurnace(x, y, z) return 0 end

--- 移除熔炉
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeFurnace(x, y, z) return 0 end

--- 检测是否为熔炉
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:checkFurnace(x, y, z) return 0 end

--- 获取熔炉热度百分比
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和热度百分比
function WorldContainer:getFurnaceHeatPercent(x, y, z) return 0, 0 end

--- 获取熔炉融化百分比
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和融化百分比
function WorldContainer:getFurnaceMeltPercent(x, y, z) return 0, 0 end

--- 新增储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:addStorageBox(x, y, z) return 0 end

--- 移除储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeStorageBox(x, y, z) return 0 end

--- 检测是否为储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:checkStorage(x, y, z) return 0 end

--- 清空储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:clearStorageBox(x, y, z) return 0 end

--- 检测储物箱空余格子，传入道具ID则同时检测已存该道具的格子
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID(0表示空余格子)
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:checkStorageEmptyGrid(x, y, z, itemid) return 0 end

--- 设置储物箱道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param offset number @仓库格子索引(从0开始)
--- @param itemid number @道具ID
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:setStorageItem(x, y, z, offset, itemid, num) return 0 end

--- 获取储物箱道具ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param offset number @仓库格子索引(从0开始)
--- @return number, number, number @成功返回 ErrorCode.OK, 道具ID和道具数量
function WorldContainer:getStorageItem(x, y, z, offset) return 0, 0, 0 end

--- 给储物箱添加道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID
--- @param num number @道具数量
--- @return number, number @成功返回 ErrorCode.OK 和成功添加数量
function WorldContainer:addStorageItem(x, y, z, itemid, num) return 0, 0 end

--- 移除储物箱内指定类型的道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具类型ID
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeStorageItemByID(x, y, z, itemid, num) return 0 end

--- 移除储物箱内指定格子的道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param offset number @储物箱格子索引(从0开始)
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeStorageItemByIndex(x, y, z, offset, num) return 0 end

--- 将一定数量道具添加到储物箱中
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID
--- @param num number @道具数量
--- @return number, number @成功返回 ErrorCode.OK 和成功添加数量
function WorldContainer:addItemToContainer(x, y, z, itemid, num) return 0, 0 end

--- 移除储物箱内一定数量道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具类型ID
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeContainerItemByID(x, y, z, itemid, num) return 0 end

--- 清空指定位置的储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:clearContainer(x, y, z) return 0 end
