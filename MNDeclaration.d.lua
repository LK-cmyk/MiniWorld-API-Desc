--- @class json
local json = {
    --- 解码Json字符串
    --- @return table @解码后的Table数据
    --- @param data string @Json字符串
    decode = function(data) 
        return {}
    end,

    --- 编码Table数据
    --- @return string @编码后的Json字符串
    --- @param data table @Table数据
    encode = function(data) 
        return ""
    end
}
_G.json = json

--- @class threadpool
local threadpool = {
    --- 等待时间
    --- @return nil
    --- @param time number @等待时间（秒）
    wait = function(self, time)
        return nil
    end
}
_G.threadpool = threadpool

--- 获取当前世界对象
--- @return table @世界对象
local GetWorld = function()
    return {}
end
_G.GetWorld = GetWorld

--- 打印信息
--- @param message any @要打印的信息
local print = function(message)
    return nil
end
_G.print = print

--- 打印错误信息
--- @param message any @要打印的错误信息
local printError = function(message)
    return nil
end
_G.printError = printError

--- 定义类对象
--- @param className string @类名
--- @param super table|string @父类原表|父类名
local Class = function(className, super, isSingle)
    return {}
end
_G.Class = Class

--- 创建类实例
--- @param className string @类名
--- @return table @对象实例
local Instance = function(className)
    return {}
end
_G.Instance = Instance

--- 获取类单例
--- @param className string @类名
--- @return table @类单例
local GetInst = function(className)
    return {}
end
_G.GetInst = GetInst

os = os

--- 获取当前时间（ms）
--- @return number @当前时间（ms）
function os.timeMs()
    return 0
end

--- @class Mini @组件属性
--- @field Number number @数值
--- @field String number @字符串
--- @field Bool number @布尔值
--- @field Color number @颜色
--- @field Vec3 number @位置
--- @field MobType number @生物类型
--- @field Block number @方块类型
--- @field Item number @物品类型
--- @field Effect number @特效类型
--- @field Picture number @图片
--- @field Buff number @状态
--- @field Sound number @音效
--- @field Model number @外观
local Mini = {}
_G.Mini = Mini

--- @class WorldType @游戏模式
--- @field Single number @单人模式
--- @field Create number @多人创造模式
--- @field Extremity number @极限模式
--- @field CreateToRungame number @由创造模式转的生存
--- @field Gamemaker number @自制玩法的编辑模式
--- @field GamemakerRun number @自制玩法的运行模式
--- @field Freemode number @冒险模式之自由模式
--- @field Record number @录像模式
local WorldType = {}
_G.WorldType = WorldType

--- @class MobType @生物类型
--- @field Hostile number @怪物
--- @field Passive number @动物
--- @field Rare number @稀有生物
--- @field Water number @水生物
--- @field Fly number @飞行生物
--- @field Trixenie number @三栖生物
local MobType = {}
_G.MobType = MobType

--- @class TerrainType @游戏地形
--- @field Flat number @平坦地形
--- @field Normal number @随机地形
local TerrainType = {}
_G.TerrainType = TerrainType

--- @class CameraEditState @自定义视角编辑状态
--- @field Null number @空
--- @field Edit number @编辑
--- @field Test number @测试
local CameraEditState = {}
_G.CameraEditState = CameraEditState

--- @class EquipSlotType @装备部位类型
--- @field Head number @头部
--- @field Breast number @身体
--- @field Legging number @腿部
--- @field Shoe number @脚部
--- @field Pifeng number @披风
--- @field Weapon number @武器
--- @field Custom1 number @自定义1
--- @field Custom2 number @自定义2
--- @field Custom3 number @自定义3
--- @field MaxSlots number @最大装备栏 **(用于判断有效性)**
local EquipSlotType = {}
_G.EquipSlotType = EquipSlotType

--- @class TeamResults @游戏战斗结果
--- @field None number @胜负未定
--- @field Win number @胜利
--- @field Lose number @失败
--- @field Dogfall number @平局
local TeamResults = {}
_G.TeamResults = TeamResults

--- @class BackpackType @背包类型
--- @field Shortcut number @快捷栏
--- @field Inventory number @存储栏
--- @field Equip number @装备栏
--- @field Extend number @扩展背包
local BackpackType = {}
_G.BackpackType = BackpackType

--- @class BackpackBeginIndex @背包起始索引
--- @field Shortcut number @快捷栏起始索引
--- @field Inventory number @存储栏起始索引
--- @field Equip number @装备栏起始索引
--- @field ExtBackpack number @扩展背包起始索引
local BackpackBeginIndex = {}
_G.BackpackBeginIndex = BackpackBeginIndex

--- @class FaceDir @朝向
--- @field NegX number @X反方向 - 西
--- @field PosX number @X正方向 - 东
--- @field NegZ number @Z反方向 - 南
--- @field PosZ number @Z正方向 - 北
--- @field NegY number @Y反方向 - 下
--- @field PosY number @Y正方向 - 上
--- @field None number @未指定
local FaceDir = {}
_G.FaceDir = FaceDir

--- @class FaceType @朝向类型
--- @field Yaw number @面朝方向
--- @field Pitch number @面仰角
local FaceType = {}
_G.FaceType = FaceType

--- @class CreatureAttr @生物属性枚举
--- @field MaxHp number @最大生命值
--- @field CurHp number @当前生命值
--- @field HpRecover number @生命恢复
--- @field MaxHunger number @最大饥饿值
--- @field CurHunger number @当前饥饿值
--- @field CurOxygen number @当前氧气值
--- @field WalkSpeed number @移动速度
--- @field SwinSpeed number @游泳速度
--- @field JumpPower number @跳跃力
--- @field Dodge number @闪避率
--- @field AtkMelee number @近战攻击
--- @field AtkRemote number @远程攻击
--- @field DefMelee number @近战防御
--- @field DefRemote number @远程防御
--- @field Dimension number @模型大小
--- @field Level number @等级
--- @field DefChaos number @混乱防御
--- @field PackSize number @背包空间
--- @field ViewDistance number @视野距离
--- @field BodyLerpSpeed number @转身速度
--- @field AtkPhysical number @物理攻击
--- @field AtkMagic number @元素攻击
--- @field DefPhysical number @物理防御
--- @field DefMagic number @元素防御
--- @field ExtraHp number @临时生命值
--- @field Toughness number @韧性值
--- @field FlySpeed number @飞行速度
--- @field ViewDis number @视野范围
--- @field AttackDis number @攻击距离
--- @field Atk number @攻击力
--- @field EnableMove number @可移动
--- @field EnableAttack number @可攻击
--- @field EnableBeattacked number @可被攻击
--- @field EnableBekilled number @可被杀死
--- @field EnablePickup number @可拾取道具
--- @field EnableDeathdropitem number @死亡掉落
local CreatureAttr = {}
_G.CreatureAttr = CreatureAttr

--- @class RoleAttr @生物/玩家属性枚举
--- @field MaxHp number @最大生命值
--- @field CurHp number @当前生命值
--- @field HpRecover number @生命恢复
--- @field MaxHunger number @饥饿度
--- @field CurHunger number @饥饿度
--- @field MaxOxygen number @最大氧气值
--- @field CurOxygen number @当前氧气值
--- @field WalkSpeed number @移动速度
--- @field RunSpeed number @奔跑速度
--- @field SwinSpeed number @游泳速度
--- @field JumpPower number @跳跃力
--- @field Gravity number @重力值
--- @field PunchArmor number @近战防御
--- @field RangeArmor number @远程防御
--- @field LevelExp number @星星经验
--- @field StarNum number @星星数量
--- @field CurStrength number @当前体力值
--- @field MaxStrength number @当前最大体力值
--- @field FlySpeed number @飞行速度
--- @field AttackDis number @攻击距离
--- @field ViewDis number @视野距离
--- @field Atk number @攻击力
local RoleAttr = {}
_G.RoleAttr = RoleAttr

--- @class ItemAbility @道具设置枚举
--- @field Throw number @道具不可丢弃
--- @field Drop number @道具不可掉落
local ItemAbility = {}
_G.ItemAbility = ItemAbility

--- @class CreatureMotion @生物行为枚举
--- @field Idle number @空闲
--- @field Standby number @待机
--- @field Stroll number @闲逛
--- @field AtkMelee number @近战攻击
--- @field AtkRemote number @远程攻击
--- @field Follow number @跟随
--- @field Swim number @游泳
--- @field RunAway number @逃跑
--- @field SelfBomb number @自爆
--- @field Beattracted number @被吸引
--- @field Copulation number @交配
local CreatureMotion = {}
_G.CreatureMotion = CreatureMotion

--- @class PlayerMotion @玩家行为枚举
--- @field Static number @静止
--- @field Walk number @行走
--- @field Run number @奔跑
--- @field Jump number @跳跃
--- @field JumpTwice number @二段跳
--- @field Sneak number @潜行
--- @field FallGround number @落地
--- @field Swim number @游泳
local PlayerMotion = {}
_G.PlayerMotion = PlayerMotion

--- @class RoleMotion @角色行为枚举
--- @field Stand number @站立
--- @field Walk number @行走
--- @field Run number @奔跑
--- @field Jump number @跳跃
--- @field Sneak number @潜行
--- @field FallGround number @落地
--- @field Swim number @游泳
local RoleMotion = {}
_G.RoleMotion = RoleMotion

--- @class HurtType @伤害类型枚举
--- @field All number @所有伤害（只设置免疫伤害接口有效）
--- @field Melee number @近战伤害 attack_punch
--- @field Remote number @远程伤害 attack_range
--- @field Bomb number @爆炸伤害 attack_explode
--- @field Burning number @燃烧伤害 attack_fire
--- @field Toxin number @毒素伤害 attack_poison
--- @field Wither number @凋零伤害 attack_wither
--- @field Flash number @电元素伤害 attack_flash
--- @field Sun number @日晒 attack_sun
--- @field Fall number @跌落伤害 attack_falling
--- @field Anvil number @被砸中伤害 attack_anvil
--- @field Cactus number @仙人掌伤害 attack_cactus
--- @field Asphyxia number @窒息伤害 attack_wall
--- @field Drown number @溺水伤害 attack_drown
--- @field Suffocate number @水下生物在空气中窒息伤害 attack_suffocate
--- @field Antiinjury number @反伤 attack_antiinjury
--- @field Laser number @被激光伤害 attack_block_laser
--- @field Ice number @冰元素伤害 attack_ice
--- @field Fixed number @固定伤害 attack_fixed
local HurtType = {}
_G.HurtType = HurtType

--- @class TeamAttr @队伍属性枚举
--- @field PlayerNum number @玩家数量
--- @field Score number @分数
local TeamAttr = {}
_G.TeamAttr = TeamAttr

--- @class BlockAttr @方块属性枚举
--- @field ExplodeResistance number @爆炸抗性
--- @field Hardness number @硬度
--- @field Glissade number @滑行惯性
--- @field BurningSpeed number @燃烧速度
--- @field BurningProbability number @燃烧几率
--- @field Lightness number @亮度
local BlockAttr = {}
_G.BlockAttr = BlockAttr

--- @class BlockLimits @方块权限
--- @field EnableDestroyed number @可破坏
--- @field EnableBeoperated number @可操作
--- @field EnableBepushed number @可被推动
--- @field EnableDropItem number @可掉落道具
--- @field BepushedDropItem number @被推动掉落
local BlockLimits = {}
_G.BlockLimits = BlockLimits

--- @class BlockStatus @方块状态
--- @field Active number @活跃 **(被激活)**
--- @field Inactive number @不活跃 **(未被激活)**
local BlockStatus = {}
_G.BlockStatus = BlockStatus

--- @class GroupWeatherType @天气状态枚举,局部天气
--- @field ShineAndRain number @晴雨交替
--- @field Shine number @晴天
--- @field Rain number @雨天
--- @field Thunder number @雷暴
--- @field Bad number @恶劣天气
--- @field Snow number @雪天
--- @field Sandduststorm number @沙尘暴
--- @field Tempest number @暴风雨
--- @field Blizzard number @暴风雪
local GroupWeatherType = {}
_G.GroupWeatherType = GroupWeatherType

--- @class WeatherGroup @地形组枚举值
--- @field Global number @全局对象
--- @field Common number @常见组
--- @field Ocean number @海洋组
--- @field Desert number @沙漠组
--- @field Frigidzone number @普通寒带组
--- @field Coldzone number @高峰寒带组
--- @field Volcano number @火山组
--- @field Nunja number @湿地组
--- @field Plain number @平坦组
--- @field AirIsland number @空岛组
local WeatherGroup = {}
_G.WeatherGroup = WeatherGroup

--- @class ViewPortType @视口方向
--- @field Main number @主视角
--- @field Back number @背视角
--- @field Front number @正视角
--- @field Back2 number @背视角2
--- @field Top number @俯视角
--- @field Custom number @自定义视角
local ViewPortType = {}
_G.ViewPortType = ViewPortType

--- @class VarType @变量类型
--- @field Pos number @位置
--- @field Areains number @区域
--- @field Number number @数值
--- @field String number @字符串
--- @field Boolean number @布尔值
--- @field Player number @玩家
--- @field PlayerGroup number @玩家组
--- @field BlockType number @方块类型
--- @field ItemType number @道具类型
--- @field Creature number @生物
--- @field CreatureType number @生物类型
--- @field CreatureGroup number @生物组
--- @field Timer number @定时器
--- @field EffectType number @特效类型
--- @field PosGroup number @位置组
--- @field AreaGroup number @区域组
--- @field NumberGroup number @数值组
--- @field StringGroup number @字符串组
--- @field BooleanGroup number @布尔值组
--- @field BlockTypeGroup number @方块类型组
--- @field ItemTypeGroup number @道具类型组
--- @field CreatureTypeGroup number @生物类型组
--- @field TimerGroup number @计时器组
--- @field EffectTypeGroup number @特效类型组
--- @field SortedData number @有序列表
--- @field ListData number @无需列表
--- @field Map number @kv map表
--- @field Table number @二维表
--- @field Blueprint number @蓝图
--- @field Object number @对象
--- @field ObjectGroup number @对象组
--- @field Projectile number @投射物
--- @field ProjectileGroup number @投射物组
--- @field DropItem number @掉落物
--- @field DropItemGroup number @掉落物组
--- @field Element number @元件
--- @field ElementGroup number @元件组
--- @field Texture number @纹理
--- @field TextureGroup number @纹理组
--- @field Role number @角色
--- @field RoleGroup number @角色组
--- @field BuffType number @buff类型
--- @field BuffTypeGroup number @buff类型组
--- @field Sound number @声音
--- @field SoundGroup number @声音组
--- @field Model number @模型
--- @field ModelGroup number @模型组
--- @field Entity number @实体
--- @field EntityGroup number @实体组
--- @field EntityType number @实体类型
--- @field EntityTypeGroup number @实体类型组
local VarType = {}
_G.VarType = VarType

--- @class WorkeStage @强制打开工作台枚举
--- @field Craft number @工具箱
--- @field Repair number @修理台
--- @field Enchant number @附魔台
local WorkeStage = {}
_G.WorkeStage = WorkeStage

--- @class GraphicsType @图文信息枚举
--- @field Hornbook number @文字板
--- @field Suspendbook number @漂浮文字
--- @field Progress number @进度条
--- @field ArrowPos number @箭头-指向位置
--- @field ArrowActor number @箭头-指向生物
--- @field LinePos number @线-指向位置
--- @field LineActor number @线-指向生物
--- @field SurfacePos number @面-指向界面
--- @field SurfaceActor number @面-指向生物
--- @field Image number @图片
--- @field Brush number @笔刷
--- @field NavPathPos number @寻路引导线-指向位置
local GraphicsType = {}
_G.GraphicsType = GraphicsType

--- @class SortType @排序方式
--- @field Up number @升序,
--- @field Down number @降序,
local SortType = {}
_G.SortType = SortType

--- @class MoveType @移动方式
--- @field Walking number @行走,
--- @field Flying number @飞行,
--- @field Swimming number @游泳,
--- @field Auto number @自动调整
local MoveType = {}
_G.MoveType = MoveType

--- @class ViedoPlayMode @显示板视频播放模式
--- @field Repeat number @循环播放
--- @field Once number @单次播放
local ViedoPlayMode = {}
_G.ViedoPlayMode = ViedoPlayMode

--- @class EventDate @时间值枚举
--- @field Year number @年
--- @field Month number @月
--- @field Day number @日
--- @field Hour number @时
--- @field Minute number @分
--- @field Second number @秒
--- @field Timestamp number @时间戳
--- @field Dayofweek number @星期几
local EventDate = {}
_G.EventDate = EventDate

--- @class ItemAttr @道具属性
--- @field Attack number @攻击力
--- @field Stackmax number @叠加数
--- @field ShortDefense number @近战防御
--- @field LongDefense number @远程防御
--- @field ExplodeDefense number @爆炸防御
--- @field FireDefense number @燃烧防御
--- @field PoisonDefense number @毒素防御
--- @field WitherDefense number @混乱防御
--- @field Duration number @耐久度
--- @field FireInterval number @射击间隔
--- @field Magazines number @弹夹量
--- @field Quality number @品质
--- @field ItemType number @道具类型
local ItemAttr = {}
_G.ItemAttr = ItemAttr

--- @class DropMode @掉落物掉落方式
--- @field DiscardItem number @丢弃道具
--- @field DestroyBox number @箱子被破坏掉落
--- @field DefeatMob number @生物被击败掉落
--- @field DestroyBlock number @方块被破坏掉落
--- @field SpawnItem number @触发器创建
--- @field ChangePlayMode number @掉落物对象转玩法创建
local DropMode = {}
_G.DropMode = DropMode

--- @class AnimMode @动作播放方式
--- @field Loop number @循环播放
--- @field Once number @播放一次
--- @field OnceStop number @播放一次完毕,停在末尾
--- @field Default number @表格默认值播放
local AnimMode = {}
_G.AnimMode = AnimMode

--- @class Easing @线性变换
--- @field None number @无动画
--- @field Linear number @直线变换
--- @field QuadIn number @平方曲线1渐入
--- @field QuadOut number @平方曲线2渐出
--- @field QuadInOut number @平方曲线3进出
--- @field ExpoIn number @指数曲线1渐入
--- @field ExpoOut number @指数曲线2渐出
--- @field ExpoInOut number @指数曲线3进出
--- @field CircIn number @圆曲线1渐入
--- @field CircOut number @圆曲线2渐出
--- @field CircInOut number @圆曲线3进出
--- @field ElasticIn number @弹簧曲线1渐入
--- @field ElasticOut number @弹簧曲线2渐出
--- @field ElasticInOut number @弹簧曲线3进出
--- @field BackIn number @回退曲线1渐入
--- @field BackOut number @回退曲线2渐出
--- @field BackInOut number @回退曲线3进出
--- @field BounceIn number @弹跳曲线1渐入
--- @field BounceOut number @弹跳曲线1渐出
--- @field BounceInOut number @弹跳曲线1进出
local Easing = {}
_G.Easing = Easing

--- @class SkyboxMap @天空盒贴图
--- @field Sky number @天空贴图
--- @field Sun number @太阳贴图
--- @field Moon number @月亮贴图
local SkyboxMap = {}
_G.SkyboxMap = SkyboxMap

--- @class SkyboxColor @天空盒颜色
--- @field Top number @天空顶部颜色
--- @field Middle number @天空腰部颜色
--- @field Bottom number @天空底部颜色
--- @field Light number @天空光照颜色
--- @field Env number @环境光颜色
--- @field Sun number @太阳颜色
--- @field Moon number @月亮颜色
--- @field Cloud number @云颜色
--- @field Fog number @雾颜色
--- @field AmbientLight number @太阳光颜色
--- @field DirectionalLight number @环境光颜色
--- @field Water number @水颜色
local SkyboxColor = {}
_G.SkyboxColor = SkyboxColor

--- @class SkyboxAttr @天空盒参数
--- @field SunScale number @太阳大小
--- @field MoonScale number @月亮大小
--- @field StarDensity number @星星密度
--- @field CloudSpeed number @云的运动速度
--- @field CloudDensity number @云的密度
--- @field CloudHigh number @云的高度
--- @field FogreMinDis number @雾的最近距离
--- @field FogreMaxDis number @雾的最远距离
--- @field Template number @模板
--- @field WaterTransparency number @水透明度
--- @field WaterMirrorness number @风速
--- @field DirectionalLightIntensity number @太阳光强度
--- @field AmbientLightIntensity number @环境光强度
--- @field WindStrength number @风速
local SkyboxAttr = {}
_G.SkyboxAttr = SkyboxAttr

--- @class SkyboxAttrNoTime @天空盒参数
--- @field Metallic number @整体金属度
--- @field Roughness number @整体粗糙度
local SkyboxAttrNoTime = {}
_G.SkyboxAttrNoTime = SkyboxAttrNoTime

--- @class SkyboxParticle @天空盒环境粒子参数
--- @field Strength number @强度
--- @field Range number @范围
--- @field Speed number @速度
--- @field Randomness number @运动不规则度
local SkyboxParticle = {}
_G.SkyboxParticle = SkyboxParticle

--- @class SkyboxFilter @天空盒滤镜参数
--- @field Contrast number @对比度
--- @field Saturation number @饱和度
--- @field Flood number @泛光强度
--- @field Exposure number @曝光强度
--- @field Volumelight number @体积光强度
--- @field Gamma number @伽马强度
--- @field Dof number @景深强度-暂时没用到
--- @field Color number @滤镜颜色
--- @field Lut number @色彩校正
--- @field Template number @滤镜模板
--- @field Bloomthreshold number @Bloom阀值
local SkyboxFilter = {}
_G.SkyboxFilter = SkyboxFilter

--- @class SkyboxSwitch @天空盒开关
--- @field Fogenable number @雾开关
local SkyboxSwitch = {}
_G.SkyboxSwitch = SkyboxSwitch

--- @class CameraModel @摄像机属性
--- @field MoveFollow number @跟随角色移动
--- @field RotateFollow number @跟随角色旋转
--- @field Autoindent number @阻挡后自动缩进
--- @field RelativeRotate number @相对人物旋转
--- @field RoleTranslucent number @角色半透
local CameraModel = {}
_G.CameraModel = CameraModel

--- @class CameraRotate @摄像机旋转模式
--- @field AllDir number @全方向
--- @field OnlyYaw number @仅左右
--- @field OnlyPitch number @仅上下
--- @field NoTurn number @无法转动
local CameraRotate = {}
_G.CameraRotate = CameraRotate

--- @class AbsoluteCampType @绝对阵营
--- @field Noteam number @无队伍
--- @field Team1 number @队伍1
--- @field Team2 number @队伍2
--- @field Team3 number @队伍3
--- @field Team4 number @队伍4
--- @field Team5 number @队伍5
--- @field Team6 number @队伍6
--- @field TeamNpc1 number @绝对阵营-npc队伍1
--- @field TeamNpc2 number @绝对阵营-npc队伍2
--- @field TeamNpc3 number @绝对阵营-npc队伍3
--- @field Enemy number @中立敌对
--- @field Passive number @中立被动
local AbsoluteCampType = {}
_G.AbsoluteCampType = AbsoluteCampType

