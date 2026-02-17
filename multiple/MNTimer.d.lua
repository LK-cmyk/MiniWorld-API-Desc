---@class Timer
---计时器模块管理接口 Timer
local Timer = {}
_G.Timer = Timer

---判断计时器是否存在
---@param id number @计时器ID
---@return boolean @是否存在
function Timer:IsExist(id)
    return true
end

---添加计时器
---@param name string @计时器名称
---@return number @计时器ID
function Timer:CreateTimer(name)
    return 0
end

---删除计时器
---@param timerid number @计时器ID
---@return boolean @操作是否成功
function Timer:DeleteTimer(timerid)
    return true
end

---启动倒计时
---@param id number @计时器ID
---@param interval number @开始倒计时时间
---@param repeated boolean @是否重复
---@return boolean @操作是否成功
function Timer:StartBackwardTimer(id, interval, repeated)
    return true
end

---启动正向计时
---@param id number @计时器ID
---@return boolean @操作是否成功
function Timer:StartForwardTimer(id)
    return true
end

---暂停计时器
---@param id number @计时器ID
---@return boolean @操作是否成功
function Timer:PauseTimer(id)
    return true
end

---恢复计时器
---@param id number @计时器ID
---@return boolean @操作是否成功
function Timer:ResumeTimer(id)
    return true
end

---停止计时器
---@param id number @计时器ID
---@return boolean @操作是否成功
function Timer:StopTimer(id)
    return true
end

---改变计时器计时
---@param id number @计时器ID
---@param curtime number @计时器当前时刻
---@return boolean @操作是否成功
function Timer:ChangeTimerTime(id, curtime)
    return true
end

---获取计时器时间
---@param id number @计时器ID
---@return number @当前倒计时时间
function Timer:GetTimerTime(id)
    return 0
end

---显示计时器窗口(若其他计时器已经显示，则替换显示)
---@param playerids table @玩家ID/玩家id数组
---@param timerid number @计时器ID
---@param title string @计时器窗口显示的标题
---@return boolean @操作是否成功
function Timer:ShowTimerWnd(playerids, timerid, title)
    return true
end

---隐藏计时器窗口
---@param playerids table @玩家ID/玩家id数组
---@param timerid number @计时器ID
---@return boolean @操作是否成功
function Timer:HideTimerWnd(playerids, timerid)
    return true
end