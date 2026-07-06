--- @class Creature
--- 生物模块管理接口 Creature
local Creature = {}
_G.Creature = Creature

--- 生物属性获取
--- @param objid number @生物objid
--- @param attrtype number @生物属性枚举(CREATUREATTR)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Creature:getAttr(objid, attrtype) return 0, 0 end

--- 生物属性设置
--- @param objid number @生物objid
--- @param attrtype number @生物属性枚举(CREATUREATTR)
--- @param val number @设置的数值
--- @return number @成功返回 ErrorCode.OK
function Creature:setAttr(objid, attrtype, val) return 0 end

--- 判断该生物是否成年
--- @param objid number @生物objid
--- @return number @成功返回 ErrorCode.OK(已成年)
function Creature:isAdult(objid) return 0 end

--- 设置是否依赖氧气
--- @param objid number @生物objid
--- @param v boolean @是否需要氧气
--- @return number @成功返回 ErrorCode.OK
function Creature:setOxygenNeed(objid, v) return 0 end

--- 获取驯养主ID
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和驯养主uin(0表示未驯服)
function Creature:getTamedOwnerID(objid) return 0, 0 end

--- 设置是否正在惊慌
--- @param objid number @生物objid
--- @param v boolean @是否正在惊慌
--- @return number @成功返回 ErrorCode.OK
function Creature:setPanic(objid, v) return 0 end

--- 设置AI是否生效
--- @param objid number @生物objid
--- @param v boolean @AI是否生效
--- @return number @成功返回 ErrorCode.OK
function Creature:setAIActive(objid, v) return 0 end

--- 获取生物actorID
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和生物actorID
function Creature:getActorID(objid) return 0, 0 end

--- 获取生物名称
--- @param objid number @生物objid
--- @return number, string @成功返回 ErrorCode.OK 和生物名称
function Creature:getActorName(objid) return 0, "" end

--- 增加模组属性
--- @param objid number @生物objid
--- @param attrtype number @附魔属性类型(MODATTRIB_TYPE)
--- @param value number @设置数值大小
--- @return number @成功返回 ErrorCode.OK
function Creature:addModAttrib(objid, attrtype, value) return 0 end

--- 获取模组属性
--- @param objid number @生物objid
--- @param attrtype number @附魔属性类型(MODATTRIB_TYPE)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Creature:getModAttrib(objid, attrtype) return 0, 0 end

--- 设置生物队伍
--- @param objid number @生物objid
--- @param teamid number @队伍ID
--- @return number @成功返回 ErrorCode.OK
function Creature:setTeam(objid, teamid) return 0 end

--- 获取生物队伍
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和队伍ID
function Creature:getTeam(objid) return 0, 0 end

--- 获取最大饥饿度
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和最大饥饿度
function Creature:getMaxFood(objid) return 0, 0 end

--- 获取饥饿度
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和当前饥饿度
function Creature:getFood(objid) return 0, 0 end

--- 设置饥饿度
--- @param objid number @生物objid
--- @param val number @设置的数值
--- @return number @成功返回 ErrorCode.OK
function Creature:setFood(objid, val) return 0 end

--- HP恢复
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和HP恢复值
function Creature:getHpRecover(objid) return 0, 0 end

--- 最大氧气值
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和最大氧气值
function Creature:getMaxOxygen(objid) return 0, 0 end

--- 行走速度
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和行走速度
function Creature:getWalkSpeed(objid) return 0, 0 end

--- 游泳速度（水中速度）
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和游泳速度
function Creature:getSwimSpeed(objid) return 0, 0 end

--- 跳跃力
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和跳跃力
function Creature:getJumpPower(objid) return 0, 0 end

--- 重量
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和重量
function Creature:getMass(objid) return 0, 0 end

--- 闪避
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和闪避值
function Creature:getDodge(objid) return 0, 0 end

--- 近程攻击
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和近程攻击值
function Creature:getPunchAttack(objid) return 0, 0 end

--- 远程攻击
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和远程攻击值
function Creature:getRangeAttack(objid) return 0, 0 end

--- 近程防御
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和近程防御值
function Creature:getPunchDefense(objid) return 0, 0 end

--- 远程防御
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和远程防御值
function Creature:getRangeDefense(objid) return 0, 0 end

--- 设置血量上限
--- @param objid number @生物objid
--- @param val number @设置的最大生命值
--- @return number @成功返回 ErrorCode.OK
function Creature:setMaxHp(objid, val) return 0 end

--- 设置血量
--- @param objid number @生物objid
--- @param val number @设置的当前生命值
--- @return number @成功返回 ErrorCode.OK
function Creature:setHP(objid, val) return 0 end

--- 设置HP恢复
--- @param objid number @生物objid
--- @param val number @设置的生命恢复值
--- @return number @成功返回 ErrorCode.OK
function Creature:setHpRecover(objid, val) return 0 end

--- 设置氧气
--- @param objid number @生物objid
--- @param val number @设置的氧气值
--- @return number @成功返回 ErrorCode.OK
function Creature:setOxygen(objid, val) return 0 end

--- 设置行走速度
--- @param objid number @生物objid
--- @param val number @设置的行走速度
--- @return number @成功返回 ErrorCode.OK
function Creature:setWalkSpeed(objid, val) return 0 end

--- 设置游泳速度（水中速度）
--- @param objid number @生物objid
--- @param val number @设置的游泳速度
--- @return number @成功返回 ErrorCode.OK
function Creature:setSwimSpeed(objid, val) return 0 end

--- 设置跳跃力
--- @param objid number @生物objid
--- @param val number @设置的跳跃力
--- @return number @成功返回 ErrorCode.OK
function Creature:setJumpPower(objid, val) return 0 end

--- 设置闪避
--- @param objid number @生物objid
--- @param val number @设置的闪避值
--- @return number @成功返回 ErrorCode.OK
function Creature:setDodge(objid, val) return 0 end

--- 设置近程攻击
--- @param objid number @生物objid
--- @param val number @设置的近程攻击值
--- @return number @成功返回 ErrorCode.OK
function Creature:setPunchAttack(objid, val) return 0 end

--- 设置远程攻击
--- @param objid number @生物objid
--- @param val number @设置的远程攻击值
--- @return number @成功返回 ErrorCode.OK
function Creature:setRangeAttack(objid, val) return 0 end

--- 设置近程防御
--- @param objid number @生物objid
--- @param val number @设置的近程防御值
--- @return number @成功返回 ErrorCode.OK
function Creature:setPunchDefense(objid, val) return 0 end

--- 设置远程防御
--- @param objid number @生物objid
--- @param val number @设置的远程防御值
--- @return number @成功返回 ErrorCode.OK
function Creature:setRangeDefense(objid, val) return 0 end

--- 替换生物
--- @param objid number @要替换的生物objid
--- @param actorid number @替换为的生物类型ID
--- @param hp number @替换后的生物血量
--- @return number @成功返回 ErrorCode.OK
function Creature:replaceActor(objid, actorid, hp) return 0 end

--- 获取生物名称
--- @param monsterid number @生物类型ID
--- @return number, string @成功返回 ErrorCode.OK 和生物类型名称
function Creature:GetMonsterDefName(monsterid) return 0, "" end

--- 获取生物类型描述
--- @param monsterid number @生物类型ID
--- @return number, string @成功返回 ErrorCode.OK 和生物类型描述
function Creature:GetMonsterDefDesc(monsterid) return 0, "" end
