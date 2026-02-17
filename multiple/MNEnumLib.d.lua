---@class Mini @组件属性
---@field Number any @数值
---@field String any @字符串
---@field Bool any @布尔值
---@field Color any @颜色
---@field Vec3 any @位置
---@field MobType any @生物类型
---@field Block any @方块类型
---@field Item any @物品类型
---@field Effect any @特效类型
---@field Picture any @图片
---@field Buff any @状态
---@field Sound any @音效
---@field Model any @外观
local Mini = {}
_G['Mini'] = Mini

---@class WorldType @游戏模式
---@field Single any @单人模式
---@field Create any @多人创造模式
---@field Extremity any @极限模式
---@field CreateToRungame any @由创造模式转的生存
---@field Gamemaker any @自制玩法的编辑模式
---@field GamemakerRun any @自制玩法的运行模式
---@field Freemode any @冒险模式之自由模式
---@field Record any @录像模式
local WorldType = {}
_G['WorldType'] = WorldType

---@class MobType @生物类型
---@field Hostile any @怪物
---@field Passive any @动物
---@field Rare any @稀有生物
---@field Water any @水生物
---@field Fly any @飞行生物
---@field Trixenie any @三栖生物
local MobType = {}
_G['MobType'] = MobType

---@class TerrainType @游戏地形
---@field Flat any @平坦地形
---@field Normal any @随机地形
local TerrainType = {}
_G['TerrainType'] = TerrainType

---@class CameraEditState @自定义视角编辑状态
---@field Null any @空
---@field Edit any @编辑
---@field Test any @测试
local CameraEditState = {}
_G['CameraEditState'] = CameraEditState

---@class EquipSlotType @装备部位类型
---@field Head any @头部
---@field Breast any @身体
---@field Legging any @腿部
---@field Shoe any @脚部
---@field Pifeng any @披风
---@field Weapon any @武器
---@field Custom1 any @自定义1
---@field Custom2 any @自定义2
---@field Custom3 any @自定义3
---@field MaxSlots any @最大装备栏 **(用于判断有效性)**
local EquipSlotType = {}
_G['EquipSlotType'] = EquipSlotType

---@class TeamResults @游戏战斗结果
---@field None any @胜负未定
---@field Win any @胜利
---@field Lose any @失败
---@field Dogfall any @平局
local TeamResults = {}
_G['TeamResults'] = TeamResults

---@class BackpackType @背包类型
---@field Shorttcut any @快捷栏
---@field Inventory	any @存储栏
---@field Equip any @装备栏
---@field Extend any @扩展背包
local BackpackType = {}
_G['BackpackType'] = BackpackType

---@class BackpackBeginIndex @背包起始索引
---@field Shortcut any @快捷栏起始索引
---@field Inventory any @存储栏起始索引
---@field Equip any @装备栏起始索引
---@field ExtBackpack any @扩展背包起始索引
local BackpackBeginIndex = {}
_G['BackpackBeginIndex'] = BackpackBeginIndex

---@class FaceDir @朝向
---@field NegX any @X反方向 - 西
---@field PosX any @X正方向 - 东
---@field NegZ any @Z反方向 - 南
---@field PosZ any @Z正方向 - 北
---@field NegY any @Y反方向 - 下
---@field PosY any @Y正方向 - 上
local FaceDir = {}
_G['FaceDir'] = FaceDir

---@class FaceType @朝向类型
---@field Yaw any @面朝方向
---@field Pitch any @面仰角
local FaceType = {}
_G['FaceType'] = FaceType

---@class CreatureAttr @生物属性枚举
---@field MaxHp any @最大生命值
---@field CurHp any @当前生命值
---@field HpRecover any @生命恢复
---@field MaxHunger any @最大饥饿值
---@field CurHunger any @当前饥饿值
---@field CurOxygen any @当前氧气值
---@field WalkSpeed any @移动速度
---@field SwinSpeed any @游泳速度
---@field JumpPower any @跳跃力
---@field Dodge any @闪避率
---@field AtkMelee any @近战攻击
---@field AtkRemote any @远程攻击
---@field DefMelee any @近战防御
---@field DefRemote any @远程防御
---@field Dimension any @模型大小
---@field Level any @等级
---@field DefChaos any @混乱防御
---@field PackSize any @背包空间
---@field ViewDistance any @视野距离
---@field BodyLerpSpeed any @转身速度
---@field AtkPhysical any @物理攻击
---@field AtkMagic any @元素攻击
---@field DefPhysical any @物理防御
---@field DefMagic any @元素防御
---@field ExtraHp any @临时生命值
---@field Toughness any @韧性值
---@field FlySpeed any @飞行速度
---@field ViewDis any @视野范围
---@field AttackDis any @攻击距离
---@field Atk any @攻击力
---@field EnableMove any @可移动
---@field EnableAttack any @可攻击
---@field EnableBeattacked any @可被攻击
---@field EnableBekilled any @可被杀死
---@field EnablePickup any @可拾取道具
---@field EnableDeathdropitem any @死亡掉落
local CreatureAttr = {}
_G['CreatureAttr'] = CreatureAttr

---@class RoleAttr @生物/玩家属性枚举
---@field MaxHp any @最大生命值
---@field CurHp any @当前生命值
---@field HpRecover any @生命恢复
---@field MaxHunger any @饥饿度
---@field CurHunger any @饥饿度
---@field MaxOxygen any @最大氧气值
---@field CurOxygen any @当前氧气值
---@field WalkSpeed any @移动速度
---@field RunSpeed any @奔跑速度
---@field SwinSpeed any @游泳速度
---@field JumpPower any @跳跃力
---@field Gravity any @重力值
---@field PunchArmor any @近战防御
---@field RangeArmor any @远程防御
---@field LevelExp any @星星经验
---@field StarNum any @星星数量
---@field CurStrength any @当前体力值
---@field MaxStrength any @当前最大体力值
---@field FlySpeed any @飞行速度
---@field AttackDis any @攻击距离
---@field ViewDis any @视野距离
---@field Atk any @攻击力
local RoleAttr = {}
_G['RoleAttr'] = RoleAttr

