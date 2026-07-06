--- @class Player
--- 玩家模块管理接口 Player
local Player = {}
_G.Player = Player

--- 玩家属性获取
--- @param objid number @玩家ID
--- @param attrtype number @玩家属性枚举(PLAYERATTR)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Player:getAttr(objid, attrtype) return 0, 0 end

--- 玩家属性设置
--- @param objid number @玩家ID
--- @param attrtype number @玩家属性枚举(PLAYERATTR)
--- @param val number @设置的数值
--- @return number @成功返回 ErrorCode.OK
function Player:setAttr(objid, attrtype, val) return 0 end

--- 获取房主uin
--- @return number, number @成功返回 ErrorCode.OK 和房主迷你号
function Player:getHostUin() return 0, 0 end

--- 是否是本地玩家
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK(是本地玩家)
function Player:isMainPlayer(objid) return 0 end

--- 获取本地玩家的uin
--- @return number, number @成功返回 ErrorCode.OK 和本地玩家迷你号
function Player:getMainPlayerUin() return 0, 0 end

--- 获取玩家比赛结果
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和结果(0游戏中 1胜利 2结束)
function Player:getGameResults(objid) return 0, 0 end

--- 设置玩家比赛结果
--- @param objid number @玩家ID
--- @param result number @结果(0游戏中 1胜利 2结束)
--- @return number @成功返回 ErrorCode.OK
function Player:setGameResults(objid, result) return 0 end

--- 获取玩家游戏分数
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和分数
function Player:getGameScore(objid) return 0, 0 end

--- 设置玩家游戏分数
--- @param objid number @玩家ID
--- @param score number @分数
--- @return number @成功返回 ErrorCode.OK
function Player:setGameScore(objid, score) return 0 end

--- 获取玩家的排行
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和排行
function Player:getGameRanking(objid) return 0, 0 end

--- 给玩家设置排行
--- @param objid number @玩家ID
--- @param rank number @排行
--- @return number @成功返回 ErrorCode.OK
function Player:setGameRanking(objid, rank) return 0 end

--- 给玩家增加道具
--- @param objid number @玩家ID
--- @param itemid number @道具ID
--- @param num number @数量
--- @param prioritytype? number @优先存放(1快捷栏 2背包栏，默认1)
--- @return number @成功返回 ErrorCode.OK
function Player:gainItems(objid, itemid, num, prioritytype) return 0 end

--- 传送到出生点
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:teleportHome(objid) return 0 end

--- 获取玩家当前手持的物品id
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和物品ID
function Player:getCurToolID(objid) return 0, 0 end

--- 获取玩家昵称
--- @param objid number @玩家ID
--- @return number, string @成功返回 ErrorCode.OK 和昵称
function Player:getNickname(objid) return 0, "" end

--- 移走背包里的物品
--- @param objid number @玩家ID
--- @param itemid number @物品ID
--- @param num number @数量
--- @return number @成功返回 ErrorCode.OK
function Player:removeBackpackItem(objid, itemid, num) return 0 end

--- 获取玩家死亡次数
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和死亡次数
function Player:getDieTimes(objid) return 0, 0 end

--- 获取玩家剩下的生命次数
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和剩余生命次数
function Player:getLeftLifeNum(objid) return 0, 0 end

--- 设置玩家队伍
--- @param objid number @玩家ID
--- @param teamid number @队伍ID
--- @return number @成功返回 ErrorCode.OK
function Player:setTeam(objid, teamid) return 0 end

--- 获取玩家队伍
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和队伍ID
function Player:getTeam(objid) return 0, 0 end

--- 获取当前饱食度
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和饱食度
function Player:getFoodLevel(objid) return 0, 0 end

--- 设置玩家饱食度
--- @param objid number @玩家ID
--- @param foodLevel number @饱食度
--- @return number @成功返回 ErrorCode.OK
function Player:setFoodLevel(objid, foodLevel) return 0 end

--- 获取当前所用快捷栏键
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和快捷栏索引
function Player:getCurShotcut(objid) return 0, 0 end

--- 设置当前玩家手持的道具消耗
--- @param objid number @玩家ID
--- @param num number @消耗数量
--- @return number @成功返回 ErrorCode.OK
function Player:onCurToolUsed(objid, num) return 0 end

--- 设置CD
--- @param objid number @玩家ID
--- @param itemid number @道具ID
--- @param cd number @技能冷却时长
--- @return number @成功返回 ErrorCode.OK
function Player:setSkillCD(objid, itemid, cd) return 0 end

--- 复活玩家到指定点
--- @param objid number @玩家ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function Player:reviveToPos(objid, x, y, z) return 0 end

