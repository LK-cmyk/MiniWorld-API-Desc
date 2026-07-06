--- @class Item
--- 道具模块管理接口 Item
local Item = {}
_G.Item = Item

--- 获取道具名称
--- @param itemid number @道具ID
--- @return number, string @成功返回 ErrorCode.OK 和道具名称
function Item:getItemName(itemid) return 0, "" end

--- 获取actor对应的道具ID，如球类等
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和道具ID
function Item:getItemId(objid) return 0, 0 end

--- 获取掉落物数量
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和掉落物堆叠数量
function Item:getDropItemNum(objid) return 0, 0 end

--- 获取随机道具id
--- @return number, number @成功返回 ErrorCode.OK 和随机道具id
function Item:randomItemID() return 0, 0 end

--- 获取随机投掷物id
--- @return number, number @成功返回 ErrorCode.OK 和随机投掷物id
function Item:randomProjectileID() return 0, 0 end

--- 获取道具类型描述
--- @param itemid number @道具类型ID
--- @return number, number @成功返回 ErrorCode.OK 和道具类型描述
function Item:getItemDesc(itemid) return 0, 0 end

--- 获取道具属性
--- @param itemid number @道具类型ID
--- @param attr number @道具属性枚举(ITEMATTR)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Item:GetAttr(itemid, attr) return 0, 0 end

--- 微缩模型掉落物播放动画
--- @param objid number @掉落物objid
--- @param animid number @动作ID
--- @param playmode number @播放模式(ANIMMODE)
--- @return number @成功返回 ErrorCode.OK
function Item:playAct(objid, animid, playmode) return 0 end