---@class ItemAbility @道具设置枚举
---@field Throw any @道具不可丢弃
---@field Drop any @道具不可掉落
local ItemAbility = {}
_G['ItemAbility'] = ItemAbility

---@class CreatureMotion @生物行为枚举
---@field Idle any @空闲
---@field Standby any @待机
---@field Stroll any @闲逛
---@field AtkMelee any @近战攻击
---@field AtkRemote any @远程攻击
---@field Follow any @跟随
---@field Swim any @游泳
---@field RunAway any @逃跑
---@field SelfBomb any @自爆
---@field Beattracted any @被吸引
---@field Copulation any @交配
local CreatureMotion = {}
_G['CreatureMotion'] = CreatureMotion

---@class PlayerMotion @玩家行为枚举
---@field Static any @静止
---@field Walk any @行走
---@field Run any @奔跑
---@field Jump any @跳跃
---@field JumpTwice any @二段跳
---@field Sneak any @潜行
---@field FallGround any @落地
---@field Swim any @游泳
local PlayerMotion = {}
_G['PlayerMotion'] = PlayerMotion

---@class RoleMotion @角色行为枚举
---@field Stand any @站立
---@field Walk any @行走
---@field Run any @奔跑
---@field Jump any @跳跃
---@field Sneak any @潜行
---@field FallGround any @落地
---@field Swim any @游泳
local RoleMotion = {}
_G['RoleMotion'] = RoleMotion

---@class HurtType @伤害类型枚举
---@field All any @所有伤害（只设置免疫伤害接口有效）
---@field Melee any @近战伤害 attack_punch
---@field Remote any @远程伤害 attack_range
---@field Bomb any @爆炸伤害 attack_explode
---@field Burning any @燃烧伤害 attack_fire
---@field Toxin any @毒素伤害 attack_poison
---@field Wither any @凋零伤害 attack_wither
---@field Flash any @电元素伤害 attack_flash
---@field Sun any @日晒 attack_sun
---@field Fall any @跌落伤害 attack_falling
---@field Anvil any @被砸中伤害 attack_anvil
---@field Cactus any @仙人掌伤害 attack_cactus
---@field Asphyxia any @窒息伤害 attack_wall
---@field Drown any @溺水伤害 attack_drown
---@field Suffocate any @水下生物在空气中窒息伤害 attack_suffocate
---@field Antiinjury any @反伤 attack_antiinjury
---@field Laser any @被激光伤害 attack_block_laser
---@field Ice any @冰元素伤害 attack_ice
---@field Fixed any @固定伤害 attack_fixed
local HurtType = {}
_G['HurtType'] = HurtType

---@class TeamAttr @队伍属性枚举
---@field PlayerNum any @玩家数量
---@field Score any @分数
local TeamAttr = {}
_G['TeamAttr'] = TeamAttr

---@class BlockAttr @方块属性枚举
---@field ExplodeResistance any @爆炸抗性
---@field Hardness any @硬度
---@field Glissade any @滑行惯性
---@field BurningSpeed any @燃烧速度
---@field BurningProbability any @燃烧几率
---@field Lightness any @亮度
local BlockAttr = {}
_G['BlockAttr'] = BlockAttr

---@class BlockLimits @方块权限
---@field EnableDestroyed any @可破坏
---@field EnableBeoperated any @可操作
---@field EnableBepushed any @可被推动
---@field EnableDropItem any @可掉落道具
---@field BepushedDropItem any @被推动掉落
local BlockLimits = {}
_G['BlockLimits'] = BlockLimits

---@class BlockStatus @方块状态
---@field Active any @活跃 **(被激活)**
---@field Inactive any @不活跃 **(未被激活)**
local BlockStatus = {}
_G['BlockStatus'] = BlockStatus

---@class GroupWeatherType @天气状态枚举,局部天气
---@field ShineAndRain integer @晴雨交替
---@field Shine integer @晴天
---@field Rain integer @雨天
---@field Thunder integer @雷暴
---@field Bad integer @恶劣天气
---@field Snow integer @雪天
---@field Sandduststorm integer @沙尘暴
---@field Tempest integer @暴风雨
---@field Blizzard integer @暴风雪
local GroupWeatherType = {}
_G['GroupWeatherType'] = GroupWeatherType

---@class WeatherGroup @地形组枚举值
---@field Global integer @全局对象
---@field Common integer @常见组
---@field Ocean integer @海洋组
---@field Desert integer @沙漠组
---@field Frigidzone integer @普通寒带组
---@field Coldzone integer @高峰寒带组
---@field Volcano integer @火山组
---@field Nunja integer @湿地组
---@field Plain integer @平坦组
---@field AirIsland integer @空岛组
local WeatherGroup = {}
_G['WeatherGroup'] = WeatherGroup

---@class ViewPortType @视口方向
---@field Main integer @主视角
---@field Back integer @背视角
---@field Front integer @正视角
---@field Back2 integer @背视角2
---@field Top integer @俯视角
---@field Custom integer @自定义视角
local ViewPortType = {}
_G['ViewPortType'] = ViewPortType

