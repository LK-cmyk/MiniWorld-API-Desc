--- MiniWorld UGC 3.0 事件回调参数表（由 MNEvent.d.lua 的事件描述生成）
--- 事件注册回调的 event 参数类型由事件常量推断，此处定义各事件实际携带的字段。

--- @class EventInfo.TriggerEvent.GroupWeatherChanged @当地形组的天气改变
--- @field weathergroupid any @事件中的天气组

--- @class EventInfo.TriggerEvent.GameStart @游戏创建

--- @class EventInfo.TriggerEvent.GameHour @游戏时间
--- @field hour any @小时
--- @field second any @分钟
--- @field ticks any @游戏刻

--- @class EventInfo.TriggerEvent.MinitimerChange @任意计时器改变

--- @class EventInfo.TriggerEvent.CraftEnd @配方合成完毕
--- @field craftid any @事件中的配方ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.FurnaceBegin @当熔炼开始
--- @field furanceid any @事件中的熔炼ID
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.FurnaceEnd @当熔炼结束
--- @field furanceid any @事件中的熔炼ID
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.PlayerRevive @玩家复活
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerMoveOneBlockSize @玩家移动
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerSelectShortcut @玩家选中快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerInvateFriend @玩家邀请好友
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.GameAnyPlayerEnterGame @当玩家进入游戏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.GameAnyPlayerLeaveGame @当玩家离开游戏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.GameAnyPlayerVictory @当玩家游戏胜利
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.GameAnyPlayerDefeat @当玩家游戏失败
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerClickBlock @当玩家点击任意方块
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.PlayerClickPlayer @当玩家点击任意玩家
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerClickMob @当玩家点击任意生物
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerClickProjectile @当玩家点击任意投掷物
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerClickDropItem @当玩家点击任意掉落物
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerClickEntity @当玩家点击任意实体
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerInputKeyClick @当任意玩家点击按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerInputKeyDown @当任意玩家按下按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerInputKeyUp @当任意玩家抬起按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerInputKeyOnPress @当任意玩家长按按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerNewInputContent @玩家发送聊天信息
--- @field content any @事件中的字符串
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerGunAction @当玩家持枪状态改变时
--- @field eventobjid any @触发事件的对象
--- @field gunAction any @枪械动作
--- @field gunState any @枪械状态
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerUseBullet @当玩家持枪单次开火时
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球
--- @field itemnum any @事件中的道具数量

