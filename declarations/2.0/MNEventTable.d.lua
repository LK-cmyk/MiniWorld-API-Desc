--- MiniWorld UGC 2.0 事件回调参数表（由 MNEvent.d.json 生成）
--- 事件名中的点号在类名里用下划线表示，如 Player.ClickBlock → EventInfo.Player_ClickBlock。

--- @class EventInfo.Backpack_ItemChange @容器内道具变化
--- @field blockid any @方块类型
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Backpack_ItemPutIn @容器内有道具放入
--- @field blockid any @方块类型
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Backpack_ItemTakeOut @容器内有道具取出
--- @field blockid any @方块类型
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Game_Hour @世界小时时间变化
--- @field hour any @游戏小时时间

--- @class EventInfo.Game_RunTime @世界Tick变化
--- @field second any @游戏分钟
--- @field ticks any @游戏秒

--- @class EventInfo.Game_AnyPlayer_Defeat @任一玩家失败
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Game_AnyPlayer_EnterGame @任一玩家进入
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Game_AnyPlayer_LeaveGame @任一玩家离开
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Game_AnyPlayer_Victory @任一玩家胜利
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Player_AddBuff @玩家获得状态效果
--- @field eventobjid any @事件玩家
--- @field buffid any @状态ID
--- @field bufflvl any @状态等级

--- @class EventInfo.Player_AddItem @玩家获得道具
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量

--- @class EventInfo.Player_AreaIn @玩家进入区域
--- @field eventobjid any @事件玩家
--- @field areaid any @区域ID

--- @class EventInfo.Player_AreaOut @玩家离开区域
--- @field eventobjid any @事件玩家
--- @field areaid any @区域ID

--- @class EventInfo.Player_AttackHit @玩家击中目标
--- @field eventobjid any @事件玩家
--- @field targetactorid any @被攻击的对象

--- @class EventInfo.Player_Attack @玩家攻击
--- @field eventobjid any @玩家攻击
--- @field shortix any @事件中的快捷栏
--- @field x any @事件中位置X
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Player_BackPackChange @背包栏变化
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field itemix any @道具所在格子索引

--- @class EventInfo.Player_BeHurt @玩家受到伤害
--- @field eventobjid any @事件玩家
--- @field hurtlv any @伤害值

--- @class EventInfo.Player_ChangeAttr @玩家属性变化
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field playerattr any @改变的属性
--- @field playerattrval any @改变的值
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Player_ClickActor @点击生物
--- @field eventobjid any @事件玩家
--- @field targetactorid any @被点击的对象

--- @class EventInfo.Player_ClickBlock @点击方块
--- @field eventobjid any @事件玩家
--- @field blockid any @点击的方块类型
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.Player_Collide @玩家跟玩家/生物碰撞
--- @field eventobjid any @事件玩家
--- @field toobjid any @目标对象

--- @class EventInfo.Player_ConsumeItem @玩家消耗道具
--- @field eventobjid any @玩家消耗道具
--- @field itemid any @事件中的道具类型
--- @field itemnum any @事件中的道具数量

--- @class EventInfo.Player_DamageActor @玩家造成伤害
--- @field eventobjid any @事件玩家
--- @field toobjid any @事件目标对象
--- @field targetactorid any @目标玩家
--- @field hurtlv any @伤害值

--- @class EventInfo.Player_DefeatActor @玩家击败目标
--- @field eventobjid any @事件玩家
--- @field toobjid any @事件目标对象
--- @field targetactorid any @被攻击的对象

--- @class EventInfo.Player_Die @玩家死亡
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Player_DiscardItem @丢弃道具
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field toobjid any @掉落物objid

--- @class EventInfo.Player_DismountActor @玩家骑乘下
--- @field eventobjid any @事件玩家
--- @field targetactorid any @被攻击的对象

--- @class EventInfo.Player_EquipChange @装备栏变化
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field itemix any @道具所在格子索引