---@class VarType @变量类型
---@field Pos integer @位置
---@field Areains integer @区域
---@field Number integer @数值
---@field String integer @字符串
---@field Boolean integer @布尔值
---@field Player integer @玩家
---@field PlayerGroup integer @玩家组
---@field BlockType integer @方块类型
---@field ItemType integer @道具类型
---@field Creature integer @生物
---@field CreatureType integer @生物类型
---@field CreatureGroup integer @生物组
---@field Timer integer @定时器
---@field EffectType integer @特效类型
---@field PosGroup integer @位置组
---@field AreaGroup integer @区域组
---@field NumberGroup integer @数值组
---@field StringGroup integer @字符串组
---@field BooleanGroup integer @布尔值组
---@field BlockTypeGroup integer @方块类型组
---@field ItemTypeGroup integer @道具类型组
---@field CreatureTypeGroup integer @生物类型组
---@field TimerGroup integer @计时器组
---@field EffectTypeGroup integer @特效类型组
---@field SortedData integer @有序列表
---@field ListData integer @无需列表
---@field Map integer @kv map表
---@field Table integer @二维表
---@field Blueprint integer @蓝图
---@field Object integer @对象
---@field ObjectGroup integer @对象组
---@field Projectile integer @投射物
---@field ProjectileGroup integer @投射物组
---@field DropItem integer @掉落物
---@field DropItemGroup integer @掉落物组
---@field Element integer @元件
---@field ElementGroup integer @元件组
---@field Texture integer @纹理
---@field TextureGroup integer @纹理组
---@field Role integer @角色
---@field RoleGroup integer @角色组
---@field BuffType integer @buff类型
---@field BuffTypeGroup integer @buff类型组
---@field Sound integer @声音
---@field SoundGroup integer @声音组
---@field Model integer @模型
---@field ModelGroup integer @模型组
---@field Entity integer @实体
---@field EntityGroup integer @实体组
---@field EntityType integer @实体类型
---@field EntityTypeGroup integer @实体类型组
local VarType = {}
_G['VarType'] = VarType

---@class WorkeStage @强制打开工作台枚举
---@field Craft integer @工具箱
---@field Repair integer @修理台
---@field Enchant integer @附魔台
local WorkeStage = {}
_G['WorkeStage'] = WorkeStage

---@class GraphicsType @图文信息枚举
---@field Hornbook integer @文字板
---@field Suspendbook integer @漂浮文字
---@field Progress integer @进度条
---@field ArrowPos integer @箭头 指向位置
---@field ArrowActor integer @箭头 指向生物
---@field LinePos integer @线 指向位置
---@field LineActor integer @线 指向生物
---@field SurfacePos integer @面 指向界面
---@field SurfaceActor integer @面 指向生物
---@field Image integer @图片
local GraphicsType = {}
_G['GraphicsType'] = GraphicsType

---@class SortType @排序方式
---@field Up integer @升序,
---@field Down integer @降序,
local SortType = {}
_G['SortType'] = SortType

---@class MoveType @移动方式
---@field Walking integer @行走,
---@field Flying integer @飞行,
---@field Swimming integer @游泳,
---@field Auto integer @自动调整
local MoveType = {}
_G['MoveType'] = MoveType

---@class ViedoPlayMode @显示板视频播放模式
---@field Repeat integer @循环播放
---@field Once integer @单次播放
local ViedoPlayMode = {}
_G['ViedoPlayMode'] = ViedoPlayMode

---@class EventDate @时间值枚举
---@field Year integer @年
---@field Month integer @月
---@field Day integer @日
---@field Hour integer @时
---@field Minute integer @分
---@field Second integer @秒
---@field Timestamp integer @时间戳
---@field Dayofweek integer @星期几
local EventDate = {}
_G['EventDate'] = EventDate

---@class ItemAttr @道具属性
---@field Attack integer @攻击力
---@field Stackmax integer @叠加数
---@field ShortDefense integer @近战防御
---@field LongDefense integer @远程防御
---@field ExplodeDefense integer @爆炸防御
---@field FireDefense integer @燃烧防御
---@field PoisonDefense integer @毒素防御
---@field WitherDefense integer @混乱防御
---@field Duration integer @耐久度
---@field FireInterval integer @射击间隔
---@field Magazines integer @弹夹量
---@field Quality integer @品质
---@field ItemType integer @道具类型
local ItemAttr = {}
_G['ItemAttr'] = ItemAttr

---@class DropMode @掉落物掉落方式
---@field DiscardItem integer @丢弃道具
---@field DestroyBox integer @箱子被破坏掉落
---@field DefeatMob integer @生物被击败掉落
---@field DestroyBlock integer @方块被破坏掉落
---@field SpawnItem integer @触发器创建
---@field ChangePlayMode integer @掉落物对象转玩法创建
local DropMode = {}
_G['DropMode'] = DropMode

---@class AnimMode @动作播放方式
---@field Loop integer @循环播放
---@field Once integer @播放一次
---@field OnceStop integer @播放一次完毕,停在末尾
---@field Default integer @表格默认值播放
local AnimMode = {}
_G['AnimMode'] = AnimMode

---@class Easing @线性变换
---@field None integer @无动画
---@field Linear integer @直线变换
---@field QuadIn integer @平方曲线1渐入
---@field QuadOut integer @平方曲线2渐出
---@field QuadInOut integer @平方曲线3进出
---@field ExpoIn integer @指数曲线1渐入
---@field ExpoOut integer @指数曲线2渐出
---@field ExpoInOut integer @指数曲线3进出
---@field CircIn integer @圆曲线1渐入
---@field CircOut integer @圆曲线2渐出
---@field CircInOut integer @圆曲线3进出
---@field ElasticIn integer @弹簧曲线1渐入
---@field ElasticOut integer @弹簧曲线2渐出
---@field ElasticInOut integer @弹簧曲线3进出
---@field BackIn integer @回退曲线1渐入
---@field BackOut integer @回退曲线2渐出
---@field BackInOut integer @回退曲线3进出
---@field BounceIn integer @弹跳曲线1渐入
---@field BounceOut integer @弹跳曲线1渐出
---@field BounceInOut integer @弹跳曲线1进出
local Easing = {}
_G['Easing'] = Easing

