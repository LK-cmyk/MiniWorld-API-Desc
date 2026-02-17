---@class Player
---玩家模块管理接口 Player
local Player = {}
_G.Player = Player

---获取房主uin
---@return number @房主uin
function Player:GetHostUin()
    return 0
end

---设置玩家是否胜利
---@param uin number @玩家uin
---@param result number @胜利结果
---@return boolean @操作是否成功
function Player:SetGameResults(uin, result)
    return true
end

---设置玩家胜利
---@param uin number @玩家uin
---@return boolean @操作是否成功
function Player:SetGameWin(uin)
    return true
end

---获取玩家手持道具
---@param uin number @玩家uin
---@return number,string @道具ID
function Player:GetCurToolID(uin)
    return 0, ""
end

---获取玩家当前选中快捷栏索引
---@param uin number @玩家uin
---@return number @索引值(1~8)
function Player:GetShotcutIndex(uin)
    return 0
end

---设置玩家当前选中快捷栏索引
---@param uin number @玩家uin
---@param index number @快捷栏索引(1~8)
---@return boolean @操作是否成功
function Player:SetShotcutIndex(uin, index)
    return true
end

---设置道具技能时间
---@param uin number @玩家uin
---@param itemid number|string @道具类型
---@param cd number @冷却时间
---@return boolean @操作是否成功
function Player:SetSkillCD(uin, itemid, cd)
    return true
end

---玩家在指定位置复活
---@param uin number @玩家uin
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @操作是否成功
function Player:ReviveToPos(uin, x, y, z)
    return true
end

---设置玩家复活点
---@param uin number @玩家uin
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @操作是否成功
function Player:SetRevivePoint(uin, x, y, z)
    return true
end

---使玩家显示飘窗文字
---@param uin number @玩家uin
---@param info string @文本内容
---@return boolean @操作是否成功
function Player:NotifyGameInfo2Self(uin, info)
    return true
end

---玩家旋转摄像机角度
---@param uin number @玩家uin
---@param yaw number @视角偏移旋转角度
---@param pitch number @视角仰望旋转角度
---@param issmooth boolean @是否平滑
---@param iscorrectyaw boolean @是否修正
---@param deltayaw number @视角偏移平滑变化量
---@param deltapitch number @视角仰望变化量
---@return boolean @操作是否成功
function Player:RotateCamera(uin, yaw, pitch, issmooth, iscorrectyaw, deltayaw, deltapitch)
    return true
end

---抖动玩家镜头
---@param uin number @玩家uin
---@param power number @强度(取值范围1-1000)
---@param time number @持续时间
---@return boolean @操作是否成功
function Player:ShakeCamera(uin, power, time)
    return true
end

---停止抖动玩家镜头
---@param uin number @玩家uin
---@return boolean @操作是否成功
function Player:StopShakeCamera(uin)
    return true
end

---玩家旋转摄像机角度朝向actor
---@param uin number @玩家uin
---@param objid number @对象ID
---@return boolean @操作是否成功
function Player:RotateCameraToActor(uin, objid)
    return true
end

---玩家改变视角
---@param uin number @玩家uin
---@param viewporttype number @视角类型
---@param islock boolean @是否锁定
---@return boolean @操作是否成功
function Player:ChangeViewMode(uin, viewporttype, islock)
    return true
end

---玩家是否装备了某件装备
---@param uin number @玩家uin
---@param itemid number|string @道具类型
---@return boolean @是否装备
function Player:IsEquipByResID(uin, itemid)
    return true
end

---获取玩家准心位置
---@param uin number @玩家uin
---@return number,number,number @x,y,z坐标
function Player:GetAimPos(uin)
    return 0, 0, 0
end

---获取玩家准心方向
---@param objid number @对象ID
---@return table @单位方向向量
function Player:GetAimDir(objid)
    return {}
end

---获取玩家射线检测起点位置
---@param objid number @对象ID
---@return number,number,number @x,y,z方块坐标
function Player:GetRayOriginPos(objid)
    return 0, 0, 0
end

---对玩家播放背景音乐2D
---@param uin number @玩家uin
---@param musicid number @音乐ID
---@param volume number @声音大小
---@param pitch number @声音音调
---@param isLoop boolean @是否循环
---@return boolean @操作是否成功
function Player:PlayMusic(uin, musicid, volume, pitch, isLoop)
    return true
end

---玩家停止播放背景音乐2D
---@param uin number @玩家uin
---@param musicid number @音乐ID
---@return boolean @操作是否成功
function Player:StopMusic(uin, musicid)
    return true
end

---玩家暂停/恢复播放背景音乐
---@param uin number @玩家uin
---@param musicid number @音乐ID
---@param pause boolean @true暂停/false恢复
---@return boolean @操作是否成功
function Player:PauseMusic(uin, musicid, pause)
    return true
end

