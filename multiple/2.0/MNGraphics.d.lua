--- @class Graphics
--- 图文信息管理接口 Graphics
local Graphics = {}
_G.Graphics = Graphics

--- 创建文字板信息
--- @param title string @显示的文字标题
--- @param font number @字体大小
--- @param alpha number @不透明度(0完全透明 100不透明)
--- @param itype number @文字板的编号
--- @param autoWrap? boolean @是否自动换行(默认true)
--- @return table @文本信息内容
function Graphics:makeGraphicsText(title, font, alpha, itype, autoWrap) return {} end

--- 创建漂浮文字信息
--- @param title string @显示的文字标题
--- @param font number @字体大小
--- @param itype number @漂浮文字的编号
--- @return table @漂浮文字信息
function Graphics:makeflotageText(title, font, itype) return {} end

--- 创建进度条信息
--- @param v1 number @进度条的当前值
--- @param v2 number @进度条的最大值
--- @param color number @进度条的颜色
--- @param itype number @进度条的编号
--- @return table @进度条信息
function Graphics:makeGraphicsProgress(v1, v2, color, itype) return {} end

--- 生成指向位置的箭头数据
--- @param x number @指向X坐标
--- @param y number @指向Y坐标
--- @param z number @指向Z坐标
--- @param size number @箭头大小
--- @param color number @箭头颜色
--- @param id number @编号
--- @return table @箭头数据
function Graphics:makeGraphicsArrowToPos(x, y, z, size, color, id) return {} end

--- 生成指向位置的线数据
--- @param x number @指向X坐标
--- @param y number @指向Y坐标
--- @param z number @指向Z坐标
--- @param size number @线的大小
--- @param color number @线的颜色
--- @param id number @编号
--- @return table @线数据
function Graphics:makeGraphicsLineToPos(x, y, z, size, color, id) return {} end

--- 生成指向位置的面数据
--- @param x number @指向X坐标
--- @param y number @指向Y坐标
--- @param z number @指向Z坐标
--- @param size number @面的大小
--- @param color number @面的颜色
--- @param id number @编号
--- @return table @面数据
function Graphics:makeGraphicsSurfaceToPos(x, y, z, size, color, id) return {} end

--- 生成指向对象的箭头数据
--- @param objid number @生物id
--- @param size number @箭头大小
--- @param color number @箭头颜色
--- @param id number @编号
--- @return table @箭头数据
function Graphics:makeGraphicsArrowToActor(objid, size, color, id) return {} end

--- 生成指向对象的线数据
--- @param objid number @生物id
--- @param size number @线的大小
--- @param color number @线的颜色
--- @param id number @编号
--- @return table @线数据
function Graphics:makeGraphicsLineToActor(objid, size, color, id) return {} end

--- 生成指向对象的面数据
--- @param objid number @生物id
--- @param size number @面的大小
--- @param color number @面的颜色
--- @param id number @编号
--- @return table @面数据
function Graphics:makeGraphicsSurfaceToActor(objid, size, color, id) return {} end

--- 在位置上创建文字板
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param graphicInfo table @图文设置的属性信息
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsTxtByPos(x, y, z, graphicInfo, x2, y2) return 0, 0 end

--- 在生物身上创建文字板
--- @param objid number @生物objid
--- @param graphicInfo table @图文设置的属性信息
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsTxtByActor(objid, graphicInfo, dir, offset, x2, y2) return 0, 0 end

--- 在位置上创建漂浮文字
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param graphicInfo table @图文设置的属性信息
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createflotageTextByPos(x, y, z, graphicInfo, x2, y2) return 0, 0 end

--- 在生物身上创建漂浮文字
--- @param objid number @生物objid
--- @param graphicInfo table @图文设置的属性信息
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createflotageTextByActor(objid, graphicInfo, dir, offset, x2, y2) return 0, 0 end

--- 在位置上创建进度条
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param graphicInfo table @进度条设置的属性信息
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsProgressByPos(x, y, z, graphicInfo, x2, y2) return 0, 0 end