---@class SkyboxMap @天空盒贴图
---@field Sky integer @天空贴图
---@field Sun integer @太阳贴图
---@field Moon integer @月亮贴图
local SkyboxMap = {}
_G['SkyboxMap'] = SkyboxMap

---@class SkyboxColor @天空盒颜色
---@field Top integer @天空顶部颜色
---@field Middle integer @天空腰部颜色
---@field Bottom integer @天空底部颜色
---@field Light integer @天空光照颜色
---@field Env integer @环境光颜色
---@field Sun integer @太阳颜色
---@field Moon integer @月亮颜色
---@field Cloud integer @云颜色
---@field Fog integer @雾颜色
local SkyboxColor = {}
_G['SkyboxColor'] = SkyboxColor

---@class SkyboxAttr @天空盒参数
---@field SunScale integer @太阳大小
---@field MoonScale integer @月亮大小
---@field StarDensity integer @星星密度
---@field CloudSpeed integer @云的运动速度
---@field CloudDensity integer @云的密度
---@field CloudHigh integer @云的高度
---@field FogreMinDis integer @雾的最近距离
---@field FogreMaxDis integer @雾的最远距离
---@field Template integer @模板
local SkyboxAttr = {}
_G['SkyboxAttr'] = SkyboxAttr

---@class SkyboxParticle @天空盒环境粒子参数
---@field Strength integer @强度
---@field Range integer @范围
---@field Speed integer @速度
---@field Randomness integer @运动不规则度
local SkyboxParticle = {}
_G['SkyboxParticle'] = SkyboxParticle

---@class SkyboxFilter @天空盒滤镜参数
---@field Contrast integer @对比度
---@field Saturation integer @饱和度
---@field Flood integer @泛光强度
---@field Exposure integer @曝光强度
---@field Volumelight integer @体积光强度
---@field Gamma integer @伽马强度
---@field Dof integer @景深强度-暂时没用到
---@field Color integer @滤镜颜色
---@field Lut integer @色彩校正
---@field Template integer @滤镜模板
local SkyboxFilter = {}
_G['SkyboxFilter'] = SkyboxFilter

---@class SkyboxSwitch @天空盒开关
---@field Fogenable integer @雾开关
local SkyboxSwitch = {}
_G['SkyboxSwitch'] = SkyboxSwitch

---@class CameraModel @摄像机属性
---@field MoveFollow integer @跟随角色移动
---@field RotateFollow integer @跟随角色旋转
---@field Autoindent integer @阻挡后自动缩进
---@field RelativeRotate integer @相对人物旋转
---@field RoleTranslucent integer @角色半透
local CameraModel = {}
_G['CameraModel'] = CameraModel

---@class CameraRotate @摄像机旋转模式
---@field AllDir integer @全方向
---@field OnlyYaw integer @仅左右
---@field OnlyPitch integer @仅上下
---@field NoTurn integer @无法转动
local CameraRotate = {}
_G['CameraRotate'] = CameraRotate

---@class AbsoluteCampType @绝对阵营
---@field Noteam integer @无队伍
---@field Team1 integer @队伍1
---@field Team2 integer @队伍2
---@field Team3 integer @队伍3
---@field Team4 integer @队伍4
---@field Team5 integer @队伍5
---@field Team6 integer @队伍6
---@field TeamNpc1 integer @绝对阵营-npc队伍1
---@field TeamNpc2 integer @绝对阵营-npc队伍2
---@field TeamNpc3 integer @绝对阵营-npc队伍3
---@field Enemy integer @中立敌对
---@field Passive integer @中立被动
local AbsoluteCampType = {}
_G['AbsoluteCampType'] = AbsoluteCampType

---@class RelativeCampType @相对阵营
---@field Friendly integer @友方
---@field Enemy integer @敌方
---@field Neutral integer @中立
---@field Any integer @任意
local RelativeCampType = {}
_G['RelativeCampType'] = RelativeCampType

---@class InnerPopUpview @游戏内弹窗界面类型
---@field CollectMaps integer @收藏地图界面
---@field EvaluateMaps integer @评价地图界面
---@field InviteFriend integer @邀请好友界面
---@field StorageBox integer @储物箱界面
---@field ItemTips integer @道具提示界面
---@field BuffStatus integer @状态界面
---@field Specialty integer @特长界面
---@field ItemProcessing integer @道具加工界面
---@field BackPackTask integer @背包任务界面
---@field BackPackEra integer @背包科技界面
---@field BackPackRole integer @背包角色界面
local InnerPopUpview = {}
_G['InnerPopUpview'] = InnerPopUpview

---@class MiniCurrency @货币类型
---@field MiniBean integer @迷你豆
---@field MiniCoin integer @迷你币
---@field MiniPoint integer @迷你点
local MiniCurrency = {}
_G['MiniCurrency'] = MiniCurrency

---@class MiniShopPage @开发者商店页面类型
---@field Item integer @道具购买
---@field Skin integer @皮肤
---@field Convert integer @兑换
---@field Welfare integer @福利
---@field MiniVip integer @大会员
---@field WareHouse integer @打开仓库
---@field CustomCoin integer @打开自定义货币界面
local MiniShopPage = {}
_G['MiniShopPage'] = MiniShopPage

---@class PixelUnits @像素单位
---@field Percentage integer @百分比
---@field Value integer @绝对值
local PixelUnits = {}
_G['PixelUnits'] = PixelUnits