--- @class EventInfo.TriggerEvent.PlayerMotionStateChange @当玩家进入运动状态
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field playermotion any @玩家行为动作
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerMotionStateChangeEnd @当玩家离开运动状态
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field playermotion any @玩家行为动作
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAddItem @当玩家获得道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerUseItem @当玩家开始使用道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerChargeItemBegin @当玩家开始蓄力道具
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerConsumeItem @当玩家消耗道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerPickUpItem @当玩家拾取道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerDiscardItem @当玩家丢弃道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerChargeItemEnd @当玩家结束蓄力道具
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerShortcutChange @当玩家的快捷栏发生改变
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerShortcutAddItem @当玩家的快捷栏放入道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerShortcutRemItem @当玩家的快捷栏取出道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerBackPackChange @当玩家的背包栏发生改变
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerBackPackAddItem @当玩家的背包栏放入道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerBackPackRemItem @当玩家的背包栏取出道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerEquipChange @当玩家的装备栏发生改变
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerEquipAddItem @当玩家的装备栏放入道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerEquipRemItem @当玩家的装备栏取出道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerEquipOn @当玩家穿上装备
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerEquipOff @当玩家脱下装备
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.BlockAdd @方块被创建
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockRemove @当方块被破坏
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockDigBegin @当方块被挖掘
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockDigEnd @当方块被挖掘完毕
--- @field actorid any @触发事件的生物类型
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockDigCancel @当方块被挖掘中断
--- @field actorid any @触发事件的生物类型
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockTrigger @当方块开关状态发生改变
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockChangeColor @当方块颜色发生改变
--- @field actorid any @触发事件的生物类型
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockChangeDir @当方块方向发生改变
--- @field actorid any @触发事件的生物类型
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockContainerChange @当储存容器内发生改变
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockContainerPutIn @当储存容器内放入道具
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.BlockContainerTakeOut @当储存容器内取出道具
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.UILostFocus @玩家在界面输入字符串
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UISpineComplete @当前界面的元件动画装载器播放完毕
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIShow @当前界面被打开
--- @field CustomUI any @事件中的界面
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIHide @当前界面被关闭
--- @field CustomUI any @事件中的界面
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIButtonClick @当前界面的元件被点击
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIButtonTouchBegin @当前界面的元件被按下
--- @field CustomUI any @事件中的界面
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIButtonTouchEnd @当前界面的元件被抬起
--- @field CustomUI any @事件中的界面
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIButtonLongPress @当前界面的元件被长按
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIGLoader3DTouchClick @当前界面的元件被点击
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIGLoader3DTouchBegin @当前界面的元件被按下
--- @field CustomUI any @事件中的界面
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIGLoader3DTouchEnd @当前界面的元件被抬起
--- @field CustomUI any @事件中的界面
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIGLoader3DLongPress @当前界面的元件被长按
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIScrollPaneTouchBegin @滑动容器触摸开始
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIScrollPaneTouchEnd @滑动容器触摸结束
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.UIScrollPaneScrollEnd @滑动容器滚动结束
--- @field CustomUI any @事件中的界面
--- @field content any @事件中的字符串
--- @field customdata any @自定义字符串数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field uielement any @事件中的元件
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ParticlePosOnCreate @当特效创建在任意位置
--- @field effectid any @事件中的特效
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.TriggerEvent.ParticleObjectOnCreate @当特效创建在任意对象
--- @field effectid any @事件中的特效
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ParticlePlayerOnCreate @当特效创建在任意玩家
--- @field effectid any @事件中的特效
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ParticleMobOnCreate @当特效创建在任意生物
--- @field effectid any @事件中的特效
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ParticleProjectileOnCreate @当特效创建在任意投掷物
--- @field effectid any @事件中的特效
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ParticleItemOnCreate @当特效创建在任意掉落物
--- @field effectid any @事件中的特效
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ParticleEntityOnCreate @当特效创建在任意实体
--- @field effectid any @事件中的特效
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DeveloperBuyItem @任意玩家购买或提取开发者商店道具
--- @field itemid any @事件中的道具类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.PlayerCollideToPlayer @当任意玩家和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerCollideToMob @当任意玩家和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerCollideToMissile @当任意玩家和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerCollideToDropItem @当任意玩家和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerCollideToEntity @当任意玩家和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerCollideToAreaObj @当任意玩家和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCollideToPlayer @当任意生物和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCollideToMob @当任意生物和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCollideToMissile @当任意生物和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCollideToDropItem @当任意生物和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCollideToEntity @当任意生物和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCollideToAreaObj @当任意生物和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCollideToPlayer @当任意投掷物和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCollideToMob @当任意投掷物和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCollideToMissile @当任意投掷物和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCollideToDropItem @当任意投掷物和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCollideToEntity @当任意投掷物和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCollideToAreaObj @当任意投掷物和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemCollideToPlayer @当任意掉落物和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemCollideToMob @当任意掉落物和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemCollideToMissile @当任意掉落物和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemCollideToDropItem @当任意掉落物和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemCollideToEntity @当任意掉落物和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemCollideToAreaObj @当任意掉落物和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCollideToPlayer @当任意实体和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCollideToMob @当任意实体和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCollideToMissile @当任意实体和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCollideToDropItem @当任意实体和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCollideToEntity @当任意实体和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCollideToAreaObj @当任意实体和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCollideToPlayer @当任意区域和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCollideToMob @当任意区域和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCollideToMissile @当任意区域和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCollideToDropItem @当任意区域和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCollideToEntity @当任意区域和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCollideToAreaObj @当任意区域和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAreaIn @当任意玩家进入区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAreaOut @当任意玩家离开区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobAreaIn @当任意生物进入区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobAreaOut @当任意生物离开区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileAreaIn @当任意投掷物进入区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileAreaOut @当任意投掷物离开区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemAreaIn @当任意掉落物进入区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemAreaOut @当任意掉落物离开区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityAreaIn @当任意实体进入区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityAreaOut @当任意实体离开区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjAreaIn @当任意区域进入区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjAreaOut @当任意区域离开区域
--- @field areaid any @事件中的区域ID
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobCreate @当任意生物被创建
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.EntityCreate @当任意实体被创建
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.AreaObjCreate @当任意区域被创建
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerBeHurt @当任意玩家受到伤害
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field hurtlv any @事件中的伤害值
--- @field hurttype any @伤害类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerDie @当任意玩家被击败
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobBeHurt @当任意生物受到伤害
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field hurtlv any @事件中的伤害值
--- @field hurttype any @伤害类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobDie @当任意生物被击败
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAttack @当任意玩家开始攻击
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAttackHit @当任意玩家攻击命中
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerDefeatActor @当任意玩家击败目标
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerDamageActor @当任意玩家造成伤害
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field hurtlv any @事件中的伤害值
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobAttack @当任意生物开始攻击
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobAttackHit @当任意生物攻击命中
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobBeat @当任意生物击败目标
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobDamage @当任意生物造成伤害
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field hurtlv any @事件中的伤害值
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAddBuff @当任意玩家获得状态
--- @field buff any @状态数据
--- @field buffid any @事件中的状态效果
--- @field bufflvl any @状态等级
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerRemoveBuff @当任意玩家失去状态
--- @field buff any @状态数据
--- @field buffid any @事件中的状态效果
--- @field bufflvl any @状态等级
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobAddBuff @当任意生物获得状态
--- @field actorid any @触发事件的生物类型
--- @field buff any @状态数据
--- @field buffid any @事件中的状态效果
--- @field bufflvl any @状态等级
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobRemoveBuff @当任意生物失去状态
--- @field actorid any @触发事件的生物类型
--- @field buff any @状态数据
--- @field buffid any @事件中的状态效果
--- @field bufflvl any @状态等级
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerChangeAttr @当任意玩家的属性改变
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field playerattr any @玩家属性
--- @field playerattrval any @玩家属性值
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobChangeAttr @当任意生物的属性改变
--- @field actorattr any @生物属性
--- @field actorattrval any @生物属性值
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ActorPickupActor @当角色举起角色
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field pickupType any @举起或放下类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerAttrStateChange @当任意玩家权限发生改变
--- @field attstateType any @权限类型
--- @field attstateValue any @权限值
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobAttrStateChange @当任意生物权限发生改变
--- @field attstateType any @权限类型
--- @field attstateValue any @权限值
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerMountActor @当任意玩家骑乘坐骑/载具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobMountActor @当任意生物骑乘坐骑/载具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerDismountActor @当任意玩家取消骑乘
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MobDismountActor @当任意生物取消骑乘
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.MissileCreate @投掷物创建
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field toobjid any @事件中的目标对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ProjectileHitBlock @当投掷物击中任意方块
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ProjectileHitPlayer @当投掷物击中任意玩家
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ProjectileHitMob @当投掷物击中任意生物
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ProjectileHitProj @当投掷物击中任意投掷物
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ProjectileHitItem @当投掷物击中任意掉落物
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ProjectileHitEntity @当投掷物击中任意实体
--- @field actorid any @触发事件的生物类型
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field helperobjid any @辅助对象ID
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ItemCreate @当掉落物创建
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.DropItemPickup @当掉落物被拾取
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.ItemDisappear @当掉落物消失
--- @field eventobjid any @触发事件的对象
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.TriggerEvent.PlayerOpenInnerView @当玩家打开内置界面
--- @field CustomUI any @事件中的界面
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.PlayerCloseInnerView @当玩家关闭内置界面
--- @field CustomUI any @事件中的界面
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.MobModelChange @当生物的主模型改变
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.PlayerModelChange @当玩家的主模型改变
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field eventworldid any @事件中的星球

