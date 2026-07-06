--- @class MapMark
--- 小地图接口 MapMark
local MapMark = {}
_G.MapMark = MapMark

--- 新增一个形状(线，矩形，圆形)
--- @param type number @形状类型(0线 1矩形 2圆形)
--- @param isshow boolean @是否显示
--- @param r number @颜色R值(0~255)
--- @param g number @颜色G值(0~255)
--- @param b number @颜色B值(0~255)
--- @return number, number @成功返回 ErrorCode.OK 和形状ID
function MapMark:newShape(type, isshow, r, g, b) return 0, 0 end

--- 删除一个形状
--- @param shapeid number @形状ID
--- @return number @成功返回 ErrorCode.OK
function MapMark:deleteShape(shapeid) return 0 end

--- 设置形状颜色
--- @param shapeid number @形状ID
--- @param r number @颜色R值(0~255)
--- @param g number @颜色G值(0~255)
--- @param b number @颜色B值(0~255)
--- @return number @成功返回 ErrorCode.OK
function MapMark:setShapeColor(shapeid, r, g, b) return 0 end

--- 设置形状显示 or 隐藏
--- @param shapeid number @形状ID
--- @param showflag boolean @是否显示(true显示 false隐藏)
--- @return number @成功返回 ErrorCode.OK
function MapMark:showShape(shapeid, showflag) return 0 end

--- 更新形状(线形)，传入起始坐标和末尾坐标
--- @param shapeid number @形状ID
--- @param sx number @起始X坐标
--- @param sz number @起始Z坐标
--- @param ex number @末尾X坐标
--- @param ez number @末尾Z坐标
--- @return number @成功返回 ErrorCode.OK
function MapMark:updateLine(shapeid, sx, sz, ex, ez) return 0 end

--- 更新形状(矩形)，传入起始坐标和尺寸
--- @param shapeid number @形状ID
--- @param sx number @起始X坐标
--- @param sz number @起始Z坐标
--- @param w number @X方向宽度
--- @param h number @Z方向高度
--- @return number @成功返回 ErrorCode.OK
function MapMark:updateRectangle(shapeid, sx, sz, w, h) return 0 end

--- 更新形状(圆形)，传入圆心坐标和半径
--- @param shapeid number @形状ID
--- @param cx number @圆心X坐标
--- @param cz number @圆心Z坐标
--- @param r number @半径
--- @return number @成功返回 ErrorCode.OK
function MapMark:updateCircle(shapeid, cx, cz, r) return 0 end