---@class HorizontalOffset @水平偏移
---@field Left integer @居左
---@field Centered integer @居中
---@field Right integer @居右
local HorizontalOffset = {}
_G['HorizontalOffset'] = HorizontalOffset

---@class VerticalOffset @垂直偏移
---@field Top integer @居上
---@field Centered integer @居中
---@field Bottom integer @居下
local VerticalOffset = {}
_G['VerticalOffset'] = VerticalOffset

---@class ElementType @元件类型
---@field Texture integer @图片
---@field Button integer @按钮
---@field Text integer @文本
---@field InputText integer @输入框
---@field Loader3D integer @3d装载器
---@field SlidingContainer integer @滑动容器
local ElementType = {}
_G['ElementType'] = ElementType

---@class CustomModType @插件类型
---@field Block integer @方块插件 预制
---@field Monster integer @生物插件
---@field Item integer @道具插件
---@field Recipe integer @配方插件
---@field Furnace integer @熔炼插件
---@field Status integer @状态插件
---@field Biome integer @地形插件
---@field Actor integer @实体
---@field UI integer @UI
---@field Rule integer @世界规则
local CustomModType = {}
_G['CustomModType'] = CustomModType

---@class WeatherType @天气类型
---@field None integer @无天气
---@field Sunshine integer @晴天
---@field Rain integer @雨天
---@field Sandstorm integer @沙尘暴
---@field Snow integer @雪天
---@field UnderWater integer @暴雨
---@field Volcano integer @火山
---@field Custom integer @自定义
local WeatherType = {}
_G['WeatherType'] = WeatherType

---@class KeyCode @按键枚举
---@field A integer @按键A
---@field D integer @按键D
---@field W integer @按键W
---@field K integer @按键K
---@field I integer @按键I
---@field J integer @按键J
---@field L integer @按键L
---@field N integer @按键N
---@field Q integer @按键Q
---@field E integer @按键E
---@field U integer @按键U
---@field V integer @按键V
---@field F integer @按键F
---@field Z integer @按键Z
---@field Y integer @按键Y
---@field X integer @按键X
---@field G integer @按键G
---@field T integer @按键T
---@field B integer @按键B
---@field R integer @按键R
---@field P integer @按键P
---@field O integer @按键O
---@field C integer @按键C
---@field S integer @按键S
---@field M integer @按键M
---@field H integer @按键H
---@field Space integer @按键空格
---@field Shift integer @按键Shift
---@field Number0 integer @按键0
---@field Number1 integer @按键1
---@field Number2 integer @按键2
---@field Number3 integer @按键3
---@field Number4 integer @按键4
---@field Number5 integer @按键5
---@field Number6 integer @按键6
---@field Number7 integer @按键7
---@field Number8 integer @按键8
---@field Number9 integer @按键9
local KeyCode = {}
_G['KeyCode'] = KeyCode

---@class ProgressImg @进度图案
---@field Background integer @进度背景
---@field Progress integer @进度值
local ProgressImg = {}
_G['ProgressImg'] = ProgressImg

---@class RayDetectType @射线检测返回类型
---@field Block integer @方块类型
---@field Player integer @玩家
---@field Actor integer @生物
---@field ActorType integer @生物类型
---@field LiquidBlock integer @液体方块类型
local RayDetectType = {}
_G['RayDetectType'] = RayDetectType

---@class PlayerBodyUIHight @获取玩家内部控件高度
---@field Nick integer @昵称
---@field Title integer @称号
---@field EffEct integer @头部动效
---@field HpBar integer @血条
local PlayerBodyUIHight = {}
_G['PlayerBodyUIHight'] = PlayerBodyUIHight

---@class UIScollDir @UI滑动方向
---@field Horizontal integer @水平滑动
---@field Vertical integer @垂直滑动
---@field Both integer @自由滑动
local UIScollDir = {}
_G['UIScollDir'] = UIScollDir

---@class TurnFaceDir @角度朝向
---@field Yaw integer @水平朝向
---@field Pitch integer @垂直朝向
local TurnFaceDir = {}
_G['TurnFaceDir'] = TurnFaceDir

---@class ProgressVal @进度值类型
---@field Min integer @最小值
---@field Max integer @最大值
---@field Current integer @当前值
---@field CurAndMax integer @当前值和最大值
local ProgressVal = {}
_G['ProgressVal'] = ProgressVal

---@class SkyboxTime @天空盒时间
---@field Current integer @当前时间
---@field Time0 integer @天空盒0点
---@field Time4 integer @天空盒4点
---@field Time6 integer @天空盒6点
---@field Time8 integer @天空盒8点
---@field Time12 integer @天空盒12点
---@field Time16 integer @天空盒16点
---@field Time18 integer @天空盒18点
---@field Time20 integer @天空盒20点
---@field TimeAll integer @所有时间段
local SkyboxTime = {}
_G['SkyboxTime'] = SkyboxTime

---@class GunState @枪械状态
---@field Entry integer @进入
---@field Exit integer @离开
local GunState = {}
_G['GunState'] = GunState

---@class GunAction @枪械触发事件类型
---@field Equip integer @举枪
---@field Idle integer @腰射待机
---@field Fire integer @腰射开火
---@field Load integer @腰射手动上膛
---@field Run integer @持枪冲刺
---@field Aim integer @瞄准待机
---@field AimFire integer @瞄准开火
---@field AimLoad integer @瞄准手动上膛
---@field Reload integer @腰射换弹
---@field ReloadEmpty integer @腰射空仓换弹
---@field Inspect integer @检视
local GunAction = {}
_G['GunAction'] = GunAction

