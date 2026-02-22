---@class CustomUI
---界面模块管理接口 - CustomUI
local CustomUI = {}
_G.CustomUI = CustomUI

---设置文本元件内容
---@return boolean
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param text string @文本内容
---@param animId? number @动画ID(缺省参数)
---@param time? number @动画时长(缺省参数)
---@param mode? number @播放模式(缺省参数)
function CustomUI:SetText(playerId, uiId, elementId, text, animId, time, mode)
    return true
end

---设置元件图案纹理
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param url string @图案纹理ID
function CustomUI:SetTexture(playerId, uiId, elementId, url)
    return true
end

---设置元件大小
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param width number @元件宽度
---@param heigth number @元件高度
function CustomUI:SetSize(playerId, uiId, elementId, width, heigth)
    return true
end

---设置文本元件字体大小
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param size number @字体大小
function CustomUI:SetFontSize(playerId, uiId, elementId, size)
    return true
end

---设置元件颜色
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param color number @颜色值(0xFFFFFF)
function CustomUI:SetColor(playerId, uiId, elementId, color)
    return true
end

---显示元件
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param effectid? number @动画ID(缺省参数)
---@param time? number @动画时长(缺省参数)
function CustomUI:ShowElement(playerId, uiId, elementId, effectid, time)
    return true
end

---隐藏元件
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param effectid? number @动画ID(缺省参数)
---@param time? number @动画时长(缺省参数)
function CustomUI:HideElement(playerId, uiId, elementId, effectid, time)
    return true
end

---旋转元件
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param rotate number @旋转角度
function CustomUI:RotateElement(playerId, uiId, elementId, rotate)
    return true
end

---设置元件透明度
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param alpha number @透明度(0-100)
function CustomUI:SetAlpha(playerId, uiId, elementId, alpha)
    return true
end

---设置状态
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param pageIndex number @状态值
---@param easeType number @缓动类型枚举(Easing)
---@param time? number @动画时长(缺省函数)
function CustomUI:SetState(playerId, uiId, elementId, pageIndex, easeType, time)
    return true
end

---设置元件位置
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param x number @X坐标
---@param y number @Y坐标
function CustomUI:SetPosition(playerId, uiId, elementId, x, y)
    return true
end

---设置模型装载器的模型缩放
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param x number @X缩放
---@param y number @Y缩放
function CustomUI:SetScale(playerId, uiId, elementId, x, y)
    return true
end

---获取道具类型图标
---@return string|nil @成功时返回道具图标的资源标识符
---@param itemId number|string 道具ID
function CustomUI:GetItemIcon(itemId)
    return ""
end

---获取生物图标
---@return string|nil @成功时返回生物图标的资源标识符
---@param objId number @生物ID
function CustomUI:GetMonsterObjIcon(objId)
    return ""
end

---获取生物类型图标
---@return string|nil @成功时返回生物类型图标的资源标识符
---@param actor number|string @生物类型ID
function CustomUI:GetMonsterIcon(actor)
    return ""
end

---获取状态图标
---@return string|nil @成功时返回状态图标的资源标识符
---@param buffId number @状态ID
function CustomUI:GetStatusIcon(buffId)
    return ""
end


---获取方块类型图标
---@return string|nil @成功时返回方块类型图标的资源标识符
---@param blockId number|string @方块类型ID
function CustomUI:GetBlockIcon(blockId)
    return ""
end

---获取玩家当前角色图标
---@return string|nil @成功时返回玩家当前角色图标的资源标识符
---@param playerId number @玩家ID
function CustomUI:GetRoleIcon(playerId)
    return ""
end

---获取玩家当前角色图标
---@return string|nil @成功时返回玩家当前角色头像的资源标识符
---@param playerId number @玩家ID
function CustomUI:GetRoleHeadIcon(playerId)
    return ""
end