--- @class RelativeCampType @相对阵营
--- @field Friendly number @友方
--- @field Enemy number @敌方
--- @field Neutral number @中立
--- @field Any number @任意
local RelativeCampType = {}
_G.RelativeCampType = RelativeCampType

--- @class InnerPopUpview @游戏内弹窗界面类型
--- @field CollectMaps number @收藏地图界面
--- @field EvaluateMaps number @评价地图界面
--- @field InviteFriend number @邀请好友界面
--- @field StorageBox number @储物箱界面
--- @field ItemTips number @道具提示界面
--- @field BuffStatus number @状态界面
--- @field Specialty number @特长界面
--- @field ItemProcessing number @道具加工界面
--- @field BackPackTask number @背包任务界面
--- @field BackPackEra number @背包科技界面
--- @field BackPackRole number @背包角色界面
--- @field AnimView number @动作列表界面
--- @field MiniMap number @小地图
--- @field MiniShop number @官方商城界面
local InnerPopUpview = {}
_G.InnerPopUpview = InnerPopUpview

--- @class MiniCurrency @货币类型
--- @field MiniBean number @迷你豆
--- @field MiniCoin number @迷你币
--- @field MiniPoint number @迷你点
local MiniCurrency = {}
_G.MiniCurrency = MiniCurrency

--- @class MiniShopPage @开发者商店页面类型
--- @field Item number @道具购买
--- @field Skin number @皮肤
--- @field Convert number @兑换
--- @field Welfare number @福利
--- @field MiniVip number @大会员
--- @field WareHouse number @打开仓库
--- @field CustomCoin number @打开自定义货币界面
local MiniShopPage = {}
_G.MiniShopPage = MiniShopPage

--- @class PixelUnits @像素单位
--- @field Percentage number @百分比
--- @field Value number @绝对值
local PixelUnits = {}
_G.PixelUnits = PixelUnits

--- @class HorizontalOffset @水平偏移
--- @field Left number @居左
--- @field Centered number @居中
--- @field Right number @居右
local HorizontalOffset = {}
_G.HorizontalOffset = HorizontalOffset

--- @class VerticalOffset @垂直偏移
--- @field Top number @居上
--- @field Centered number @居中
--- @field Bottom number @居下
local VerticalOffset = {}
_G.VerticalOffset = VerticalOffset

--- @class ElementType @元件类型
--- @field Texture number @图片
--- @field Button number @按钮
--- @field Text number @文本
--- @field InputText number @输入框
--- @field Loader3D number @3d装载器
--- @field SlidingContainer number @滑动容器
local ElementType = {}
_G.ElementType = ElementType

--- @class CustomModType @插件类型
--- @field Block number @方块插件 预制
--- @field Monster number @生物插件
--- @field Item number @道具插件
--- @field Recipe number @配方插件
--- @field Furnace number @熔炼插件
--- @field Status number @状态插件
--- @field Biome number @地形插件
--- @field Actor number @实体
--- @field UI number @UI
--- @field Rule number @世界规则
local CustomModType = {}
_G.CustomModType = CustomModType

--- @class WeatherType @天气类型
--- @field None number @无天气
--- @field Sunshine number @晴天
--- @field Rain number @雨天
--- @field Sandstorm number @沙尘暴
--- @field Snow number @雪天
--- @field UnderWater number @暴雨
--- @field Volcano number @火山
--- @field Custom number @自定义
local WeatherType = {}
_G.WeatherType = WeatherType

--- @class KeyCode @按键枚举
--- @field A number @按键A
--- @field D number @按键D
--- @field W number @按键W
--- @field K number @按键K
--- @field I number @按键I
--- @field J number @按键J
--- @field L number @按键L
--- @field N number @按键N
--- @field Q number @按键Q
--- @field E number @按键E
--- @field U number @按键U
--- @field V number @按键V
--- @field F number @按键F
--- @field Z number @按键Z
--- @field Y number @按键Y
--- @field X number @按键X
--- @field G number @按键G
--- @field T number @按键T
--- @field B number @按键B
--- @field R number @按键R
--- @field P number @按键P
--- @field O number @按键O
--- @field C number @按键C
--- @field S number @按键S
--- @field M number @按键M
--- @field H number @按键H
--- @field Space number @按键空格
--- @field Shift number @按键Shift
--- @field Number0 number @按键0
--- @field Number1 number @按键1
--- @field Number2 number @按键2
--- @field Number3 number @按键3
--- @field Number4 number @按键4
--- @field Number5 number @按键5
--- @field Number6 number @按键6
--- @field Number7 number @按键7
--- @field Number8 number @按键8
--- @field Number9 number @按键9
local KeyCode = {}
_G.KeyCode = KeyCode

--- @class ProgressImg @进度图案
--- @field Background number @进度背景
--- @field Progress number @进度值
local ProgressImg = {}
_G.ProgressImg = ProgressImg

--- @class RayDetectType @射线检测返回类型
--- @field Block number @方块类型
--- @field Player number @玩家
--- @field Actor number @生物
--- @field ActorType number @生物类型
--- @field LiquidBlock number @液体方块类型
local RayDetectType = {}
_G.RayDetectType = RayDetectType

--- @class PlayerBodyUIHight @获取玩家内部控件高度
--- @field Nick number @昵称
--- @field Title number @称号
--- @field EffEct number @头部动效
--- @field HpBar number @血条
local PlayerBodyUIHight = {}
_G.PlayerBodyUIHight = PlayerBodyUIHight

--- @class UIScollDir @UI滑动方向
--- @field Horizontal number @水平滑动
--- @field Vertical number @垂直滑动
--- @field Both number @自由滑动
local UIScollDir = {}
_G.UIScollDir = UIScollDir

--- @class TurnFaceDir @角度朝向
--- @field Yaw number @水平朝向
--- @field Pitch number @垂直朝向
local TurnFaceDir = {}
_G.TurnFaceDir = TurnFaceDir

--- @class ProgressVal @进度值类型
--- @field Min number @最小值
--- @field Max number @最大值
--- @field Current number @当前值
--- @field CurAndMax number @当前值和最大值
local ProgressVal = {}
_G.ProgressVal = ProgressVal

--- @class SkyboxTime @天空盒时间
--- @field Current number @当前时间
--- @field Time0 number @天空盒0点
--- @field Time4 number @天空盒4点
--- @field Time6 number @天空盒6点
--- @field Time8 number @天空盒8点
--- @field Time12 number @天空盒12点
--- @field Time16 number @天空盒16点
--- @field Time18 number @天空盒18点
--- @field Time20 number @天空盒20点
--- @field TimeAll number @所有时间段
local SkyboxTime = {}
_G.SkyboxTime = SkyboxTime

--- @class GunState @枪械状态
--- @field Entry number @进入
--- @field Exit number @离开
local GunState = {}
_G.GunState = GunState

--- @class GunAction @枪械触发事件类型
--- @field Equip number @举枪
--- @field Idle number @腰射待机
--- @field Fire number @腰射开火
--- @field Load number @腰射手动上膛
--- @field Run number @持枪冲刺
--- @field Aim number @瞄准待机
--- @field AimFire number @瞄准开火
--- @field AimLoad number @瞄准手动上膛
--- @field Reload number @腰射换弹
--- @field ReloadEmpty number @腰射空仓换弹
--- @field Inspect number @检视
local GunAction = {}
_G.GunAction = GunAction

--- @class GunActionBan @枪械禁用类型
--- @field Equip number @举枪
--- @field Fire number @腰射开火
--- @field Load number @腰射手动上膛
--- @field Run number @持枪冲刺
--- @field Aim number @瞄准待机
--- @field AimFire number @瞄准开火
--- @field AimLoad number @瞄准手动上膛
--- @field Reload number @腰射换弹
--- @field ReloadEmpty number @腰射空仓换弹
--- @field Inspect number @检视
local GunActionBan = {}
_G.GunActionBan = GunActionBan

--- @class Ability @动作总开关
--- @field Movement number @移动能力总开关
--- @field Walking number @行走
--- @field Flying number @飞行
--- @field Swimming number @游泳
--- @field Sneaking number @潜行
--- @field Sprinting number @疾跑
--- @field Jumping number @跳跃
--- @field Cube number @方块能力总开关
--- @field Interaction number @交互方块
--- @field Place number @摆放方块
--- @field Break number @破坏方块
--- @field Item number @道具能力总开关
--- @field Use number @使用道具
--- @field Pick number @拾取道具
--- @field Drop number @丢弃道具
--- @field Attack number @普通攻击
--- @field CanBePickup number @可被举起
--- @field CanUseItemWhenBePickup number @被举起时可否使用道具
--- @field EnableBeattacked number @可受伤
--- @field EnableBekilled number @可被杀死
--- @field EnableDeathdropitem number @杀死有掉落物
--- @field EnableSwitchShortcut number @可切换快捷栏
--- @field EnableRotatingCamera number @可旋转摄像机
--- @field EnableInputRotate number @玩家输入旋转(玩家生效)
local Ability = {}
_G.Ability = Ability

--- @class LogLevel @输出日志等级
--- @field Print number @普通输出
--- @field Warn number @警告输出
--- @field Error number @错误输出
local LogLevel = {}
_G.LogLevel = LogLevel

--- @class ErrorCode @错误码
--- @field OK number @成功
--- @field FAILED number @失败
--- @field KV_UPDATE_GET number @表安全更新拉取的返回码
--- @field KV_UPDATE_SET number @表安全更新设置的返回码
--- @field KV_OP_CD_LMT number @表设置CD超限
--- @field KV_OP_QPM_LMT number @表设置QPS/QPM超限
--- @field KV_OP_NO_VAL number @获取Key不存在
--- @field KV_OP_INVALID_VAL number @获取Key类型不匹配
local ErrorCode = {}
_G.ErrorCode = ErrorCode

--- @class PickupActionType @举起动作类型
--- @field Pickup number @拾取
--- @field Drop number @放下
--- @field Throw number @投掷
--- @field Unbind number @解绑
local PickupActionType = {}
_G.PickupActionType = PickupActionType

--- @class AreaFillType @区域填充类型
--- @field Delete number @删除
--- @field Destroy number @摧毁
local AreaFillType = {}
_G.AreaFillType = AreaFillType

--- @class PlayerNameType @玩家内置UI类型
--- @field Nick number @昵称
--- @field Title number @称号
--- @field EffEct number @头部特效
local PlayerNameType = {}
_G.PlayerNameType = PlayerNameType

--- @class GunFireType @开火类型
--- @field Auto number @全自动
--- @field SemiAuto number @半自动
--- @field Manual number @手动
local GunFireType = {}
_G.GunFireType = GunFireType

--- @class GunDamageType @伤害类型
--- @field Physics number @物理伤害
--- @field Fire number @燃烧伤害
--- @field Poison number @毒素伤害
--- @field Ice number @冰冻伤害
local GunDamageType = {}
_G.GunDamageType = GunDamageType

--- @class GunSpreadType @散布形状
--- @field RightUp number @右上
--- @field Circle number @圆
--- @field NoRightDown number @无右下
local GunSpreadType = {}
_G.GunSpreadType = GunSpreadType

--- @class GunAttr @枪械属性
--- @field BaseDamage number @基础伤害
--- @field RepelDistance number @击退距离
--- @field BulletShrapnel number @弹片数量
--- @field BulletConsume number @消耗子弹数
--- @field Penetration number @穿透率
--- @field HeadDamage number @头部倍率
--- @field BodyDamage number @躯干倍率
--- @field MaxAmmo number @弹容量
--- @field Rpm number @射速(每分钟子弹数)
--- @field ReloadPhase2Time number @换弹行为时间
--- @field ReloadPhase2TimeEmpty number @空仓换弹行为时间
--- @field GunLevel number @枪械等级 历史遗留的字段,对于游戏本体只用于显示角标
--- @field AdsXFunction number @瞄准镜准星功能
--- @field AdsXScale number @瞄准镜准星底图缩放值
--- @field ScopeXPic number @瞄准镜准星贴图
--- @field AdsOffsetX number @瞄准偏移值
--- @field AdsOffsetY number @瞄准偏移值
--- @field AdsOffsetZ number @瞄准偏移值
--- @field FireType number @开火类型
--- @field DamageType number @伤害类型
--- @field TouReduce number @削刃值
--- @field HittedCameraAngle number @被击中抬头反馈
--- @field Range number @射程
--- @field DecayStart number @衰减起始距离
--- @field DecayFinish number @衰减结束距离
--- @field DecayMin number @衰减最小值
--- @field DecayLiquid number @液体衰减系数
--- @field HipSpreadMin number @腰射散布最小值
--- @field HipSpreadStep number @腰射散布步长
--- @field HipSpreadMax number @腰射散布最大值
--- @field HipSpreadType number @腰射散布类型
--- @field AdsSpreadMin number @瞄准散布最小值
--- @field AdsSpreadStep number @瞄准散布步长
--- @field AdsSpreadMax number @瞄准散布最大值
--- @field AdsSpreadType number @瞄准散布类型
--- @field MoveSpreadBonus number @移动散布倍率
--- @field RunSpreadBonus number @疾跑散布倍率
--- @field ShiftSpreadBonus number @潜行散布倍率
--- @field ShiftMoveSpreadBonus number @潜行移动散布倍率
--- @field JumpSpreadBonus number @跳跃散布倍率
--- @field SpreadStepSpeed number @每发增加速度
--- @field SpreadResetSpeed number @重置速度
--- @field SpreadBonusResetSpeed number @重置速度
--- @field EquipTime number @切换枪械行为时间
--- @field AdsSwitchTime number @瞄准时间
--- @field ScopeMagnification number @瞄准倍率
--- @field ControlValue number @操控速度(仅取值)
--- @field HipAccValue number @腰射射击精度(仅取值)
--- @field RecoilValue number @后坐力控制(仅取值)
--- @field BaseDamageBonus number @基础伤害倍率
--- @field ReloadTimeBonus number @换弹时间倍率
--- @field RecoilBonus number @后坐力倍率
--- @field RecoilPitchBonus number @垂直后坐力倍率
--- @field RecoilYawBonus number @水平后坐力倍率
--- @field SpreadBonus number @散布倍率
--- @field SpreadHipBonus number @腰射散布倍率
--- @field SpreadAdsBonus number @瞄准散布倍率
--- @field HipMoveSpeedBonus number @腰射移动速度倍率
--- @field AdsMoveSpeedBonus number @瞄准移动速度倍率
--- @field AdsSwitchTimeBonus number @瞄准时间倍率
--- @field RpmBonus number @射速倍率
--- @field RangeBonus number @射程倍率
--- @field BulletId number @子弹ID(仅获取预制属性)
local GunAttr = {}
_G.GunAttr = GunAttr

--- @class BiomeType @怪物刷新地形枚举
--- @field Sea number @迷拉星浅海
--- @field GrassLand number @迷拉星草原
--- @field Desert number @迷拉星沙漠
--- @field Forest number @迷拉星森林
--- @field Cliff number @迷拉星峭壁
--- @field Swamp number @迷拉星沼泽
--- @field ConiferousForest number @迷拉星针叶林
--- @field Jungle number @迷拉星丛林
--- @field IceSheet number @迷拉星冰原
--- @field FrozenSea number @迷拉星冻洋
--- @field FrozenRiver number @迷拉星冻河
--- @field RedSoil number @迷拉星红土
--- @field RedSoilShore number @迷拉星红土海岸
--- @field DesertHills number @迷拉星沙漠山丘
--- @field ForestHills number @迷拉星森林山丘
--- @field ConiferousForestHills number @迷拉星针叶林山丘
--- @field IceMountains number @迷拉星冰山
--- @field JungleHills number @迷拉星丛林山丘
--- @field River number @迷拉星河流
--- @field Beach number @迷拉星沙滩
--- @field CliffEdge number @迷拉星峭壁边缘
--- @field Earthcore number @烈焰星熔岩之地
--- @field Airland number @迷拉星空岛
--- @field Basin number @迷拉星盆地
--- @field BasinEdge number @迷拉星盆地边缘
--- @field BasinBamboo number @迷拉星竹林盆地
--- @field BasinPeach number @迷拉星桃树盆地
--- @field EyedStarGround number @萌眼星地表
--- @field EyedStarGroundHills number @萌眼星山丘
--- @field EyedStarGroundPlain number @萌眼星祭坛平原
--- @field EyedStarGroundMountain number @萌眼星高山
--- @field EyedStarGroundHills2 number @萌眼星山丘2
--- @field EyedStarAirlands number @萌眼星空岛
--- @field EyedStarAirlandsSub1 number @萌眼星子空岛1
--- @field EyedStarAirlandsSub2 number @萌眼星子空岛2
--- @field EyedStarAirlandsSub3 number @萌眼星子空岛3
--- @field EyedStarAirlandsSub4 number @萌眼星子空岛4
--- @field EyedStarAirlandsEdge number @萌眼星空岛边缘
--- @field RainForest number @迷拉星雨林
--- @field AirlandGround number @迷拉星空岛地上
--- @field AirlandAir number @迷拉星空岛空中
--- @field Volcano number @迷拉星火山主峰
--- @field VolcanoPlain number @迷拉星火山平原
--- @field VolcanoMountain number @迷拉星火山山脉
--- @field VolcanoRiver number @迷拉星火山岩浆河
--- @field VolcanoCore number @迷拉星火山口
--- @field DesertOasis number @迷拉星沙漠绿洲
--- @field DesertLake number @迷拉星沙漠湖泊
--- @field DeepSea number @迷拉星深海
--- @field IslandShoreDesert number @迷拉星荒岛海岸
--- @field IslandLandDesert number @迷拉星荒岛岛心
--- @field IslandShoreRedsoil number @迷拉星红土岛海岸
--- @field IslandLandRedsoil number @迷拉星红土岛心
--- @field IslandShoreReef number @迷拉星珊瑚岛海岸
--- @field IslandLandReef number @迷拉星珊瑚岛岛心
--- @field IceSheetConiferousForest number @迷拉星覆雪针叶林
--- @field IceSheetHighestPeak number @迷拉星雪山主峰
--- @field IceSheetSecondPeak number @迷拉星雪山副峰
--- @field IceSheetMountain number @迷拉星雪山山脉
--- @field IceSheetMountainSide number @迷拉星雪山中部
--- @field IceSheetPeakPlain number @迷拉星雪山底部
--- @field IceSheetSecondMountainSide number @迷拉星雪山副峰中部
--- @field IceSheetFrizebLake number @迷拉星雪山冻湖
--- @field Canyon number @迷拉星峡谷
--- @field CanyonEage number @迷拉星峡谷边缘
--- @field GrassLandArid number @迷拉星干旱草原
--- @field GrassLandDandelion number @迷拉星草原蒲公英花海
--- @field GrassLandRapeseed number @迷拉星草原油菜花海
--- @field ForestLavender number @迷拉星森林薰衣草花海
--- @field ForestFoxtail number @迷拉星森林狗尾草海
--- @field ForestChrysanth number @迷拉星森林菊花花海
--- @field BasinRice number @迷拉星盆地稻田
--- @field SwampRiverSide number @迷拉星沼泽河畔
--- @field AirlandShine number @迷拉星粉蝶花空岛
--- @field CliffPlum number @迷拉星三角梅峭壁
--- @field IslandLandTulip number @迷拉星郁金香岛心
--- @field IslandShoreTulip number @迷拉星郁金香海岸
--- @field City number @迷拉星末日城镇
--- @field DesertPopulusEuphratica number @迷拉星沙漠胡杨林
--- @field JungleBlueJacaranda number @迷拉星丛林蓝花楹树林
--- @field CliffMaple number @迷拉星峭壁枫叶林
--- @field CliffGinkgo number @迷拉星峭壁银杏林
--- @field PlainsLake number @迷拉星草原湖泊
--- @field BasinLake number @迷拉星盆地湖泊
--- @field ForestLake number @迷拉星森林湖泊
--- @field ConiferousForestLake number @迷拉星针叶林湖泊
--- @field RainForestLake number @迷拉星雨林湖泊
--- @field AirShipPlain number @铁穹平原
--- @field AirShipFleet number @铁穹舰队
local BiomeType = {}
_G.BiomeType = BiomeType

--- @class GridAttr @ItemId
--- @field ItemNum number @道具数量
--- @field Durable number @耐久度
--- @field Toughness number @韧性
local GridAttr = {}
_G.GridAttr = GridAttr

--- @class VDistanceRange @视野距离
--- @field Near number @近
--- @field Middle number @中
--- @field Far number @远
--- @field Further number @更远
--- @field Farthest number @最远
local VDistanceRange = {}
_G.VDistanceRange = VDistanceRange

--- @class ObjType @对象类型
--- @field Entity number @实体
--- @field Mob number @生物
--- @field Player number @玩家
--- @field World number @世界
--- @field Block number @方块
--- @field UI number @UI编辑界面
--- @field Area number @区域
--- @field Projectile number @投掷物对象
--- @field Pos number @位置
--- @field DropItem number @掉落物
local ObjType = {}
_G.ObjType = ObjType

--- @class CmpProPermission @组件属性访问权限
--- @field Public number @公开
--- @field Private number @私有
--- @field Read number @只读
local CmpProPermission = {}
_G.CmpProPermission = CmpProPermission

--- @class CmpUIPermission @组件属性预制面板显示控制
--- @field Hide number @隐藏
--- @field Show number @显示
local CmpUIPermission = {}
_G.CmpUIPermission = CmpUIPermission

--- @class DeviceType @设备类型
--- @field PC number @PC端
--- @field Android number @安卓
--- @field IOS number @苹果
--- @field Other number @其他
local DeviceType = {}
_G.DeviceType = DeviceType

--- @class MatchMode @标签匹配方式
--- @field All number @全部匹配
--- @field Any number @部分匹配
local MatchMode = {}
_G.MatchMode = MatchMode

--- @class AvtPart @皮肤数据类型
--- @field Body number @身体
--- @field Head number @头部
--- @field Face number @脸
--- @field FaceOrnament number @脸装饰
--- @field Jacket number @夹克
--- @field HandOrnament number @手装饰
--- @field Trousers number @裤子
--- @field Shoe number @鞋子
--- @field BackOrnament number @背装饰
--- @field Footprint number @脚印
--- @field Skin number @皮肤
--- @field RightHand number @右手特效
--- @field RightShoe number @右脚特效
--- @field HeadEffect number @头部特效
--- @field FaceEffect number @脸特效
--- @field WholeBodyEffect number @全身特效
--- @field HandEffect number @手特效
--- @field TrailingEffect number @拖尾特效
--- @field BgEffect number @背景特效
--- @field WingEffect number @翅膀特效
--- @field EquipHead number @装备头部
--- @field EquipBreast number @装备胸部
--- @field EquipLegging number @装备腿部
--- @field EquipShoe number @装备鞋子
--- @field EquipPifeng number @装备披风
--- @field EquipWeapon number @装备武器
--- @field EquipCustom1 number @装备扩展1
--- @field EquipCustom2 number @装备扩展2
--- @field EquipCustom3 number @装备扩展3
--- @field Max number @最大值
local AvtPart = {}
_G.AvtPart = AvtPart