---@class GunActionBan @枪械禁用类型
---@field Equip integer @举枪
---@field Fire integer @腰射开火
---@field Load integer @腰射手动上膛
---@field Run integer @持枪冲刺
---@field Aim integer @瞄准待机
---@field AimFire integer @瞄准开火
---@field AimLoad integer @瞄准手动上膛
---@field Reload integer @腰射换弹
---@field ReloadEmpty integer @腰射空仓换弹
---@field Inspect integer @检视
local GunActionBan = {}
_G['GunActionBan'] = GunActionBan

---@class Ability @动作总开关
---@field Movement integer @移动能力总开关
---@field Walking integer @行走
---@field Flying integer @飞行
---@field Swimming integer @游泳
---@field Sneaking integer @潜行
---@field Sprinting integer @疾跑
---@field Jumping integer @跳跃
---@field Cube integer @方块能力总开关
---@field Interaction integer @交互方块
---@field Place integer @摆放方块
---@field Break integer @破坏方块
---@field Item integer @道具能力总开关
---@field Use integer @使用道具
---@field Pick integer @拾取道具
---@field Drop integer @丢弃道具
---@field Attack integer @普通攻击
---@field CanBePickup integer @可被举起
---@field CanUseItemWhenBePickup integer @被举起时可否使用道具
---@field EnableBeattacked integer @可受伤
---@field EnableBekilled integer @可被杀死
---@field EnableDeathdropitem integer @杀死有掉落物
---@field EnableSwitchShortcut integer @可切换快捷栏
---@field EnableRotatingCamera integer @可旋转摄像机
local Ability = {}
_G['Ability'] = Ability

---@class LogLevel @输出日志等级
---@field Print integer @普通输出
---@field Warn integer @警告输出
---@field Error integer @错误输出
local LogLevel = {}
_G['LogLevel'] = LogLevel

---@class ErrorCode @错误码
---@field OK integer @成功
---@field FAILED integer @失败
---@field KV_UPDATE_GET integer @表安全更新拉取的返回码
---@field KV_UPDATE_SET integer @表安全更新设置的返回码
---@field KV_OP_CD_LMT integer @表设置CD超限
---@field KV_OP_QPM_LMT integer @表设置QPS/QPM超限
---@field KV_OP_NO_VAL integer @获取key不存在
local ErrorCode = {}
_G['ErrorCode'] = ErrorCode

---@class PickupActionType @举起动作类型
---@field Pickup integer @拾取
---@field Drop integer @放下
---@field Throw integer @投掷
---@field Unbind integer @解绑
local PickupActionType = {}
_G['PickupActionType'] = PickupActionType

---@class AreaFillType @区域填充类型
---@field Delete integer @删除
---@field Destroy integer @摧毁
local AreaFillType = {}
_G['AreaFillType'] = AreaFillType

---@class PlayerNameType @玩家内置UI类型
---@field Nick integer @昵称
---@field Title integer @称号
---@field EffEct integer @头部特效
local PlayerNameType = {}
_G['PlayerNameType'] = PlayerNameType

---@class GunFireType @开火类型
---@field Auto integer @全自动
---@field SemiAuto integer @半自动
---@field Manual integer @手动
local GunFireType = {}
_G['GunFireType'] = GunFireType

---@class GunDamageType @伤害类型
---@field Physics integer @物理伤害
---@field Fire integer @燃烧伤害
---@field Poison integer @毒素伤害
---@field Ice integer @冰冻伤害
local GunDamageType = {}
_G['GunDamageType'] = GunDamageType

---@class GunSpreadType @散布形状
---@field RightUp integer @右上
---@field Circle integer @圆
---@field NoRightDown integer @无右下
local GunSpreadType = {}
_G['GunSpreadType'] = GunSpreadType

---@class GunAttr @枪械属性
---@field BaseDamage integer @基础伤害
---@field RepelDistance integer @击退距离
---@field BulletShrapnel integer @弹片数量
---@field BulletConsume integer @消耗子弹数
---@field Penetration integer @穿透率
---@field HeadDamage integer @头部倍率
---@field BodyDamage integer @躯干倍率
---@field MaxAmmo integer @弹容量
---@field Rpm integer @射速(每分钟子弹数)
---@field ReloadPhase2Time integer @换弹行为时间
---@field ReloadPhase2TimeEmpty integer @空仓换弹行为时间
---@field GunLevel integer @枪械等级 历史遗留的字段,对于游戏本体只用于显示角标
---@field AdsXFunction integer @瞄准镜准星功能
---@field AdsXScale integer @瞄准镜准星底图缩放值
---@field ScopeXPic integer @瞄准镜准星贴图
---@field AdsOffsetX integer @瞄准偏移值
---@field AdsOffsetY integer @瞄准偏移值
---@field AdsOffsetZ integer @瞄准偏移值
---@field FireType integer @开火类型
---@field DamageType integer @伤害类型
---@field TouReduce integer @削刃值
---@field HittedCameraAngle integer @被击中抬头反馈
---@field Range integer @射程
---@field DecayStart integer @衰减起始距离
---@field DecayFinish integer @衰减结束距离
---@field DecayMin integer @衰减最小值
---@field DecayLiquid integer @液体衰减系数
---@field HipSpreadMin integer @腰射散布最小值
---@field HipSpreadStep integer @腰射散布步长
---@field HipSpreadMax integer @腰射散布最大值
---@field HipSpreadType integer @腰射散布类型
---@field AdsSpreadMin integer @瞄准散布最小值
---@field AdsSpreadStep integer @瞄准散布步长
---@field AdsSpreadMax integer @瞄准散布最大值
---@field AdsSpreadType integer @瞄准散布类型
---@field MoveSpreadBonus integer @移动散布倍率
---@field RunSpreadBonus integer @疾跑散布倍率
---@field ShiftSpreadBonus integer @潜行散布倍率
---@field ShiftMoveSpreadBonus integer @潜行移动散布倍率
---@field JumpSpreadBonus integer @跳跃散布倍率
---@field SpreadStepSpeed integer @每发增加速度
---@field SpreadResetSpeed integer @重置速度
---@field SpreadBonusResetSpeed integer @重置速度
---@field EquipTime integer @切换枪械行为时间
---@field AdsSwitchTime integer @瞄准时间
---@field ScopeMagnification integer @瞄准倍率
---@field ControlValue integer @操控速度(仅取值)
---@field HipAccValue integer @腰射射击精度(仅取值)
---@field RecoilValue integer @后坐力控制(仅取值)
---@field BaseDamageBonus integer @基础伤害倍率
---@field ReloadTimeBonus integer @换弹时间倍率
---@field RecoilBonus integer @后坐力倍率
---@field RecoilPitchBonus integer @垂直后坐力倍率
---@field RecoilYawBonus integer @水平后坐力倍率
---@field SpreadBonus integer @散布倍率
---@field SpreadHipBonus integer @腰射散布倍率
---@field SpreadAdsBonus integer @瞄准散布倍率
---@field HipMoveSpeedBonus integer @腰射移动速度倍率
---@field AdsMoveSpeedBonus integer @瞄准移动速度倍率
---@field AdsSwitchTimeBonus integer @瞄准时间倍率
---@field RpmBonus integer @射速倍率
---@field RangeBonus integer @射程倍率
---@field BulletId integer @子弹ID(仅获取预制属性)
local GunAttr = {}
_G['GunAttr'] = GunAttr

