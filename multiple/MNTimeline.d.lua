--- @class Timeline
--- 剧情动画模块管理接口 Timeline
local Timeline = {}
_G.Timeline = Timeline

--- 对所有玩家播放Timeline
--- @param timelineId string @Timeline 资源id
--- @return boolean @成功(true)
function Timeline:PlayForAll(timelineId) return true end

--- 对指定玩家播放Timeline
--- @param uin number @玩家UIN
--- @param timelineId string @Timeline 资源id
--- @param reverse boolean @是否反向播放
--- @param playToEnd boolean @是否播放到结尾
--- @return boolean @成功(true)
function Timeline:PlayForPlayer(uin, timelineId, reverse, playToEnd) return true end

--- 暂停指定玩家的Timeline播放
--- @param uin number @玩家UIN
--- @param timelineId string @Timeline 资源id
--- @return boolean @成功(true)
function Timeline:Pause(uin, timelineId) return true end

--- 恢复指定玩家的Timeline播放
--- @param uin number @玩家UIN
--- @param timelineId string @Timeline 资源id
--- @return boolean @成功(true)
function Timeline:Resume(uin, timelineId) return true end

--- 跳过指定玩家当前正在播放的Timeline
--- @param uin number @玩家UIN
--- @return boolean @成功(true)
function Timeline:SkipForPlayer(uin) return true end

--- 获取玩家Timeline播放状态
--- @param uin number @玩家UIN
--- @param timelineId string @Timeline 资源id
--- @return number @播放状态(0空闲 1播放中 2暂停)
function Timeline:GetPlayerState(uin, timelineId) return 0 end

--- 检查所有玩家是否都已播放完成指定Timeline
--- @param timelineId string @Timeline 资源 id
--- @return boolean @全部完成(true)
function Timeline:IsAllFinished(timelineId) return true end
