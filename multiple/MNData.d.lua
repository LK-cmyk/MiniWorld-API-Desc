---@class Data
---普通变量数据管理接口 - Data
local Data = {
    Array = {}, --- 数组变量数据管理接口 - Array
    Table = {}, --- 二维表变量数据管理接口 - Table
    Map = {}, --- 一维表 (KV表) 变量数据管理接口 - Map
}
_G.Data = Data

---获取变量值
---
---**1.全局变量playerId传nil**
---@return boolean @成功返回True，失败返回False
---@param varId string @变量ID
---@param playerId number @玩家ID
---@param value any @默认值
function Data:SetValue(varId, playerId, value)
    return true
end

---获取变量值
---
---**1.全局变量playerId传nil**
---@return any
---@param varId string @变量ID
---@param playerId number @玩家ID
function Data:GetValue(varId, playerId)
    return nil
end

---数值变量增加值
---
---**1.全局变量playerId传nil**
---@return any
---@param varId string @变量ID
---@param playerId number @玩家ID
---@param value number @增加值
function Data:IncreasesValue(varId, playerId, value)
    return nil
end