--- @class EventInfo.Player_EquipOff @脱下装备
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field itemix any @道具所在格子索引

--- @class EventInfo.Player_EquipOn @穿上装备
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field itemix any @道具所在格子索引

--- @class EventInfo.Player_InputContent @输入字符串
--- @field eventobjid any @事件玩家
--- @field content any @事件中的字符串

--- @class EventInfo.Player_InputKeyDown @玩家按下按键
--- @field eventobjid any @事件玩家
--- @field vkey any @按下的键值

--- @class EventInfo.Player_InputKeyOnPress @玩家长按按键
--- @field eventobjid any @事件玩家
--- @field vkey any @按下的键值

--- @class EventInfo.Player_InputKeyUp @玩家松开按键
--- @field eventobjid any @事件玩家
--- @field vkey any @按下的键值

--- @class EventInfo.Player_InvateFriend @邀请好友
--- @field eventobjid any @事件玩家
--- @field toobjid any @事件目标玩家

--- @class EventInfo.Player_LevelModelUpgrade @玩家等级发生改变
--- @field eventobjid any @事件玩家

--- @class EventInfo.Player_MotionStateChange @玩家行为状态变更
--- @field eventobjid any @事件玩家
--- @field playermotion any @行为状态枚举

--- @class EventInfo.Player_MountActor @玩家骑乘上
--- @field eventobjid any @事件玩家
--- @field targetactorid any @被攻击的对象

--- @class EventInfo.Player_MoveOneBlockSize @玩家移动(移动一格)
--- @field eventobjid any @事件玩家
--- @field shortix any @事件中的快捷栏
--- @field x any @事件中位置X
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Player_NewInputContent @从聊天框输入
--- @field eventobjid any @事件玩家
--- @field content any @事件中的字符串

--- @class EventInfo.Player_PickUpItem @玩家拾取
--- @field eventobjid any @事件玩家
--- @field toobjid any @掉落物objid
--- @field itemid any @道具类型ID
--- @field itemnum any @道具数量

--- @class EventInfo.Player_PlayAction @玩家使用表情动作
--- @field eventobjid any @事件玩家
--- @field act any @动作ID

--- @class EventInfo.Player_RemoveBuff @玩家失去指定状态效果
--- @field eventobjid any @事件玩家
--- @field buffid any @状态ID
--- @field bufflvl any @状态等级

--- @class EventInfo.Player_Revive @玩家复活
--- @field eventobjid any @事件玩家
--- @field shortix any @快捷栏索引
--- @field x any @坐标位置
--- @field y any @坐标位置
--- @field z any @坐标位置

--- @class EventInfo.Player_SelectShortcut @快捷栏选择
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量

--- @class EventInfo.Player_ShortcutChange @快捷栏变化
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field itemix any @道具所在格子索引

--- @class EventInfo.Player_UseGiftPack @局部此类包裹道具被使用[]
--- @field eventobjid any @事件对象
--- @field itemid any @道具类型
--- @field itemnum any @道具数量

--- @class EventInfo.Player_UseItem @玩家使用道具
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field itemix any @道具所在格子索引

--- @class EventInfo.Actor_AddBuff @生物获得状态效果
--- @field eventobjid any @事件生物
--- @field actorid any @事件生物类型
--- @field buffid any @状态ID
--- @field bufflvl any @状态等级

--- @class EventInfo.Actor_AreaIn @生物进入区域
--- @field eventobjid any @事件生物
--- @field areaid any @区域ID

--- @class EventInfo.Actor_AreaOut @生物离开区域
--- @field eventobjid any @事件生物
--- @field areaid any @区域ID

--- @class EventInfo.Actor_AttackHit @攻击命中
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field actorid any @事件生物类型
--- @field targetactorid any @攻击对象生物类型

--- @class EventInfo.Actor_Attack @攻击
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field actorid any @事件生物类型
--- @field targetactorid any @攻击对象生物类型