---获取玩家快捷栏图标
---@return string|nil @成功时返回玩家快捷栏图标的资源标识符
---@param playerId number @玩家ID
---@param ix number @快捷栏索引(1-8)
function CustomUI:GetShortcutIcon(playerId, ix)
    return ""
end

---元件平滑移动到指定位置
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param x number @目标X坐标
---@param y number @目标Y坐标
function CustomUI:SmoothMoveTo(playerId, uiId, elementId, time, x, y)
    return true
end

---元件平滑移动相对距离
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param x number @X坐标
---@param y number @Y坐标
function CustomUI:SmoothMoveBy(playerId, uiId, elementId, time, x, y)
    return true
end

---元件平滑改变到指定宽度和高度
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param w number @目标宽度
---@param h number @目标高度
function CustomUI:SmoothScaleTo(playerId, uiId, elementId, time, w, h)
    return true
end

---元件平滑改变相对宽度和高度
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param w number @宽度
---@param h number @高度
function CustomUI:SmoothScaleBy(playerId, uiId, elementId, time, w, h)
    return true
end

---元件平滑改变相对缩放大小（子节点也会改变大小）
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param x number @X缩放
---@param y number @Y缩放
---@param delayTime number @延迟时间
---@param easeType number @缓动类型枚举(Easing)
function CustomUI:SmoothScaleByEx(playerId, uiId, elementId, time, x, y, delayTime, easeType)
    return true
end

---元件平滑旋转到指定角度
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param angle number @目标角度
function CustomUI:SmoothRotateTo(playerId, uiId, elementId, time, angle)
   return true
end

---元件平滑旋转相对角度
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长(>0)
---@param angle number @角度
function CustomUI:SmoothRotateBy(playerId, uiId, elementId, time, angle)
    return true
end

---元件播放动画
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param animId number @动画ID
---@param time number @动画时长(>0)
---@param mode number @播放模式枚举(AnimMode)
---@param easeType number @缓动类型枚举(Easing)
---@param delayTime number @延迟时间
---@param endValue number @动画结束值
function CustomUI:PlayElementAnim(playerId, uiId, elementId, animId, time, mode, easeType, delayTime, endValue)
    return true
end

---元件停止动画
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param iType number @类型(lement-如果为0就是停止所有的UI的动效，1就是停止elementid对应的UI动效)
function CustomUI:StopAnim(playerId, uiId, elementId, iType)
    return true
end

---设置装载器的模型（调用道具实例的模型：模型名称填"ItemInstance_道具实例id"）
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param modelName string @模型名称
function CustomUI:SetLoaderModel(playerId, uiId, elementId, modelName)
    return true
end

---设置装载器的模型缩放
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param modelScale number @模型缩放值
function CustomUI:SetLoaderModelScale(playerId, uiId, elementId, modelScale)
    return true
end

---设置装载器的模型方向
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param yaw number @水平角度(角度制)
function CustomUI:SetLoaderModelDir(playerId, uiId, elementId, yaw)
    return true
end

---设置装载器的模型位置
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param x number @X坐标
---@param y number @Y坐标
---@param z number @Z坐标
function CustomUI:SetLoaderModelPosition(playerId, uiId, elementId, x, y, z)
    return true
end

---设置装载器的模型动画
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param animId number @动画ID
---@param playMode number @播放模式枚举(AnimMode)
---@param spend number @播放速度(0-1)
function CustomUI:SetLoaderModelAnim(playerId, uiId, elementId, animId, playMode, spend)
    return true
end

---滑动列表跳转到某位置
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param x number @目标X坐标
---@param y number @目标Y坐标
function CustomUI:TurnSliderToPos(playerId, uiId, elementId, x, y)
    return true
end

---设置滑动列表的滑动方式
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param dir number @滑动方向(0:水平，1:垂直, 2:自由)
function CustomUI:SetSliderDir(playerId, uiId, elementId, dir)
    return true
end