--- @class ElementAttr @元件属性
--- @field Name number @名称
--- @field Color number @颜色
--- @field Text number @文本
--- @field Transparency number @透明度
--- @field Angle number @角度
--- @field Visibility number @显示/隐藏状态
--- @field Position number @位置
--- @field Size number @尺寸
--- @field ScrollPosition number @滚动容器位置
--- @field GlobalPos number @绝对位置
local ElementAttr = {}
_G.ElementAttr = ElementAttr

--- @class UIAttr @界面属性
--- @field Name number @名称
--- @field Visibility number @显示/隐藏状态
local UIAttr = {}
_G.UIAttr = UIAttr

--- @class MiniShopData @皮肤数据类型
--- @field Skin number @皮肤
--- @field Avt number @所有AVT
--- @field Mount number @所有坐骑
--- @field AllMountLevel number @所有坐骑的等级总和
local MiniShopData = {}
_G.MiniShopData = MiniShopData

--- @class BeaconMapType
--- @field Position number @坐标
--- @field Object number @对象
local BeaconMapType = {}
_G.BeaconMapType = BeaconMapType

--- @class MiniMapMarkType @小地图图标类型
--- @field DevMark number @使用接口创建的图标
--- @field Player number @玩家图标
local MiniMapMarkType = {}
_G.MiniMapMarkType = MiniMapMarkType

--- @class GameSetting
--- @field ScopeMode number @准星模式
--- @field CameraShake number @镜头晃动
--- @field AutoJump number @自动跳跃
--- @field FixedMap number @固定小地图
local GameSetting = {}
_G.GameSetting = GameSetting

--- @class BeaconClampType @自定义UI信标限制类型
--- @field None number @无限制
--- @field Circle number @圆形限制
--- @field Rectangle number @矩形限制
local BeaconClampType = {}
_G.BeaconClampType = BeaconClampType


--- @class Data
--- 普通变量数据管理接口 - Data
local Data = {
    Array = {}, ---  数组变量数据管理接口 - Array
    Table = {}, ---  二维表变量数据管理接口 - Table
    Map = {}, ---  一维表 (KV表) 变量数据管理接口 - Map
}
_G.Data = Data

--- 获取变量值
--- 
--- **1.全局变量playerId传nil**
--- @return boolean @成功返回True，失败返回False
--- @param varId string @变量ID
--- @param playerId number @玩家ID
--- @param value any @默认值
function Data:SetValue(varId, playerId, value)
    return true
end

--- 获取变量值
--- 
--- **1.全局变量playerId传nil**
--- @return any
--- @param varId string @变量ID
--- @param playerId number @玩家ID
function Data:GetValue(varId, playerId)
    return nil
end

--- 数值变量增加值
--- 
--- **1.全局变量playerId传nil**
--- @return any
--- @param varId string @变量ID
--- @param playerId number @玩家ID
--- @param value number @增加值
function Data:IncreasesValue(varId, playerId, value)
    return nil
end


--- 更新整个表的数据信息
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param value table @表内的值
--- @return boolean @是否成功
function Data.Table:UpdateAllValue(varId, playerId, value)
    return true
end

--- 清理表格数据
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @return boolean @是否成功
function Data.Table:Clear(varId, playerId)
    return true
end

--- 在末尾插入一行数据
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param ... any @按照列顺序编写的值(中间值不能传nil)
--- @return boolean @是否成功
function Data.Table:InsertValue(varId, playerId, ...)
    return true
end

--- 在某行插入一行数据
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param data table @插入的数据表{[列索引] = 值, ...} or {[列名] = 值, ...}
--- @param rowIndex number @行索引(可选，默认插入到最后)
--- @return boolean @是否成功
function Data.Table:InsertValueByRow(varId, playerId, data, rowIndex)
    return true
end

--- 获取表格数据
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param row number @行索引
--- @param col number @列索引或列名
--- @return any @返回的值
function Data.Table:GetValue(varId, playerId, row, col)
    return nil
end

--- 获取表格所有数据
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @return table @返回的表格数据
function Data.Table:GetAllValue(varId, playerId)
    return {}
end

--- 设置表格数据
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param row number|table @行索引或行索引数组
--- @param col number @列索引或列名
--- @param value any @设置的值
--- @return boolean @是否成功
function Data.Table:SetValue(varId, playerId, row, col, value)
    return true
end

--- 删除序列号的值
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param row number|table @行索引或行索引数组
--- @return boolean @是否成功
function Data.Table:RemoveRow(varId, playerId, row)
    return true
end

--- 获取某列的所有值
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param col number @列索引或列名
--- @return table @列值数组
function Data.Table:GetValuesByCol(varId, playerId, col)
    return {}
end

--- 获取行数
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @return number @行数
function Data.Table:GetRows(varId, playerId)
    return 0
end

--- 获取列数
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @return number @列数
function Data.Table:GetCols(varId, playerId)
    return 0
end

--- 获取列索引
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param colName string @列名
--- @return number @列索引
function Data.Table:GetColIndex(varId, playerId, colName)
    return 0
end

--- 获取指定列和值的行索引(默认判断值相等)
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param col number @列索引或列名
--- @param value any @查询的值
--- @param cmp function @筛选函数(可选, function(actionvalue) return a == value end)
--- @return number @行索引
function Data.Table:GetRowIndex(varId, playerId, col, value, cmp)
    return 0
end

--- 获取指定列和值的所有行索引(默认判断值相等)
--- @param varId number @变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param col number @列索引或列名
--- @param value any @查询的值
--- @param cmp function @筛选函数(可选, function(actionvalue) return a == value end)
--- @return table @行索引数组
function Data.Table:GetRowIndexs(varId, playerId, col, value, cmp)
    return {}
end

--- 获取表格列的key
--- @param varId number @变量ID
--- @return table @列键名数组
function Data.Table:GetTableColKeys(varId)
    return {}
end


--- 设置组对应索引的值
--- 
--- **1.索引值不允许大于数组当前大小**
--- 
--- **2.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value any @设置的值
--- @param index number @索引值
--- @return boolean @是否成功
function Data.Array:SetValue(varId, playerId, value, index)
    return true
end

--- 插入数据到数组
--- 
--- **1.如果index为空就加到最后**
--- 
--- **2.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value any @插入的值
--- @param index? number @索引值 **(为空则加到最后)**
--- @return boolean @是否成功
function Data.Array:InsertValue(varId, playerId, value, index)
    return true
end

--- 替换组中的值
--- 
--- 将数值组的全部 **{oldValue}** 替换为 **{newValue}**
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param newValue any @新值
--- @param oldValue any @旧值
--- @return boolean @是否成功
function Data.Array:ReplaceValue(varId, playerId, newValue, oldValue)
    return true
end

--- 获取对应索引数据
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param index number @索引值
function Data.Array:GetValue(varId, playerId, index)
    return nil
end

--- 获取数据对应索引
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value any @值
function Data.Array:GetIndexByValue(varId, playerId, value)
    return 0
end

--- 删除数组中全部的 **{value}**
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value any @值
function Data.Array:RemoveByValue(varId, playerId, value)
    return true
end

--- 删除索引的值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param index number @索引值
function Data.Array:Remove(varId, playerId, index)
    return true
end

--- 清理数组数据
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @return boolean @是否成功
function Data.Array:Clear(varId, playerId)
    return true
end

--- 数组排序
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param isUp number @排序方式枚举(SortType)
--- @return boolean @是否成功
function Data.Array:Sort(varId, playerId, isUp)
    return true
end

--- 获取数组长度
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @return number @数组长度
function Data.Array:GetSize(varId, playerId)
    return 0
end

--- 获取数组所有数据
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @return table @数组所有数据
function Data.Array:GetAllValue(varId, playerId)
    return {}
end

--- 获取数组最大值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @return number @数组最大值
function Data.Array:GetMax(varId, playerId)
    return 0
end

--- 获取数组最小值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @return number @数组最小值
function Data.Array:GetMin(varId, playerId)
    return 0
end

--- 获取数组随机值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @return number @数组随机值
function Data.Array:RandomValue(varId, playerId)
    return 0
end

--- 组是否有指定值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value any @值
--- @return boolean @是否有指定值
function Data.Array:HasValue(varId, playerId, value)
    return true
end

--- 任意组索引是否有任意值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param index number @索引值
--- @return boolean @是否有指定值
function Data.Array:HasValueByNo(varId, playerId, index)
    return true
end

--- 在指定索引位置插入组
--- 
--- **1.全局变量playerId传nil**
--- 
--- **2.全局变量playerId2传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param index number @索引值(插入位置)
--- @param varId2 string @表ID2
--- @param playerId2 number @玩家ID2
--- @return boolean @是否成功
function Data.Array:InsertValues(varId, playerId, index, varId2, playerId2)
    return true
end

--- 删除 **{var}** 中 **{var2}** 含有的值
--- 
--- **1.全局变量playerId传nil**
--- 
--- **2.全局变量playerId2传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param varId2 string @表ID2
--- @param playerId2 number @玩家ID2
--- @return boolean @是否成功
function Data.Array:RemoveByValues(varId, playerId, varId2, playerId2)
    return true
end

--- 获取任意组种任意值的数量
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value any @值
--- @return number @数量
function Data.Array:GetCountByValue(varId, playerId, value)
    return 0
end

--- 数值组指定索引值增加指定值
--- 
--- **1.全局变量playerId传nil**
--- @param varId string @表ID
--- @param playerId number @玩家ID
--- @param value number @增加值
--- @param index number @索引值
function Data.Array:IncreasesValue(varId, playerId, value, index)
    return true
end


--- @class Component
--- 组件管理接口 Component
local Component = {}
_G.Component = Component

--- 获取该组件挂载的对象实例
--- @return nil @挂载对象
function Component:GetGameObject()    
    return nil
end

--- 获取组件挂载的对象实例id
--- @return number @对象实例id
function Component:GetGameObjectId()
    return 0
end

--- 获取组件是否有效
--- @return boolean @是否有效
function Component:IsValid()
    return true
end

--- 在组件所在的对象上添加指定组件
--- @param componentId string @组件ID
--- @return nil @组件对象
function Component:AddComponent(componentId)
    return nil
end

--- 删除在组件所在的对象上的指定组件
--- @param componentId string @组件ID
--- @return nil
function Component:RemoveComponent(componentId)
end

--- 获取组件所在对象上的指定组件
--- @param componentId string @组件ID
--- @return nil @组件对象
function Component:GetComponent(componentId)
    return nil
end

--- 发送自定义消息(异步)
--- @param eventId string @消息ID
--- @param ... any @消息参数
--- @return nil
function Component:PushCustomEvent(eventId, ...)
end

--- 发送自定义消息(同步)
--- @param eventId string @消息ID
--- @param ... any @消息参数
--- @return nil
function Component:PushCustomEventSync(eventId, ...)
end

--- 监听自定义消息(广播)
--- @param eventId string @消息ID
--- @param callback function @回调函数
--- @return nil
function Component:AddCustomEvent(eventId, callback)
end

--- 移除自定义事件监听
--- @param eventId string @消息ID
--- @return nil
function Component:RemoveCustomEvent(eventId)
end

--- 添加触发事件(该函数只在UI跟世界类型组件有效)
--- @param eventType number @事件类型
--- @param callback function @回调函数
--- @param filterParam1? any @过滤参数1(缺省参数)
--- @param filterParam2? any @过滤参数2(缺省参数)
--- @return nil
function Component:AddTriggerEvent(eventType, callback, filterParam1, filterParam2)
end

--- 移除触发事件监听
--- @param eventType number @事件类型
--- @return nil
function Component:RemoveTriggerEvent(eventType)
end

--- 发送对象事件(异步)，只有同个对象上监听的组件才能收到事件
--- @param eventType string @自定义事件类型
--- @param ... any @事件内容
--- @return nil
function Component:PushEvent(eventType, ...)
end

--- 发送对象事件(同步)，只有同个对象上监听的组件才能收到事件
--- @param eventType string @自定义事件类型
--- @param ... any @消息内容
--- @return nil
function Component:PushEventSync(eventType, ...)
    return nil
end

--- 监听对象事件(可以监听自定义的，也能监听官方内置对象事件)
--- @param eventType string|number @事件类型
--- @param callback function @回调函数
--- @return nil
function Component:AddEvent(eventType, callback)
    return nil
end

--- 移除对象的事件监听
--- @param eventType string|number @事件类型
--- @return nil
function Component:RemoveEvent(eventType)
    return nil
end

--- 启动定时器在指定时间执行任务
--- @param callback function @回调函数
--- @param delay number @时间间隔(秒)
--- @return nil @定时器任务对象
function Component:DoTaskInTime(callback, delay)
    return nil
end

--- 启动定时器周期性执行任务
--- @param callback function @回调函数
--- @param interval number @间隔时间(秒)
--- @param delay number @延迟开始第一次执行时间(默认0)
--- @param count number @执行次数(默认无限次)
--- @return nil @定时器任务对象
function Component:DoPeriodicTask(callback, interval, delay, count)
    return nil
end

--- 清除所有定时器任务
--- @return nil
function Component:ClearAllTask()
    return nil
end

--- 设置是否启用事件
--- @param callback function @事件回调函数
--- @param enable boolean @是否启用
--- @return nil
function Component:SetEventIsEnable(callback, enable)
    return nil
end

--- 启动新协程
--- @param callback function @协程函数
--- @return nil
function Component:ThreadWork(callback)
    return nil
end

--- 线程等待
--- @param delay number @等待时间(默认一帧)
--- @return nil
function Component:ThreadWait(delay)
    return nil
end

--- 发送云服广播消息(异步)
--- @param eventType string @自定义事件类型
--- @param ... any @事件内容
--- @return nil
function Component:PushCloudServerMsg(eventType, ...)
    return nil
end

--- 接收云服事件
--- @param eventType string @消息类型
--- @param callback function @回调函数
--- @return nil
function Component:AddCloudSeverEvent(eventType, callback)
    return nil
end

--- 移除云服消息监听
--- @param eventType string @消息类型
--- @return nil
function Component:RemoveCloudSeverEvent(eventType)
    return nil
end

--- @type Component self

--- @class TriggerEvent @触发器事件枚举
--- @field GroupWeatherChanged any @当地形组的天气改变
--- @field GameStart any @游戏创建
--- @field GameHour any @游戏时间
--- @field MinitimerChange any @任意计时器改变
--- @field CraftEnd any @配方合成完毕
--- @field FurnaceBegin any @当熔炼开始
--- @field FurnaceEnd any @当熔炼结束
--- @field PlayerRevive any @玩家复活
--- @field PlayerMoveOneBlockSize any @玩家移动
--- @field PlayerSelectShortcut any @玩家选中快捷栏
--- @field PlayerInvateFriend any @玩家邀请好友
--- @field GameAnyPlayerEnterGame any @当玩家进入游戏
--- @field GameAnyPlayerLeaveGame any @当玩家离开游戏
--- @field GameAnyPlayerVictory any @当玩家游戏胜利
--- @field GameAnyPlayerDefeat any @当玩家游戏失败
--- @field PlayerClickBlock any @当玩家点击任意方块
--- @field PlayerClickPlayer any @当玩家点击任意玩家
--- @field PlayerClickMob any @当玩家点击任意生物
--- @field PlayerClickProjectile any @当玩家点击任意投掷物
--- @field PlayerClickDropItem any @当玩家点击任意掉落物
--- @field PlayerClickEntity any @当玩家点击任意实体
--- @field PlayerInputKeyClick any @当任意玩家点击按键
--- @field PlayerInputKeyDown any @当任意玩家按下按键
--- @field PlayerInputKeyUp any @当任意玩家抬起按键
--- @field PlayerInputKeyOnPress any @当任意玩家长按按键
--- @field PlayerNewInputContent any @玩家发送聊天信息
--- @field PlayerGunAction any @当玩家持枪状态改变时
--- @field PlayerMotionStateChange any @当玩家进入运动状态
--- @field PlayerMotionStateChangeEnd any @当玩家离开运动状态
--- @field PlayerAddItem any @当玩家获得道具
--- @field PlayerUseItem any @当玩家开始使用道具
--- @field PlayerChargeItemBegin any @当玩家开始蓄力道具
--- @field PlayerConsumeItem any @当玩家消耗道具
--- @field PlayerPickUpItem any @当玩家拾取道具
--- @field PlayerDiscardItem any @当玩家丢弃道具
--- @field PlayerChargeItemEnd any @当玩家结束蓄力道具
--- @field PlayerShortcutChange any @当玩家的快捷栏发生改变
--- @field PlayerShortcutAddItem any @当玩家的快捷栏放入道具
--- @field PlayerShortcutRemItem any @当玩家的快捷栏取出道具
--- @field PlayerBackPackChange any @当玩家的背包栏发生改变
--- @field PlayerBackPackAddItem any @当玩家的背包栏放入道具
--- @field PlayerBackPackRemItem any @当玩家的背包栏取出道具
--- @field PlayerEquipChange any @当玩家的装备栏发生改变
--- @field PlayerEquipAddItem any @当玩家的装备栏放入道具
--- @field PlayerEquipRemItem any @当玩家的装备栏取出道具
--- @field PlayerEquipOn any @当玩家穿上装备
--- @field PlayerEquipOff any @当玩家脱下装备
--- @field BlockAdd any @方块被创建
--- @field BlockRemove any @当方块被破坏
--- @field BlockDigBegin any @当方块被挖掘
--- @field BlockDigEnd any @当方块被挖掘完毕
--- @field BlockDigCancel any @当方块被挖掘中断
--- @field BlockTrigger any @当方块开关状态发生改变
--- @field BlockChangeColor any @当方块颜色发生改变
--- @field BlockChangeDir any @当方块方向发生改变
--- @field BlockContainerChange any @当储存容器内发生改变
--- @field BlockContainerPutIn any @当储存容器内放入道具
--- @field BlockContainerTakeOut any @当储存容器内取出道具
--- @field UILostFocus any @玩家在界面输入字符串
--- @field UISpineComplete any @当前界面的元件动画装载器播放完毕
--- @field UIShow any @当前界面被打开
--- @field UIHide any @当前界面被关闭
--- @field UIButtonClick any @当前界面的元件被点击
--- @field UIButtonTouchBegin any @当前界面的元件被按下
--- @field UIButtonTouchEnd any @当前界面的元件被抬起
--- @field UIButtonLongPress any @当前界面的元件被长按
--- @field UIGLoader3DTouchClick any @当前界面的元件被点击
--- @field UIGLoader3DTouchBegin any @当前界面的元件被按下
--- @field UIGLoader3DTouchEnd any @当前界面的元件被抬起
--- @field UIGLoader3DLongPress any @当前界面的元件被长按
--- @field UIScrollPaneTouchBegin any @滑动容器触摸开始
--- @field UIScrollPaneTouchEnd any @滑动容器触摸结束
--- @field UIScrollPaneScrollEnd any @滑动容器滚动结束
--- @field ParticlePosOnCreate any @当特效创建在任意位置
--- @field ParticleObjectOnCreate any @当特效创建在任意对象
--- @field ParticlePlayerOnCreate any @当特效创建在任意玩家
--- @field ParticleMobOnCreate any @当特效创建在任意生物
--- @field ParticleProjectileOnCreate any @当特效创建在任意投掷物
--- @field ParticleItemOnCreate any @当特效创建在任意掉落物
--- @field ParticleEntityOnCreate any @当特效创建在任意实体
--- @field DeveloperBuyItem any @任意玩家购买或提取开发者商店道具
--- @field PlayerCollideToPlayer any @当任意玩家和任意玩家碰撞开始
--- @field PlayerCollideToMob any @当任意玩家和任意生物碰撞开始
--- @field PlayerCollideToMissile any @当任意玩家和任意投掷物碰撞开始
--- @field PlayerCollideToDropItem any @当任意玩家和任意掉落物碰撞开始
--- @field PlayerCollideToEntity any @当任意玩家和任意实体碰撞开始
--- @field PlayerCollideToAreaObj any @当任意玩家和任意区域碰撞开始
--- @field MobCollideToPlayer any @当任意生物和任意玩家碰撞开始
--- @field MobCollideToMob any @当任意生物和任意生物碰撞开始
--- @field MobCollideToMissile any @当任意生物和任意投掷物碰撞开始
--- @field MobCollideToDropItem any @当任意生物和任意掉落物碰撞开始
--- @field MobCollideToEntity any @当任意生物和任意实体碰撞开始
--- @field MobCollideToAreaObj any @当任意生物和任意区域碰撞开始
--- @field MissileCollideToPlayer any @当任意投掷物和任意玩家碰撞开始
--- @field MissileCollideToMob any @当任意投掷物和任意生物碰撞开始
--- @field MissileCollideToMissile any @当任意投掷物和任意投掷物碰撞开始
--- @field MissileCollideToDropItem any @当任意投掷物和任意掉落物碰撞开始
--- @field MissileCollideToEntity any @当任意投掷物和任意实体碰撞开始
--- @field MissileCollideToAreaObj any @当任意投掷物和任意区域碰撞开始
--- @field DropItemCollideToPlayer any @当任意掉落物和任意玩家碰撞开始
--- @field DropItemCollideToMob any @当任意掉落物和任意生物碰撞开始
--- @field DropItemCollideToMissile any @当任意掉落物和任意投掷物碰撞开始
--- @field DropItemCollideToDropItem any @当任意掉落物和任意掉落物碰撞开始
--- @field DropItemCollideToEntity any @当任意掉落物和任意实体碰撞开始
--- @field DropItemCollideToAreaObj any @当任意掉落物和任意区域碰撞开始
--- @field EntityCollideToPlayer any @当任意实体和任意玩家碰撞开始
--- @field EntityCollideToMob any @当任意实体和任意生物碰撞开始
--- @field EntityCollideToMissile any @当任意实体和任意投掷物碰撞开始
--- @field EntityCollideToDropItem any @当任意实体和任意掉落物碰撞开始
--- @field EntityCollideToEntity any @当任意实体和任意实体碰撞开始
--- @field EntityCollideToAreaObj any @当任意实体和任意区域碰撞开始
--- @field AreaObjCollideToPlayer any @当任意区域和任意玩家碰撞开始
--- @field AreaObjCollideToMob any @当任意区域和任意生物碰撞开始
--- @field AreaObjCollideToMissile any @当任意区域和任意投掷物碰撞开始
--- @field AreaObjCollideToDropItem any @当任意区域和任意掉落物碰撞开始
--- @field AreaObjCollideToEntity any @当任意区域和任意实体碰撞开始
--- @field AreaObjCollideToAreaObj any @当任意区域和任意区域碰撞开始
--- @field PlayerAreaIn any @当任意玩家进入区域
--- @field PlayerAreaOut any @当任意玩家离开区域
--- @field MobAreaIn any @当任意生物进入区域
--- @field MobAreaOut any @当任意生物离开区域
--- @field MissileAreaIn any @当任意投掷物进入区域
--- @field MissileAreaOut any @当任意投掷物离开区域
--- @field DropItemAreaIn any @当任意掉落物进入区域
--- @field DropItemAreaOut any @当任意掉落物离开区域
--- @field EntityAreaIn any @当任意实体进入区域
--- @field EntityAreaOut any @当任意实体离开区域
--- @field AreaObjAreaIn any @当任意区域进入区域
--- @field AreaObjAreaOut any @当任意区域离开区域
--- @field MobCreate any @当任意生物被创建
--- @field EntityCreate any @当任意实体被创建
--- @field AreaObjCreate any @当任意区域被创建
--- @field PlayerBeHurt any @当任意玩家受到伤害
--- @field PlayerDie any @当任意玩家被击败
--- @field MobBeHurt any @当任意生物受到伤害
--- @field MobDie any @当任意生物被击败
--- @field PlayerAttack any @当任意玩家开始攻击
--- @field PlayerAttackHit any @当任意玩家攻击命中
--- @field PlayerDefeatActor any @当任意玩家击败目标
--- @field PlayerDamageActor any @当任意玩家造成伤害
--- @field MobAttack any @当任意生物开始攻击
--- @field MobAttackHit any @当任意生物攻击命中
--- @field MobBeat any @当任意生物击败目标
--- @field MobDamage any @当任意生物造成伤害
--- @field PlayerAddBuff any @当任意玩家获得状态
--- @field PlayerRemoveBuff any @当任意玩家失去状态
--- @field MobAddBuff any @当任意生物获得状态
--- @field MobRemoveBuff any @当任意生物失去状态
--- @field PlayerChangeAttr any @当任意玩家的属性改变
--- @field MobChangeAttr any @当任意生物的属性改变
--- @field ActorPickupActor any @当角色举起角色
--- @field PlayerAttrStateChange any @当任意玩家权限发生改变
--- @field MobAttrStateChange any @当任意生物权限发生改变
--- @field PlayerMountActor any @当任意玩家骑乘坐骑/载具
--- @field MobMountActor any @当任意生物骑乘坐骑/载具
--- @field PlayerDismountActor any @当任意玩家取消骑乘
--- @field MobDismountActor any @当任意生物取消骑乘
--- @field MissileCreate any @投掷物创建
--- @field ProjectileHitBlock any @当投掷物击中任意方块
--- @field ProjectileHitPlayer any @当投掷物击中任意玩家
--- @field ProjectileHitMob any @当投掷物击中任意生物
--- @field ProjectileHitProj any @当投掷物击中任意投掷物
--- @field ProjectileHitItem any @当投掷物击中任意掉落物
--- @field ProjectileHitEntity any @当投掷物击中任意实体
--- @field ItemCreate any @当掉落物创建
--- @field DropItemPickup any @当掉落物被拾取
--- @field ItemDisappear any @当掉落物消失
local TriggerEvent = {}
_G.TriggerEvent = TriggerEvent

