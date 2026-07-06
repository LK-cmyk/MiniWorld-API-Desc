--- @class ObjectLib
--- 对象库接口 ObjectLib
local ObjectLib = {}
_G.ObjectLib = ObjectLib

--- 获取区域数据
--- @param uuid number @区域ID
--- @return number, number @成功返回 ErrorCode.OK 和区域运行ID
function ObjectLib:getAreaData(uuid) return 0, 0 end

--- 获取位置数据
--- @param uuid number @位置ID
--- @return number, number @成功返回 ErrorCode.OK 和位置运行ID
function ObjectLib:getPositionData(uuid) return 0, 0 end

--- 获取生物数据
--- @param uuid number @生物ID
--- @return number, number @成功返回 ErrorCode.OK 和生物运行ID
function ObjectLib:getLivingData(uuid) return 0, 0 end

--- 获取道具点数据
--- @param uuid number @道具ID
--- @return number, number @成功返回 ErrorCode.OK 和道具运行ID
function ObjectLib:getItemData(uuid) return 0, 0 end