--- 改变玩家复活点位置
--- @param objid number @玩家ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function Player:setRevivePoint(objid, x, y, z) return 0 end

--- 玩家乘上坐骑
--- @param objid number @玩家Uin
--- @param objid2 number @坐骑ID(传入0登下坐骑)
--- @param bctrl? boolean @是否可以控制(不填默认不可控制)
--- @return number @成功返回 ErrorCode.OK
function Player:mountActor(objid, objid2, bctrl) return 0 end

--- 玩家播放动画
--- @param objid number @玩家迷你号
--- @param actid number @动作ID
--- @return number @成功返回 ErrorCode.OK
function Player:playAct(objid, actid) return 0 end

--- 对玩家显示飘窗文字
--- @param objid number @玩家ID
--- @param info string @文字内容
--- @return number @成功返回 ErrorCode.OK
function Player:notifyGameInfo2Self(objid, info) return 0 end

--- 使玩家使用当前道具
--- @param objid number @玩家ID
--- @param itemid number @道具ID
--- @param status number @使用状态
--- @param onshift boolean @是否按下shift键
--- @return number @成功返回 ErrorCode.OK
function Player:useItem(objid, itemid, status, onshift) return 0 end

--- 旋转玩家镜头
--- @param objid number @玩家ID
--- @param yaw number @水平旋转角度
--- @param pitch number @俯仰角
--- @return number @成功返回 ErrorCode.OK
function Player:rotateCamera(objid, yaw, pitch) return 0 end

--- 改变玩家视角模式
--- @param objid number @玩家ID
--- @param viewmode number @视角模式(VIEWPORTTYPE)
--- @param islock boolean @是否锁定
--- @return number @成功返回 ErrorCode.OK
function Player:changeViewMode(objid, viewmode, islock) return 0 end

--- 设置玩家行为属性状态
--- @param objid number @玩家ID
--- @param actionattr number @行为属性(PLAYERATTR_ENABLE)
--- @param switch boolean @是否可以
--- @return number @成功返回 ErrorCode.OK
function Player:setActionAttrState(objid, actionattr, switch) return 0 end

--- 获取玩家特殊属性的状态
--- @param objid number @玩家ID
--- @param actionattr number @行为属性(PLAYERATTR_ENABLE)
--- @return number @成功返回 ErrorCode.OK(可以)
function Player:checkActionAttrState(objid, actionattr) return 0 end

--- 设置玩家是否装备了某件装备
--- @param objid number @玩家ID
--- @param resid number @装备ID
--- @return number @成功返回 ErrorCode.OK(已装备)
function Player:isEquipByResID(objid, resid) return 0 end

--- 设置player位置
--- @param objid number @玩家ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function Player:setPosition(objid, x, y, z) return 0 end

--- 获取player准星位置
--- @param objid number @玩家ID
--- @return number, number, number, number @成功返回 ErrorCode.OK 和x,y,z坐标
function Player:getAimPos(objid) return 0, 0, 0, 0 end

--- 设置玩家道具设置属性：丢弃、掉落
--- @param objid number @玩家ID
--- @param itemid number @道具ID
--- @param attrtype number @属性(1不可丢弃 2不可掉落)
--- @param switch boolean @是否开启
--- @return number @成功返回 ErrorCode.OK
function Player:setItemAttAction(objid, itemid, attrtype, switch) return 0 end

--- 对玩家播放背景音乐
--- @param objid number @玩家ID
--- @param musicId number @音乐ID
--- @param volume number @音量
--- @param pitch number @音高
--- @param isLoop boolean @是否循环
--- @return number @成功返回 ErrorCode.OK
function Player:playMusic(objid, musicId, volume, pitch, isLoop) return 0 end

--- 停止播放玩家背景音乐
--- @param objid number @玩家ID
--- @param musicId string @音乐ID
--- @return number @成功返回 ErrorCode.OK
function Player:stopMusic(objid, musicId) return 0 end

--- 使玩家获得游戏胜利
--- @param objid number @玩家迷你号
--- @return number @成功返回 ErrorCode.OK
function Player:setGameWin(objid) return 0 end

--- 打开开发者商店
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:openDevStore(objid) return 0 end

--- 玩家手持道具的类型
--- @param objid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和道具ID
function Player:getPropsType(objid) return 0, 0 end

--- 设置检测掉落物半径
--- @param objid number @玩家ID
--- @param range number @缩放比例
--- @return number @成功返回 ErrorCode.OK
function Player:setCheckBoxScale(objid, range) return 0 end

--- 打开可以操作的箱子
--- @param objid number @玩家ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function Player:openBoxByPos(objid, x, y, z) return 0 end