--- @class CurEventParam @事件参数类
--- @field EventTargetPos any @事件中的位置
--- @field EventBuff any @事件中的状态效果
--- @field EventTargetEffect any @事件中的特效
--- @field EventTargetBlock any @事件中的方块类型
--- @field EventShortCutIdx any @事件中的快捷栏
--- @field EquipItemPos any @事件中的装备栏
--- @field EventElementID any @事件中的元件
--- @field EventUIID any @事件中的界面
--- @field EventString any @事件中的字符串
--- @field SelectUIID any @当前编辑的界面
--- @field EventAreaid any @事件中的区域
--- @field Hurtlv any @事件中伤害值
--- @field TriggerByPlayer any @触发事件的玩家
--- @field EventTargetPlayer any @事件中的目标玩家
--- @field TriggerByCreature any @触发事件的生物
--- @field EventTargetCreature any @事件中的目标生物
--- @field Actorid any @触发事件的生物类型
--- @field targetactorid any @事件中的目标生物类型
--- @field EventTargetItemID any @事件中的道具类型
--- @field TriggerByMissile any @触发事件的投射物
--- @field EventTargetDropItem any @事件中的掉落物
--- @field Itemnum any @事件中的道具数量
local CurEventParam = {}
_G.CurEventParam = CurEventParam

--- @class ObjectEvent @组件事件枚举
--- @field OnPropertyChange any @当对象的属性发生改变
--- @field PlayerEnterGame any @当此玩家进入游戏
--- @field PlayerLeaveGame any @当此玩家离开游戏
--- @field PlayerVictory any @当此玩家游戏胜利
--- @field PlayerDefeat any @当此玩家游戏失败
--- @field PlayerClickBlock any @当此玩家点击任意方块
--- @field PlayerClickPlayer any @当此玩家点击任意玩家
--- @field PlayerClickMob any @当此玩家点击任意生物
--- @field PlayerClickProjectile any @当此玩家点击任意投掷物
--- @field PlayerClickDropItem any @当此玩家点击任意掉落物
--- @field PlayerClickEntity any @当此玩家点击任意实体
--- @field PlayerInputKeyClick any @当此玩家点击按键
--- @field PlayerInputKeyDown any @当此玩家按下按键
--- @field PlayerInputKeyUp any @当此玩家抬起按键
--- @field PlayerInputKeyOnPress any @当此玩家长按按键
--- @field PlayerNewInputContent any @此玩家发送聊天信息
--- @field ObjectMotionStateChange any @当此玩家运动状态发生改变
--- @field PlayerAddItem any @当此玩家获得道具
--- @field PlayerUseItem any @当此玩家开始使用道具
--- @field PlayerChargeItemBegin any @当此玩家开始蓄力道具
--- @field PlayerConsumeItem any @当此玩家消耗道具
--- @field PlayerPickUpItem any @当此玩家拾取道具
--- @field PlayerChargeItemEnd any @当此玩家结束蓄力道具
--- @field PlayerShortcutChange any @当此玩家快捷栏的发生改变
--- @field PlayerShortcutAddItem any @当此玩家快捷栏的放入道具
--- @field PlayerShortcutRemItem any @当此玩家快捷栏的取出道具
--- @field PlayerBackPackChange any @当此玩家背包栏的发生改变
--- @field PlayerBackPackAddItem any @当此玩家背包栏的放入道具
--- @field PlayerBackPackRemItem any @当此玩家背包栏的取出道具
--- @field PlayerEquipChange any @当此玩家装备栏的发生改变
--- @field PlayerEquipAddItem any @当此玩家装备栏的放入道具
--- @field PlayerEquipRemItem any @当此玩家装备栏的取出道具
--- @field PlayerEquipOn any @当此玩家穿上装备
--- @field PlayerEquipOff any @当此玩家脱下装备
--- @field PlayerRevive any @此玩家复活
--- @field PlayerMoveOneBlockSize any @此玩家移动
--- @field PlayerInvateFriend any @此玩家邀请好友
--- @field PlayerSelectShortcut any @此玩家选中快捷栏
--- @field BlockAdd any @此类方块被创建
--- @field BlockClicked any @当此类方块被被点击
--- @field BlockRemove any @当此类方块被被破坏
--- @field BlockDigBegin any @当此类方块被被挖掘
--- @field BlockDigEnd any @当此类方块被被挖掘完毕
--- @field BlockDigCancel any @当此类方块被被挖掘中断
--- @field OnInteract any @当此类方块开关状态发生改变
--- @field BlockChangeColor any @当此类方块颜色发生改变
--- @field BlockChangeDir any @当此类方块方向发生改变
--- @field BlockContainerChange any @当储存容器内发生改变
--- @field BlockContainerPutIn any @当储存容器内放入道具
--- @field BlockContainerTakeOut any @当储存容器内取出道具
--- @field ObjectPlayAnim any @当此对象播放动画时
--- @field ObjectCollideByPlayer any @当此角色和任意玩家碰撞开始
--- @field ObjectCollideByMob any @当此角色和任意生物碰撞开始
--- @field ObjectCollideByMissile any @当此角色和任意投掷物碰撞开始
--- @field ObjectCollideByDropItem any @当此角色和任意掉落物碰撞开始
--- @field ObjectCollideByEntity any @当此角色和任意实体碰撞开始
--- @field ObjectCollideByAreaObj any @当此角色和任意区域碰撞开始
--- @field ObjectBeClick any @此角色被玩家点击
--- @field ObjectBeHurt any @当此角色受到伤害
--- @field ObjectDie any @当此角色被击败
--- @field ObjectAttack any @当此角色开始攻击
--- @field ObjectAttackHit any @当此角色攻击命中
--- @field ObjectDefeat any @当此角色击败目标
--- @field ObjectDamage any @当此角色造成伤害
--- @field ObjectAddBuff any @当此角色获得状态
--- @field ObjectRemoveBuff any @当此角色失去状态
--- @field ObjectAttrStateChange any @当此角色权限改变
--- @field ObjectChangeAttr any @当此角色属性改变
--- @field ObjectMountActor any @此角色骑乘
--- @field ObjectDismountActor any @此角色取消骑乘
local ObjectEvent = {}
_G.ObjectEvent = ObjectEvent


--- @class Timer
--- 计时器模块管理接口 Timer
local Timer = {}
_G.Timer = Timer

--- 判断计时器是否存在
--- @param id number @计时器ID
--- @return boolean @是否存在
function Timer:IsExist(id)
    return true
end

--- 添加计时器
--- @param name string @计时器名称
--- @return number @计时器ID
function Timer:CreateTimer(name)
    return 0
end

--- 删除计时器
--- @param timerid number @计时器ID
--- @return boolean @操作是否成功
function Timer:DeleteTimer(timerid)
    return true
end

--- 启动倒计时
--- @param id number @计时器ID
--- @param interval number @开始倒计时时间
--- @param repeated boolean @是否重复
--- @return boolean @操作是否成功
function Timer:StartBackwardTimer(id, interval, repeated)
    return true
end

--- 启动正向计时
--- @param id number @计时器ID
--- @return boolean @操作是否成功
function Timer:StartForwardTimer(id)
    return true
end

--- 暂停计时器
--- @param id number @计时器ID
--- @return boolean @操作是否成功
function Timer:PauseTimer(id)
    return true
end

--- 恢复计时器
--- @param id number @计时器ID
--- @return boolean @操作是否成功
function Timer:ResumeTimer(id)
    return true
end

--- 停止计时器
--- @param id number @计时器ID
--- @return boolean @操作是否成功
function Timer:StopTimer(id)
    return true
end

--- 改变计时器计时
--- @param id number @计时器ID
--- @param curtime number @计时器当前时刻
--- @return boolean @操作是否成功
function Timer:ChangeTimerTime(id, curtime)
    return true
end

--- 获取计时器时间
--- @param id number @计时器ID
--- @return number @当前倒计时时间
function Timer:GetTimerTime(id)
    return 0
end

--- 显示计时器窗口(若其他计时器已经显示，则替换显示)
--- @param playerids table @玩家ID/玩家id数组
--- @param timerid number @计时器ID
--- @param title string @计时器窗口显示的标题
--- @return boolean @操作是否成功
function Timer:ShowTimerWnd(playerids, timerid, title)
    return true
end

--- 隐藏计时器窗口
--- @param playerids table @玩家ID/玩家id数组
--- @param timerid number @计时器ID
--- @return boolean @操作是否成功
function Timer:HideTimerWnd(playerids, timerid)
    return true
end


--- @class Mod
--- 资源模块管理接口 Mod
local Mod = {}
_G.Mod = Mod

--- 通过资源id获取defid
--- @param assetId string @资源id
--- @return number @defid
function Mod:GetCfgIdByAssetId(assetId)
    return 0
end


--- @class WorldContainer
--- 世界容器模块管理接口 WorldContainer
local WorldContainer = {}
_G.WorldContainer = WorldContainer

--- 检测是否是储物箱
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @是否是储物箱
function WorldContainer:CheckStorage(x, y, z)
    return true
end

--- 清空储物箱
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @操作是否成功
function WorldContainer:ClearStorageBox(x, y, z)
    return true
end

--- 检测储物箱空余格子,传入道具ID同时检测已存该道具的格子
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @return boolean @是否有空余格子
function WorldContainer:CheckStorageEmptyGrid(x, y, z, itemid)
    return true
end

--- 设置储物箱道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @仓库格子索引(从1开始)
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @return boolean @操作是否成功
function WorldContainer:SetStorageItem(x, y, z, offset, itemid, num)
    return true
end

--- 获取储物箱道具ID
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @仓库格子索引(从1开始)
--- @return number,number @道具类型ID,道具数量
function WorldContainer:GetStorageItem(x, y, z, offset)
    return 0, 0
end

--- 给储物箱添加道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @return number @成功添加数量
function WorldContainer:AddStorageItem(x, y, z, itemid, num)
    return 0
end

--- 移除储物箱内指定类型的道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @return boolean @操作是否成功
function WorldContainer:RemoveStorageItemByID(x, y, z, itemid, num)
    return true
end

--- 移除储物箱内指定格子的道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @储物箱格子索引(从1开始)
--- @param num number @道具数量
--- @return boolean @操作是否成功
function WorldContainer:RemoveStorageItemByIndex(x, y, z, offset, num)
    return true
end

--- 将一定数量道具添加到储物箱中
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @return number @成功添加数量
function WorldContainer:AddItemToContainer(x, y, z, itemid, num)
    return 0
end

--- 移除储物箱中一定数量道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemid number|string @道具类型ID
--- @param num number @道具数量
--- @return boolean @操作是否成功
function WorldContainer:RemoveContainerItemByID(x, y, z, itemid, num)
    return true
end

--- 清空指定位置的储物箱
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @操作是否成功
function WorldContainer:ClearContainer(x, y, z)
    return true
end

--- 给当前世界的储物箱添加道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param itemids table @道具数组(成员需含有itemId itemNum)
--- @return number @成功添加数量
function WorldContainer:AddWorldStorageItems(x, y, z, itemids)
    return 0
end

--- 获取储物箱内指定格子的道具实例ID
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @仓库格子索引(从1开始)
--- @return string @道具实例ID
function WorldContainer:GetStorageItemInstanceId(x, y, z, offset)
    return ""
end

--- 获取储物箱里所有的道具实例(只取通过接口创建的道具实例)
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return table @道具实例ID数组
function WorldContainer:GetAllStorageItemInstanceIds(x, y, z)
    return {}
end

--- 玩家和指定位置的储物箱或熔炉交换道具
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param grid number @Container格子索引(从1开始)
--- @param uin number @玩家uin
--- @param grid2 number @玩家格子索引
--- @return boolean @操作是否成功
function WorldContainer:SwapContainerItem(x, y, z, grid, uin, grid2)
    return true
end

--- 获取格子属性
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param offset number @格子索引
--- @param attrType number @属性类型
--- @return number @属性值
function WorldContainer:GetGridAttr(x, y, z, offset, attrType)
    return 0
end


--- @class World
--- 世界模块管理接口 World
local World = {}
_G.World = World

--- 停止指定位置的特效
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param particleId number @特效ID
--- @return boolean @操作是否成功
function World:StopParticleOnPos(x, y, z, particleId)
    return true
end

--- 设置指定位置的特效偏移旋转缩放
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param particleIdArg number|table @特效ID或ID数组
--- @param offset table @偏移量(缺省参数)
--- @param rot table @旋转角度(缺省参数)
--- @param scale table @缩放比例
--- @return boolean @操作是否成功
function World:SetParticleTransform(pos, particleIdArg, offset, rot, scale)
    return true
end

--- 在指定位置播放特效
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param particleIdArg number|table @特效ID或ID数组
--- @param ptimeArg number @播放时长(秒)
--- @param scale table @缩放比例(缺省参数)
--- @return boolean @操作是否成功
function World:PlayParticle(pos, particleIdArg, ptimeArg, scale)
    return true
end

--- 生成生物(包括怪物、NPC、动物等)
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param actorid number|string @生物类型ID
--- @param num number @生成数量(默认1)
--- @param trigger boolean @是否触发事件(默认true)
--- @return table @生成的生物对象ID数组
function World:SpawnCreature(x, y, z, actorid, num, trigger)
    return {}
end

--- 移除生物
--- @param creatureId number @生物对象ID
--- @return boolean @操作是否成功
function World:DespawnActor(creatureId)
    return true
end

--- 获取全部玩家数量
--- @param alive number @玩家状态(0阵亡,1存活,-1全体玩家)
--- @return number @玩家数量
function World:GetPlayerTotal(alive)
    return 0
end

--- 获取全部玩家
--- @param alive number @玩家状态(0阵亡,1存活,-1全体玩家)
--- @return table @玩家ID数组
function World:GetAllPlayers(alive)
    return {}
end

--- 获取默认出生点
--- @return number,number,number @x,y,z方块坐标
function World:GetSpawnPoint()
    return 0, 0, 0
end

--- 获取附近合适的生物出生点位置(方块坐标单位)
--- @param centerX number @中心位置x
--- @param centerY number @中心位置y
--- @param centerZ number @中心位置z
--- @param radius number @搜索半径
--- @param includeCenterPos boolean @是否包含中心位置(默认true)
--- @return table @位置坐标表数组
function World:FindCanSpawnMobPosList(centerX, centerY, centerZ, radius, includeCenterPos)
    return {}
end

--- 获取距离某点最近的玩家(方块坐标单位)
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId number @世界ID(默认米拉星)
--- @return number @最近的玩家ID
function World:FindNearestPlayerByPos(x, y, z, worldId)
    return 0
end

--- 在指定位置上播放指定音效
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param soundId number @音效ID
--- @param volume number @音量调节
--- @param pitch number @音调调节
--- @param isLoop boolean @是否循环播放
--- @return boolean @操作是否成功
function World:PlaySoundEffectOnPos(pos, soundId, volume, pitch, isLoop)
    return true
end

--- 停止指定位置上的指定音效
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param soundId number @音效ID
--- @return boolean @操作是否成功
function World:StopSoundEffectOnPos(pos, soundId)
    return true
end

--- 暂停/恢复指定位置上的指定音效
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param soundId number @音效ID
--- @param pause boolean @true暂停/false恢复
--- @return boolean @操作是否成功
function World:PauseSoundEffectOnPos(pos, soundId, pause)
    return true
end

--- 是否是白天
--- @return boolean @是否白天
function World:IsDaytime()
    return true
end

--- 设置游戏当前时间(小时)
--- @param time number @时间(小时)
--- @return boolean @操作是否成功
function World:SetHours(time)
    return true
end

--- 获取游戏当前时间(小时)
--- @return number @当前时间(小时)
function World:GetHours()
    return 0
end

--- 获取游戏当前天数
--- @return number @当前天数
function World:GetDay()
    return 0
end

--- 设置重力
--- @param gravity number @重力值
--- @return boolean @操作是否成功
function World:SetGravity(gravity)
    return true
end

--- 获取重力
--- @return number @重力值
function World:GetGravity()
    return 0
end

--- 获取XZ位置上是否可创建生物并返回对应的Y轴位置
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return number @可创建的Y轴位置(不可创建返回0)
function World:CanMobSpawnOnPosXZ(x, y, z)
    return 0
end

--- 生成投掷物
--- @param uin number @玩家uin
--- @param itemid number|string @道具类型
--- @param srcX number @起点坐标x
--- @param srcY number @起点坐标y
--- @param srcZ number @起点坐标z
--- @param dstX number @目标坐标x
--- @param dstY number @目标坐标y
--- @param dstZ number @目标坐标z
--- @param speed number @速度
--- @return number @投掷物对象ID
function World:SpawnProjectile(uin, itemid, srcX, srcY, srcZ, dstX, dstY, dstZ, speed)
    return 0
end

--- 生成投掷物(通过方向向量)
--- @param uin number @玩家uin
--- @param itemid number|string @道具类型
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dirX number @方向向量x
--- @param dirY number @方向向量y
--- @param dirZ number @方向向量z
--- @param speed number @速度
--- @return number @投掷物对象ID
function World:SpawnProjectileByDir(uin, itemid, x, y, z, dirX, dirY, dirZ, speed)
    return 0
end

--- 获取某个位置的地形类型
--- @param x number @位置坐标x
--- @param z number @位置坐标z
--- @return number @地形类型
function World:GetBiomeType(x, z)
    return 0
end

--- 获取地形类型所属的地形组类型
--- @param x number @位置坐标x
--- @param z number @位置坐标z
--- @return number @地形组类型
function World:GetBiomeGroup(x, z)
    return 0
end

--- 查找地形位置
--- @param centerX number @查找起点x
--- @param centerY number @查找起点y
--- @param centerZ number @查找起点z
--- @param biomeType number @地形类型
--- @param radius number @查找范围半径(单位chunk)
--- @return number,number,number @找到的地形位置x,y,z
function World:FindEcosystem(centerX, centerY, centerZ, biomeType, radius)
    return 0, 0, 0
end

--- 添加地图标记
--- @param uin number @玩家ID
--- @param markId string @标记ID
--- @param params table @标记参数表
--- @return boolean @操作是否成功
function World:PixelMapAddMarker(uin, markId, params)
    return true
end

--- 刷新地图标记
--- @param uin number @玩家ID
--- @param markId string @标记ID
--- @param params table @标记参数表
--- @return boolean @操作是否成功
function World:PixelMapRefreshMarker(uin, markId, params)
    return true
end

--- 删除地图标记
--- @param uin number @玩家ID
--- @param markId string @标记ID
--- @return boolean @操作是否成功
function World:PixelMapDelMarker(uin, markId)
    return true
end

--- 添加地图纹理
--- @param uin number @玩家ID
--- @param textureId string @纹理ID
--- @param params table @纹理参数表
--- @return boolean @操作是否成功
function World:PixelMapAddTexture(uin, textureId, params)
    return true
end

--- 刷新地图纹理
--- @param uin number @玩家ID
--- @param textureId string @纹理ID
--- @param params table @纹理参数表
--- @return boolean @操作是否成功
function World:PixelMapRefreshTexture(uin, textureId, params)
    return true
end

--- 删除地图纹理
--- @param uin number @玩家ID
--- @param textureId string @纹理ID
--- @return boolean @操作是否成功
function World:PixelMapDelTexture(uin, textureId)
    return true
end

--- 设置天空盒颜色参数(带动效)
--- @param uin number @玩家ID
--- @param colorType number @颜色类型
--- @param colorValue string @颜色值
--- @param easingType number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function World:SetSkyBoxColorAnim(uin, colorType, colorValue, easingType, time)
    return true
end

--- 设置天空盒时间流逝速度
--- @param speed number @时间流逝速度
--- @return boolean @操作是否成功
function World:SetTimeVanishingSpeed(speed)
    return true