--- @class EventInfo.Actor_BeHurt @受到伤害
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field hurtlv any @伤害值
--- @field actorid any @事件生物类型

--- @class EventInfo.Actor_Beat @生物击败玩家/生物
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field actorid any @事件生物类型
--- @field targetactorid any @攻击对象生物类型

--- @class EventInfo.Actor_ChangeAttr @属性变化
--- @field eventobjid any @事件生物
--- @field actorid any @事件生物类型
--- @field actorattr any @属性枚举值
--- @field actorattrval any @改变的值

--- @class EventInfo.Actor_ChangeMotion @生物行为状态变更到[n]
--- @field eventobjid any @事件生物
--- @field actorid any @事件生物类型
--- @field actormotion any @动作枚举值

--- @class EventInfo.Actor_Collide @碰撞到玩家/生物
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field actorid any @事件生物类型
--- @field targetactorid any @攻击对象生物类型

--- @class EventInfo.Actor_Create @被创建
--- @field eventobjid any @事件生物
--- @field actorid any @事件生物类型

--- @class EventInfo.Actor_Damage @造成伤害
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field hurtlv any @伤害值
--- @field actorid any @事件生物类型
--- @field targetactorid any @攻击对象生物类型

--- @class EventInfo.Actor_Die @死亡
--- @field eventobjid any @事件生物
--- @field toobjid any @攻击对象
--- @field actorid any @事件生物类型

--- @class EventInfo.Actor_Projectile_Hit @投掷物击中
--- @field eventobjid any @事件投掷物对象
--- @field toobjid any @被击中的对象
--- @field itemid any @道具类型
--- @field targetactorid any @被击中的生物类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标
--- @field helperobjid any @辅助对象ID

--- @class EventInfo.Actor_RemoveBuff @生物失去状态效果
--- @field eventobjid any @事件生物
--- @field actorid any @事件生物类型
--- @field buffid any @状态ID
--- @field bufflvl any @状态等级

--- @class EventInfo.Block_Add @被创建
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Block_DestroyBy @局部此类方块被破坏时
--- @field eventobjid any @事件玩家
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Block_Dig_Begin @任意方块被挖掘时
--- @field eventobjid any @事件玩家
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Block_Dig_Cancel @任意方块被挖掘取消
--- @field eventobjid any @事件玩家
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Block_Dig_End @方块被挖
--- @field eventobjid any @事件玩家
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Block_Remove @方块移除
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Block_Trigger @活跃/通电
--- @field eventobjid any @事件玩家
--- @field blockid any @方块类型
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.DropItem_AreaIn @掉落物进入区域
--- @field eventobjid any @事件掉落物
--- @field areaid any @区域ID
--- @field itemid any @道具类型

--- @class EventInfo.DropItem_AreaOut @掉落物离开区域
--- @field eventobjid any @事件掉落物
--- @field areaid any @区域ID
--- @field itemid any @道具类型

--- @class EventInfo.Item_Create @掉落物被创建
--- @field eventobjid any @事件掉落物
--- @field itemid any @道具类型
--- @field defaultvalue any @掉落方式
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Item_Destroy @局部此类装备被破坏时
--- @field eventobjid any @事件对象
--- @field itemid any @道具类型
--- @field itemnum any @道具数量

--- @class EventInfo.Item_Disappear @掉落物消失
--- @field eventobjid any @事件掉落物
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Item_Pickup @掉落物被拾取
--- @field eventobjid any @事件玩家
--- @field toobjid any @被拾取的对象
--- @field itemid any @道具类型
--- @field itemnum any @道具数量
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Item_expend @局部此类食物道具被消耗
--- @field eventobjid any @事件对象
--- @field itemid any @道具类型
--- @field itemnum any @道具数量

--- @class EventInfo.Missile_AreaIn @投掷物进入区域
--- @field eventobjid any @事件投掷物
--- @field areaid any @区域ID
--- @field itemid any @道具类型
--- @field helperobjid any @投掷物所属对象

