--- @class GameRule
--- 游戏规则接口 GameRule
local GameRule = {}
_G.GameRule = GameRule

--- 编辑模式设置的游戏时间
--- @type number
GameRule.CurTime = nil

--- 编辑模式设定的是否锁定时间(0:不锁定 1:锁定)
--- @type number
GameRule.TimeLocked = nil

--- 编辑模式设定的天气(0:晴雨交错 1:晴天 2:雨天 3:雷暴)
--- @type number
GameRule.Weather = nil

--- 编辑模式设定的最大玩家数量
--- @type number
GameRule.MaxPlayers = nil

--- 编辑模式设定的是否可破坏方块(0:不可 1:可以)
--- @type number
GameRule.BlockDestroy = nil

--- 编辑模式设定的是否可放置方块(0:不可 1:可以)
--- @type number
GameRule.BlockPlace = nil

--- 编辑模式设定的是否可使用方块(0:不可 1:可以)
--- @type number
GameRule.BlockUse = nil

--- 编辑模式设定的重力倍数(0.1到10之间)
--- @type number
GameRule.GravityFactor = nil

--- 编辑模式设定的视角
--- @type number
--- 0:主视角 1:背视角 2:正视角 3:锁定主视角 4:锁定背视角
--- 5:锁定正视角 6:锁定俯视角 7:锁定自定义视角 8:背视角2 9:锁定背视角2
GameRule.CameraDir = nil

--- 编辑模式设定的游戏开启模式
--- @type number
--- 0:房主开启 1:达到人数自动开启 2:不限条件自动开启
GameRule.StartMode = nil

--- 编辑模式设定的开启游戏需求人数
--- @type number
GameRule.StartPlayers = nil

--- 编辑模式设定的队伍数量
--- @type number
GameRule.TeamNum = nil

--- 编辑模式设定的攻击模式
--- @type number
--- 0:队伍间攻击 1:禁止攻击玩家 2:自由攻击
GameRule.AttackPlayerMode = nil

--- 编辑模式设定的游戏是否限时(0:不限时 1-60:限时1-60分钟)
--- @type number
GameRule.EndTime = nil

--- 编辑模式设定的是否达到分数获得胜利(0:否 1-999:达到1-999分获得胜利)
--- @type number
GameRule.EndScore = nil

--- 编辑模式设定的战胜玩家得分分数
--- @type number
GameRule.ScoreKillPlayer = nil

--- 编辑模式设定的战胜怪物得分分数
--- @type number
GameRule.ScoreKillMob = nil

--- 编辑模式设定的获得星星得分分数
--- @type number
GameRule.ScoreCollectStar = nil

--- 编辑模式设定的再次挑战时间(0:默认 1-320:死亡后1-320秒自动复活)
--- @type number
GameRule.ReviveMode = nil

--- 编辑模式设定的再次挑战保护时间(1到99秒之间，0为默认5秒)
--- @type number
GameRule.ReviveInvulnerable = nil

--- 编辑模式设定的玩家名显示模式
--- @type number
--- 0:所有人可见 1:仅己方队伍可见 2:仅敌方队伍可见 3:全部不可见
GameRule.DisplayName = nil

--- 编辑模式设定的时间结束胜利判定
--- @type number
--- 0:分数高的队伍获胜 1:时间结束全体胜利 2:时间结束全体失败
GameRule.WinLoseEndTime = nil

--- 编辑模式设定的是否退出重置(0:否 1:是)
--- @type number
GameRule.SaveMode = nil

--- 编辑模式设定的是否开启战斗提示(0:否 1:是)
--- @type number
GameRule.KillNotify = nil

--- 编辑模式设定的游戏背景音乐(-1:无音乐 0:默认 1-8:bgm1-8)
--- @type number
GameRule.BgMusicMode = nil

--- 编辑模式设定的是否生成怪物(-1:创建时没有勾选生成怪物 0:否 1:是)
--- @type number
GameRule.MobGen = nil

--- 编辑模式设定的集结点规则(0:随机到小队集结点 1:到最近小队集结点)
--- @type number
GameRule.SpawnPtMode = nil

--- 编辑模式设定的地图显示选项(0:不同队伍可见 1:不同队伍不可见)
--- @type number
GameRule.MinimapTeams = nil

--- 编辑模式设定的玩家战败是否掉落物品
--- @type number
--- 0:正常掉落 1:清空背包 2:保留物品 3:掉落箱子
GameRule.PlayerDieDrops = nil

--- 编辑模式设定的是否显示比分和时间(0:否 1:是)
--- @type number
GameRule.DisplayScore = nil

--- 编辑模式设定的是否限制游戏生命数(0:不限制 1-99:限制生命数为1-99)
--- @type number
GameRule.LifeNum = nil

--- 编辑模式设定的是否显示准心(0:不显示 1:显示)
--- @type number
GameRule.ShowSight = nil

--- 编辑模式设定的染色得分分数
--- @type number
GameRule.ScoreColorChange = nil

--- 编辑模式设定的是否开启污染区(0:否 1:是)
--- @type number
GameRule.GPoisonSwitch = nil

--- 编辑模式设定的第一个安全区半径(1到100区块)
--- @type number
GameRule.GPoisonSafeD0 = nil

--- 编辑模式设定的第一段安全时间(1到600秒)
--- @type number
GameRule.GPoisonSafeT0 = nil

--- 编辑模式设定的是否允许中途加入游戏(0:否 1:是)
--- @type number
GameRule.AllowMidwayJoin = nil

--- 编辑模式设定的是否开启队伍共用生命数(0:否 1是)
--- @type number
GameRule.LifeNumTeamShare = nil

--- 编辑模式设定的是否开启失败观战(0:否 1:是)
--- @type number
GameRule.ViewMode = nil

--- 编辑模式设定的观战类型(0:自由观战 1:跟随屏幕 2:可切换)
--- @type number
GameRule.ViewType = nil

--- 编辑模式设定的游戏开启倒计时时长(1到100秒)
--- @type number
GameRule.CountDown = nil

--- 编辑模式设定的是否开启回合模式(0:否 1:是)
--- @type number
GameRule.ScoreResetRound = nil

--- 编辑模式设定的达到分数重置的分数(1至100)
--- @type number
GameRule.ResetScore = nil