end

--- 设置天空盒模板
--- @param templateId number @模板ID
--- @return boolean @操作是否成功
function World:SetSkyBoxTemplate(templateId)
    return true
end

--- 设置天空盒贴图
--- @param mapType number @贴图类型
--- @param url string @图片链接
--- @return boolean @操作是否成功
function World:SetSkyBoxMaps(mapType, url)
    return true
end

--- 设置天空盒颜色参数
--- @param timeType number @时间类型
--- @param colorType number @颜色类型
--- @param colorValue string @颜色值
--- @return boolean @操作是否成功
function World:SetSkyBoxColor(timeType, colorType, colorValue)
    return true
end

--- 设置天空盒属性参数
--- @param timeType number @时间类型
--- @param attrType number @属性类型
--- @param value number @属性值
--- @return boolean @操作是否成功
function World:SetSkyBoxAttr(timeType, attrType, value)
    return true
end

--- 设置天空盒滤镜参数
--- @param uin number @玩家ID
--- @param filterType number @滤镜类型
--- @param value number|string @参数值
--- @return boolean @操作是否成功
function World:SetSkyBoxFilter(uin, filterType, value)
    return true
end

--- 天空盒属性开关
--- @param timeType number @时间类型
--- @param switchType number @开关类型
--- @param enable boolean @是否开启
--- @return boolean @操作是否成功
function World:SetSkyBoxSwitch(timeType, switchType, enable)
    return true
end

--- 设置天空盒贴图(带动效)
--- @param uin number @玩家ID
--- @param mapType number @贴图类型
--- @param url string @图片链接
--- @param easingType number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function World:SetSkyBoxMapsAnim(uin, mapType, url, easingType, time)
    return true
end

--- 设置天空盒滤镜参数(带动效)
--- @param uin number @玩家ID
--- @param filterType number @滤镜类型
--- @param value number|string @参数值
--- @param easingType number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function World:SetSkyBoxFilterAnim(uin, filterType, value, easingType, time)
    return true
end

--- 获取对象到某个方向上的射线检测目标
--- @param pos table @对象位置{x=x, y=y, z=z}
--- @param dir table @方向向量{x=x, y=y, z=z}
--- @param maxLen number @最大检测距离
--- @param detectType number @检测类型
--- @return number @检测到的对象ID
function World:GetDirRayDetection(pos, dir, maxLen, detectType)
    return 0
end

--- 计算指定方向射线长度(遇到方块结束)
--- @param srcX number @起点坐标x
--- @param srcY number @起点坐标y
--- @param srcZ number @起点坐标z
--- @param dstX number @终点坐标x
--- @param dstY number @终点坐标y
--- @param dstZ number @终点坐标z
--- @param distance number @最大检测距离
--- @return number @射线长度
function World:GetRayLength(srcX, srcY, srcZ, dstX, dstY, dstZ, distance)
    return 0
end

--- 射线打到的方块类型(遇到方块结束)
--- @param srcX number @起点坐标x
--- @param srcY number @起点坐标y
--- @param srcZ number @起点坐标z
--- @param faceDir number @面方向
--- @param distance number @最大检测距离
--- @return number @方块类型ID
function World:GetRayBlock(srcX, srcY, srcZ, faceDir, distance)
    return 0
end

--- 通过局部坐标方向计算绝对正方向(忽略视角仰角)
--- @param uin number @玩家uin
--- @param vx number @局部坐标x方向
--- @param vy number @局部坐标y方向
--- @param vz number @局部坐标z方向
--- @return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByYawDirection(uin, vx, vy, vz)
    return {}
end

--- 通过局部球坐标方向计算绝对正方向(忽略视角仰角)
--- @param uin number @玩家uin
--- @param yaw number @水平偏移夹角
--- @param pitch number @垂直偏移夹角
--- @return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByYawAngle(uin, yaw, pitch)
    return {}
end

--- 绝对坐标方向
--- @param x number @坐标x
--- @param y number @坐标y
--- @param z number @坐标z
--- @return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByCoord(x, y, z)
    return {}
end

--- 角度坐标方向
--- @param yaw number @水平偏移夹角
--- @param pitch number @垂直偏移夹角
--- @return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByAngle(yaw, pitch)
    return {}
end

--- 随机特效类型,随机返回一种特效ID
--- @return number @随机特效ID
function World:RandomParticleEffectID()
    return 0
end

--- 随机音效ID,随机返回一种音效ID
--- @return number @随机音效ID
function World:RandomSoundID()
    return 0
end

--- 计算两个三维坐标之间的距离
--- @param posSrc table @源坐标{x=x, y=y, z=z}
--- @param posDst table @目标坐标{x=x, y=y, z=z}
--- @return number @两点之间的距离
function World:CalcDistance(posSrc, posDst)
    return 0
end

--- 设置天气组的天气状态
--- @param groupId number @天气组ID
--- @param weatherType number @天气类型
--- @return boolean @操作是否成功
function World:SetGroupWeather(groupId, weatherType)
    return true
end

--- 随机天气
--- @return number @随机天气ID
function World:RandomWeatherID()
    return 0
end

--- 获取天气组天气
--- @param groupId number @天气组ID
--- @return number @天气值
function World:GetGroupWeather(groupId)
    return 0
end

--- 设置出生点
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @操作是否成功
function World:SetSpawnPoint(x, y, z)
    return true
end

--- 位置到位置的单位方向
--- @param pos1 table @位置1{x=x, y=y, z=z}
--- @param pos2 table @位置2{x=x, y=y, z=z}
--- @return table @单位方向向量
function World:CalcDirectionByPos2Pos(pos1, pos2)
    return {}
end

--- 设置世界创建生物规则(设置不保存,退出游戏后失效,只适用迷拉星)
--- @param cfgs table @生物规则配置表
--- @return boolean @操作是否成功
function World:SetWorldCreateMobRule(cfgs)
    return true
end

--- 设置生物生成密度(设置不保存,退出游戏后失效,只适用迷拉星)
--- @param mobType number @生物类型
--- @param density number @生成密度
--- @return boolean @操作是否成功
function World:SetMobSpawnDensity(mobType, density)
    return true
end

--- 设置农作物生长时间要求修正(设置不保存,退出游戏后失效,只适用迷拉星)
--- @param rate number @时间修正系数
--- @return boolean @操作是否成功
function World:SetPlantGrowRate(rate)
    return true
end

--- 设置游戏内的界面是否禁用
--- @param popupType number @弹窗类型
--- @param enable boolean @是否启用
--- @return boolean @操作是否成功
function World:SetInnerViewEnable(popupType, enable)
    return true
end

--- 设置是否可中途加入
--- @param enable boolean @是否开启中途加入
--- @return boolean @操作是否成功
function World:SetMidJoin(enable)
    return true
end

--- 获取游戏模式
--- @return number @游戏模式
function World:GetGameMode()
    return 0
end

--- 获取XZ位置上是否加载了区块
--- @param x number @位置坐标x
--- @param z number @位置坐标z
--- @param worldId number @世界ID
--- @return boolean @是否加载了区块
function World:IsChunkLoaded(x, z, worldId)
    return true
end

--- 增加重力
--- @param value number @重力值
--- @return boolean @操作是否成功
function World:AddGravity(value)
    return true
end

--- 转换时间戳为时间单位
--- @param number number @时间戳
--- @param enum number @时间单位枚举 (EventDate)
--- @return number @转换后的时间
function World:GetDateFromTime(number, enum)
    return 0
end

--- 回调设置kv数据
--- @param varId string @排行榜/排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（数值key会转换成字符串）
--- @param value string|number|boolean @具体值
--- @param callback function @回调函数
--- @return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:SetValueAndCallBack(varId, playerId, key, value, callback)
    return true
end

--- 阻塞设置kv数据
--- @param varId string @排行榜/排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（数值key会转换成字符串）
--- @param value string|number|boolean @具体值
--- @param call_back function @内部回调(缺省参数)
--- @return number,string,string|number|boolean @错误码,键值,具体值
function Data.Map:SetValueAndBlock(varId, playerId, key, value, call_back)
    return 0, "", ""
end

--- 回调删除指定key的数据
--- @param varId string @排行榜/排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（数值会转换成字符串）
--- @param callback function @回调函数
--- @return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:RemoveValueAndCallBack(varId, playerId, key, callback)
    return true
end

--- 阻塞删除指定key的数据
--- @param varId string @排行榜/排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（小数会向下取整，科学计数法会返回失败）
--- @param call_back function @内部回调(缺省参数)
--- @return number,string @错误码,键值
function Data.Map:RemoveValueAndBlock(varId, playerId, key, call_back)
    return 0, ""
end

--- 更新指定key的数据
--- @param varId string @kv表变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（数值会转换成字符串）
--- @param value string|number|boolean @具体值
--- @return boolean @是否成功(全局云KV变量可用)
function Data.Map:UpdateValueAndCallback(varId, playerId, key, value)
    return true
end

--- 回调获取kv数据
--- @param varId string @kv/排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（数值会转换成字符串）
--- @param callback function @回调函数
--- @return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:GetValueAndCallBack(varId, playerId, key, callback)
    return true
end

--- 阻塞获取kv数据
--- @param varId string @kv/排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（数值会转换成字符串）
--- @return number,string,string|number|boolean @错误码,键值,具体值
function Data.Map:GetValueAndBlock(varId, playerId, key)
    return 0, "", ""
end

--- 获取排行榜指定排名索引的值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param index number @排名索引
--- @param ascending boolean @是否升序
--- @param callback function @回调函数
--- @return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:GetIndexValueAndCallback(varId, playerId, index, ascending, callback)
    return true
end

--- 获取排行榜指定排名索引的值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param index number @排名索引
--- @param ascending boolean @是否升序
--- @return number,string,any,number,boolean @错误码,键值,具体值,排名索引,是否升序
function Data.Map:GetIndexValueAndBlock(varId, playerId, index, ascending)
    return 0, "", nil, 0, true
end

--- 获取排行榜指定前num个值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param num number @数量
--- @param ascending boolean @是否升序
--- @param callback function @回调函数
--- @return boolean @是否调用成功
function Data.Map:GetNumValuesAndCallback(varId, playerId, num, ascending, callback)
    return true
end

--- 获取排行榜值为min~max区间的所有值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param min number @最小值
--- @param max number @最大值
--- @param ascending boolean @是否升序
--- @param pagesize number @单次返回数量
--- @param callback function @回调函数
--- @return boolean @是否调用成功
function Data.Map:GetRangeValuesAndCallback(varId, playerId, min, max, ascending, pagesize, callback)
    return true
end

--- 阻塞设置排行榜的值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（小数会向下取整，科学计数法会返回失败）
--- @param value number @数值
--- @param extendvalue string|number|boolean @附带信息（附带信息只会更新不会删除）
--- @param call_back function @内部回调(缺省参数)
--- @return number,string,number @错误码,键值,数值
function Data.Map:SetRankValueAndBlock(varId, playerId, key, value, extendvalue, call_back)
    return 0, "", 0
end

--- 清空kv表/排行榜
--- @param varId string @表ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @return boolean @是否成功
function Data.Map:ClearData(varId, playerId)
    return true
end

--- 阻塞增加排行榜的值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（小数会向下取整，科学计数法会返回失败）
--- @param value number @数值
--- @param extendvalue string|number|boolean @附带信息（附带信息只会更新不会删除）
--- @param call_back function @内部回调(缺省参数)
--- @return number,string,number @错误码,键值,数值
function Data.Map:IncreasesRankValueAndBlock(varId, playerId, key, value, extendvalue, call_back)
    return 0, "", 0
end

--- 回调增加排行榜的值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param key string @键值（小数会向下取整，科学计数法会返回失败）
--- @param value number @数值
--- @param extendvalue string|number|boolean @附带信息（附带信息只会更新不会删除）
--- @param call_back function @内部回调(缺省参数)
--- @return number,string,number @错误码,键值,数值
function Data.Map:IncreasesRankValueAndCallback(varId, playerId, key, value, extendvalue, call_back)
    return 0, "", 0
end

--- 获取排行榜排名为min~max区间的所有值
--- @param varId string @排行榜变量ID
--- @param playerId number @玩家uin(全局变量传nil)
--- @param min number @最小排名
--- @param max number @最大排名
--- @param ascending boolean @是否升序
--- @param pagesize number @单次返回数量
--- @param callback function @回调函数
--- @return boolean @是否调用成功
function Data.Map:GetRangeIndexsAndCallback(varId, playerId, min, max, ascending, pagesize, callback)
    return true
end


--- @class Block
--- 方块模块管理接口 Block
local Block = {}
_G.Block = Block

--- 是否为固体方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return boolean @是否为固体方块
function Block:IsSolidBlock(x, y, z)
    return true
end

--- 是否是液体方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return boolean @是否为液体方块
function Block:IsLiquidBlock(x, y, z)
    return true
end

--- 是否是空气方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return boolean @是否为空气方块
function Block:IsAirBlock(x, y, z)
    return true
end

--- 获取指定位置的方块类型
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return number @方块类型ID
function Block:GetBlockID(x, y, z)
    return 0
end

--- 设置位置方块数据
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param blockid number @方块ID
--- @param data number @方块朝向等数据
--- @return boolean @操作是否成功
function Block:SetBlockAll(x, y, z, blockid, data)
    return true
end

--- 摧毁方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dropItem boolean @是否掉落物品(缺省参数)
--- @return boolean @操作是否成功
function Block:DestroyBlock(x, y, z, dropItem)
    return true
end

--- 放置方块
--- @param blockid number @方块ID
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dir number @方块方向
--- @param color number @十六进制颜色值(0XFFFFFF 颜色方块类型才生效)
--- @return boolean @操作是否成功
function Block:PlaceBlock(blockid, x, y, z, dir, color)
    return true
end

--- 替换方块
--- @param blockid number @新方块ID
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param color number @十六进制颜色值(0XFFFFFF 颜色方块类型才生效)
--- @return boolean @操作是否成功
function Block:ReplaceBlock(blockid, x, y, z, color)
    return true
end

--- 设置blockalldata 更新当前位置方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param data number @方块数据
--- @return boolean @操作是否成功
function Block:SetBlockData(x, y, z, data)
    return true
end

--- 获取方块数据
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return number @方块数据值
function Block:GetBlockData(x, y, z)
    return 0
end

--- 获取方块朝向
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return number @方块朝向
function Block:GetBlockDir(x, y, z)
    return 0
end

--- 播放方块动作
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param animid number|string @动作id
--- @param speed number @播放速度
--- @param animmode number @动画模式
--- @return boolean @操作是否成功
function Block:PlayAnim(pos, animid, speed, animmode)
    return true
end

--- 设置方块设置属性状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param attrtype number @方块属性类型
--- @param switch boolean @是否开关
--- @return boolean @操作是否成功
function Block:SetBlockSettingAttState(x, y, z, attrtype, switch)
    return true
end

--- 获取方块设置属性状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param attrtype number @方块属性类型
--- @return boolean @是否开启
function Block:GetBlockSettingAttState(x, y, z, attrtype)
    return true
end

--- 获取功能方块的开关状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return boolean @是否开启
function Block:GetBlockSwitchStatus(x, y, z)
    return true
end

--- 获取方块的通电状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return boolean @是否开启
function Block:GetBlockPowerStatus(x, y, z)
    return true
end

--- 在资源库里随机获取一个方块
--- @return number @随机的方块类型ID
function Block:RandomBlockID()
    return 0
end

--- 获取方块名称
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return string @方块名称
function Block:GetBlockDefName(x, y, z)
    return ""
end

--- 获取方块描述
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @return string @方块描述
function Block:GetBlockDefDesc(x, y, z)
    return ""
end

--- 放置蓝图
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param blueprintid string @蓝图ID
--- @param angle number @旋转角度
--- @param mirror boolean @是否镜像
--- @param placeMode boolean @是否蓝图区域全部覆盖
--- @return boolean @操作是否成功
function Block:ReplaceBluePrint(x, y, z, blueprintid, angle, mirror, placeMode)
    return true
end

--- 播放方块裂纹特效
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param process number @裂纹进度
--- @return boolean @操作是否成功
function Block:PlayCrackEffect(x, y, z, process)
    return true
end

--- 播放方块损毁特效
--- @param x number @方块位置的X坐标
--- @param y number @方块位置的Y坐标
--- @param z number @方块位置的Z坐标
--- @return boolean @操作是否成功
function Block:PlayDestroyEffect(x, y, z)
    return true
end

--- 获取方块掉落物信息
--- @param blockid number @方块ID
--- @param itype number @类型(1手持敲方块,2手持道具正确,3手持道具不正确)
--- @return table @返回掉落道具信息{itemid, itemnum, odds} 道具ID,数量,概率
function Block:GetBlockDropItemType(blockid, itype)
    return {}
end

--- 获取方块的采集经验
--- @param blockid number @方块ID
--- @param itype number @采集类型
--- @return number @经验值
function Block:GetBlockDropExp(blockid, itype)
    return 0
end

--- 设置方块颜色
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param color number @颜色值
--- @return boolean @操作是否成功
function Block:SetBlockColor(x, y, z, color)
    return true
end

--- 设置方块开关状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param state boolean @开关状态
--- @return boolean @操作是否成功
function Block:SetBlockSwichState(x, y, z, state)
    return true
end

--- 设置方块方向
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dir number @方块方向
--- @return boolean @操作是否成功
function Block:SetBlockDir(x, y, z, dir)
    return true
end

--- 获取方块类型外观
--- @param blockid number|string @方块类型ID或方块预制ID
--- @return string @方块类型外观
function Block:GetFacade(blockid)
    return ""
end

--- 设置方块纹理颜色
--- @param blockid number @方块ID
--- @param color number @颜色值(0:还原默认颜色)
--- @param alpha number @混合比例(0-100)
--- @param slotindex number @材质槽索引(默认1)
--- @return boolean @操作是否成功
function Block:SetBlockTextureColor(blockid, color, alpha, slotindex)
    return true
end


--- @class GameObject
--- 对象模块管理接口 - GameObject
local GameObject = {}
_G.GameObject = GameObject

--- 根据ID查找游戏对象
--- @return string|nil @返回查找的方块对象，如果没有找到则返回nil
--- @param id number|string @游戏对象的唯一标识
function GameObject:FindObject(id)
    return ""
end

--- 获取当前游戏UI对象
--- @return string|nil @返回查找的UI对象，如果没有找到则返回nil
--- @param id number|string @游戏对象的唯一标识
function GameObject:FindUIObject(id)
    return ""
end

--- 注意: 方块对象接口只能查找到 **编辑过的方块** 或 **自定义的方块**
--- 
--- 注意: 场景中 **至少有一个** 方块才能获取到!
--- 
--- 获取当前游戏方块类别对象
--- @return string|nil @返回查找的方块类别对象，如果没有找到则返回nil
--- @param id number|string @游戏对象的唯一标识
function GameObject:FindBlockObject(id)
    return ""
end

--- 创建预制实例
--- @param prefabId string @预制体ID
--- @param worldId number @星球ID(默认为当前主机所在星球)
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param trigger boolean @是否触发事件
--- @return string|nil @返回创建的预制实例，如果创建失败则返回nil
function GameObject:CreatePrefabInst(prefabId, worldId, x, y, z, trigger)
    return ""
end

--- 创建对象
--- 
--- 如果需要objId，则需要用GetId()获取
--- @param objectType number @对象类型枚举(ObjType)
--- @param prefabId number|string @类型ID|预制体ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param num number @数量
--- @param trigger? boolean @是否触发事件(可缺省)
--- @param worldId number @星球ID(默认为当前主机所在星球)
--- @return table|nil @返回创建对象的列表(Table), 如果创建失败则返回nil
function GameObject:CreatePrefab(objectType, prefabId, x, y, z, num, trigger, worldId)
    return {}
end

--- 删除对象
--- 
--- (玩家，方块，世界，UI 对象 **不能** 删除)
--- @param objId string @对象ID
--- @return boolean @返回true表示成功删除，false表示失败
function GameObject:Destroy(objId)
    return true
end

--- 获取对象的预制ID
--- @param objId string @对象ID (掉落物，投掷物，生物 **可用**)
--- @return number|string|nil @返回预制ID(number/string)，如果没有找到则返回nil
--- @return number @对象类型枚举(bjType)
function GetObjectPrefab(objId)
    return "" or 0, 0
end


--- @class Actor
--- 角色模块管理接口 Actor
local Actor = {}
_G.Actor = Actor

--- 获取掉落物的类型ID
--- @param objId number @对象ID
--- @return number @掉落物类型ID
function Actor:GetItemId(objId)
    return 0
end

--- 获取掉落物品数量
--- @param objId number @对象ID
--- @return number @掉落物品数量
function Actor:GetDropItemNum(objId)
    return 0
end

--- 设置角色队伍
--- @param objid number @对象ID
--- @param teamType number @队伍类型
--- @param bResetAttr boolean @是否重置属性(玩家有效，默认false)
--- @return boolean @成功状态
function Actor:SetTeam(objid, teamType, bResetAttr)
    return true
end

--- 获取角色队伍
--- @param objid number @对象ID
--- @return number @队伍类型
function Actor:GetTeam(objid)
    return 0
end

--- 增加角色当前生命量
--- @param objid number @对象ID
--- @param hp number @血量值(hp>0增加血量，hp<0减少血量)
--- @return boolean @成功状态
function Actor:AddHp(objid, hp)
    return true
end

--- 获取最大血量(包括加成)
--- @param objid number @对象ID
--- @return number @最大生命值
function Actor:GetMaxHP(objid)
    return 0
end

--- 设置对象昵称是否显示
--- @param objid number @对象ID
--- @param bshow boolean @是否显示
--- @return boolean @成功状态
function Actor:ShowNickName(objid, bshow)
    return true
end

--- 设置角色昵称
--- @param objid number @对象ID
--- @param nickname string @昵称
--- @return boolean @成功状态
function Actor:SetNickName(objid, nickname)
    return true
end

--- 获取角色昵称
--- @param objid number @对象ID
--- @return string @角色昵称
function Actor:GetNickName(objid)
    return ""
end

--- 获取角色所在的mapid
--- @param objId number @对象ID
--- @return number @地图ID
function Actor:GetCurMapId(objId)
    return 0
end

--- 检查对象是否为玩家
--- @param objId number @对象ID
--- @return boolean @是否为玩家
function Actor:IsPlayer(objId)
    return false
end

--- 在指定角色身上播放音效
--- @param objid number @对象ID
--- @param soundId number @音效ID
--- @param volume number @音量
--- @param pitch number @音调
--- @param isLoop boolean @是否循环播放
--- @return boolean @成功状态
function Actor:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop)
    return true
end

--- 停止指定对象身上的音效
--- @param objid number @对象ID
--- @param soundId number @音效ID
--- @return boolean @成功状态
function Actor:StopSoundEffectById(objid, soundId)
    return true
end