--- 强制打开可以操作的方块 如工具箱
--- @param objid number @玩家ID
--- @param itemid number @工具箱方块ID
--- @return number @成功返回 ErrorCode.OK
function Player:forceOpenBoxUI(objid, itemid) return 0 end

--- 打开开发者商店商品弹窗
--- @param objid number @玩家ID
--- @param devGoodsId number @商品id
--- @param customDesc string @商品描述
--- @return number @成功返回 ErrorCode.OK
function Player:openDevGoodsBuyDialog(objid, devGoodsId, customDesc) return 0 end

--- 改变玩家移动方式
--- @param objid number @玩家ID
--- @param moveType number @移动方式(1飞行 2默认)
--- @return number @成功返回 ErrorCode.OK
function Player:changPlayerMoveType(objid, moveType) return 0 end

--- 设置玩家免疫伤害类型
--- @param objid number @玩家ID
--- @param immunetype number @伤害类型
--- @param isadd boolean @是否开启
--- @return number @成功返回 ErrorCode.OK
function Player:setImmuneType(objid, immunetype, isadd) return 0 end

--- 抖动玩家镜头
--- @param objid number @玩家ID
--- @param duration number @抖动持续秒数
--- @param power number @抖动力度
--- @return number @成功返回 ErrorCode.OK
function Player:shakeCamera(objid, duration, power) return 0 end

--- 停止抖动玩家镜头
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:stopShakeCamera(objid) return 0 end

--- 玩家播放qq音乐
--- @param objid number @玩家ID
--- @param musicId number @音乐ID
--- @param volume number @音量
--- @param isLoop boolean @是否循环
--- @return number @成功返回 ErrorCode.OK
function Player:playQQMusic(objid, musicId, volume, isLoop) return 0 end

--- 暂停/恢复/停止玩家的QQ音乐
--- @param operate number @操作(QQMUSICOP)
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:operateQQMusic(operate, objid) return 0 end

--- 打开评价界面
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:OpenAppraiseView(objid) return 0 end

--- 打开收藏界面
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:OpenCollectionView(objid) return 0 end

--- 判断是否是迷你会员
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK(是会员)
function Player:IsMiniVip(objid) return 0 end

--- 发送好友请求
--- @param playerid number @发送请求的玩家ID
--- @param playerid2 number @被添加的好友ID
--- @return number @成功返回 ErrorCode.OK
function Player:SendFriendApply(playerid, playerid2) return 0 end

--- 判断是否有好友
--- @param playerid number @玩家ID
--- @param playerid2 number @好友ID
--- @return number @成功返回 ErrorCode.OK(是好友)
function Player:HasFriend(playerid, playerid2) return 0 end

--- 玩家手持微缩道具播放动画
--- @param playerid number @玩家ID
--- @param animid number @动作ID
--- @param playmode number @播放模式(ANIMMODE)
--- @return number @成功返回 ErrorCode.OK
function Player:PlayActInHand(playerid, animid, playmode) return 0 end

--- 玩家打开开发者商店（仅开发者可用）
--- @param objid number @玩家Uin
--- @return number @成功返回 ErrorCode.OK
function Player:openDevStoreNew(objid) return 0 end

--- 打开内置排行榜
--- @param objid number @玩家ID
--- @param id number @排行榜ID
--- @return number @成功返回 ErrorCode.OK
function Player:OpenBuiltinRank(objid, id) return 0 end

--- 隐藏内置排行榜
--- @param objid number @玩家ID
--- @return number @成功返回 ErrorCode.OK
function Player:HideBuiltinRank(objid) return 0 end

--- 打开开发者商店商品详情页
--- @param objid number @玩家Uin
--- @param devGoodsId number @商品ID
--- @return number @成功返回 ErrorCode.OK
function Player:openDevGoodsBuyDetailedDialog(objid, devGoodsId) return 0 end

--- 玩家手机震动
--- @param playerid number @玩家Uin
--- @param time number @震动时长(ms)
--- @param amplitude number @震动强度(1~255)
--- @return number @成功返回 ErrorCode.OK
function Player:setMobileVibrate(playerid, time, amplitude) return 0 end

--- 玩家摄像机变换相对位置
--- @param playerid number @玩家Uin
--- @param vec table @变换轴向{x,y,z}
--- @param animid number @动画枚举(LinearTransformation)
--- @param time number @动画时长
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraPosTransformBy(playerid, vec, animid, time) return 0 end

--- 玩家摄像机变换到位置
--- @param playerid number @玩家Uin
--- @param vec table @变换轴向{x,y,z}
--- @param animid number @动画枚举(LinearTransformation)
--- @param time number @动画时长
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraPosTransformTo(playerid, vec, animid, time) return 0 end

