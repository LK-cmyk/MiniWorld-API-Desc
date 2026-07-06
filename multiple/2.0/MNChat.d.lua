--- @class Chat
--- 聊天接口 Chat
local Chat = {}
_G.Chat = Chat

--- 发送聊天消息(默认全部玩家)
--- @param content string @消息内容
--- @param targetuin? number @目标玩家uin(0表示全部玩家，默认0)
--- @return number @成功返回 ErrorCode.OK
function Chat:sendChat(content, targetuin) return 0 end

--- 发送系统消息(默认全部玩家)
--- @param content string @消息内容
--- @param targetuin? number @目标玩家uin(0表示全部玩家，默认0)
--- @return number @成功返回 ErrorCode.OK
function Chat:sendSystemMsg(content, targetuin) return 0 end