---@class BiomeType @怪物刷新地形枚举
---@field Sea integer @迷拉星浅海
---@field GrassLand integer @迷拉星草原
---@field Desert integer @迷拉星沙漠
---@field Forest integer @迷拉星森林
---@field Cliff integer @迷拉星峭壁
---@field Swamp integer @迷拉星沼泽
---@field ConiferousForest integer @迷拉星针叶林
---@field Jungle integer @迷拉星丛林
---@field IceSheet integer @迷拉星冰原
---@field FrozenSea integer @迷拉星冻洋
---@field FrozenRiver integer @迷拉星冻河
---@field RedSoil integer @迷拉星红土
---@field RedSoilShore integer @迷拉星红土海岸
---@field DesertHills integer @迷拉星沙漠山丘
---@field ForestHills integer @迷拉星森林山丘
---@field ConiferousForestHills integer @迷拉星针叶林山丘
---@field IceMountains integer @迷拉星冰山
---@field JungleHills integer @迷拉星丛林山丘
---@field River integer @迷拉星河流
---@field Beach integer @迷拉星沙滩
---@field CliffEdge integer @迷拉星峭壁边缘
---@field Earthcore integer @烈焰星熔岩之地
---@field Airland integer @迷拉星空岛
---@field Basin integer @迷拉星盆地
---@field BasinEdge integer @迷拉星盆地边缘
---@field BasinBamboo integer @迷拉星竹林盆地
---@field BasinPeach integer @迷拉星桃树盆地
---@field EyedStarGround integer @萌眼星地表
---@field EyedStarGroundHills integer @萌眼星山丘
---@field EyedStarGroundPlain integer @萌眼星祭坛平原
---@field EyedStarGroundMountain integer @萌眼星高山
---@field EyedStarGroundHills2 integer @萌眼星山丘2
---@field EyedStarAirlands integer @萌眼星空岛
---@field EyedStarAirlandsSub1 integer @萌眼星子空岛1
---@field EyedStarAirlandsSub2 integer @萌眼星子空岛2
---@field EyedStarAirlandsSub3 integer @萌眼星子空岛3
---@field EyedStarAirlandsSub4 integer @萌眼星子空岛4
---@field EyedStarAirlandsEdge integer @萌眼星空岛边缘
---@field RainForest integer @迷拉星雨林
---@field AirlandGround integer @迷拉星空岛地上
---@field AirlandAir integer @迷拉星空岛空中
---@field Volcano integer @迷拉星火山主峰
---@field VolcanoPlain integer @迷拉星火山平原
---@field VolcanoMountain integer @迷拉星火山山脉
---@field VolcanoRiver integer @迷拉星火山岩浆河
---@field VolcanoCore integer @迷拉星火山口
---@field DesertOasis integer @迷拉星沙漠绿洲
---@field DesertLake integer @迷拉星沙漠湖泊
---@field DeepSea integer @迷拉星深海
---@field IslandShoreDesert integer @迷拉星荒岛海岸
---@field IslandLandDesert integer @迷拉星荒岛岛心
---@field IslandShoreRedsoil integer @迷拉星红土岛海岸
---@field IslandLandRedsoil integer @迷拉星红土岛心
---@field IslandShoreReef integer @迷拉星珊瑚岛海岸
---@field IslandLandReef integer @迷拉星珊瑚岛岛心
---@field IceSheetConiferousForest integer @迷拉星覆雪针叶林
---@field IceSheetHighestPeak integer @迷拉星雪山主峰
---@field IceSheetSecondPeak integer @迷拉星雪山副峰
---@field IceSheetMountain integer @迷拉星雪山山脉
---@field IceSheetMountainSide integer @迷拉星雪山中部
---@field IceSheetPeakPlain integer @迷拉星雪山底部
---@field IceSheetSecondMountainSide integer @迷拉星雪山副峰中部
---@field IceSheetFrizebLake integer @迷拉星雪山冻湖
---@field Canyon integer @迷拉星峡谷
---@field CanyonEage integer @迷拉星峡谷边缘
---@field GrassLandArid integer @迷拉星干旱草原
---@field GrassLandDandelion integer @迷拉星草原蒲公英花海
---@field GrassLandRapeseed integer @迷拉星草原油菜花海
---@field ForestLavender integer @迷拉星森林薰衣草花海
---@field ForestFoxtail integer @迷拉星森林狗尾草海
---@field ForestChrysanth integer @迷拉星森林菊花花海
---@field BasinRice integer @迷拉星盆地稻田
---@field SwampRiverSide integer @迷拉星沼泽河畔
---@field AirlandShine integer @迷拉星粉蝶花空岛
---@field CliffPlum integer @迷拉星三角梅峭壁
---@field IslandLandTulip integer @迷拉星郁金香岛心
---@field IslandShoreTulip integer @迷拉星郁金香海岸
---@field City integer @迷拉星末日城镇
---@field DesertPopulusEuphratica integer @迷拉星沙漠胡杨林
---@field JungleBlueJacaranda integer @迷拉星丛林蓝花楹树林
---@field CliffMaple integer @迷拉星峭壁枫叶林
---@field CliffGinkgo integer @迷拉星峭壁银杏林
---@field PlainsLake integer @迷拉星草原湖泊
---@field BasinLake integer @迷拉星盆地湖泊
---@field ForestLake integer @迷拉星森林湖泊
---@field ConiferousForestLake integer @迷拉星针叶林湖泊
---@field RainForestLake integer @迷拉星雨林湖泊
---@field AirShipPlain integer @铁穹平原
---@field AirShipFleet integer @铁穹舰队
local BiomeType = {}
_G['BiomeType'] = BiomeType

