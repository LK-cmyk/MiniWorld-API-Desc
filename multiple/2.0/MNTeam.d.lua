--- @class Team
--- 队伍模块管理接口 Team
local Team = {}
_G.Team = Team

--- 当前队伍数量
--- @return number, number @成功返回 ErrorCode.OK 和队伍数量
function Team:getNumTeam() return 0, 0 end

--- 获取指定队伍玩家数量
--- @param teamid number @队伍ID(默认全部)
--- @param alive number @是否存活(0死亡 1存活 2全部，默认全部)
--- @return number, number @成功返回 ErrorCode.OK 和队伍玩家数量
function Team:getTeamPlayerNum(teamid, alive) return 0, 0 end

--- 获取指定队伍玩家
--- @param teamid number @队伍ID(默认全部)
--- @param alive number @是否存活(0死亡 1存活 2全部，默认全部)
--- @return number, number, table @成功返回 ErrorCode.OK, 玩家数量和成员uin数组
function Team:getTeamPlayers(teamid, alive) return 0, 0, {} end

--- 随机一名玩家
--- @param teamid number @队伍ID(默认全部)
--- @param alive number @是否存活(0死亡 1存活 2全部，默认全部)
--- @return number, number @成功返回 ErrorCode.OK 和随机玩家的uin
function Team:randomTeamPlayer(teamid, alive) return 0, 0 end

--- 获取指定队伍生物 (类似 getTeamPlayers)
--- @param teamid number @队伍ID
--- @return number, table @成功返回 ErrorCode.OK 和objid数组
function Team:getTeamCreatures(teamid) return 0, {} end

--- 队伍分数
--- @param teamid number @队伍ID
--- @param score number @要设置的分数
--- @return number @成功返回 ErrorCode.OK
function Team:setTeamScore(teamid, score) return 0 end

--- 获取组队分数
--- @param teamid number @队伍ID
--- @return number, number @成功返回 ErrorCode.OK 和队伍分数
function Team:getTeamScore(teamid) return 0, 0 end

--- 增加队伍分数
--- @param teamid number @队伍ID
--- @param score number @要增加的分数
--- @return number @成功返回 ErrorCode.OK
function Team:addTeamScore(teamid, score) return 0 end

--- 队伍胜负结果
--- @param teamid number @队伍ID
--- @param result number @胜负结果(1获胜 2失败)
--- @return number @成功返回 ErrorCode.OK
function Team:setTeamResults(teamid, result) return 0 end

--- 获取当前队伍胜负
--- @param teamid number @队伍ID
--- @return number, number @成功返回 ErrorCode.OK 和胜负结果(1获胜 2失败)
function Team:getTeamResults(teamid) return 0, 0 end

--- 队伍阵亡次数
--- @param teamid number @队伍ID
--- @param times number @阵亡次数
--- @return number @成功返回 ErrorCode.OK
function Team:setTeamDieTimes(teamid, times) return 0 end

--- 获取队伍总死亡数
--- @param teamid number @队伍ID
--- @return number, number @成功返回 ErrorCode.OK 和总死亡数
function Team:getTeamDieTimes(teamid) return 0, 0 end

--- 增加队伍总死亡数
--- @param teamid number @队伍ID
--- @return number @成功返回 ErrorCode.OK
function Team:addTeamDieTimes(teamid) return 0 end

--- 改变玩家队伍
--- @param playerid number @玩家ID或迷你号
--- @param teamid number @目标队伍ID
--- @return number @成功返回 ErrorCode.OK
function Team:changePlayerTeam(playerid, teamid) return 0 end