--- @class EventInfo.TriggerEvent.TimelineStart @当剧情动画开始
--- @field eventobjid any @触发事件的对象

--- @class EventInfo.TriggerEvent.TimelineStop @当剧情动画结束
--- @field eventobjid any @触发事件的对象

--- @class EventInfo.ObjectEvent.OnPropertyChange @当对象的属性发生改变

--- @class EventInfo.ObjectEvent.PlayerEnterGame @当此玩家进入游戏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerLeaveGame @当此玩家离开游戏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.PlayerVictory @当此玩家游戏胜利
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerDefeat @当此玩家游戏失败
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerClickBlock @当此玩家点击任意方块
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z

--- @class EventInfo.ObjectEvent.PlayerClickPlayer @当此玩家点击任意玩家
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerClickMob @当此玩家点击任意生物
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerClickProjectile @当此玩家点击任意投掷物
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerClickDropItem @当此玩家点击任意掉落物
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerClickEntity @当此玩家点击任意实体
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerInputKeyClick @当此玩家点击按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerInputKeyDown @当此玩家按下按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerInputKeyUp @当此玩家抬起按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerInputKeyOnPress @当此玩家长按按键
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field vkey any @事件中的按键
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerNewInputContent @此玩家发送聊天信息
--- @field content any @事件中的字符串
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectMotionStateChangeEnd @当此玩家离开运动状态
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field playermotion any @玩家行为动作
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectMotionStateChange @当此玩家运动状态发生改变
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field playermotion any @玩家行为动作
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerAddItem @当此玩家获得道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerUseItem @当此玩家开始使用道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerChargeItemBegin @当此玩家开始蓄力道具
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerConsumeItem @当此玩家消耗道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerPickUpItem @当此玩家拾取道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerChargeItemEnd @当此玩家结束蓄力道具
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerShortcutChange @当此玩家快捷栏的发生改变
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerShortcutAddItem @当此玩家快捷栏的放入道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerShortcutRemItem @当此玩家快捷栏的取出道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerBackPackChange @当此玩家背包栏的发生改变
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerBackPackAddItem @当此玩家背包栏的放入道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerBackPackRemItem @当此玩家背包栏的取出道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerEquipChange @当此玩家装备栏的发生改变
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerEquipAddItem @当此玩家装备栏的放入道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerEquipRemItem @当此玩家装备栏的取出道具
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerEquipOn @当此玩家穿上装备
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerEquipOff @当此玩家脱下装备
--- @field ShortCutIdx any @事件中的快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerRevive @此玩家复活
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerMoveOneBlockSize @此玩家移动
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.PlayerInvateFriend @此玩家邀请好友
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.PlayerSelectShortcut @此玩家选中快捷栏
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field itemid any @事件中的道具类型
--- @field itemix any @事件中的格子ID
--- @field itemnum any @事件中的道具数量
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.BlockAdd @此类方块被创建
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockClicked @当此类方块被被点击
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field actorid any @触发事件的生物类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockRemove @当此类方块被被破坏
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field actorid any @触发事件的生物类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockDigBegin @当此类方块被被挖掘
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field actorid any @触发事件的生物类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockDigEnd @当此类方块被被挖掘完毕
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field actorid any @触发事件的生物类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockDigCancel @当此类方块被被挖掘中断
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventobjid any @触发事件的对象
--- @field actorid any @触发事件的生物类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.OnInteract @当此类方块开关状态发生改变
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockChangeColor @当此类方块颜色发生改变
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockChangeDir @当此类方块方向发生改变
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockContainerChange @当储存容器内发生改变
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field itemid any @事件中的道具类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockContainerPutIn @当储存容器内放入道具
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field itemid any @事件中的道具类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.BlockContainerTakeOut @当储存容器内取出道具
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field blockid any @事件中的方块类型
--- @field itemid any @事件中的道具类型
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.ObjectPlayAnim @当此对象播放动画时
--- @field eventobjid any @触发事件的对象
--- @field actorid any @触发事件的生物类型
--- @field x any @事件中的位置
--- @field y any @事件中的位置
--- @field z any @事件中的位置
--- @field anim any @事件中的动作
--- @field eventworldid any @事件中的星球

