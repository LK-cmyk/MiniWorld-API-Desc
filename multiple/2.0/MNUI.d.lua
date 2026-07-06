--- @class UI
--- 游戏UI管理接口 UI
local UI = {}
_G.UI = UI

--- 设置战斗总结UI
--- @param name string @设定名
--- @param value string|boolean @设定值
--- @return number @成功返回 ErrorCode.OK
function UI:setGBattleUI(name, value) return 0 end

--- 世界坐标转换到小地图
--- @param x number @世界X坐标
--- @param y number @世界Y坐标
--- @return number, number, number @成功返回 ErrorCode.OK 和小地图x,z坐标
function UI:world2RadarPos(x, y) return 0, 0, 0 end

--- 世界长度转换到小地图
--- @param length number @世界长度
--- @return number, number @成功返回 ErrorCode.OK 和小地图长度
function UI:world2RadarDist(length) return 0, 0 end

--- 设置小地图模式
--- @param mode number @模式(0默认 1:45度旋转视角 2:全图固定俯视角)
--- @return number @成功返回 ErrorCode.OK
function UI:setMinimapRenderMode(mode) return 0 end

--- 地图标记形状设置，设置成线条(LineShape)
--- @param uiname string @地图标记名称
--- @param p1x number @起点X
--- @param p1y number @起点Y
--- @param p2x number @终点X
--- @param p2y number @终点Y
--- @return number @成功返回 ErrorCode.OK
function UI:setShapeLine(uiname, p1x, p1y, p2x, p2y) return 0 end

--- 地图标记形状设置，设置成圆(CircleShape)
--- @param uiname string @地图标记名称
--- @param x number @圆心X
--- @param y number @圆心Y
--- @param radius number @半径
--- @return number @成功返回 ErrorCode.OK
function UI:setShapeCircle(uiname, x, y, radius) return 0 end

--- 显示屏幕特效
--- @param type number @效果类型(1 speedline 2 powerline 3 fog)
--- @param isloop boolean @是否循环
--- @param incspeed number @增速
--- @return number @成功返回 ErrorCode.OK
function UI:ShowScreenEffect(type, isloop, incspeed) return 0 end
