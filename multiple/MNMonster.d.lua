--- @class Monster
--- 生物模块管理接口 Monster
local Monster = {}
_G.Monster = Monster

--- 获取生物类型ID
--- @param objid number @对象ID
--- @return number @生物类型ID
function Monster:GetActorID(objid) return 0 end

--- 获取生物类型名称
--- @param objId number @对象ID
--- @return string @生物类型名称
function Monster:GetActorName(objId) return "" end

--- 替换生物
--- @param objId number @原生物对象ID
--- @param newactorId number @新生物类型ID
--- @return number @新生物对象ID
function Monster:ReplaceActor(objId, newactorId) return 0 end

--- 获取生物击杀掉落经验
--- @param actorId number @生物类型ID
--- @return number @击杀掉落经验值
function Monster:GetMonsterDefLevelExp(actorId) return 0 end

--- 设置生物击杀掉落经验
--- @param actorId number @生物类型ID
--- @param exp number @经验值
--- @return boolean @操作是否成功
function Monster:SetMonsterDefLevelExp(actorId, exp) return true end

--- 切换Ai行为树
--- @param objid number @生物对象ID
--- @param treeid number|string @行为树ID
--- @return boolean @操作是否成功
function Monster:ChangeAI(objid, treeid) return true end

--- 怪物对目标是否可见
--- @param objId number @怪物对象ID
--- @param targetUin number @目标玩家uin
--- @return boolean @是否可见
function Monster:CanSee(objId, targetUin) return true end

--- 获取生物的掉落物信息
--- @param actorId number @生物类型ID
--- @return table @掉落物信息表，包含道具ID、数量、概率
function Monster:GetDropItemInfo(actorId) return {} end

--- 设置生物A被玩家驯服
--- @param objId number @生物对象ID
--- @param playerUin number @玩家uin
--- @return boolean @操作是否成功
function Monster:SetTameTarget(objId, playerUin) return true end

--- 随机获取一个生物类型ID
--- @return number @随机生物类型ID
function Monster:RandomActorID() return 0 end

--- 获取驯养主ID
--- @param objId number @生物对象ID
--- @return number @驯养主ID
function Monster:GetTamedOwnerID(objId) return 0 end

--- 获取生物类型外观
--- @param monsterId number|string @生物定义ID或生物预制ID
--- @return any @生物外观模型信息
function Monster:GetFacade(monsterId) return nil end

--- 获取生物定义中的标签组
--- @param actorId number|string @生物类型ID
--- @return table|nil @标签组信息
function Monster:GetTags(actorId) return {} end

--- 获取生物名称
--- @param actorId number|string @生物类型ID
--- @return string|nil @生物名称
function Monster:GetMonsterDefName(actorId) return "" end