--- @class EventInfo.ObjectEvent.ObjectCollideByPlayer @当此角色和任意玩家碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectCollideByMob @当此角色和任意生物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectCollideByMissile @当此角色和任意投掷物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectCollideByDropItem @当此角色和任意掉落物碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectCollideByEntity @当此角色和任意实体碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectCollideByAreaObj @当此角色和任意区域碰撞开始
--- @field EventObjType any @事件对象类型
--- @field ToolObjType any @工具对象类型
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectBeClick @此角色被玩家点击
--- @field actorid any @触发事件的生物类型
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectBeHurt @当此角色受到伤害
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field hurtlv any @事件中的伤害值
--- @field hurttype any @伤害类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectDie @当此角色被击败
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectAttack @当此角色开始攻击
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectAttackHit @当此角色攻击命中
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectDefeat @当此角色击败目标
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectDamage @当此角色造成伤害
--- @field defaultvalue any @自定义数值数据
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field hurtlv any @事件中的伤害值
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectAddBuff @当此角色获得状态
--- @field buff any @状态数据
--- @field buffid any @事件中的状态效果
--- @field bufflvl any @状态等级
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectRemoveBuff @当此角色失去状态
--- @field buff any @状态数据
--- @field buffid any @事件中的状态效果
--- @field bufflvl any @状态等级
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectAttrStateChange @当此角色权限改变
--- @field attstateType any @权限类型
--- @field attstateValue any @权限值
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectChangeAttr @当此角色属性改变
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field playerattr any @玩家属性
--- @field playerattrval any @玩家属性值
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectMountActor @此角色骑乘
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球

--- @class EventInfo.ObjectEvent.ObjectDismountActor @此角色取消骑乘
--- @field eventobjid any @触发事件的对象
--- @field x any @事件中位置X
--- @field y any @事件中位置Y
--- @field z any @事件中位置Z
--- @field targetactorid any @事件中的目标生物类型
--- @field toobjid any @事件中的目标对象
--- @field eventworldid any @事件中星球
