---@class Graphics
---图形界面模块管理接口 Graphics
local Graphics = {}
_G.Graphics = Graphics

---创建文字板信息
---@param title string @文本内容
---@param font number @字体大小
---@param apha number @不透明度
---@param autoWrap number @自动换行(默认自动换行)
---@return table @文本信息内容
function Graphics:MakeGraphicsText(title, font, apha, autoWrap)
    return {}
end

---创建漂浮文字信息
---@param title string @文本信息
---@param font number @字体大小
---@param apha number @不透明度
---@return table @漂浮文字信息内容
function Graphics:MakeflotageText(title, font, apha)
    return {}
end

---创建进度条信息
---@param current number @当前进度值
---@param total number @总进度值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @进度条信息内容
function Graphics:MakeGraphicsProgress(current, total, color, apha)
    return {}
end

---生成指向位置的箭头数据
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param size number @缩放值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @箭头信息内容
function Graphics:MakeGraphicsArrowToPos(x, y, z, size, color, apha)
    return {}
end

---生成指向位置的线数据
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param size number @缩放值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @线信息内容
function Graphics:MakeGraphicsLineToPos(x, y, z, size, color, apha)
    return {}
end

---生成指向位置的面数据
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param size number @缩放值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @面信息内容
function Graphics:MakeGraphicsSurfaceToPos(x, y, z, size, color, apha)
    return {}
end

---生成指向对象的箭头数据
---@param objid number @对象ID
---@param size number @缩放值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @箭头信息内容
function Graphics:MakeGraphicsArrowToActor(objid, size, color, apha)
    return {}
end

---生成指向对象的线数据
---@param objid number @对象ID
---@param size number @缩放值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @线信息内容
function Graphics:MakeGraphicsLineToActor(objid, size, color, apha)
    return {}
end

---生成指向对象的面数据
---@param objid number @对象ID
---@param size number @缩放值
---@param color string @颜色值(十六进制)
---@param apha number @不透明度
---@return table @面信息内容
function Graphics:MakeGraphicsSurfaceToActor(objid, size, color, apha)
    return {}
end

---生成图片信息
---@param imgid string @图片ID
---@param size number @缩放值
---@param height number @高度
---@param apha number @不透明度
---@return table @图片信息内容
function Graphics:MakeGraphicsImage(imgid, size, height, apha)
    return {}
end

---创建图文信息
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param info table @图文信息
---@param x2 number @X坐标偏移(缺省参数)
---@param y2 number @Y坐标偏移(缺省参数)
---@return number @图文对象ID
function Graphics:CreateGraphicsTxtByPos(x, y, z, info, x2, y2)
    return 0
end

---在生物身上创建文字板
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return number @图文实例ID
function Graphics:CreateGraphicsTxtByActor(objid, info, offset, distance)
    return 0
end

---在位置上创建漂浮文字
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param info table @图文信息
---@param x2 number @X坐标偏移(缺省参数)
---@param y2 number @Y坐标偏移(缺省参数)
---@return number @图文实例ID
function Graphics:CreateflotageTextByPos(x, y, z, info, x2, y2)
    return 0
end

---在生物身上创建漂浮文字
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return number @图文实例ID
function Graphics:CreateflotageTextByActor(objid, info, offset, distance)
    return 0
end

---在位置上创建进度条
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param info table @图文信息
---@param x2 number @X坐标偏移(缺省参数)
---@param y2 number @Y坐标偏移(缺省参数)
---@return boolean @操作是否成功
function Graphics:CreateGraphicsProgressByPos(x, y, z, info, x2, y2)
    return true
end

---在生物身上创建进度条
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsProgressByActor(objid, info, offset, distance)
    return true
end

---删除位置上的图文信息
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param graphid number @图文ID
---@param graphType number @图文类型
---@return boolean @操作是否成功
function Graphics:RemoveGraphicsByPos(x, y, z, graphid, graphType)
    return true
end

---删除生物的图文信息
---@param objid number @对象ID
---@param graphid number @图文ID
---@param graphType number @图文类型
---@return boolean @操作是否成功
function Graphics:RemoveGraphicsByObjID(objid, graphid, graphType)
    return true
end

---更新图文信息的文字内容
---@param graphid number @图文ID
---@param title string @文本内容
---@param fontsize number @字体大小
---@param apha number @不透明度
---@return boolean @操作是否成功
function Graphics:UpdateGraphicsTextById(graphid, title, fontsize, apha)
    return true
end

---创建生物指向位置的箭头
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByActorToPos(objid, info, offset, distance)
    return true
end

---创建生物指向生物的箭头
---@param srcObjid number @源对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByActorToActor(srcObjid, info, offset, distance)
    return true
end

---创建位置指向位置的箭头
---@param pos table @位置坐标{x=x, y=y, z=z}
---@param info table @图文信息
---@return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByPosToPos(pos, info)
    return true
end

---创建位置指向生物的箭头
---@param pos table @位置坐标{x=x, y=y, z=z}
---@param info table @图文信息
---@return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByPosToActor(pos, info)
    return true
end

---创建生物与位置的线
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsLineByActorToPos(objid, info, offset, distance)
    return true
end

---创建指向生物的线
---@param srcObjid number @源对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsLineByActorToActor(srcObjid, info, offset, distance)
    return true
end

---创建位置指向位置的线
---@param pos table @位置坐标{x=x, y=y, z=z}
---@param info table @图文信息
---@return boolean @操作是否成功
function Graphics:CreateGraphicsLineByPosToPos(pos, info)
    return true
end

---创建位置指向生物的线
---@param pos table @位置坐标{x=x, y=y, z=z}
---@param info table @图文信息
---@return boolean @操作是否成功
function Graphics:CreateGraphicsLineByPosToActor(pos, info)
    return true
end

---创建生物与位置的面
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByActorToPos(objid, info, offset, distance)
    return true
end

---创建生物与生物的引导面
---@param srcObjid number @源对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByActorToActor(srcObjid, info, offset, distance)
    return true
end

---创建位置指向位置的面
---@param pos table @位置坐标{x=x, y=y, z=z}
---@param info table @图文信息
---@return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByPosToPos(pos, info)
    return true
end

---创建位置指向生物的面
---@param pos table @位置坐标{x=x, y=y, z=z}
---@param info table @图文信息
---@return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByPosToActor(pos, info)
    return true
end

---将src相关的所有图文信息转移到des身上
---@param srcObjid number @源对象ID
---@param desObjid number @目标对象ID
---@return boolean @是否成功
function Graphics:ReplaceAllGraphics(srcObjid, desObjid)
    return true
end

---在位置上创建图像
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param info table @图文信息
---@param x2 number @X坐标偏移(缺省参数)
---@param y2 number @Y坐标偏移(缺省参数)
---@return boolean @是否成功
function Graphics:CreateGraphicsImageByPos(x, y, z, info, x2, y2)
    return true
end

---在生物上创建图像
---@param objid number @对象ID
---@param info table @图文信息
---@param offset table @方向偏移距离{x=x, y=y, z=z}
---@param distance number @偏移距离
---@return boolean @是否成功
function Graphics:CreateGraphicsImageByActor(objid, info, offset, distance)
    return true
end

---获取玩家昵称或称号的偏移高度
---@param objid number @对象ID
---@param nameType number @名称类型
---@param callback function @回调函数
---@return number @高度值(未展示返回0)
function Graphics:GetInnerGraphicsOffset(objid, nameType, callback)
    return 0
end