---设置滑动条的图片
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param url string @图片资源ID
function CustomUI:SetSliderBarImg(playerId, uiId, elementId, url)
    return true
end

---设置元件相对位置
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param v number @水平偏移枚举(HorizontalOffset)
---@param xOffset number @X方向数值
---@param xUnits number @像素单位枚举(PixelUnits)
---@param h number @垂直偏移枚举(VerticalOffset)
---@param yOffset number @Y方向数值
---@param yUnits number @像素单位枚举(PixelUnits)
function CustomUI:SetRelationPosition(playerId, uiId, elementId, v, xOffset, xUnits, h, yOffset, yUnits)
    return true
end

---设置元件相对大小
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param width number @宽度数值
---@param widthUnits number @宽度单位枚举(PixelUnits)
---@param heigth number @高度数值
---@param heigthUnits number @高度单位枚举(PixelUnits)
function CustomUI:SetRelationSize(playerId, uiId, elementId, width, widthUnits, heigth, heigthUnits)
    return true
end

---动态创建元件
---@return string @成功时返回元件ID
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementType number @元件类型枚举(ElementType)
function CustomUI:CreateElement(playerId, uiId, elementType)
    return ""
end

---克隆元件
---@return string @成功时返回元件ID
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @目标元件ID
function CustomUI:CloneElement(playerId, uiId, elementId)
    return ""
end

---修改元件父元件
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param parentElementId string @父元件ID
function CustomUI:ChangeParent(playerId, uiId, elementId, parentElementId)
    return true
end

---设置玩家界面进度条的值
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param iType number @类型枚举(ProgressType)
---@param value number @设定值
function CustomUI:SetProgressBarValue(playerId, uiId, elementId, iType, value)
    return true
end

---获取玩家界面进度条的值
---@return number, number, number @成功时返回最小值，最大值，当前值
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param iType number @类型枚举(ProgressType)
function CustomUI:GetProgressBarValue(playerId, uiId, elementId, iType)
    return 0, 0, 0
end

---设置玩家界面进度条的纹理
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param iType number @类型枚举(ProgressType)
---@param url string @纹理资源ID 
function CustomUI:SetProgressBarResId(playerId, uiId, elementId, iType, url)
    return true
end

---进度条文本平滑计时
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param bVal number @开始值
---@param eVal number @结束值
---@param time number @动画时长
function CustomUI:SmoothChangeProgress(playerId, uiId, elementId, bVal, eVal, time)
    return true
end

---设置动画元件动画ID
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param animId number @动画ID
---@param animIndex number @动画序列
---@param playMode number @播放模式枚举(ViedoPlayMode)
function CustomUI:SetSpineAnimID(playerId, uiId, elementId, animId, animIndex, playMode)
    return true
end

---进度条文本平滑增加计时
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
---@param time number @动画时长
---@param pType number @类型枚举(1.增加, 2.减少. 3.变化至)
---@param value number @变化值
function CustomUI:SmoothIncreaseProgress(playerId, uiId, elementId, time, pType, value)
    return true
end

---设置伤害文本
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param elementId string @元件ID
---@param objId number @目标对象ID
---@param text string @文本内容
---@param color number @颜色
---@param offsetX number @X偏移
---@param offsetY number @Y偏移
---@param moveX number @移动X
---@param moveY number @移动Y
---@param showTime number @显示时间
---@param moveX2 number @移动X2
---@param moveY2 number @移动Y2
---@param showTime2 number @显示时间2
function CustomUI:SetFloatDamageTxt(playerId, elementId, objId, text, color, offsetX, offsetY, moveX, moveY, showTime, moveX2, moveY2, showTime2)
    return true
end

---获取客机屏幕分辨率
---@return table @返回屏幕大小:{w, h}
function CustomUI:GetScreenSize(playerId)
    return {}
end

---删除UI元件
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
function CustomUI:DeleteElement(playerId, uiId, elementId)
    return true
end