--- @class EventInfo.Missile_AreaOut @投掷物离开区域
--- @field eventobjid any @事件投掷物
--- @field areaid any @区域ID
--- @field itemid any @道具类型
--- @field helperobjid any @投掷物所属对象

--- @class EventInfo.Missile_Create @投掷物被创建
--- @field eventobjid any @事件玩家
--- @field itemid any @道具类型
--- @field toobjid any @事件投掷物
--- @field x any @方块坐标
--- @field y any @方块坐标
--- @field z any @方块坐标

--- @class EventInfo.Particle_Item_OnCreate @当特效在掉落物上创建
--- @field eventobjid any @事件掉落物
--- @field effectid any @特效类型
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.Particle_Mob_OnCreate @任意生物身上特效被创建
--- @field eventobjid any @事件生物
--- @field effectid any @特效类型
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.Particle_Player_OnCreate @任意玩家身上特效被创建
--- @field eventobjid any @事件玩家
--- @field effectid any @特效类型
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.Particle_Pos_OnCreate @任意位置上特效被创建
--- @field effectid any @特效类型
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.Particle_Projectile_OnCreate @任意投掷物特效被创建
--- @field eventobjid any @事件投掷物
--- @field effectid any @特效类型
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.UI_Button_Click @按钮点击
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI
--- @field uielement any @事件元件

--- @class EventInfo.UI_Button_TouchBegin @按钮按下
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI
--- @field uielement any @事件元件

--- @class EventInfo.UI_GLoader3D_Click @当前界面的模型被松开
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI
--- @field uielement any @事件元件

--- @class EventInfo.UI_GLoader3D_TouchBegin @当前界面的模型被按下
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI
--- @field uielement any @事件元件

--- @class EventInfo.UI_Hide @界面被关闭
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI

--- @class EventInfo.UI_LostFocus @自定义ui输入框失去焦点
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI
--- @field uielement any @事件元件
--- @field content any @输入的内容

--- @class EventInfo.UI_Show @界面被打开
--- @field eventobjid any @事件玩家
--- @field CustomUI any @事件UI

--- @class EventInfo.BluePrint_BuildBegin @蓝图开始创建
--- @field areaid any @区域ID

--- @class EventInfo.Craft_end @任意配方合成完成
--- @field eventobjid any @事件对象
--- @field craftid any @配方ID
--- @field itemid any @道具类型
--- @field itemnum any @道具数量

--- @class EventInfo.Developer_BuyItem @任意玩家购买或提取 商品道具
--- @field eventobjid any @事件对象
--- @field itemid any @道具类型

--- @class EventInfo.Furnace_begin @任意熔炼开始
--- @field furanceid any @熔炼ID
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.Furnace_end @任意熔炼结束
--- @field furanceid any @熔炼ID
--- @field x any @方块位置
--- @field y any @方块位置
--- @field z any @方块位置

--- @class EventInfo.MiNiVip_1 @购买迷你大会员1个月
--- @field eventobjid any @事件玩家

--- @class EventInfo.MiNiVip_3 @购买迷你大会员3个月
--- @field eventobjid any @事件玩家

--- @class EventInfo.Plot_begin @任意剧情开始
--- @field eventobjid any @事件对象
--- @field toobjid any @目标对象
--- @field plotid any @剧情类型
--- @field targetactorid any @目标生物类型

--- @class EventInfo.Plot_end @任意剧情结束
--- @field eventobjid any @事件对象
--- @field toobjid any @目标对象
--- @field plotid any @剧情类型
--- @field targetactorid any @目标生物类型

--- @class EventInfo.QQMusic_PlayBegin @QQ音乐开始播放
--- @field eventobjid any @事件玩家
--- @field qqMusicId any @音乐ID

--- @class EventInfo.minitimer_change @指定计时器变化
--- @field timerid any @计时器ID
--- @field timername any @计时器名称
--- @field timertime any @计时器时间

-- 103 events, 372 fields