--- 暂停/恢复指定对象身上的音效
--- @param objid number @对象ID
--- @param soundId number @音效ID
--- @param pause boolean @true暂停/false恢复
--- @return boolean @成功状态
function Actor:PauseSoundEffectById(objid, soundId, pause)
    return true
end

--- 使生物朝向目标生物
--- @param objid number @对象ID
--- @param targetid number @目标对象ID
--- @return boolean @成功状态
function Actor:RotateFaceToActor(objid, targetid)
    return true
end

--- 获取对象的当前移动速度
--- @param objId number @对象ID
--- @return number, number, number @x,y,z方向速度
function Actor:GetMotion(objId)
    return 0, 0, 0
end

--- 对象是否存在
--- @param objId number @对象ID
--- @return boolean @是否存在
function Actor:HasActor(objId)
    return false
end

--- 设置目标仇恨目标
--- @param objId number @对象ID
--- @param targetId number @目标对象ID
--- @return boolean @成功状态
function Actor:SetBeHurtTarget(objId, targetId)
    return true
end

--- 获取角色外观(需要确保对象在场景中存在)
--- @param objid number @对象ID
--- @return string @对象外观
function Actor:GetActorFacade(objid)
    return ""
end

--- 比较两个主模型外观是否相等
--- @param facade1 string @外观类型1
--- @param facade2 string @外观类型2
--- @return boolean @是否相等
function Actor:CompareMainModel(facade1, facade2)
    return false
end

--- 在指定对象身上播放粒子特效
--- @param objid number @对象ID
--- @param particleId number|table @粒子特效ID或ID列表
--- @param time number @时长(秒)
--- @param offset table @偏移位置
--- @param rotation table @旋转角度
--- @param scale table @缩放比例
--- @return boolean @成功状态
function Actor:PlayBodyParticleById(objid, particleId, time, offset, rotation, scale)
    return true
end

--- 停止指定对象身上的粒子特效
--- @param objid number @对象ID
--- @param particleId number @粒子特效ID
--- @return boolean @成功状态
function Actor:StopBodyEffectById(objid, particleId)
    return true
end

--- 设置指定对象身上的特效大小
--- @param objid number @对象ID
--- @param particleId number @粒子特效ID
--- @param offset table @偏移位置
--- @param rotation table @旋转角度
--- @param scale table @缩放比例
--- @return boolean @成功状态
function Actor:SetBodyParticleTransform(objid, particleId, offset, rotation, scale)
    return true
end

--- 使玩家/生物跳跃一次
--- @param objId number @对象ID
--- @return boolean @成功状态
function Actor:Jump(objId)
    return true
end

--- 获取骑乘生物的objid
--- @param objid number @对象ID
--- @return number @骑乘对象ID
function Actor:GetRidingActorObjId(objid)
    return 0
end

--- 获取actor朝向
--- @param objId number @对象ID
--- @return table @轴向上的方向
function Actor:GetFaceDirection(objId)
    return {}
end

--- 使对象向目标行动者移动
--- @param objid number @执行动作的对象id
--- @param targetid number @目标对象id
--- @param speed number @移动速度
--- @return boolean @成功状态
function Actor:TryMoveToActor(objid, targetid, speed)
    return true
end

--- 设置对象朝向
--- @param objId number @对象ID
--- @param x number @x方向
--- @param y number @y方向
--- @param z number @z方向
--- @return boolean @成功状态
function Actor:SetFaceDirection(objId, x, y, z)
    return true
end

--- 击败对象
--- @param objId number @对象ID
--- @return boolean @成功状态
function Actor:KillSelf(objId)
    return true
end

--- 设置角色属性
--- @param objId number @对象ID
--- @param attrType number @属性类型
--- @param val number @属性值
--- @return boolean @成功状态
function Actor:SetAttr(objId, attrType, val)
    return true
end

--- 增加角色属性值
--- @param objid number @对象ID
--- @param atttype number @属性类型
--- @param val number @增加值
--- @return boolean @成功状态
function Actor:IncreasesAttr(objid, atttype, val)
    return true
end

--- 获取角色属性值
--- @param objId number @对象ID
--- @param attrType number @属性类型
--- @return number @属性值
function Actor:GetAttr(objId, attrType)
    return 0
end

--- 设置对象权限
--- @param objId number @对象ID
--- @param abilityType number @权限类型
--- @param switch boolean @是否开启
--- @return boolean @成功状态
function Actor:SetActorPermissions(objId, abilityType, switch)
    return true
end

--- 获取对象权限
--- @param objId number @对象ID
--- @param abilityType number @权限类型
--- @return boolean @权限状态
function Actor:GetActorPermissions(objId, abilityType)
    return false
end

--- 设置对象面向角度
--- @param objId number @对象ID
--- @param yaw number @面朝角度
--- @return boolean @成功状态
function Actor:SetFaceYaw(objId, yaw)
    return true
end

--- 获取actor视角偏移角度
--- @param objId number @对象ID
--- @return number @面朝角度
function Actor:GetFaceYaw(objId)
    return 0
end

--- 设置actor视角仰望角度
--- @param objid number @对象ID
--- @param pitch number @面仰角度
--- @return boolean @成功状态
function Actor:SetFacePitch(objid, pitch)
    return true
end

--- 获取actor视角仰望角度
--- @param objid number @对象ID
--- @return number @仰望角度
function Actor:GetFacePitch(objid)
    return 0
end

--- 设置角色位置
--- @param objId number @对象ID
--- @param x number @目标X坐标
--- @param y number @目标Y坐标
--- @param z number @目标Z坐标
--- @return boolean @成功状态
function Actor:SetPosition(objId, x, y, z)
    return true
end

--- 获取对象位置
--- @param objId number @对象ID
--- @return number, number, number @x,y,z坐标
function Actor:GetPosition(objId)
    return 0, 0, 0
end

--- 改变对象外观
--- @param objid number @对象ID
--- @param modleName string @对象外观描述
--- @return boolean @成功状态
function Actor:ChangeCustomModel(objid, modleName)
    return true
end

--- 恢复对象外观
--- @param objid number @对象ID
--- @return boolean @成功状态
function Actor:RecoverinitialModel(objid)
    return true
end

--- 使对象A对对象B造成伤害
--- @param attackerId number @攻击者对象ID
--- @param targetId number @目标对象ID
--- @param damage number @伤害值
--- @param hurtType number @伤害类型
--- @param ignoreResist boolean @忽略伤害抵抗
--- @param ignoreTriggerEvent boolean @忽略触发伤害事件
--- @return boolean @成功状态
function Actor:ActorHurt(attackerId, targetId, damage, hurtType, ignoreResist, ignoreTriggerEvent)
    return true
end

--- 设置免疫伤害类型
--- @param objId number @对象ID
--- @param hurtType number @伤害类型
--- @param enable boolean @是否开启
--- @return boolean @成功状态
function Actor:SetImmuneType(objId, hurtType, enable)
    return true
end

--- 改变玩家移动方式
--- @param objid number @对象ID
--- @param moveType number @移动类型
--- @return boolean @成功状态
function Actor:ChangActorMoveType(objid, moveType)
    return true
end

--- 取角色的移动模式
--- @param objid number @对象ID
--- @return number @移动模式
function Actor:GetActorMovementMode(objid)
    return 0
end

--- 获取模型大小值
--- @param objId number @对象ID
--- @return table @模型大小
function Actor:GetBoundSzie(objId)
    return {}
end

--- 随机一个外观获取其id字符串
--- @return string @随机外观ID
function Actor:RandomFacadeID()
    return ""
end

--- 判断对象是否是玩家/生物
--- @param objId number @对象ID
--- @return number @对象类型
function Actor:GetObjType(objId)
    return 0
end

--- 尝试移动到某个位置走寻路(方块坐标)
--- @param objId number @对象ID
--- @param x number @目标X坐标
--- @param y number @目标Y坐标
--- @param z number @目标Z坐标
--- @param cancontrol boolean @是否能控制
--- @param bshowtip boolean @是否显示提示
--- @return boolean @成功状态
function Actor:TryMoveToPos(objId, x, y, z, cancontrol, bshowtip)
    return true
end

--- 给对象附加一个速度
--- @param objId number @对象ID
--- @param x number @x轴速度
--- @param y number @y轴速度
--- @param z number @z轴速度
--- @return boolean @成功状态
function Actor:AppendSpeed(objId, x, y, z)
    return true
end

--- 寻找对象附近某个类型方块的最近位置
--- @param objid number @对象ID
--- @param blockid number @查找的方块类型
--- @param blockRange number @查找范围(格子数)
--- @return number, number, number @x,y,z方块坐标
function Actor:FindNearestBlock(objid, blockid, blockRange)
    return 0, 0, 0
end

--- 获取角色高度
--- @param objId number @对象ID
--- @return number @角色高度
function Actor:GetEyeHeight(objId)
    return 0
end

--- 清除生物ID为actorid的生物
--- @param actorid number @生物类型ID
--- @param bkill boolean @是否杀死生物(默认false)
--- @return boolean @成功状态
function Actor:ClearActorWithId(actorid, bkill)
    return true
end

--- 对象是否存在
--- @param objId number @对象ID
--- @return boolean @是否存在
function Actor:IsExist(objId)
    return false
end

--- 对象播放动作
--- @param objId number @对象ID
--- @param animid number|string @动作id
--- @param speed number @播放速度
--- @param animMode number @动画模式
--- @return boolean @成功状态
function Actor:PlayAnim(objId, animid, speed, animMode)
    return true
end

--- 对象手持播放动作
--- @param objId number @对象ID
--- @param animid number|string @动作id
--- @param speed number @播放速度
--- @param loop boolean|number @是否循环或循环模式
--- @return boolean @成功状态
function Actor:PlayHandAnim(objId, animid, speed, loop)
    return true
end

--- 角色骑乘
--- @param riderId number @骑乘者ID
--- @param mountId number @被骑乘者ID
--- @param isContrl boolean @是否控制
--- @param isCloseAI boolean @是否关闭AI
--- @return boolean @成功状态
function Actor:MountActor(riderId, mountId, isContrl, isCloseAI)
    return true
end

--- 角色取消骑乘
--- @param objid number @对象ID
--- @return boolean @成功状态
function Actor:DisMountActor(objid)
    return true
end

--- 对象抓举对象
--- @param grabberId number @抓举者ID
--- @param targetId number @目标对象ID
--- @return boolean @成功状态
function Actor:PickupActor(grabberId, targetId)
    return true
end

--- 尝试抓取前方指定距离的对象
--- @param objid number @对象ID
--- @param distance number @距离
--- @return boolean @成功状态
function Actor:TryPickupActorForward(objid, distance)
    return true
end

--- 尝试投掷角色
--- @param throwerId number @投掷者ID
--- @param dir table @投掷方向
--- @param useDir boolean @是否使用方向
--- @param speed number @投掷速度
--- @param useGravity boolean @是否使用重力
--- @return boolean @成功状态
function Actor:DropActor(throwerId, dir, useDir, speed, useGravity)
    return true
end

--- 尝试逃脱抓举
--- @param objid number @被抓举的对象objid
--- @return boolean @成功状态
function Actor:EscapePickup(objid)
    return true
end

--- 设置行为树变量
--- @param objid number @生物对象objid
--- @param varid string @变量id
--- @param val any @变量值(数字/字符/boolean)
--- @return boolean @成功状态
function Actor:SetBtreeVarValue(objid, varid, val)
    return true
end

--- 获取行为树变量
--- @param objid number @生物对象objid
--- @param varid string @变量id
--- @return any @变量值
function Actor:GetBtreeVarValue(objid, varid)
    return nil
end

--- 根据掉落物objid获取道具实例id
--- @param objid number @掉落物对象ID
--- @return string @道具实例id
function Actor:GetDropItemInstanceId(objid)
    return ""
end

--- 设置掉落物是否可以拾取
--- @param objId number @对象ID
--- @param able boolean @是否可以拾取
--- @return boolean @成功状态
function Actor:SetAblePick(objId, able)
    return true
end

--- 获取实体类型外观
--- @param entityId string @实体类型ID
--- @return string @外观描述
function Actor:GetEntityFacade(entityId)
    return ""
end

--- 角色拾取地上的掉落物或者投掷物
--- @param objid number @角色ID
--- @param itemobjid number @掉落物或投掷物objid
--- @return number @拾取数量
function Actor:PickupItem(objid, itemobjid)
    return 0
end

--- 获取角色举起的角色objid
--- @param objid number @对象ID
--- @return number @举起的角色objid
function Actor:GetPickupObjID(objid)
    return 0
end

--- 获取指定角色当前所在的星球ID
--- @param objId number @对象ID
--- @return number @星球ID (失败返回 -1)
function Actor:GetObjWorldId(objId)
    return 0
end

--- 检测指定对象ID是否为玩家对象
--- @param objId number @对象ID
--- @return boolean @是否为玩家对象
function Actor:IsPlayer(objId)
    return true
end


--- @class Player
--- 玩家模块管理接口 Player
local Player = {}
_G.Player = Player

--- 获取房主uin
--- @return number @房主uin
function Player:GetHostUin()
    return 0
end

--- 设置玩家是否胜利
--- @param uin number @玩家uin
--- @param result number @胜利结果
--- @return boolean @操作是否成功
function Player:SetGameResults(uin, result)
    return true
end

--- 设置玩家胜利
--- @param uin number @玩家uin
--- @return boolean @操作是否成功
function Player:SetGameWin(uin)
    return true
end

--- 获取玩家手持道具
--- @param uin number @玩家uin
--- @return number,string @道具ID
function Player:GetCurToolID(uin)
    return 0, ""
end

--- 获取玩家当前选中快捷栏索引
--- @param uin number @玩家uin
--- @return number @索引值(1~8)
function Player:GetShotcutIndex(uin)
    return 0
end

--- 设置玩家当前选中快捷栏索引
--- @param uin number @玩家uin
--- @param index number @快捷栏索引(1~8)
--- @return boolean @操作是否成功
function Player:SetShotcutIndex(uin, index)
    return true
end

--- 设置道具技能时间
--- @param uin number @玩家uin
--- @param itemid number|string @道具类型
--- @param cd number @冷却时间
--- @return boolean @操作是否成功
function Player:SetSkillCD(uin, itemid, cd)
    return true
end

--- 玩家在指定位置复活
--- @param uin number @玩家uin
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @操作是否成功
function Player:ReviveToPos(uin, x, y, z)
    return true
end

--- 设置玩家复活点
--- @param uin number @玩家uin
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @操作是否成功
function Player:SetRevivePoint(uin, x, y, z)
    return true
end

--- 使玩家显示飘窗文字
--- @param uin number @玩家uin
--- @param info string @文本内容
--- @return boolean @操作是否成功
function Player:NotifyGameInfo2Self(uin, info)
    return true
end

--- 玩家旋转摄像机角度
--- @param uin number @玩家uin
--- @param yaw number @视角偏移旋转角度
--- @param pitch number @视角仰望旋转角度
--- @param issmooth boolean @是否平滑
--- @param iscorrectyaw boolean @是否修正
--- @param deltayaw number @视角偏移平滑变化量
--- @param deltapitch number @视角仰望变化量
--- @return boolean @操作是否成功
function Player:RotateCamera(uin, yaw, pitch, issmooth, iscorrectyaw, deltayaw, deltapitch)
    return true
end

--- 抖动玩家镜头
--- @param uin number @玩家uin
--- @param power number @强度(取值范围1-1000)
--- @param time number @持续时间
--- @return boolean @操作是否成功
function Player:ShakeCamera(uin, power, time)
    return true
end

--- 停止抖动玩家镜头
--- @param uin number @玩家uin
--- @return boolean @操作是否成功
function Player:StopShakeCamera(uin)
    return true
end

--- 玩家旋转摄像机角度朝向actor
--- @param uin number @玩家uin
--- @param objId number @对象ID
--- @return boolean @操作是否成功
function Player:RotateCameraToActor(uin, objId)
    return true
end

--- 玩家改变视角
--- @param uin number @玩家uin
--- @param viewporttype number @视角类型
--- @param islock boolean @是否锁定
--- @return boolean @操作是否成功
function Player:ChangeViewMode(uin, viewporttype, islock)
    return true
end

--- 玩家是否装备了某件装备
--- @param uin number @玩家uin
--- @param itemid number|string @道具类型
--- @return boolean @是否装备
function Player:IsEquipByResID(uin, itemid)
    return true
end

--- 获取玩家准心位置
--- @param uin number @玩家uin
--- @return number,number,number @x,y,z坐标
function Player:GetAimPos(uin)
    return 0, 0, 0
end

--- 获取玩家准心方向
--- @param objId number @对象ID
--- @return table @单位方向向量
function Player:GetAimDir(objId)
    return {}
end

--- 获取玩家射线检测起点位置
--- @param objId number @对象ID
--- @return number,number,number @x,y,z方块坐标
function Player:GetRayOriginPos(objId)
    return 0, 0, 0
end

--- 对玩家播放背景音乐2D
--- @param uin number @玩家uin
--- @param musicid number @音乐ID
--- @param volume number @声音大小
--- @param pitch number @声音音调
--- @param isLoop boolean @是否循环
--- @return boolean @操作是否成功
function Player:PlayMusic(uin, musicid, volume, pitch, isLoop)
    return true
end

--- 玩家停止播放背景音乐2D
--- @param uin number @玩家uin
--- @param musicid number @音乐ID
--- @return boolean @操作是否成功
function Player:StopMusic(uin, musicid)
    return true
end

--- 玩家暂停/恢复播放背景音乐
--- @param uin number @玩家uin
--- @param musicid number @音乐ID
--- @param pause boolean @true暂停/false恢复
--- @return boolean @操作是否成功
function Player:PauseMusic(uin, musicid, pause)
    return true
end

--- 打开一个UI界面
--- @param uin number @玩家uin
--- @param viewid string @界面ID
--- @param effectid number @动作ID(缺省参数)
--- @param time number @动画事件(缺省参数)
--- @return boolean @操作是否成功
function Player:OpenUIView(uin, viewid, effectid, time)
    return true
end

--- 隐藏一个UI界面
--- @param uin number @玩家uin
--- @param viewid string @界面ID
--- @param effectid number @动作ID(缺省参数)
--- @param time number @动画事件(缺省参数)
--- @return boolean @操作是否成功
function Player:HideUIView(uin, viewid, effectid, time)
    return true
end

--- 获取客机类型
--- @param uin number @玩家uin
--- @return any @客机类型信息
function Player:GetClientInfo(uin)
    return nil
end

--- 获取玩家昵称
--- @param objId number @对象ID
--- @return string @玩家昵称
function Player:GetNickname(objId)
    return ""
end

--- 打开开发者商店商品购买弹框(开发者账号和自定义按钮点击事件可用)
--- @param objId number @对象ID
--- @param devGoodsId string @开发者商品ID
--- @param customDesc string @自定义商品描述
--- @return number @操作结果代码
function Player:OpenDevGoodsBuyDialog(objId, devGoodsId, customDesc)
    return 0
end

--- 打开开发者商店商品详情页
--- @param objId number @对象ID
--- @param devGoodsId string @开发者商品ID
--- @return number @操作结果代码
function Player:OpenDevGoodsBuyDetailedDialog(objId, devGoodsId)
    return 0
end

--- 玩家打开开发者商店(仅开发者可用)
--- @param objId number @对象ID
--- @return any @操作结果
function Player:OpenDevStore(objId)
    return nil
end

--- 打开开发者商品二级分类
--- @param objId number @对象ID
--- @param page number @分类页码
--- @param name string @分类名称
--- @return any @操作结果
function Player:OpenDevStoreTab(objId, page, name)
    return nil
end

--- 打开开发者商店一级页面
--- @param playerId number @玩家ID
--- @param pagetype number @页面类型
--- @param pagetitle string @页面标题
--- @return any @操作结果
function Player:OpenDevGoodsPage(playerId, pagetype, pagetitle)
    return nil
end

--- 获取玩家的消费统计(有5s冷却限制,触发冷却返回nil)
--- @param uin number @玩家uin
--- @param tbegin number @开始时间
--- @param tend number @结束时间
--- @param currencytype number @货币类型
--- @param call_back function @内部回调(缺省参数)
--- @return number @消费数量(-1表示请求失败)
function Player:GetPlayerCostStatic(uin, tbegin, tend, currencytype, call_back)
    return 0
end

--- 玩家自定义数据上报埋点
--- @param uin number @玩家uin
--- @param eventname string @事件名称
--- @return boolean @操作是否成功
function Player:StandReportEvent(uin, eventname)
    return true
end

--- 清空运动趋势(配合'禁止移动'使用)
--- @param uin number @玩家uin
--- @return boolean @操作是否成功
function Player:ClearMotion(uin)
    return true
end

--- 玩家手机震动
--- @param uin number @玩家uin
--- @param time number @震动时长(单位:ms)
--- @param amplitude number @震动强度(范围:1~255)
--- @return boolean @操作是否成功
function Player:SetMobileVibrate(uin, time, amplitude)
    return true
end

--- 根据玩家uin,3D坐标获取玩家屏幕2D坐标
--- @param uin number @玩家uin
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return number,number @屏幕x坐标,屏幕y坐标
function Player:GetScreenSpacePos(uin, x, y, z)
    return 0, 0
end

--- 根据玩家uin,3D坐标获取玩家屏幕2D坐标(V2版本)
--- @param playerId number @玩家ID
--- @param x number @坐标x
--- @param y number @坐标y
--- @param z number @坐标z
--- @return number @屏幕x坐标
function Player:GetScreenSpacePosV2(playerId, x, y, z)
    return 0
end

--- 发送好友申请
--- @param uin1 number @发起申请的玩家uin
--- @param uin2 number @添加的好友uin
--- @return boolean @操作是否成功
function Player:SendFriendApply(uin1, uin2)
    return true
end

--- 玩家摄像机变换到位置
--- @param uin number @玩家uin
--- @param pos table @位置坐标
--- @param easingtype number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function Player:SetCameraPosTransformTo(uin, pos, easingtype, time)
    return true
end

--- 玩家摄像机旋转到角度
--- @param uin number @玩家uin
--- @param rot table @角度坐标
--- @param easingtype number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function Player:SetCameraRotTransformTo(uin, rot, easingtype, time)
    return true
end

--- 玩家摄像机Fov变换到值
--- @param uin number @玩家uin
--- @param fov number @Fov值
--- @param easingtype number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function Player:SetCameraFovTransformTo(uin, fov, easingtype, time)
    return true
end

--- 玩家摄像机变换相对位置
--- @param uin number @玩家uin
--- @param delta table @相对位置坐标(100=1方块)
--- @param easingtype number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function Player:SetCameraPosTransformBy(uin, delta, easingtype, time)
    return true
end

--- 玩家摄像机旋转相对角度
--- @param uin number @玩家uin
--- @param delta table @相对角度坐标
--- @param easingtype number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function Player:SetCameraRotTransformBy(uin, delta, easingtype, time)
    return true
end

