---@class Buff
---状态模块管理接口 Buff
local Buff = {}
_G.Buff = Buff

---给对象附加效果
---@param objid number @对象ID
---@param buffid number|string @效果ID
---@param customticks number @效果持续时间 **(-1表示默认配置，0表示无限)**
---@return boolean @成功(true)
function Buff:AddBuff(objid, buffid, customticks)
    return true
end

---给对象移除指定效果
---@param objid number @对象ID
---@param buffid number|string @效果ID
---@return boolean @成功(true)
function Buff:RemoveBuff(objid, buffid)
    return true
end

---给对象清除所有效果
---@param objid number @对象ID
---@return boolean @成功(true)
function Buff:ClearAllBuff(objid)
    return true
end

---为对象清除所有负面效果
---@param objid number @对象ID
---@return boolean @成功(true)
function Buff:ClearAllBadBuff(objid)
    return true
end

---为对象清除所有有益效果
---@param objid number @对象ID
---@return boolean @成功(true)
function Buff:ClearAllGoodBuff(objid)
    return true
end

---判断对象身上是否有指定效果
---@param objid number @对象ID
---@param buffid number|string @效果ID
---@param bufflv number @效果等级
---@return boolean @成功(true)
function Buff:HasBuff(objid, buffid, bufflv)
    return true
end

---获取对象身上效果列表
---@param objid number @对象ID
---@return number, table @效果数量, 效果ID数组
function Buff:GetBuffList(objid)
    return 0, {}
end

---获取对象身上指定效果数量
---@param objid number @对象ID
---@param buffid number|string @效果ID
---@return number @数量
function Buff:GetBuffNumByBuffid(objid, buffid)
    return 0
end

---获取对象身上指定效果剩余时间
---@param objid number @对象ID
---@param buffid number|string @效果ID
---@return number @剩余时间 **(秒，0表示永久)**
function Buff:GetBuffLeftTime(objid, buffid)
    return 0
end

---获取状态效果名称
---@param buffid number|string @效果ID
---@return string @效果名称
function Buff:GetBuffDefName(buffid)
    return ""
end

---获取状态效果描述
---@param buffid number|string @效果ID
---@return string @状态效果描述
function Buff:GetBuffDefDesc(buffid)
    return ""
end

---替换已有状态
---@param objid number @对象ID
---@param buffsrc number|string @源状态ID
---@param buffsrclv number @源状态等级
---@param buffdst number|string @目标状态
---@param buffdstlv number @目标状态等级
---@param customticks number @持续时间
---@return boolean @替换成功 **(true)** 或失败 **(false)**
function Buff:ReplaceBuff(objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks)
    return true
end