---打开一个UI界面
---@param uin number @玩家uin
---@param viewid string @界面ID
---@param effectid number @动作ID(缺省参数)
---@param time number @动画事件(缺省参数)
---@return boolean @操作是否成功
function Player:OpenUIView(uin, viewid, effectid, time)
    return true
end

---隐藏一个UI界面
---@param uin number @玩家uin
---@param viewid string @界面ID
---@param effectid number @动作ID(缺省参数)
---@param time number @动画事件(缺省参数)
---@return boolean @操作是否成功
function Player:HideUIView(uin, viewid, effectid, time)
    return true
end

---获取客机类型
---@param uin number @玩家uin
---@return any @客机类型信息
function Player:GetClientInfo(uin)
    return nil
end

---获取玩家昵称
---@param objid number @对象ID
---@return string @玩家昵称
function Player:GetNickname(objid)
    return ""
end

---打开开发者商店商品购买弹框(开发者账号和自定义按钮点击事件可用)
---@param objid number @对象ID
---@param devGoodsId string @开发者商品ID
---@param customDesc string @自定义商品描述
---@return number @操作结果代码
function Player:OpenDevGoodsBuyDialog(objid, devGoodsId, customDesc)
    return 0
end

---打开开发者商店商品详情页
---@param objid number @对象ID
---@param devGoodsId string @开发者商品ID
---@return number @操作结果代码
function Player:OpenDevGoodsBuyDetailedDialog(objid, devGoodsId)
    return 0
end

---玩家打开开发者商店(仅开发者可用)
---@param objid number @对象ID
---@return any @操作结果
function Player:OpenDevStore(objid)
    return nil
end

---打开开发者商品二级分类
---@param objid number @对象ID
---@param page number @分类页码
---@param name string @分类名称
---@return any @操作结果
function Player:OpenDevStoreTab(objid, page, name)
    return nil
end

---打开开发者商店一级页面
---@param playerid number @玩家ID
---@param pagetype number @页面类型
---@param pagetitle string @页面标题
---@return any @操作结果
function Player:OpenDevGoodsPage(playerid, pagetype, pagetitle)
    return nil
end

---获取玩家的消费统计(有5s冷却限制,触发冷却返回nil)
---@param uin number @玩家uin
---@param tbegin number @开始时间
---@param tend number @结束时间
---@param currencytype number @货币类型
---@param call_back function @内部回调(缺省参数)
---@return number @消费数量(-1表示请求失败)
function Player:GetPlayerCostStatic(uin, tbegin, tend, currencytype, call_back)
    return 0
end

---玩家自定义数据上报埋点
---@param uin number @玩家uin
---@param eventname string @事件名称
---@return boolean @操作是否成功
function Player:StandReportEvent(uin, eventname)
    return true
end

---清空运动趋势(配合'禁止移动'使用)
---@param uin number @玩家uin
---@return boolean @操作是否成功
function Player:ClearMotion(uin)
    return true
end

---玩家手机震动
---@param uin number @玩家uin
---@param time number @震动时长(单位:ms)
---@param amplitude number @震动强度(范围:1~255)
---@return boolean @操作是否成功
function Player:SetMobileVibrate(uin, time, amplitude)
    return true
end

---根据玩家uin,3D坐标获取玩家屏幕2D坐标
---@param uin number @玩家uin
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return number,number @屏幕x坐标,屏幕y坐标
function Player:GetScreenSpacePos(uin, x, y, z)
    return 0, 0
end

---根据玩家uin,3D坐标获取玩家屏幕2D坐标(V2版本)
---@param playerid number @玩家ID
---@param x number @坐标x
---@param y number @坐标y
---@param z number @坐标z
---@return number @屏幕x坐标
function Player:GetScreenSpacePosV2(playerid, x, y, z)
    return 0
end

---发送好友申请
---@param uin1 number @发起申请的玩家uin
---@param uin2 number @添加的好友uin
---@return boolean @操作是否成功
function Player:SendFriendApply(uin1, uin2)
    return true
end

---玩家摄像机变换到位置
---@param uin number @玩家uin
---@param pos table @位置坐标
---@param easingtype number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function Player:SetCameraPosTransformTo(uin, pos, easingtype, time)
    return true
end

---玩家摄像机旋转到角度
---@param uin number @玩家uin
---@param rot table @角度坐标
---@param easingtype number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function Player:SetCameraRotTransformTo(uin, rot, easingtype, time)
    return true
end

---玩家摄像机Fov变换到值
---@param uin number @玩家uin
---@param fov number @Fov值
---@param easingtype number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function Player:SetCameraFovTransformTo(uin, fov, easingtype, time)
    return true
end

---玩家摄像机变换相对位置
---@param uin number @玩家uin
---@param delta table @相对位置坐标(100=1方块)
---@param easingtype number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function Player:SetCameraPosTransformBy(uin, delta, easingtype, time)
    return true
end

---玩家摄像机旋转相对角度
---@param uin number @玩家uin
---@param delta table @相对角度坐标
---@param easingtype number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function Player:SetCameraRotTransformBy(uin, delta, easingtype, time)
    return true