---@class GridAttr @ItemId
---@field ItemNum integer @道具数量
---@field Durable integer @耐久度
---@field Toughness integer @韧性
local GridAttr = {}
_G['GridAttr'] = GridAttr

---@class VDistanceRange @视野距离
---@field Near integer @近
---@field Middle integer @中
---@field Far integer @远
---@field Further integer @更远
---@field Farthest integer @最远
local VDistanceRange = {}
_G['VDistanceRange'] = VDistanceRange

---@class ObjType @对象类型
---@field Entity integer @实体
---@field Mob integer @生物
---@field Player integer @玩家
---@field World integer @世界
---@field Block integer @方块
---@field UI integer @UI编辑界面
---@field Area integer @区域
---@field Projectile integer @投掷物对象
---@field Pos integer @位置
---@field DropItem integer @掉落物
local ObjType = {}
_G['ObjType'] = ObjType

---@class CmpProPermission @组件属性访问权限
---@field Public integer @公开
---@field Private integer @私有
---@field Read integer @只读
local CmpProPermission = {}
_G['CmpProPermission'] = CmpProPermission

---@class CmpUIPermission @组件属性预制面板显示控制
---@field Hide integer @隐藏
---@field Show integer @显示
local CmpUIPermission = {}
_G['CmpUIPermission'] = CmpUIPermission

---@class DeviceType @设备类型
---@field PC integer @PC端
---@field Android integer @安卓
---@field IOS integer @苹果
---@field Other integer @其他
local DeviceType = {}
_G['DeviceType'] = DeviceType

---@class MatchMode @标签匹配方式
---@field All any @全部匹配
---@field Any any @部分匹配
local MatchMode = {}
_G['MatchMode'] = MatchMode

---@class AvtPart @皮肤数据类型
---@field Body any @身体
---@field Head any @头部
---@field Face any @脸
---@field FaceOrnament any @脸装饰
---@field Jacket any @夹克
---@field HandOrnament any @手装饰
---@field Trousers any @裤子
---@field Shoe any @鞋子
---@field BackOrnament any @背装饰
---@field Footprint any @脚印
---@field Skin any @皮肤
---@field RightHand any @右手特效
---@field RightShoe any @右脚特效
---@field HeadEffect any @头部特效
---@field FaceEffect any @脸特效
---@field WholeBodyEffect any @全身特效
---@field HandEffect any @手特效
---@field TrailingEffect any @拖尾特效
---@field BgEffect any @背景特效
---@field WingEffect any @翅膀特效
---@field EquipHead any @装备头部
---@field EquipBreast any @装备胸部
---@field EquipLegging any @装备腿部
---@field EquipShoe any @装备鞋子
---@field EquipPifeng any @装备披风
---@field EquipWeapon any @装备武器
---@field EquipCustom1 any @装备扩展1
---@field EquipCustom2 any @装备扩展2
---@field EquipCustom3 any @装备扩展3
---@field Max any @最大值
local AvtPart = {}
_G['AvtPart'] = AvtPart

---@class ElementAttr @元件属性
---@field Name any @名称
---@field Id any @id
---@field Color any @颜色
---@field Text any @文本
---@field Transparency any @透明度
---@field Angle any @角度
---@field Visibility any @显示/隐藏状态
---@field Position any @位置
---@field Size any @尺寸
---@field ScrollPosition any @滚动容器位置
local ElementAttr = {}
_G['ElementAttr'] = ElementAttr

---@class UIAttr @界面属性
---@field Name any @名称
---@field Id any @id
---@field Visibility any @显示/隐藏状态
local UIAttr = {}
_G['UIAttr'] = UIAttr

---@class TouchState @触摸状态
---@field Begin any @按下
---@field End any @抬起
---@field Cancel any @取消
local TouchState = {}
_G['TouchState'] = TouchState

---@class MiniShopData @皮肤数据类型
---@field Skin any @皮肤
---@field Avt any @所有AVT
---@field Mount any @所有坐骑
local MiniShopData = {}
_G['MiniShopData'] = MiniShopData