--- @class MiniTimer
--- 计时器接口 MiniTimer
local MiniTimer = {}
_G.MiniTimer = MiniTimer

--- 判断计时器是否存在
--- @param id number @计时器ID
--- @return boolean @是否存在
function MiniTimer:isExist(id) return true end

--- 添加计时器
--- @param name string @计时器名称
--- @param mapid? any @地图ID(作用不明，默认不传)
--- @param private? boolean @是否为存档私有计时器(默认true)
--- @return number, number @成功返回 ErrorCode.OK 和计时器ID
function MiniTimer:createTimer(name, mapid, private) return 0, 0 end

--- 删除计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:deleteTimer(id) return 0 end

--- 启动倒计时
--- @param id number @计时器ID
--- @param interval number @倒计时间隔时间
--- @param repeated boolean @是否重复执行
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:startBackwardTimer(id, interval, repeated) return 0 end

--- 启动正向计时
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:startForwardTimer(id) return 0 end

--- 暂停计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:pauseTimer(id) return 0 end

--- 恢复计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:resumeTimer(id) return 0 end

--- 停止计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:stopTimer(id) return 0 end

--- 改变计时器计时
--- @param id number @计时器ID
--- @param time number @计时器计时
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:changeTimerTime(id, time) return 0 end

--- 获取计时器时间
--- @param id number @计时器ID
--- @return number, number @成功返回 ErrorCode.OK 和计时器运行时间
function MiniTimer:getTimerTime(id) return 0, 0 end

--- 显示计时器窗口(若其他计时器已经显示，则替换显示)
--- @param playerids table @玩家ID数组(nil表示全部玩家)
--- @param timerid number @计时器ID
--- @param title string @计时器窗口显示的标题
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:showTimerWnd(playerids, timerid, title) return 0 end

--- 隐藏计时器窗口
--- @param playerids table @玩家ID数组(nil表示全部玩家)
--- @param timerid number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:hideTimerWnd(playerids, timerid) return 0 end