--- 在生物身上创建进度条
--- @param objid number @生物objid
--- @param graphicInfo table @进度条设置的属性信息
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsProgressByActor(objid, graphicInfo, dir, offset, x2, y2) return 0, 0 end

--- 删除位置上的图文信息
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itype number @图文信息组类型(编号)
--- @param graphType number @图文类型枚举值
--- @return number @成功返回 ErrorCode.OK
function Graphics:removeGraphicsByPos(x, y, z, itype, graphType) return 0 end

--- 删除生物的图文信息
--- @param objid number @生物objid
--- @param itype number @图文信息组类型(编号)
--- @param graphType number @图文类型枚举值
--- @return number @成功返回 ErrorCode.OK
function Graphics:removeGraphicsByObjID(objid, itype, graphType) return 0 end

--- 更新图文信息的文字内容
--- @param graphid number @已创建的图文信息ID
--- @param title string @文字内容
--- @param fontsize? number @字体大小(可不填)
--- @param alpha? number @不透明度
--- @return number @成功返回 ErrorCode.OK
function Graphics:updateGraphicsTextById(graphid, title, fontsize, alpha) return 0 end

--- 更新进度条的进度
--- @param graphid number @已创建的图文信息ID
--- @param curval number @进度条当前值
--- @param maxval number @进度条最大值
--- @return number @成功返回 ErrorCode.OK
function Graphics:updateGraphicsProgressById(graphid, curval, maxval) return 0 end

--- 创建生物指向位置的箭头
--- @param objid number @生物id
--- @param info table @箭头信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByActorToPos(objid, info, dir, offset) return 0 end

--- 创建生物指向生物的箭头
--- @param objid number @生物id
--- @param info table @箭头信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByActorToActor(objid, info, dir, offset) return 0 end

--- 创建位置指向位置的箭头
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @箭头信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByPosToPos(x, y, z, info) return 0 end

--- 创建位置指向生物的箭头
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @箭头信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByPosToActor(x, y, z, info) return 0 end

--- 创建生物与位置的线
--- @param objid number @生物id
--- @param info table @线信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByActorToPos(objid, info, dir, offset) return 0 end

--- 创建指向生物的线
--- @param objid number @生物id
--- @param info table @线信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByActorToActor(objid, info, dir, offset) return 0 end

--- 创建位置指向位置的线
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @线信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByPosToPos(x, y, z, info) return 0 end

--- 创建位置指向生物的线
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @线信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByPosToActor(x, y, z, info) return 0 end

--- 创建指向位置的面
--- @param objid number @生物id
--- @param info table @面信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByActorToPos(objid, info, dir, offset) return 0 end

--- 创建指向生物的面
--- @param objid number @生物id
--- @param info table @面信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByActorToActor(objid, info, dir, offset) return 0 end

--- 创建位置指向位置的面
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @面信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByPosToPos(x, y, z, info) return 0 end

--- 创建位置指向生物的面
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @面信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByPosToActor(x, y, z, info) return 0 end

--- 刷新信息至客机(在更新图文信息接口之后调用)
--- @return number @成功返回 ErrorCode.OK
function Graphics:snycGraphicsInfo2Client() return 0 end

--- 创建图片信息
--- @param imgid number @图片ID
--- @param scale number @图片大小缩放
--- @param alpha number @图片透明度
--- @param id number @图片的编号
--- @return table @图片信息
function Graphics:makeGraphicsImage(imgid, scale, alpha, id) return {} end

--- 在生物身上创建图片
--- @param objid table @生物或玩家ID
--- @param info table @图片信息(makeGraphicsImage生成)
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsImageByActor(objid, info, dir, offset, x2, y2) return 0 end

--- 在位置上创建图片
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @图片信息(makeGraphicsImage生成)
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsImageByPos(x, y, z, info, x2, y2) return 0 end