--- 玩家摄像机Fov变换相对值
--- @param uin number @玩家uin
--- @param delta number @相对Fov值
--- @param easingtype number @缓动类型
--- @param time number @动画时间
--- @return boolean @操作是否成功
function Player:SetCameraFovTransformBy(uin, delta, easingtype, time)
    return true
end

--- 设置玩家的摄像机设置开关
--- @param uin number @玩家uin
--- @param attrtype number @摄像机属性类型
--- @param enable boolean @开关(true开启 false关闭)
--- @return boolean @操作是否成功
function Player:SetCameraAttrState(uin, attrtype, enable)
    return true
end

--- 设置玩家的摄像机旋转模式
--- @param uin number @玩家uin
--- @param rotmode number @旋转模式
--- @return boolean @操作是否成功
function Player:SetCameraRotMode(uin, rotmode)
    return true
end

--- 设置玩家的摄像机挂载到对象
--- @param uin number @玩家uin
--- @param targetuin number @目标玩家uin
--- @return boolean @操作是否成功
function Player:SetCameraMountObj(uin, targetuin)
    return true
end

--- 设置玩家的摄像机挂载到位置
--- @param uin number @玩家uin
--- @param pos table @挂载位置坐标
--- @return boolean @操作是否成功
function Player:SetCameraMountPos(uin, pos)
    return true
end

--- 重置玩家摄像机
--- @param uin number @玩家uin
--- @return boolean @操作是否成功
function Player:ResetCameraAttr(uin)
    return true
end

--- 打开可以操作的箱子
--- @param uin number @玩家uin
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @return boolean @操作是否成功
function Player:OpenBoxByPos(uin, x, y, z)
    return true
end

--- 获取玩家首次邀请人(阻塞接口,请求间隔10s)
--- @param uin number @玩家uin
--- @param call_back function @内部回调(缺省参数)
--- @return number @邀请人的玩家Uin(获取失败时返回错误码)
function Player:GetFirstInviter(uin, call_back)
    return 0
end

--- 判断两个玩家是否是好友(阻塞接口)
--- @param uin1 number @玩家1的uin
--- @param uin2 number|string @玩家2的uin
--- @return boolean @是否是好友
function Player:HasFriend(uin1, uin2)
    return true
end

--- 获取玩家VIP等级
--- @param uin number @玩家uin
--- @return number @VIP等级
function Player:GetMiniVipLevel(uin)
    return 0
end

--- 改变玩家移动方式
--- @param uin number @玩家uin
--- @param movetype number @移动类型
--- @return boolean @操作是否成功
function Player:ChangPlayerMoveType(uin, movetype)
    return true
end

--- 触发器播放广告接口
--- @param uin number @玩家uin
--- @param adname string @广告名称
--- @return number,number,string @操作代码,玩家uin,广告名称
function Player:PlayAdvertising(uin, adname)
    return 0, 0, ""
end

--- 玩家组显示游戏内弹窗
--- @param uin number @玩家uin
--- @param popuptype number @弹窗类型
--- @param bopen boolean @打开或者关闭
--- @param data any @附加数据
--- @return boolean @操作是否成功
function Player:OpenInnerView(uin, popuptype, bopen, data)
    return true
end

--- 设置玩家道具设置属性
--- @param uin number @玩家uin
--- @param itemid number|string @道具ID
--- @param abilitytype number @道具能力类型
--- @param switch boolean @是否打开
--- @return boolean @操作是否成功
function Player:SetItemAttAction(uin, itemid, abilitytype, switch)
    return true
end

--- 玩家强制打开UI界面
--- @param uin number @玩家uin
--- @param workstage number @工作阶段
--- @return boolean @操作是否成功
function Player:ForceOpenBoxUI(uin, workstage)
    return true
end

--- 设置道具技能进入冷却
--- @param uin number @玩家uin
--- @param itemid number|string @道具ID
--- @param cd number @CD时间
--- @return boolean @操作是否成功
function Player:ItemSkillCDEnter(uin, itemid, cd)
    return true
end

--- 设置道具技能结束冷却
--- @param uin number @玩家uin
--- @param itemid number|string @道具ID
--- @return boolean @操作是否成功
function Player:ItemSkillCDDone(uin, itemid)
    return true
end

--- 设置玩家枪械权限
--- @param uin number @玩家uin
--- @param actiontype number @枪禁用状态枚举
--- @param switch boolean @是否打开
--- @return boolean @操作是否成功
function Player:SetGunActionState(uin, actiontype, switch)
    return true
end

--- 获取玩家视角模式
--- @param uin number @玩家uin
--- @return any @视角模式信息
function Player:GetViewMode(uin)
    return nil
end

--- 获取玩家复活点
--- @param uin number @玩家uin
--- @return number,number,number @x,y,z方块坐标
function Player:GetRevivePoint(uin)
    return 0, 0, 0
end

--- 获取租赁云服务器服主
--- @return number @玩家Uin(仅租赁云服生效)
function Player:GetRentCloudServerOwner()
    return 0
end

--- 将玩家移出本局游戏
--- @param objId number @对象ID
--- @return boolean @操作是否成功
function Player:RemovePlayer(objId)
    return true
end

--- 获取玩家好友列表信息
--- @param objId number @玩家Uin
--- @param index number @起始索引
--- @param size number @获取数量
--- @return number @最大好友数量
--- @return table {{name: string, uin: number, headframe: string, live: boolean, online: boolean}, ...} @好友列表信息
function Player:GetFriendList(objId, index, size)
    return 0, {}
end

--- 设置游戏设置开关
--- @param playerId number @玩家ID
--- @param iType number @设置类型 (GameSetting)
--- @param enable boolean @开关
--- @return boolean @操作是否成功
function Player:SetSettingEnable(playerId, iType, enable)
    return true
end

--- 设置游戏设置权限开关
--- @param playerId number @玩家ID
--- @param iType number @设置类型 (GameSetting)
--- @param enable boolean @开关
--- @return boolean @操作是否成功
function Player:SetSettingAbility(playerId, iType, enable)
    return true
end

--- 旋转玩家模型
--- @param playerId number @玩家ID
--- @param yaw number @偏航角(X轴)
--- @param pitch number @俯仰角(Y轴)
--- @return boolean @操作是否成功
function Player:RotateMainModel(playerId, yaw, pitch)
    return true
end

--- @class Area
--- 区域模块管理接口 Area
local Area = {}
_G.Area = Area

--- 创建一个区域对象
--- @param pos table @区域底部中心位置
--- @param size table @区域大小
--- @return number @区域对象ID
function Area:CreateAreaPrefab(pos, size)
    return 0
end

--- 通过区域对象id获取区域uuid
--- @param objId number @区域对象ID
--- @return any @区域UUID
function Area:GetAreaUuidByObjId(objId)
    return nil
end

--- 创建矩形区域(通过范围)
--- @param posBeg table @区域起始坐标
--- @param posEnd table @区域结束坐标
--- @param btmp boolean @是否是临时区域
--- @return any @操作结果
function Area:CreateAreaRectByRange(posBeg, posEnd, btmp)
    return nil
end

--- 销毁区域
--- @param areaid number @区域ID
--- @return boolean @操作是否成功
function Area:DestroyArea(areaid)
    return true
end

--- 获取区域中间点
--- @param areaid number @区域ID
--- @return table @区域中心位置
function Area:GetAreaCenter(areaid)
    return {}
end

--- 获取区域各边长
--- @param areaid number @区域ID
--- @return number,number,number @x轴向长度,y轴向长度,z轴向长度
function Area:GetAreaRectLength(areaid)
    return 0, 0, 0
end

--- 获取区域范围
--- @param areaid number @区域ID
--- @return table,table @区域起始坐标,区域结束坐标
function Area:GetAreaRectRange(areaid)
    return {}, {}
end

--- 随机区域内位置
--- @param areaid number @区域ID
--- @return table @随机坐标
function Area:GetRandomPos(areaid)
    return {}
end

--- 检测obj是否在区域内
--- @param areaid number @区域ID
--- @param objid number @对象ID
--- @return boolean @是否在区域内
function Area:ObjInArea(areaid, objid)
    return true
end

--- 检测区域内是否有某个方块
--- @param areaid number @区域ID
--- @param blockid number|string @方块类型ID
--- @return boolean @是否在区域内
function Area:BlockInArea(areaid, blockid)
    return true
end

--- 位置是否在区域内
--- @param areaid number @区域ID
--- @param pos table @位置坐标
--- @return boolean @是否在区域内
function Area:PosInArea(areaid, pos)
    return true
end

--- 获取区域中的所有玩家
--- @param areaid number @区域ID
--- @return table @玩家objid组
function Area:GetAreaPlayers(areaid)
    return {}
end

--- 获取区域中的所有生物(当帧创建的生物获取不到)
--- @param areaid number @区域ID
--- @return table @生物objid组
function Area:GetAreaCreatures(areaid)
    return {}
end

--- 清空区域内全部方块
--- @param areaid number @区域ID
--- @param blockid number|string @方块类型ID
--- @param num number @最大清除数量
--- @param btriggerevent boolean @是否触发事件
--- @return boolean @操作是否成功
function Area:ClearAllBlock(areaid, blockid, num, btriggerevent)
    return true
end

--- 复制区域内方块到另一个区域
--- @param areaid number @区域ID
--- @param pos table @目标起始位置
--- @return boolean @操作是否成功
function Area:CloneAreaBlock(areaid, pos)
    return true
end

--- 替换方块类型为新的方块类型
--- @param areaid number @区域ID
--- @param srcblockid number|string @区域内的方块类型
--- @param destblockid number|string @替换的方块类型
--- @param face number @方块朝向
--- @param color string|number @颜色
--- @return boolean @操作是否成功
function Area:ReplaceAreaBlock(areaid, srcblockid, destblockid, face, color)
    return true
end

--- 获取区域范围内全部对象
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @param objtype number @对象类型
--- @return table @对象列表
function Area:GetAllObjsInAreaRange(posbeg, posend, objtype)
    return {}
end

--- 获取区域范围内全部玩家
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @return table @玩家列表
function Area:GetAllPlayersInAreaRange(posbeg, posend)
    return {}
end

--- 获取区域范围内全部生物
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @return table @生物列表
function Area:GetAllCreaturesInAreaRange(posbeg, posend)
    return {}
end

--- 用方块填充区域范围(分帧处理,当前帧率操作不到填充的方块)
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @param blockid number|string @方块类型
--- @param face number @方块朝向
--- @param color string|number @颜色
--- @param switch boolean @是否开启
--- @param filltype number @填充类型
--- @return boolean @操作是否成功
function Area:FillBlockAreaRange(posbeg, posend, blockid, face, color, switch, filltype)
    return true
end

--- 清空区域范围内方块
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @param blockid number|string @方块类型
--- @param btriggerevent boolean @是否触发事件
--- @return boolean @操作是否成功
function Area:ClearAllBlockAreaRange(posbeg, posend, blockid, btriggerevent)
    return true
end

--- 破坏区域内的方块
--- @param areaid number @区域ID
--- @param blockid string|number @方块ID或资产ID
--- @param n number @销毁数量(不填或者0则全部销毁)
--- @param candrop boolean @是否掉落物品
--- @param btriggerevent boolean @是否触发事件
--- @return boolean @操作是否成功
function Area:DestroyAllBlock(areaid, blockid, n, candrop, btriggerevent)
    return true
end

--- 复制区域范围内方块到另一个区域
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @param deststartpos table @目标起始位置
--- @param itype number @复制类型
--- @return boolean @操作是否成功
function Area:CloneAreaRange(posbeg, posend, deststartpos, itype)
    return true
end

--- 替换区域范围方块
--- @param posbeg table @起始位置
--- @param posend table @末点位置
--- @param srcblockid number|string @方块类型
--- @param destblockid number|string @目标方块类型
--- @param face number @方块朝向
--- @param inair boolean @是否包括空气方块
--- @return boolean @操作是否成功
function Area:ReplaceAreaRangeBlock(posbeg, posend, srcblockid, destblockid, face, inair)
    return true
end

--- 获取一个区域内随机空气方块
--- @param posbeg table @区域起始位置
--- @param posend table @区域结束位置
--- @return table @随机空气位置(x y z)
function Area:GetRandomAirPos(posbeg, posend)
    return {}
end

--- 获取区域内的方块类型
--- @param areaid number @区域ID
--- @return table @类型组
function Area:GetAreaBlockTypes(areaid)
    return {}
end

--- 获取区域内的方块数量
--- @param areaid number @区域ID
--- @param blockid string|number @方块ID
--- @return number @方块数量
function Area:GetBlockNum(areaid, blockid)
    return 0
end

--- 检查指定范围内是否可以放置方块
--- @param posbeg table @区域起始位置
--- @param posend table @区域结束位置
--- @param blockid string|number @方块ID
--- @return boolean @是否可以放置方块(true/false)
function Area:CheckRangeCanPlace(posbeg, posend, blockid)
    return true
end

--- 获取区域中指定玩家关系的角色
--- @param posbeg table @区域起始位置
--- @param posend table @区域结束位置
--- @param uin number @玩家uin
--- @param relativing number @关系类型
--- @param actortype number @角色类型
--- @return number,table @数量,角色数组
function Area:GetRelativeActors(posbeg, posend, uin, relativing, actortype)
    return 0, {}
end


--- @class Buff
--- 状态模块管理接口 Buff
local Buff = {}
_G.Buff = Buff

--- 给对象附加效果
--- @param objid number @对象ID
--- @param buffid number|string @效果ID
--- @param customticks number @效果持续时间 **(-1表示默认配置，0表示无限)**
--- @return boolean @成功(true)
function Buff:AddBuff(objid, buffid, customticks)
    return true
end

--- 给对象移除指定效果
--- @param objid number @对象ID
--- @param buffid number|string @效果ID
--- @return boolean @成功(true)
function Buff:RemoveBuff(objid, buffid)
    return true
end

--- 给对象清除所有效果
--- @param objid number @对象ID
--- @return boolean @成功(true)
function Buff:ClearAllBuff(objid)
    return true
end

--- 为对象清除所有负面效果
--- @param objid number @对象ID
--- @return boolean @成功(true)
function Buff:ClearAllBadBuff(objid)
    return true
end

--- 为对象清除所有有益效果
--- @param objid number @对象ID
--- @return boolean @成功(true)
function Buff:ClearAllGoodBuff(objid)
    return true
end

--- 判断对象身上是否有指定效果
--- @param objid number @对象ID
--- @param buffid number|string @效果ID
--- @param bufflv number @效果等级
--- @return boolean @成功(true)
function Buff:HasBuff(objid, buffid, bufflv)
    return true
end

--- 获取对象身上效果列表
--- @param objid number @对象ID
--- @return number, table @效果数量, 效果ID数组
function Buff:GetBuffList(objid)
    return 0, {}
end

--- 获取对象身上指定效果数量
--- @param objid number @对象ID
--- @param buffid number|string @效果ID
--- @return number @数量
function Buff:GetBuffNumByBuffid(objid, buffid)
    return 0
end

--- 获取对象身上指定效果剩余时间
--- @param objid number @对象ID
--- @param buffid number|string @效果ID
--- @return number @剩余时间 **(秒，0表示永久)**
function Buff:GetBuffLeftTime(objid, buffid)
    return 0
end

--- 获取状态效果名称
--- @param buffid number|string @效果ID
--- @return string @效果名称
function Buff:GetBuffDefName(buffid)
    return ""
end

--- 获取状态效果描述
--- @param buffid number|string @效果ID
--- @return string @状态效果描述
function Buff:GetBuffDefDesc(buffid)
    return ""
end

--- 替换已有状态
--- @param objid number @对象ID
--- @param buffsrc number|string @源状态ID
--- @param buffsrclv number @源状态等级
--- @param buffdst number|string @目标状态
--- @param buffdstlv number @目标状态等级
--- @param customticks number @持续时间
--- @return boolean @替换成功 **(true)** 或失败 **(false)**
function Buff:ReplaceBuff(objid, buffsrc, buffsrclv, buffdst, buffdstlv, customticks)
    return true
end


--- @class Item
--- 道具模块管理接口 Item
local Item = {}
_G.Item = Item

--- 获取道具名称
--- @param itemid number|string @道具ID
--- @return string @道具名称
function Item:GetItemName(itemid)
    return ""
end

--- 在资源库里随机获取一个道具ID
--- @return number @随机道具ID
function Item:RandomItemID()
    return 0
end

--- 在资源库里随机获取一个投掷物ID
--- @return number @随机投掷物ID
function Item:RandomProjectileID()
    return 0
end

--- 获取道具属性
--- @param itemid number|string @道具ID
--- @param attrtype number @属性类型
--- @return number @属性值
function Item:GetAttr(itemid, attrtype)
    return 0
end

--- 获取道具描述
--- @param itemid number|string @道具ID
--- @return string @道具描述
function Item:GetItemDesc(itemid)
    return ""
end

--- 获取自定义枪械的属性(仅自定义枪械有效)
--- @param itemid number|string @道具ID
--- @param attrname string @属性名称
--- @return any @属性值
function Item:GetCustomGunAttr(itemid, attrname)
    return nil
end

--- 获取道具配方的数量
--- @param itemid number|string @道具ID
--- @return number @配方数量
function Item:GetCraftIDNum(itemid)
    return 0
end

--- 获取道具的配方材料和数量
--- @param itemid number|string @道具ID
--- @param index number @配方索引
--- @return table @配方材料表{{材料ID, 数量}, ...}
function Item:GetCraftMaterialAndNum(itemid, index)
    return {}
end

--- 获取道具类型外观
--- @param itemid number|string @道具类型ID或道具预制ID
--- @return string @道具类型外观
function Item:GetFacade(itemid)
    return ""
end

--- 在位置上创建道具实例的掉落物
--- @param itemid number|string @道具ID
--- @param pos table @掉落物位置{x=0, y=0, z=0}
--- @return number @掉落物对象ID
function Item:CreateItemInstInWorld(itemid, pos)
    return 0
end

--- 在位置上创建枪械道具实例的掉落物
--- @param itemid number|string @道具ID
--- @param pos table @掉落物位置
--- @return number @掉落物对象ID
function Item:CreateGunInWorld(itemid, pos)
    return 0
end

--- 获取装备道具所对应的装备栏
--- @param itemid number|string @装备道具ID
--- @return number @装备栏位置(BackpackBeginIndex.Equip + EquipSlotType)
function Item:GetEquipItemGridID(itemid)
    return 0
end

--- 修改枪械道具实例的属性
--- @param instId number @道具实例ID
--- @param key string @属性键
--- @param value any @属性值(number|string|bool)
--- @return boolean @操作是否成功
function Item:ModifyGunAttribute(instId, key, value)
    return true
end

--- 获取枪械道具实例的属性
--- @param instId number @道具实例ID
--- @param key string @属性键
--- @return any @属性值(number|string|bool|nil)
function Item:GetGunAttribute(instId, key)
    return nil
end

--- 获取枪预制的属性
--- @param instId number @道具实例ID
--- @param key string @属性键
--- @return any @属性值(number|string|bool|nil)
function Item:GetGunPrefabAttribute(instId, key)
    return nil
end

--- 根据道具实例ID获取道具ID
--- @param instId number @道具实例ID
--- @return number|string @道具ID
function Item:GetItemIdByInstanceId(instId)
    return 0
end

--- 给道具实例添加一个模型子部件
--- @param instId number @道具实例ID
--- @param partName string @子部件名字
--- @param boneName string @骨骼名称
--- @param modelStr string @模型字符串
--- @param offset table @位置偏移{x=0, y=0, z=0}
--- @param rot table @旋转角度{x=0, y=0, z=0}
--- @param scale table @缩放比例{x=1, y=1, z=1}
--- @return string @部件名字
function Item:AddSubModelPart(instId, partName, boneName, modelStr, offset, rot, scale)
    return ""
end

--- 删除一个道具实例的模型子部件
--- @param instId number @道具实例ID
--- @param partName string @子部件名字
--- @return boolean @操作是否成功
function Item:DeleteSubModelPart(instId, partName)
    return true
end

--- 修改一个道具实例的模型子部件
--- @param instId number @道具实例ID
--- @param partName string @子部件名字
--- @param boneName string @骨骼名称
--- @param modelStr string @模型字符串
--- @param offset table @位置偏移
--- @param rot table @旋转角度
--- @param scale table @缩放比例
--- @return boolean @操作是否成功
function Item:ReplaceSubModelPart(instId, partName, boneName, modelStr, offset, rot, scale)
    return true
end

--- 设置道具实例的自定义数据string
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @param value string @字符串值
--- @return boolean @操作是否成功
function Item:SetStringCustomData(instId, key, value)
    return true
end

--- 设置道具实例的自定义数据bool
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @param value boolean @布尔值
--- @return boolean @操作是否成功
function Item:SetBoolCustomData(instId, key, value)
    return true
end

--- 设置道具实例的自定义数据number
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @param value number @数值
--- @return boolean @操作是否成功
function Item:SetNumberCustomData(instId, key, value)
    return true
end

--- 设置道具实例的自定义数据Object
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @param value table @对象值
--- @return boolean @操作是否成功
function Item:SetObjCustomData(instId, key, value)
    return true
end

--- 设置道具实例的自定义数据Array
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @param value table @数组值
--- @return boolean @操作是否成功
function Item:SetArrayCustomData(instId, key, value)
    return true
end

--- 获取道具实例的自定义数据string
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @return string @字符串值
function Item:GetStringCustomData(instId, key)
    return ""
end

--- 获取道具实例的自定义数据bool
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @return boolean @布尔值
function Item:GetBoolCustomData(instId, key)
    return true
end

--- 获取道具实例的自定义数据number
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @return number @数值
function Item:GetNumberCustomData(instId, key)
    return 0
end

--- 获取道具实例的自定义数据Object
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @return table @对象值
function Item:GetObjCustomData(instId, key)
    return {}
end

--- 获取道具实例的自定义数据Array
--- @param instId number @道具实例ID
--- @param key string @数据键
--- @return table @数组值
function Item:GetArrayCustomData(instId, key)
    return {}
end

--- 获取具有道具实例ID的道具外观
--- @param instId number @道具实例ID
--- @return string @道具实例外观
function Item:GetItemInstFacade(instId)
    return ""
end

--- 获取掉落物或者投掷物的格子属性
--- @param objId number @对象ID
--- @param attrType number @属性类型
--- @return number @属性值
function Item:GetGridAttr(objId, attrType)
    return 0
end

--- 获取道具定义中的标签组
--- @return table @道具的标签组
--- @param itemId number|string @道具定义ID/道具预制ID
function Item:GetTags(itemId)
    return {}
end


--- @class Backpack
--- 背包模块管理接口 Backpack
local Backpack = {}
_G.Backpack = Backpack

--- 设置背包格道具
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量(默认1)
--- @return boolean @是否成功
function Backpack:SetGridItem(playerid, gridid, itemid, num)
    return true
end

