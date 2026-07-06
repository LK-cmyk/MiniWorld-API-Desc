--- @class Game
--- 游戏模块管理接口 Game
local Game = {}
_G.Game = Game

--- 游戏结束
--- @return number @成功返回 ErrorCode.OK
function Game:doGameEnd() return 0 end

--- 派发自定义事件
--- @param msgid string @事件ID
--- @param params table @事件参数
--- @return number @成功返回 ErrorCode.OK
function Game:dispatchEvent(msgid, params) return 0 end

--- 获取默认字符串
--- @param id string @字符串ID
--- @return number, string @成功返回 ErrorCode.OK 和字符串
function Game:getDefString(id) return 0, "" end

--- 设置脚本参数，供自定义使用
--- @param index number @序列索引(0~100)
--- @param val number @索引对应的值
--- @return number @成功返回 ErrorCode.OK
function Game:setScriptVar(index, val) return 0 end

--- 获取脚本参数，自定义使用
--- @param index number @序列索引(0~100)
--- @return number, number @成功返回 ErrorCode.OK 和索引对应的值
function Game:getScriptVar(index) return 0, 0 end

--- 上传设置好的脚本参数
--- @return number @成功返回 ErrorCode.OK
function Game:sendScriptVars2Client() return 0 end

--- 新增全局效果
--- @param path string @效果名称
--- @param effectid number @命名ID
--- @return number, number @成功返回 ErrorCode.OK 和特效ID
function Game:addRenderGlobalEffect(path, effectid) return 0, 0 end

--- 移除全局效果
--- @param effectid number @命名ID
--- @return number @成功返回 ErrorCode.OK
function Game:removeRenderGlobalEffect(effectid) return 0 end

--- 设置全局效果位置
--- @param effectid number @命名ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function Game:setRenderGlobalEffectPos(effectid, x, y, z) return 0 end

--- 设置全局效果缩放
--- @param effectid number @命名ID
--- @param scalex number @X缩放值
--- @param scaley number @Y缩放值
--- @param scalez number @Z缩放值
--- @return number @成功返回 ErrorCode.OK
function Game:setRenderGlobalEffectScale(effectid, scalex, scaley, scalez) return 0 end

--- 消息弹框
--- @param msg string @消息内容
--- @return number @成功返回 ErrorCode.OK
function Game:msgBox(msg) return 0 end

--- 分割字符串
--- @param str string @要分割的字符串
--- @param mark string @分割符号
--- @return number, table @成功返回 ErrorCode.OK 和字符串组
function Game:splitStr(str, mark) return 0, {} end
