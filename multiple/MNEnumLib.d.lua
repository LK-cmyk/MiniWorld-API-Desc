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
--- @field BaseDamage string @基础伤害
--- @field RepelDistance string @击退距离
--- @field BulletShrapnel string @弹片数量
--- @field BulletConsume string @消耗子弹数
--- @field Penetration string @穿透率
--- @field HeadDamage string @头部倍率
--- @field BodyDamage string @躯干倍率
--- @field MaxAmmo string @弹容量
--- @field Rpm string @射速(每分钟子弹数)
--- @field ReloadPhase2Time string @换弹行为时间
--- @field ReloadPhase2TimeEmpty string @空仓换弹行为时间
--- @field GunLevel string @枪械等级 历史遗留的字段,对于游戏本体只用于显示角标
--- @field AdsXFunction string @瞄准镜准星功能
--- @field AdsXScale string @瞄准镜准星底图缩放值
--- @field ScopeXPic string @瞄准镜准星贴图
--- @field AdsOffsetX string @瞄准偏移值
--- @field AdsOffsetY string @瞄准偏移值
--- @field AdsOffsetZ string @瞄准偏移值
--- @field FireType string @开火类型
--- @field DamageType string @伤害类型
--- @field TouReduce string @削刃值
--- @field HittedCameraAngle string @被击中抬头反馈
--- @field Range string @射程
--- @field DecayStart string @衰减起始距离
--- @field DecayFinish string @衰减结束距离
--- @field DecayMin string @衰减最小值
--- @field DecayLiquid string @液体衰减系数
--- @field HipSpreadMin string @腰射散布最小值
--- @field HipSpreadStep string @腰射散布步长
--- @field HipSpreadMax string @腰射散布最大值
--- @field HipSpreadType string @腰射散布类型
--- @field AdsSpreadMin string @瞄准散布最小值
--- @field AdsSpreadStep string @瞄准散布步长
--- @field AdsSpreadMax string @瞄准散布最大值
--- @field AdsSpreadType string @瞄准散布类型
--- @field MoveSpreadBonus string @移动散布倍率
--- @field RunSpreadBonus string @疾跑散布倍率
--- @field ShiftSpreadBonus string @潜行散布倍率
--- @field ShiftMoveSpreadBonus string @潜行移动散布倍率
--- @field JumpSpreadBonus string @跳跃散布倍率
--- @field SpreadStepSpeed string @每发增加速度
--- @field SpreadResetSpeed string @重置速度
--- @field SpreadBonusResetSpeed string @重置速度
--- @field EquipTime string @切换枪械行为时间
--- @field AdsSwitchTime string @瞄准时间
--- @field ScopeMagnification string @瞄准倍率
--- @field ControlValue string @操控速度(仅取值)
--- @field HipAccValue string @腰射射击精度(仅取值)
--- @field RecoilValue string @后坐力控制(仅取值)
--- @field BaseDamageBonus string @基础伤害倍率
--- @field ReloadTimeBonus string @换弹时间倍率
--- @field RecoilBonus string @后坐力倍率
--- @field RecoilPitchBonus string @垂直后坐力倍率
--- @field RecoilYawBonus string @水平后坐力倍率
--- @field SpreadBonus string @散布倍率
--- @field SpreadHipBonus string @腰射散布倍率
--- @field SpreadAdsBonus string @瞄准散布倍率
--- @field HipMoveSpeedBonus string @腰射移动速度倍率
--- @field AdsMoveSpeedBonus string @瞄准移动速度倍率
--- @field AdsSwitchTimeBonus string @瞄准时间倍率
--- @field RpmBonus string @射速倍率
--- @field RangeBonus string @射程倍率
--- @field BulletId string @子弹ID(仅获取预制属性)
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

--- @class AreaCloneType @区域复制类型
--- @field IncludeAir number @复制 (含空气)
--- @field ExcludeAir number @复制 (不含空气)
--- @field IncludeAirAndMove number @移动 (含空气)
--- @field ExcludeAirAndMove number @移动 (不含空气)
local AreaCloneType = {}
_G.AreaCloneType = AreaCloneType

--- @class RolePickupType @角色举起类型
--- @field Carrying number @被举起
--- @field Carried number @被举起着
local RolePickupType = {}
_G.RolePickupType = RolePickupType