--- 移除背包格内一定数量道具
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param num number @道具数量(默认全部移除)
--- @return boolean @是否成功
function Backpack:RemoveGridItem(playerid, gridid, num)
    return true
end

--- 移除背包内一定数量道具,通过道具ID移除,默认全部移除
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量
--- @return number @移除数量(ret and ret>0 成功)
function Backpack:RemoveGridItemByItemID(playerid, itemid, num)
    return 0
end

--- 清空指定背包栏
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @return boolean @是否成功
function Backpack:ClearPack(playerid, bartype)
    return true
end

--- 清空全部背包(包含背包栏、快捷栏、装备栏)
--- @param playerid number @玩家ID
--- @return boolean @是否成功
function Backpack:ClearAllPack(playerid)
    return true
end

--- 移动背包道具,默认全部转移
--- @param playerid number @玩家ID
--- @param gridsrc number @源格子ID
--- @param griddst number @移动至的目标格子ID
--- @param num number @道具数量(默认全部)
--- @return boolean @是否成功
function Backpack:MoveGridItem(playerid, gridsrc, griddst, num)
    return true
end

--- 交换背包道具
--- @param playerid number @玩家ID
--- @param grid1 number @格子1 ID
--- @param grid2 number @格子2 ID
--- @return boolean @是否成功
function Backpack:SwapGridItem(playerid, grid1, grid2)
    return true
end

--- 背包(包含背包栏、快捷栏)是否有足够的空间存放一定数量的道具
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量(默认1)
--- @return boolean @是否成功
function Backpack:EnoughSpaceForItem(playerid, itemid, num)
    return true
end

--- 计算背包(包含背包栏、快捷栏)能存放的道具剩余总数量
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @return number @可以存放的数量
function Backpack:CalcSpaceNumForItem(playerid, itemid)
    return 0
end

--- 检测背包是否持有某个道具
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @param itemid number|string @道具类型
--- @return boolean @是否成功
function Backpack:HasItemByBackpackBar(playerid, bartype, itemid)
    return true
end

--- 获取背包持有某个道具总数量,同时返回装有道具的背包格数组
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @param itemid number|string @道具类型
--- @return number,table @道具数量,格子ID数组
function Backpack:GetItemNumByBackpackBar(playerid, bartype, itemid)
    return 0, {}
end

--- 获取背包持有某个道具总数量,同时返回装有道具的背包格数组
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param isAddEquip boolean @是否添加装备栏(默认True)
--- @return number,table @道具数量,格子ID数组
function Backpack:GetItemNum(playerid, itemid, isAddEquip)
    return 0, {}
end

--- 获取背包格道具ID(返回itemid, num)
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @return number,number @道具类型,道具数量(无道具 数量是0 itemid是0)
function Backpack:GetGridItemID(playerid, gridid)
    return 0, 0
end

--- 获取背包格道具名称
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @return string @道具名称
function Backpack:GetGridItemName(playerid, gridid)
    return ""
end

--- 添加道具到背包
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量
--- @param prioritytype number @优先快捷栏还是背包栏:1优先快捷栏 2优先背包栏(默认1)
--- @return number @成功添加的数量
function Backpack:AddItem(playerid, itemid, num, prioritytype)
    return 0
end

--- 丢弃背包某个格子里的道具
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param num number @道具数量
--- @param ablePick boolean @能否拾取
--- @return boolean @是否成功
function Backpack:DiscardItem(playerid, gridid, num, ablePick)
    return true
end

--- 丢弃背包某个格子里的道具
--- @param playerid number @玩家ID
--- @param itemid number|string @道具ID
--- @return boolean @是否成功
function Backpack:DiscardItemByID(playerid, itemid)
    return true
end

--- 玩家穿上装备
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param frompos number @格子ID(可不传,如果不为nil 则必须和itemid一致)
--- @return boolean @是否成功
function Backpack:ActEquipUpByResID(playerid, itemid, frompos)
    return true
end

--- 玩家脱下装备栏装备
--- @param playerid number @玩家ID
--- @param grid number @装备栏ID
--- @param grid2 number @目标格子ID(可不传,如果不为nil 则必须是空格子)
--- @return boolean @是否成功
function Backpack:ActEquipOffByEquipID(playerid, grid, grid2)
    return true
end

--- 销毁装备
--- @param playerid number @玩家ID
--- @param grid number @装备栏ID
--- @return boolean @是否成功
function Backpack:ActDestructEquip(playerid, grid)
    return true
end

--- 创建道具到玩家背包
--- @param playerid number @玩家ID
--- @param itemid number @道具类型
--- @param num number @道具数量
--- @param ipos number @优先存放的位置
--- @return any @操作结果
function Backpack:CreateItem(playerid, itemid, num, ipos)
    return nil
end

--- 在手持道具上播放特效
--- @param playerid number @玩家ID
--- @param effectid number @特效ID
--- @param offset table @偏移量
--- @param rot table @旋转
--- @param scale table @缩放
--- @return boolean @是否成功
function Backpack:PlayShortCutIxParticle(playerid, effectid, offset, rot, scale)
    return true
end

--- 停止手持道具上播放特效
--- @param playerid number @玩家ID
--- @param effectid number @特效ID
--- @return boolean @是否成功
function Backpack:StopShortCutIxEffect(playerid, effectid)
    return true
end

--- 设置玩家快捷栏上某种类型道具手持特效
--- @param playerid number @玩家ID
--- @param itemid number @道具类型
--- @param effectid number @特效ID
--- @return boolean @是否成功
function Backpack:PlayShortCutItemParticle(playerid, itemid, effectid)
    return true
end

--- 删除玩家快捷栏上某种类型道具手持特效
--- @param playerid number @玩家ID
--- @param itemid number @道具类型
--- @param effectid number @特效ID
--- @return boolean @是否成功
function Backpack:StopShortCutItemEffect(playerid, itemid, effectid)
    return true
end

--- 批量获取背包和快捷栏格子信息数据
--- @param playerid number @玩家ID
--- @param begingridId number @开始格子id
--- @param endgridId number @结束格子id
--- @return any @格子信息数据
function Backpack:GetGridInfos(playerid, begingridId, endgridId)
    return nil
end

--- 加载背包和快捷栏格子信息数据
--- @param playerid number @玩家ID
--- @param gridinfo string @格子信息
--- @return boolean @是否成功
function Backpack:LoadGridInfos(playerid, gridinfo)
    return true
end

--- 解析格子信息数据
--- @param str string @GetGridInfos打包字符串
--- @return table @解析后的数据
function Backpack:DecodeGridInfo(str)
    return {}
end

--- 将解析的格子信息数据打包
--- @param infos table @DecodeGridInfo解析后的数据
--- @return string @打包后的字符串
function Backpack:EncodeTableGridInfo(infos)
    return ""
end

--- 设置背包和快捷栏格子锁定状态
--- @param playerid number @玩家ID
--- @param begingridId number @开始格子id
--- @param endgridId number @结束格子id
--- @param lock boolean @true锁定 false打开
--- @return boolean @是否成功
function Backpack:SetGridsLock(playerid, begingridId, endgridId, lock)
    return true
end

--- 批量清理背包格子数据
--- @param playerid number @玩家ID
--- @param begingridId number @开始格子id
--- @param endgridId number @结束格子id
--- @return boolean @是否成功
function Backpack:ClearGrids(playerid, begingridId, endgridId)
    return true
end

--- 设置背包格子数量
--- @param playerid number @玩家ID
--- @param num number @数量暂定范围(0-100)
--- @return boolean @是否成功
function Backpack:SetBackPackNum(playerid, num)
    return true
end

--- 获取指定背包中所有道具实例
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @return table @道具实例ID数组
function Backpack:GetAllBackPackInstanceIds(playerid, bartype)
    return {}
end

--- 在玩家的背包内创建一个道具实例
--- @param playerid number @玩家ID
--- @param itemid number|string @道具id
--- @param gridIndex number @格子索引
--- @return string @道具实例ID
function Backpack:CreateItemInstInBackpack(playerid, itemid, gridIndex)
    return ""
end

--- 在玩家的背包内创建一把实例化的枪械
--- @param playerid number @玩家ID
--- @param itemid number|string @道具id
--- @param gridIndex number @格子索引
--- @return string @道具实例ID
function Backpack:CreateGunInBackpack(playerid, itemid, gridIndex)
    return ""
end

--- 根据背包索引获取道具实例id
--- @param playerid number @玩家ID
--- @param gridIndex number @格子索引
--- @return string @道具实例id
function Backpack:GetInstIdByGridIndex(playerid, gridIndex)
    return ""
end

--- 获取背包所有实例化的枪械
--- @param playerid number @玩家ID
--- @return table @实例id数组
function Backpack:GetGunInstIdInBackpack(playerid)
    return {}
end

--- 获取背包格子是否锁定
--- @param playerid number @玩家ID
--- @param gridIndex number @格子索引
--- @return boolean @是否锁定(参数错误返回true)
function Backpack:IsLock(playerid, gridIndex)
    return true
end

--- 获取背包格子属性
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param attr number @属性类型
--- @return number @属性值
function Backpack:GetGridAttr(playerid, gridid, attr)
    return 0
end

--- 设置背包格子属性
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param attr number @属性类型
--- @param value number @属性值
--- @return boolean @是否成功
function Backpack:SetGridAttr(playerid, gridid, attr, value)
    return true
end


--- @class Chat
--- 消息模块管理接口 - Chat
local Chat = {}
_G.Chat = Chat

--- 发送系统信息
--- 
--- **注意：playerId参数传0，表示发送给所有玩家**
--- @param content string @内容
--- @param playerId number @玩家ID
--- @return boolean @是否发送成功
function Chat:SendSystemMsg(content, playerId)
    return true
end


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
---@return number, number @返回屏幕大小(width, height)
function CustomUI:GetScreenSize(playerId)
    return 0, 0
end

---删除UI元件
---@return boolean @成功返回True, 失败返回False
---@param playerId number @玩家ID
---@param uiId string @界面ID
---@param elementId string @元件ID
function CustomUI:DeleteElement(playerId, uiId, elementId)
    return true
end

--- 设置信标映射类型
--- @return boolean @成功返回True, 失败返回False
--- @param playerId number @玩家ID
--- @param uiId string @界面ID
--- @param elementId string @元件ID
--- @param mapType number @信标映射类型枚举(BeaconMapType)
function CustomUI:SetBeaconMapType(playerId, uiId, elementId, mapType)
    return true
end

--- 设置信标位置
--- @return boolean @成功返回True, 失败返回False
--- @param playerId number @玩家ID
--- @param uiId string @界面ID
--- @param elementId string @元件ID
--- @param bandPosX number @信标X坐标
--- @param bandPosY number @信标Y坐标
--- @param bandPosZ number @信标Z坐标
function CustomUI:SetBeaconBandPos(playerId, uiId, elementId, bandPosX, bandPosY, bandPosZ)
    return true
end

--- 设置信标对象
--- @return boolean @成功返回True, 失败返回False
--- @param playerId number @玩家ID
--- @param uiId string @界面ID
--- @param elementId string @元件ID
--- @param objId number @信标对象ID
function CustomUI:SetBeaconObjId(playerId, uiId, elementId, objId)
    return true
end

--- 设置信标偏移
--- @return boolean @成功返回True, 失败返回False
--- @param playerId number @玩家ID
--- @param uiId string @界面ID
--- @param elementId string @元件ID
--- @param offsetX number @信标X偏移
--- @param offsetY number @信标Y偏移
--- @param offsetZ number @信标Z偏移
function CustomUI:SetBeaconOffset(playerId, uiId, elementId, offsetX, offsetY, offsetZ)
    return true
end

--- 设置信标限制范围类型
--- @return boolean @成功返回True, 失败返回False
--- @param playerId number @玩家ID
--- @param uiId string @界面ID
--- @param elementId string @元件ID
--- @param clampRange number @信标限制范围类型枚举(BeaconClampType)
function CustomUI:SetBeaconClampType(playerId, uiId, elementId, clampRange)
    return true
end

--- 设置信标显示半径
--- @return boolean @成功返回True, 失败返回False
--- @param playerId number @玩家ID
--- @param uiId string @界面ID
--- @param elementId string @元件ID
--- @param radius number @信标半径
function CustomUI:SetBeaconRadius(playerId, uiId, elementId, radius)
    return true
end


--- @class Graphics
--- 图形界面模块管理接口 Graphics
local Graphics = {}
_G.Graphics = Graphics

--- 创建文字板信息
--- @param title string @文本内容
--- @param font number @字体大小
--- @param apha number @不透明度
--- @param autoWrap number @自动换行(默认自动换行)
--- @return table @文本信息内容
function Graphics:MakeGraphicsText(title, font, apha, autoWrap)
    return {}
end

--- 创建漂浮文字信息
--- @param title string @文本信息
--- @param font number @字体大小
--- @param apha number @不透明度
--- @return table @漂浮文字信息内容
function Graphics:MakeflotageText(title, font, apha)
    return {}
end

--- 创建进度条信息
--- @param current number @当前进度值
--- @param total number @总进度值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @进度条信息内容
function Graphics:MakeGraphicsProgress(current, total, color, apha)
    return {}
end

--- 生成指向位置的箭头数据
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param size number @缩放值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @箭头信息内容
function Graphics:MakeGraphicsArrowToPos(x, y, z, size, color, apha)
    return {}
end

--- 生成指向位置的线数据
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param size number @缩放值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @线信息内容
function Graphics:MakeGraphicsLineToPos(x, y, z, size, color, apha)
    return {}
end

--- 生成指向位置的面数据
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param size number @缩放值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @面信息内容
function Graphics:MakeGraphicsSurfaceToPos(x, y, z, size, color, apha)
    return {}
end

--- 生成指向对象的箭头数据
--- @param objid number @对象ID
--- @param size number @缩放值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @箭头信息内容
function Graphics:MakeGraphicsArrowToActor(objid, size, color, apha)
    return {}
end

--- 生成指向对象的线数据
--- @param objid number @对象ID
--- @param size number @缩放值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @线信息内容
function Graphics:MakeGraphicsLineToActor(objid, size, color, apha)
    return {}
end

--- 生成指向对象的面数据
--- @param objid number @对象ID
--- @param size number @缩放值
--- @param color string @颜色值(十六进制)
--- @param apha number @不透明度
--- @return table @面信息内容
function Graphics:MakeGraphicsSurfaceToActor(objid, size, color, apha)
    return {}
end

--- 生成图片信息
--- @param imgid string @图片ID
--- @param size number @缩放值
--- @param height number @高度
--- @param apha number @不透明度
--- @return table @图片信息内容
function Graphics:MakeGraphicsImage(imgid, size, height, apha)
    return {}
end

--- 创建图文信息
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param info table @图文信息
--- @param x2 number @X坐标偏移(缺省参数)
--- @param y2 number @Y坐标偏移(缺省参数)
--- @return number @图文对象ID
function Graphics:CreateGraphicsTxtByPos(x, y, z, info, x2, y2)
    return 0
end

--- 在生物身上创建文字板
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return number @图文实例ID
function Graphics:CreateGraphicsTxtByActor(objid, info, offset, distance)
    return 0
end

--- 在位置上创建漂浮文字
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param info table @图文信息
--- @param x2 number @X坐标偏移(缺省参数)
--- @param y2 number @Y坐标偏移(缺省参数)
--- @return number @图文实例ID
function Graphics:CreateflotageTextByPos(x, y, z, info, x2, y2)
    return 0
end

--- 在生物身上创建漂浮文字
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return number @图文实例ID
function Graphics:CreateflotageTextByActor(objid, info, offset, distance)
    return 0
end

--- 在位置上创建进度条
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param info table @图文信息
--- @param x2 number @X坐标偏移(缺省参数)
--- @param y2 number @Y坐标偏移(缺省参数)
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsProgressByPos(x, y, z, info, x2, y2)
    return true
end

--- 在生物身上创建进度条
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsProgressByActor(objid, info, offset, distance)
    return true
end

--- 删除位置上的图文信息
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param graphid number @图文ID
--- @param graphType number @图文类型
--- @return boolean @操作是否成功
function Graphics:RemoveGraphicsByPos(x, y, z, graphid, graphType)
    return true
end

--- 删除生物的图文信息
--- @param objid number @对象ID
--- @param graphid number @图文ID
--- @param graphType number @图文类型
--- @return boolean @操作是否成功
function Graphics:RemoveGraphicsByObjID(objid, graphid, graphType)
    return true
end

--- 更新图文信息的文字内容
--- @param graphid number @图文ID
--- @param title string @文本内容
--- @param fontsize number @字体大小
--- @param apha number @不透明度
--- @return boolean @操作是否成功
function Graphics:UpdateGraphicsTextById(graphid, title, fontsize, apha)
    return true
end

--- 创建生物指向位置的箭头
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByActorToPos(objid, info, offset, distance)
    return true
end

--- 创建生物指向生物的箭头
--- @param srcObjid number @源对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByActorToActor(srcObjid, info, offset, distance)
    return true
end

--- 创建位置指向位置的箭头
--- @param pos table @位置坐标{x=x, y=y, z=z}
--- @param info table @图文信息
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByPosToPos(pos, info)
    return true
end

--- 创建位置指向生物的箭头
--- @param pos table @位置坐标{x=x, y=y, z=z}
--- @param info table @图文信息
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsArrowByPosToActor(pos, info)
    return true
end

--- 创建生物与位置的线
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsLineByActorToPos(objid, info, offset, distance)
    return true
end

--- 创建指向生物的线
--- @param srcObjid number @源对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsLineByActorToActor(srcObjid, info, offset, distance)
    return true
end

--- 创建位置指向位置的线
--- @param pos table @位置坐标{x=x, y=y, z=z}
--- @param info table @图文信息
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsLineByPosToPos(pos, info)
    return true
end

--- 创建位置指向生物的线
--- @param pos table @位置坐标{x=x, y=y, z=z}
--- @param info table @图文信息
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsLineByPosToActor(pos, info)
    return true
end

--- 创建生物与位置的面
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByActorToPos(objid, info, offset, distance)
    return true
end

--- 创建生物与生物的引导面
--- @param srcObjid number @源对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByActorToActor(srcObjid, info, offset, distance)
    return true
end

--- 创建位置指向位置的面
--- @param pos table @位置坐标{x=x, y=y, z=z}
--- @param info table @图文信息
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByPosToPos(pos, info)
    return true
end

--- 创建位置指向生物的面
--- @param pos table @位置坐标{x=x, y=y, z=z}
--- @param info table @图文信息
--- @return boolean @操作是否成功
function Graphics:CreateGraphicsSurfaceByPosToActor(pos, info)
    return true
end

--- 将src相关的所有图文信息转移到des身上
--- @param srcObjid number @源对象ID
--- @param desObjid number @目标对象ID
--- @return boolean @是否成功
function Graphics:ReplaceAllGraphics(srcObjid, desObjid)
    return true
end

--- 在位置上创建图像
--- @param x number @方块坐标x
--- @param y number @方块坐标y
--- @param z number @方块坐标z
--- @param info table @图文信息
--- @param x2 number @X坐标偏移(缺省参数)
--- @param y2 number @Y坐标偏移(缺省参数)
--- @return boolean @是否成功
function Graphics:CreateGraphicsImageByPos(x, y, z, info, x2, y2)
    return true
end

--- 在生物上创建图像
--- @param objid number @对象ID
--- @param info table @图文信息
--- @param offset table @方向偏移距离{x=x, y=y, z=z}
--- @param distance number @偏移距离
--- @return boolean @是否成功
function Graphics:CreateGraphicsImageByActor(objid, info, offset, distance)
    return true
end

--- 获取玩家昵称或称号的偏移高度
--- @param objid number @对象ID
--- @param nameType number @名称类型
--- @param callback function @回调函数
--- @return number @高度值(未展示返回0)
function Graphics:GetInnerGraphicsOffset(objid, nameType, callback)
    return 0
end

--- 在指定位置创建笔刷区域图文
--- @param pos table {x: number, y: number, z: number} @位置坐标
--- @param dim table {x: number, y: number, z: number} @区域范围
--- @param color string @颜色值(十六进制)
--- @param showUin number @显示玩家ID (0:全部)
--- @param iType number @类型ID
--- @param worldId? number @世界ID (可选)
--- @return number|false @图文实例ID, 失败返回false
function Graphics:CreateBrushByPos(pos, dim, color, showUin, iType, worldId)
    return 0
end

--- 按图文实例ID删除图文信息
--- @param objId number @图文实例ID
--- @return boolean @操作是否成功
function Graphics:RemoveGraphicsByGraphicsID(objId)
    return true
end

--- @class Monster
--- 生物模块管理接口 Monster
local Monster = {}
_G.Monster = Monster

--- 获取生物类型ID
--- @param objid number @对象ID
--- @return number @生物类型ID
function Monster:GetActorID(objid)
    return 0
end

--- 获取生物类型名称
--- @param objId number @对象ID
--- @return string @生物类型名称
function Monster:GetActorName(objId)
    return ""
end

--- 替换生物
--- @param objId number @原生物对象ID
--- @param newActorId number @新生物类型ID
--- @return number @新生物对象ID
function Monster:ReplaceActor(objId, newActorId)
    return 0
end

--- 获取生物击杀掉落经验
--- @param actorId number @生物类型ID
--- @return number @击杀掉落经验值
function Monster:GetMonsterDefLevelExp(actorId)
    return 0
end

--- 设置生物击杀掉落经验
--- @param actorId number @生物类型ID
--- @param exp number @经验值
--- @return boolean @操作是否成功
function Monster:SetMonsterDefLevelExp(actorId, exp)
    return true
end

--- 切换Ai行为树
--- @param objid number @生物对象ID
--- @param treeid number|string @行为树ID
--- @return boolean @操作是否成功
function Monster:ChangeAI(objid, treeid)
    return true
end

--- 怪物对目标是否可见
--- @param objId number @怪物对象ID
--- @param targetUin number @目标玩家uin
--- @return boolean @是否可见
function Monster:CanSee(objId, targetUin)
    return true
end

--- 获取生物的掉落物信息
--- @param actorId number @生物类型ID
--- @return table @掉落物信息表，包含道具ID、数量、概率
function Monster:GetDropItemInfo(actorId)
    return {}
end

--- 设置生物A被玩家驯服
--- @param objId number @生物对象ID
--- @param playerUin number @玩家uin
--- @return boolean @操作是否成功
function Monster:SetTameTarget(objId, playerUin)
    return true
end

--- 随机获取一个生物类型ID
--- @return number @随机生物类型ID
function Monster:RandomActorID()
    return 0
end

--- 获取驯养主ID
--- @param objId number @生物对象ID
--- @return number @驯养主ID
function Monster:GetTamedOwnerID(objId)
    return 0
end

--- 获取生物类型外观
--- @param monsterid number|string @生物定义ID或生物预制ID
--- @return any @生物外观模型信息
function Monster:GetFacade(monsterid)
    return nil
end