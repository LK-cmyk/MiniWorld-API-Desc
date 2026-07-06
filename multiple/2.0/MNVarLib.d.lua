--- @class VarLib2
--- 变量库接口 VarLib2
local VarLib2 = {}
_G.VarLib2 = VarLib2

--- 设置变量库全局变量
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @param val number @设置的值
--- @return number @成功返回 ErrorCode.OK
function VarLib2:setGlobalVarByName(actionattr, msg, val) return 0 end

--- 获取变量库全局变量
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @return number, number @成功返回 ErrorCode.OK 和变量值
function VarLib2:getGlobalVarByName(actionattr, msg) return 0, 0 end

--- 设置变量库私有变量
--- @param objid number @私有变量所属对象ID
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @param val number @设置的值
--- @return number @成功返回 ErrorCode.OK
function VarLib2:setPlayerVarByName(objid, actionattr, msg, val) return 0 end

--- 获取变量库私有变量
--- @param objid number @私有变量所属对象ID
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @return number, number @成功返回 ErrorCode.OK 和变量值
function VarLib2:getPlayerVarByName(objid, actionattr, msg) return 0, 0 end