--- 玩家摄像机旋转相对角度
--- @param playerid number @玩家Uin
--- @param vec table @变换轴向{x,y,z}
--- @param animid number @动画枚举(LinearTransformation)
--- @param time number @动画时长
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraRotTransformBy(playerid, vec, animid, time) return 0 end

--- 玩家摄像机旋转到角度
--- @param playerid number @玩家Uin
--- @param vec table @变换轴向{x,y,z}
--- @param animid number @动画枚举(LinearTransformation)
--- @param time number @动画时长
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraRotTransformTo(playerid, vec, animid, time) return 0 end

--- 玩家摄像机Fov变换相对值
--- @param playerid number @玩家Uin
--- @param value number @视场角
--- @param animid number @动画枚举(LinearTransformation)
--- @param time number @动画时长
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraFovTransformBy(playerid, value, animid, time) return 0 end

--- 玩家摄像机Fov变换到值
--- @param playerid number @玩家Uin
--- @param value number @视场角
--- @param animid number @动画枚举(LinearTransformation)
--- @param time number @动画时长
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraFovTransformTo(playerid, value, animid, time) return 0 end

--- 设置玩家的摄像机设置开关
--- @param playerid number @玩家Uin
--- @param attr number @摄像机属性(CameraModel)
--- @param enable boolean @是否开启
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraAttrState(playerid, attr, enable) return 0 end

--- 设置玩家的摄像机旋转模式
--- @param playerid number @玩家Uin
--- @param attr number @摄像机旋转模式(CameraRotate)
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraRotMode(playerid, attr) return 0 end

--- 设置玩家的摄像机挂载到对象
--- @param playerid number @玩家Uin
--- @param objid number @对象objid
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraMountObj(playerid, objid) return 0 end

--- 设置玩家的摄像机挂载到位置
--- @param playerid number @玩家Uin
--- @param pos table @位置坐标
--- @return number @成功返回 ErrorCode.OK
function Player:SetCameraMountPos(playerid, pos) return 0 end

--- 重置玩家摄像机
--- @param playerid number @玩家Uin
--- @return number @成功返回 ErrorCode.OK
function Player:ResetCameraAttr(playerid) return 0 end

--- 打开皮肤商品购买弹框
--- @param playerid number @玩家Uin
--- @param skin string @模型ID
--- @param desc string @描述语
--- @return number @成功返回 ErrorCode.OK
function Player:openDevGoodsSkinBuyDialog(playerid, skin, desc) return 0 end

--- 打开皮肤商品详情页(仅限自定义UI按钮响应事件)
--- @param playerid number @玩家Uin
--- @param skin string @模型ID
--- @return number @成功返回 ErrorCode.OK
function Player:openDevGoodsSkinDetail(playerid, skin) return 0 end

--- 打开皮肤商店(仅限自定义UI按钮响应事件)
--- @param playerid number @玩家Uin
--- @return number @成功返回 ErrorCode.OK
function Player:openDevGoodsSkin(playerid) return 0 end

--- 打开好友邀请界面
--- @param playerid number @玩家Uin
--- @return number @成功返回 ErrorCode.OK
function Player:OpenInviteBulletBox(playerid) return 0 end

--- 获取玩家首次邀请人(阻塞接口，请求间隔10s)
--- @param playerid number @被邀请的玩家Uin
--- @return number, number @成功返回 ErrorCode.OK 和邀请人的玩家Uin
function Player:GetFirstInviter(playerid) return 0, 0 end

--- 获取玩家新邀请的玩家组(阻塞接口，最多返回200个数据，请求间隔10s)
--- @param objid number @玩家Uin
--- @return number, table @成功返回 ErrorCode.OK 和玩家ID数组
function Player:GetNewInviteGroup(objid) return 0, {} end

--- 打开开发者商店页面
--- @param objid number @玩家Uin
--- @param pagetype number @页面枚举值(MiniShopPage)
--- @param pagetitle string @页面标题
--- @return number @成功返回 ErrorCode.OK
function Player:OpenDevGoodsPage(objid, pagetype, pagetitle) return 0 end

--- 获取玩家的消费统计（有15s冷却限制）
--- @param objid number @玩家Uin
--- @param tbegin number @开始时间的时间戳
--- @param tend number @结束时间的时间戳
--- @param costtype number @查询类型(1迷你豆 2迷你币)
--- @return number, number @成功返回 ErrorCode.OK 和消费数量
function Player:GetPlayerCostStatic(objid, tbegin, tend, costtype) return 0, 0 end