end

---玩家摄像机Fov变换相对值
---@param uin number @玩家uin
---@param delta number @相对Fov值
---@param easingtype number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function Player:SetCameraFovTransformBy(uin, delta, easingtype, time)
    return true
end

---设置玩家的摄像机设置开关
---@param uin number @玩家uin
---@param attrtype number @摄像机属性类型
---@param enable boolean @开关(true开启 false关闭)
---@return boolean @操作是否成功
function Player:SetCameraAttrState(uin, attrtype, enable)
    return true
end

---设置玩家的摄像机旋转模式
---@param uin number @玩家uin
---@param rotmode number @旋转模式
---@return boolean @操作是否成功
function Player:SetCameraRotMode(uin, rotmode)
    return true
end

---设置玩家的摄像机挂载到对象
---@param uin number @玩家uin
---@param targetuin number @目标玩家uin
---@return boolean @操作是否成功
function Player:SetCameraMountObj(uin, targetuin)
    return true
end

---设置玩家的摄像机挂载到位置
---@param uin number @玩家uin
---@param pos table @挂载位置坐标
---@return boolean @操作是否成功
function Player:SetCameraMountPos(uin, pos)
    return true
end

---重置玩家摄像机
---@param uin number @玩家uin
---@return boolean @操作是否成功
function Player:ResetCameraAttr(uin)
    return true
end

---打开可以操作的箱子
---@param uin number @玩家uin
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @操作是否成功
function Player:OpenBoxByPos(uin, x, y, z)
    return true
end

---获取玩家首次邀请人(阻塞接口,请求间隔10s)
---@param uin number @玩家uin
---@param call_back function @内部回调(缺省参数)
---@return number @邀请人的玩家Uin(获取失败时返回错误码)
function Player:GetFirstInviter(uin, call_back)
    return 0
end

---判断两个玩家是否是好友(阻塞接口)
---@param uin1 number @玩家1的uin
---@param uin2 number|string @玩家2的uin
---@return boolean @是否是好友
function Player:HasFriend(uin1, uin2)
    return true
end

---获取玩家VIP等级
---@param uin number @玩家uin
---@return number @VIP等级
function Player:GetMiniVipLevel(uin)
    return 0
end

---改变玩家移动方式
---@param uin number @玩家uin
---@param movetype number @移动类型
---@return boolean @操作是否成功
function Player:ChangPlayerMoveType(uin, movetype)
    return true
end

---触发器播放广告接口
---@param uin number @玩家uin
---@param adname string @广告名称
---@return number,number,string @操作代码,玩家uin,广告名称
function Player:PlayAdvertising(uin, adname)
    return 0, 0, ""
end

---玩家组显示游戏内弹窗
---@param uin number @玩家uin
---@param popuptype number @弹窗类型
---@param bopen boolean @打开或者关闭
---@param data any @附加数据
---@return boolean @操作是否成功
function Player:OpenInnerView(uin, popuptype, bopen, data)
    return true
end

---设置玩家道具设置属性
---@param uin number @玩家uin
---@param itemid number|string @道具ID
---@param abilitytype number @道具能力类型
---@param switch boolean @是否打开
---@return boolean @操作是否成功
function Player:SetItemAttAction(uin, itemid, abilitytype, switch)
    return true
end

---玩家强制打开UI界面
---@param uin number @玩家uin
---@param workstage number @工作阶段
---@return boolean @操作是否成功
function Player:ForceOpenBoxUI(uin, workstage)
    return true
end

---设置道具技能进入冷却
---@param uin number @玩家uin
---@param itemid number|string @道具ID
---@param cd number @CD时间
---@return boolean @操作是否成功
function Player:ItemSkillCDEnter(uin, itemid, cd)
    return true
end

---设置道具技能结束冷却
---@param uin number @玩家uin
---@param itemid number|string @道具ID
---@return boolean @操作是否成功
function Player:ItemSkillCDDone(uin, itemid)
    return true
end

---设置玩家枪械权限
---@param uin number @玩家uin
---@param actiontype number @枪禁用状态枚举
---@param switch boolean @是否打开
---@return boolean @操作是否成功
function Player:SetGunActionState(uin, actiontype, switch)
    return true
end

---获取玩家视角模式
---@param uin number @玩家uin
---@return any @视角模式信息
function Player:GetViewMode(uin)
    return nil
end

---获取玩家复活点
---@param uin number @玩家uin
---@return number,number,number @x,y,z方块坐标
function Player:GetRevivePoint(uin)
    return 0, 0, 0
end

---获取租赁云服务器服主
---@return number @玩家Uin(仅租赁云服生效)
function Player:GetRentCloudServerOwner()
    return 0
end

---将玩家移出本局游戏
---@param objid number @对象ID
---@return boolean @操作是否成功
function Player:RemovePlayer(objid)
    return true
end