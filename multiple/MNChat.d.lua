---@class Chat
---消息模块管理接口 - Chat
local Chat = {}
_G.Chat = Chat

---发送聊天信息
---
---**注意：playerId参数传0，表示发送给所有玩家**
---@param content string @内容
---@param playerId number @玩家ID
---@return boolean @是否发送成功
function Chat:SendChat(content, playerId)
    return true
end

---发送系统信息
---
---**注意：playerId参数传0，表示发送给所有玩家**
---@param content string @内容
---@param playerId number @玩家ID
---@return boolean @是否发送成功
function Chat:SendSystemMsg(content, playerId)
    return true
end