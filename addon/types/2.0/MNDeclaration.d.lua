--- @class ErrorCode @错误码
--- @field OK number @正确返回
--- @field FAILED number @错误返回
local ErrorCode = {}
_G.ErrorCode = ErrorCode

--- @class WorldType @游戏模式
--- @field OWTYPE_SINGLE number @单人模式
--- @field OWTYPE_CREATE number @多人创造模式
--- @field OWTYPE_EXTREMITY number @极限模式
--- @field OWTYPE_CREATE_RUNGAME number @由创造模式转的生存
--- @field OWTYPE_GAMEMAKER number @自制玩法的编辑模式
--- @field OWTYPE_GAMEMAKER_RUN number @自制玩法的运行模式
--- @field OWTYPE_FREEMODE number @冒险模式之自由模式
--- @field OWTYPE_RECORD number @录像模式
local WorldType = {}
_G.WorldType = WorldType

--- @class TerrainType @游戏地形
--- @field TERRAIN_FLAT number @平坦地形
--- @field TERRAIN_NORMAL number @随机地形
local TerrainType = {}
_G.TerrainType = TerrainType

--- @class CameraEditState @自定义视角编辑状态
--- @field CAMERA_EDIT_STATE_NULL number @空
--- @field CAMERA_EDIT_STATE_EDIT number @编辑
--- @field CAMERA_EDIT_STATE_TEST number @测试
local CameraEditState = {}
_G.CameraEditState = CameraEditState

--- @class MAPMARK_TYPE @小地图绘图类型
--- @field MMARK_LINE number @线形标记
--- @field MMARK_RECTANGLE number @矩形标记
--- @field MMARK_CIRCLE number @圆形标记
local MAPMARK_TYPE = {}
_G.MAPMARK_TYPE = MAPMARK_TYPE

--- @class EQUIP_SLOT_TYPE @装备部位类型
--- @field EQUIP_HEAD number @头
--- @field EQUIP_BREAST number @身体
--- @field EQUIP_LEGGING number @腿
--- @field EQUIP_SHOE number @脚
--- @field EQUIP_PIFENG number @披风
--- @field EQUIP_WEAPON number @武器
--- @field MAX_EQUIP_SLOTS number @最大装备栏
local EQUIP_SLOT_TYPE = {}
_G.EQUIP_SLOT_TYPE = EQUIP_SLOT_TYPE

--- @class MODATTRIB_TYPE @附魔属性类型
--- @field MODATTR_MOVE_SPEED number @移动速度
--- @field MODATTR_SWIM_SPEED number @游泳速度
--- @field MODATTR_JUMP_SPEED number @往上跳的速度
--- @field MODATTR_ATTACK_PUNCH number @近程攻击别人时加成的百分比
--- @field MODATTR_ATTACK_RANGE number @远程攻击别人时加成的百分比
--- @field MODATTR_ATTACK_EXPLODE number @爆炸攻击别人时加成的百分比
--- @field MODATTR_ATTACK_FIRE number @火攻击别人时加成的百分比
--- @field MODATTR_ATTACK_POISON number @毒攻击别人时加成的百分比
--- @field MODATTR_ATTACK_WITHER number @混乱攻击别人时加成的百分比
--- @field MODATTR_ATTACK_PLAYER number @攻击玩家时加成的百分比
--- @field MODATTR_ATTACK_UNDEAD number @攻击亡灵时加成的百分比
--- @field MODATTR_ATTACK_ANIMAL number @攻击动物别人时加成的百分比
--- @field MODATTR_DAMAGED_PUNCH number @被近程攻击时加成的百分比
--- @field MODATTR_DAMAGED_RANGE number @被远程攻击时加成的百分比
--- @field MODATTR_DAMAGED_EXPLODE number @被爆炸攻击时加成的百分比
--- @field MODATTR_DAMAGED_FIRE number @被火攻击时加成的百分比
--- @field MODATTR_DAMAGED_POISON number @被毒攻击时加成的百分比
--- @field MODATTR_DAMAGED_WITHER number @被混乱攻击时加成的百分比
--- @field MODATTR_DAMAGED_FALLING number @高处掉下伤害加成的百分比
--- @field MODATTR_ARMOR_PUNCH number @近程护甲加点
--- @field MODATTR_ARMOR_RANGE number @远程护甲加点
--- @field MODATTR_ARMOR_EXPLODE number @爆炸护甲加点
--- @field MODATTR_DAMAGE_ABSORB number @吸收伤害
--- @field MODATTR_CRITICAL_HIT number @暴击伤害加成
--- @field MODATTR_KNOCK number @增加攻击别人的击退距离
--- @field MODATTR_KNOCK_RESIST number @减少击退距离
--- @field MODATTR_KNOCK_RESIST_PROB number @击退概率抵抗值, 0.2表示有20%概率不被击退
--- @field MODATTR_ACTOR_SCALE number @角色大小 0 - 1.0 只针对玩家对象有效
--- @field MODATTR_DIG_SPEED number @挖掘速度
--- @field MODATTR_LUCK_DIG number @挖掘幸运, 0.2表示增加20%掉落概率
--- @field MODATTR_LUCK_KILLMOB number @怪物掉落
--- @field MODATTR_VIEW_BRIGHT number @视野亮度 0 - 1.0
--- @field MODATTR_OXYGEN_SUPPLY number @氧气提供
--- @field MAX_MOB_MODATTR number @怪物最大附魔属性
--- @field MAX_MOD_ATTRIB number @最大附魔属性
--- @field MAX_PLAYER_MODATTR number @玩家最大附魔属性
local MODATTRIB_TYPE = {}
_G.MODATTRIB_TYPE = MODATTRIB_TYPE

--- @class TEAM_RESULTS @游戏战斗结果
--- @field TEAM_RESULTS_NONE number @胜负未定
--- @field TEAM_RESULTS_WIN number @胜利
--- @field TEAM_RESULTS_LOSE number @失败
--- @field TEAM_RESULTS_DOGFALL number @平局
local TEAM_RESULTS = {}
_G.TEAM_RESULTS = TEAM_RESULTS

--- @class GSOUND_TYPE @声音类型
--- @field GSOUND_DIG number @挖掘
--- @field GSOUND_DESTROY number @破坏
--- @field GSOUND_PLACE number @放置
--- @field GSOUND_FALLGROUND number @摔落
--- @field GSOUND_WALK number @行走
local GSOUND_TYPE = {}
_G.GSOUND_TYPE = GSOUND_TYPE

--- @class ACTORBODY_EFFECT @生物身体特效
--- @field BODYFX_HURT number @受伤
--- @field BODYFX_FIRE number @燃烧
--- @field BODYFX_PORTAL number @传送门
--- @field BODYFX_ACCUMFIRE number @火焰累积
--- @field BODYFX_DRAGONFIRE number @龙焰
--- @field BODYFX_DRAGONSUMMON number @龙召唤
--- @field BODYFX_TAME_SUCCEED number @驯服成功
--- @field BODYFX_TAME_FAILED number @驯服失败
--- @field BODYFX_TAME_FOOD number @驯服食物
--- @field BODYFX_TAME_NOFOOD number @无驯服食物
--- @field BODYFX_AI_NEEDREEDS number @AI需要物品
--- @field BODYFX_FEAR number @恐惧
--- @field BODYFX_ROLECOLLECT number @角色收集
--- @field BODYFX_ROLEJUMP number @角色跳跃
--- @field BODYFX_DEADPROTECT number @死亡保护
--- @field BODYFX_DRAGONDIE0 number @龙死亡0
--- @field BODYFX_DRAGONDIE1 number @龙死亡1
--- @field BODYFX_DRAGONDIE2 number @龙死亡2
--- @field BODYFX_HORSE_FLY number @马飞行
--- @field BODYFX_DISAPPEAR number @消失
--- @field BODYFX_HORSE_BENTENG number @马奔腾
--- @field BODYFX_DANCE number @跳舞
--- @field TOOLFX_JETPACK2 number @喷气背包
--- @field BODYFX_INTERACTION number @交互
--- @field HUDFX_HEADSHOT number @爆头
--- @field HUDFX_NORMALSHOT number @普通射击
--- @field BODYFX_MILKING number @挤奶
--- @field BODYFX_AI_ANGRY number @AI愤怒
--- @field BODYFX_AI_SLEEP number @AI睡眠
--- @field BODYFX_TRANSPORT number @运输
--- @field BODYFX_FORBIDDEN number @禁止
--- @field BODYFX_CONCEAL number @潜行
--- @field BODYFX_WEAPON_FIRE number @野人猎手武器上的火
--- @field BODYFX_DIZZY number @眩晕
--- @field BODYFX_MAKETROUBLE number @捣乱
--- @field BODYFX_TRAINMOVE number @火车移动
--- @field BODYFX_AI_HUNGRY number @饥饿
--- @field BODYFX_BALL_CHARGE number @蓄力踢球特效
--- @field BODYFX_BALL_SHOOT_RELEASE number @射球瞬间爆发特效
--- @field BODYFX_ENCH_FALL number @附魔速降
local ACTORBODY_EFFECT = {}
_G.ACTORBODY_EFFECT = ACTORBODY_EFFECT

--- @class OBJ_TYPE @游戏实例类型
--- @field OBJTYPE_PLAYER number @玩家
--- @field OBJTYPE_CREATURE number @生物(包含怪物、动物、NPC、BOSS等)
--- @field OBJTYPE_DROPITEM number @掉落物
--- @field OBJTYPE_MISSILE number @投掷物
local OBJ_TYPE = {}
_G.OBJ_TYPE = OBJ_TYPE

--- @class BACKPACK_TYPE @玩家背包类型
--- @field SHORTCUT number @快捷栏
--- @field INVENTORY number @存储栏
--- @field EQUIP number @装备栏
local BACKPACK_TYPE = {}
_G.BACKPACK_TYPE = BACKPACK_TYPE

--- @class BPACK_SINDEX @存储栏起始位
--- @field BACKPACK_START_INDEX number @背包栏
--- @field SHORTCUT_START_INDEX number @快捷栏
--- @field STORAGE_START_INDEX number @储物箱
--- @field EQUIP_START_INDEX number @装备栏
local BPACK_SINDEX = {}
_G.BPACK_SINDEX = BPACK_SINDEX

--- @class FACE_DIRECTION @玩家朝向
--- @field DIR_NOT_INIT number @未指定
--- @field DIR_NEG_X number @X反方向
--- @field DIR_POS_X number @X正方向
--- @field DIR_NEG_Z number @Z反方向
--- @field DIR_POS_Z number @Z正方向
--- @field DIR_NEG_Y number @Y反方向
--- @field DIR_POS_Y number @Y正方向
local FACE_DIRECTION = {}
_G.FACE_DIRECTION = FACE_DIRECTION

--- @class CREATUREATTR @生物属性枚举
--- @field MAX_HP number @最大生命值
--- @field CUR_HP number @当前生命值
--- @field HP_RECOVER number @生命恢复
--- @field MAX_HUNGER number @最大饥饿值
--- @field CUR_HUNGER number @当前饥饿值
--- @field MAX_OXYGEN number @最大氧气值
--- @field CUR_OXYGEN number @当前氧气值
--- @field RECOVER_OXYGEN number @氧气恢复速度
--- @field WALK_SPEED number @移动速度
--- @field RUN_SPEED number @奔跑速度
--- @field SWIN_SPEED number @游泳速度
--- @field JUMP_POWER number @跳跃力
--- @field WEIGHT number @重量
--- @field DODGE number @闪避率
--- @field ATK_MELEE number @近战攻击
--- @field ATK_REMOTE number @远程攻击
--- @field DEF_MELEE number @近战防御
--- @field DEF_REMOTE number @远程防御
--- @field DIMENSION number @模型大小
--- @field ATK_PHYSICAL number @物理攻击
--- @field ATK_MAGIC number @元素攻击
--- @field DEF_PHYSICAL number @物理防御
--- @field DEF_MAGIC number @元素防御
--- @field ENABLE_MOVE number @可移动
--- @field ENABLE_ATTACK number @可攻击
--- @field ENABLE_BEATTACKED number @可被攻击
--- @field ENABLE_BEKILLED number @可被杀死
--- @field ENABLE_PICKUP number @可拾取道具
--- @field ENABLE_DEATHDROPITEM number @死亡掉落
local CREATUREATTR = {}
_G.CREATUREATTR = CREATUREATTR

--- @class PLAYERATTR @玩家属性枚举
--- @field MAX_HP number @最大生命值
--- @field CUR_HP number @当前生命值
--- @field HP_RECOVER number @生命恢复
--- @field LIFE_NUM number @生命数
--- @field MAX_HUNGER number @最大饥饿值
--- @field CUR_HUNGER number @当前饥饿值
--- @field MAX_OXYGEN number @最大氧气值
--- @field CUR_OXYGEN number @当前氧气值
--- @field RECOVER_OXYGEN number @氧气恢复速度
--- @field WALK_SPEED number @移动速度
--- @field RUN_SPEED number @奔跑速度
--- @field SNEAK_SPEED number @潜行速度
--- @field SWIN_SPEED number @游泳速度
--- @field JUMP_POWER number @跳跃力
--- @field DODGE number @闪避率
--- @field ATK_MELEE number @近战攻击
--- @field ATK_REMOTE number @远程攻击
--- @field DEF_MELEE number @近战防御
--- @field DEF_REMOTE number @远程防御
--- @field DIMENSION number @大小
--- @field SCORE number @分数
--- @field LEVEL number @星星等级
--- @field CUR_LEVELEXP number @当前经验
--- @field CUR_LEVEL number @当前等级
--- @field CUR_STRENGTH number @当前体力值
--- @field MAX_STRENGTH number @当前最大体力值
--- @field STRENGTH_RECOVER number @当前体力值恢复速度
--- @field ATK_PHYSICAL number @物理攻击
--- @field ATK_MAGIC number @元素攻击
--- @field DEF_PHYSICAL number @物理防御
--- @field DEF_MAGIC number @元素防御
--- @field ENABLE_MOVE number @可移动
--- @field ENABLE_PLACEBLOCK number @可摆放方块
--- @field ENABLE_OPERATEBLOCK number @可操作方块
--- @field ENABLE_DESTROYBLOCK number @可破坏方块
--- @field ENABLE_USEITEM number @可使用道具
--- @field ENABLE_ATTACK number @可攻击
--- @field ENABLE_BEATTACKED number @可被攻击
--- @field ENABLE_BEKILLED number @可被杀死
--- @field ENABLE_PICKUP number @可拾取道具
--- @field ENABLE_DEATHDROPITEM number @死亡掉落
--- @field ENABLE_VEHICLEAUTOFORWARD number @载具自动前行
--- @field ENABLE_DISCARDITEM number @可丢弃道具
--- @field ITEM_DISABLE_THROW number @道具不可丢弃
--- @field ITEM_DISABLE_DROP number @道具不可掉落
local PLAYERATTR = {}
_G.PLAYERATTR = PLAYERATTR

--- @class CREATUREMOTION @生物行为枚举
--- @field IDLE number @空闲
--- @field STANDBY number @待机
--- @field STROLL number @闲逛
--- @field ATK_MELEE number @近战攻击
--- @field ATK_REMOTE number @远程攻击
--- @field FOLLOW number @跟随
--- @field SWIM number @游泳
--- @field RUN_AWAY number @逃跑
--- @field SELF_BOMB number @自爆
--- @field BEATTRACTED number @被吸引
--- @field COPULATION number @交配
local CREATUREMOTION = {}
_G.CREATUREMOTION = CREATUREMOTION

--- @class PLAYERMOTION @玩家行为枚举
--- @field STATIC number @静止
--- @field WALK number @行走
--- @field RUN number @奔跑
--- @field JUMP number @跳跃
--- @field JUMP_TWICE number @二段跳
--- @field SNEAK number @潜行
--- @field FALL_GROUND number @落地
--- @field TURNBACK number @转身(已取消)
--- @field UP number @上升(已取消)
--- @field DOWN number @下降(已取消)
--- @field FALL number @下落(已取消)
local PLAYERMOTION = {}
_G.PLAYERMOTION = PLAYERMOTION

--- @class TEAMATTR @队伍属性枚举
--- @field PLAYER_NUM number @玩家数量
--- @field SCORE number @分数
local TEAMATTR = {}
_G.TEAMATTR = TEAMATTR

--- @class HURTTYPE @伤害类型枚举
--- @field MELEE number @近战伤害
--- @field REMOTE number @远程伤害
--- @field BOMB number @爆炸伤害
--- @field BURNING number @燃烧伤害
--- @field TOXIN number @毒素伤害
--- @field WITHER number @混乱伤害
--- @field SUN number @日晒
--- @field FALL number @跌落伤害
--- @field ANVIL number @被砸中伤害
--- @field CACTUS number @仙人掌伤害
--- @field ASPHYXIA number @窒息伤害
--- @field DROWN number @溺水伤害
--- @field SUFFOCATE number @水下生物在空气中窒息伤害
--- @field ANTIINJURY number @反伤
--- @field LASER number @被激光伤害
--- @field MAGIC number @元素伤害
--- @field PHYSICS number @物理伤害
local HURTTYPE = {}
_G.HURTTYPE = HURTTYPE

--- @class BLOCKATTR @方块属性枚举
--- @field EXPLODE_RESISTANCE number @爆炸抗性
--- @field HARDNESS number @硬度
--- @field GLISSADE number @滑行惯性
--- @field BURNING_SPEED number @燃烧速度
--- @field BURNING_PROBABILITY number @燃烧几率
--- @field LIGHTNESS number @亮度
--- @field ENABLE_DESTROYED number @可破坏
--- @field ENABLE_BEOPERATED number @可操作
--- @field ENABLE_BEPUSHED number @可被推动
--- @field ENABLE_DROPITEM number @可掉落道具
--- @field BEPUSHED_DROPITEM number @被推动掉落
local BLOCKATTR = {}
_G.BLOCKATTR = BLOCKATTR

--- @class BLOCKSTATUS @方块状态
--- @field ACTIVE number @活跃(被激活)
--- @field INACTIVE number @不活跃(未被激活)
local BLOCKSTATUS = {}
_G.BLOCKSTATUS = BLOCKSTATUS

--- @class WEATHERSTATUS @天气状态枚举
--- @field SHINE_AND_RAIN number @晴雨交替
--- @field SHINE number @晴天
--- @field RAIN number @雨天
local WEATHERSTATUS = {}
_G.WEATHERSTATUS = WEATHERSTATUS

--- @class VIEWPORTTYPE @视口方向
--- @field MAINVIEW number @主视角
--- @field BACKVIEW number @背视角
--- @field FRONTVIEW number @正视角
--- @field BACK2VIEW number @背视角2
--- @field TOPVIEW number @俯视角
--- @field CUSTOMVIEW number @自定义视角
local VIEWPORTTYPE = {}
_G.VIEWPORTTYPE = VIEWPORTTYPE

--- @class RESLIBTYPE @模板库类型
--- @field NONE number @无
--- @field BLOCK number @方块
--- @field ITEM number @道具
--- @field MONSTER number @生物
--- @field PARTICLE number @特效
--- @field SOUND number @音效
local RESLIBTYPE = {}
_G.RESLIBTYPE = RESLIBTYPE

--- @class GRAPHICS @图文信息枚举
--- @field GRAPHICS_HORNBOOK number @文字板
--- @field GRAPHICS_SUSPENDBOOK number @漂浮文字
--- @field GRAPHICS_PROGRESS number @进度条
--- @field GRAPHICS_ARROW_POS number @箭头指向位置
--- @field GRAPHICS_ARROW_ACTOR number @箭头指向生物
--- @field GRAPHICS_LINE_POS number @线指向位置
--- @field GRAPHICS_LINE_ACTOR number @线指向生物
--- @field GRAPHICS_SURFACE_POS number @面指向界面
--- @field GRAPHICS_SURFACE_ACTOR number @面指向生物
--- @field GRAPHICS_IMAGE number @图片
local GRAPHICS = {}
_G.GRAPHICS = GRAPHICS

--- @class FURNACEID @合成炉枚举
--- @field FURNACEID_STONE number @石炉
--- @field FURNACEID_IRON number @铁炉
--- @field FURNACEID_COPPER number @铜炉
local FURNACEID = {}
_G.FURNACEID = FURNACEID

--- @class STORAGEID @储物箱枚举
--- @field STORAGEID_BOX number @储物箱
--- @field STORAGEID_BOXROW number @大型储物箱（横）
--- @field STORAGEID_BOXCOL number @大型储物箱（竖）
local STORAGEID = {}
_G.STORAGEID = STORAGEID

--- @class SORT @排序枚举
--- @field UP number @升序
--- @field DOWN number @降序
local SORT = {}
_G.SORT = SORT

--- @class MOVETYPE @移动方式枚举
--- @field FLY number @飞行
--- @field IDLE number @默认移动方式
local MOVETYPE = {}
_G.MOVETYPE = MOVETYPE

--- @class EVENTDATE @设备时间类型枚举
--- @field YEAR number @年
--- @field MONTH number @月
--- @field DAY number @日
--- @field HOUR number @时
--- @field MINUTE number @分
--- @field SECOND number @秒
--- @field TIMESTAMP number @时间戳
local EVENTDATE = {}
_G.EVENTDATE = EVENTDATE

--- @class ITEMATTR @道具属性
--- @field ATTACK number @攻击力
--- @field STACKMAX number @叠加数
--- @field SHORTDEFENSE number @近战防御
--- @field LONGDEFENSE number @远程防御
--- @field EXPLODEDEFENSE number @爆炸防御
--- @field FIREDEFENSE number @燃烧防御
--- @field POISONDEFENSE number @毒素防御
--- @field WITHERDEFENSE number @混乱防御
--- @field DURATION number @耐久度
--- @field FIREINTERVAL number @射击间隔
--- @field MAGAZINES number @弹夹量
local ITEMATTR = {}
_G.ITEMATTR = ITEMATTR

--- @class DROPMODE @掉落物掉落方式
--- @field DISCARDITEM number @丢弃道具
--- @field DESTROYBOX number @箱子被破坏掉落
--- @field DEFEATMOB number @生物被击败掉落
--- @field DESTROYBLOCK number @方块被破坏掉落
--- @field SPAWNITEM number @触发器创建
--- @field CHANGEPLAYMODE number @掉落物对象转玩法创建
local DROPMODE = {}
_G.DROPMODE = DROPMODE

--- @class ANIMMODE @动作播放方式
--- @field ANIM_MODE_LOOP number @循环播放
--- @field ANIM_MODE_ONCE number @播放一次
--- @field ANIM_MODE_ONCE_STOP number @播放一次完毕,停在末尾
--- @field ANIM_MODE_DEFAULT number @表格默认值播放
local ANIMMODE = {}
_G.ANIMMODE = ANIMMODE

--- @class LinearTransformation @线性变换
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
local LinearTransformation = {}
_G.LinearTransformation = LinearTransformation

--- @class SKYBOXMAP @天空盒贴图
--- @field SKYMAP number @天空贴图
--- @field SUNMAP number @太阳贴图
--- @field MOONMAP number @月亮贴图
local SKYBOXMAP = {}
_G.SKYBOXMAP = SKYBOXMAP

--- @class SKYBOXCOLOR @天空盒颜色
--- @field TOPCOLOR number @天空顶部颜色
--- @field MIDDLECOLOR number @天空腰部颜色
--- @field BOTTOMCOLOR number @天空底部颜色
--- @field LIGHTCOLOR number @天空光照颜色
--- @field ENVCOLOR number @环境光颜色
--- @field SUNCOLOR number @太阳颜色
--- @field MOONCOLOR number @月亮颜色
--- @field CLOUDCOLOR number @云颜色
--- @field FOGCOLOR number @雾颜色
local SKYBOXCOLOR = {}
_G.SKYBOXCOLOR = SKYBOXCOLOR

--- @class SKYBOXATTR @天空盒参数
--- @field SUNSCALE number @太阳大小
--- @field MOONSCALE number @月亮大小
--- @field STARDENSITY number @星星密度
--- @field CLOUDSPEED number @云的运动速度
--- @field CLOUDENSITY number @云的密度
--- @field CLOUDHIGH number @云的高度
--- @field FOGREMINDIS number @雾的最近距离
--- @field FOGREMAXDIS number @雾的最远距离
--- @field TEMPLATE number @模板
local SKYBOXATTR = {}
_G.SKYBOXATTR = SKYBOXATTR

--- @class SKYBOXPARTICLE @天空盒环境粒子参数
--- @field STRENGTH number @强度
--- @field RANGE number @范围
--- @field SPEED number @速度
--- @field RANDOMNESS number @运动不规则度
local SKYBOXPARTICLE = {}
_G.SKYBOXPARTICLE = SKYBOXPARTICLE

--- @class SKYBOXFILTER @天空盒滤镜参数
--- @field CONTRAST number @对比度
--- @field SATURATION number @饱和度
--- @field FLOOD number @泛光强度
--- @field EXPOSURE number @曝光强度
--- @field VOLUMELIGHT number @体积光强度
--- @field GAMMA number @伽马强度
--- @field DEPTH number @景深强度
--- @field COLOR number @滤镜颜色
--- @field LUT number @色彩校正
--- @field TEMPLATE number @滤镜模板
local SKYBOXFILTER = {}
_G.SKYBOXFILTER = SKYBOXFILTER

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

--- @class MiniShopPage @开发者商店页面类型
--- @field Item number @道具购买
--- @field Skin number @皮肤
--- @field Convert number @兑换
--- @field Welfare number @福利
--- @field MiniVip number @大会员
local MiniShopPage = {}
_G.MiniShopPage = MiniShopPage

--- @class QQMUSICOP @QQ音乐操作类型
--- @field PAUSE number @暂停
--- @field RESUME number @恢复
--- @field STOP number @停止
local QQMUSICOP = {}
_G.QQMUSICOP = QQMUSICOP
--- @class Game
--- 游戏模块管理接口 Game
local Game = {}
_G.Game = Game

--- 游戏结束
--- @return number @成功返回 ErrorCode.OK
function Game:doGameEnd() return 0 end

--- 派发自定义事件
--- @param msgid string @事件ID
--- @param params table @事件参数
--- @return number @成功返回 ErrorCode.OK
function Game:dispatchEvent(msgid, params) return 0 end

--- 获取默认字符串
--- @param id string @字符串ID
--- @return number, string @成功返回 ErrorCode.OK 和字符串
function Game:getDefString(id) return 0, "" end

--- 设置脚本参数，供自定义使用
--- @param index number @序列索引(0~100)
--- @param val number @索引对应的值
--- @return number @成功返回 ErrorCode.OK
function Game:setScriptVar(index, val) return 0 end

--- 获取脚本参数，自定义使用
--- @param index number @序列索引(0~100)
--- @return number, number @成功返回 ErrorCode.OK 和索引对应的值
function Game:getScriptVar(index) return 0, 0 end

--- 上传设置好的脚本参数
--- @return number @成功返回 ErrorCode.OK
function Game:sendScriptVars2Client() return 0 end

--- 新增全局效果
--- @param path string @效果名称
--- @param effectid number @命名ID
--- @return number, number @成功返回 ErrorCode.OK 和特效ID
function Game:addRenderGlobalEffect(path, effectid) return 0, 0 end

--- 移除全局效果
--- @param effectid number @命名ID
--- @return number @成功返回 ErrorCode.OK
function Game:removeRenderGlobalEffect(effectid) return 0 end

--- 设置全局效果位置
--- @param effectid number @命名ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function Game:setRenderGlobalEffectPos(effectid, x, y, z) return 0 end

--- 设置全局效果缩放
--- @param effectid number @命名ID
--- @param scalex number @X缩放值
--- @param scaley number @Y缩放值
--- @param scalez number @Z缩放值
--- @return number @成功返回 ErrorCode.OK
function Game:setRenderGlobalEffectScale(effectid, scalex, scaley, scalez) return 0 end

--- 消息弹框
--- @param msg string @消息内容
--- @return number @成功返回 ErrorCode.OK
function Game:msgBox(msg) return 0 end

--- 分割字符串
--- @param str string @要分割的字符串
--- @param mark string @分割符号
--- @return number, table @成功返回 ErrorCode.OK 和字符串组
function Game:splitStr(str, mark) return 0, {} end
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
--- @class World
--- 世界模块管理接口 World
local World = {}
_G.World = World

--- 是否为白天
--- @return number @成功返回 ErrorCode.OK(是白天)
function World:isDaytime() return 0 end

--- 是否为自定义游戏
--- @return number @成功返回 ErrorCode.OK(是自定义游戏)
function World:isCustomGame() return 0 end

--- 是否为创造模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为创造模式
function World:isCreativeMode() return 0, true end

--- 多人创造模式 或者 自制玩法的编辑模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为该模式
function World:isGodMode() return 0, true end

--- 极限模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为极限模式
function World:isExtremityMode() return 0, true end

--- 冒险模式之自由模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为自由模式
function World:isFreeMode() return 0, true end

--- 单人模式 或者 冒险模式之自由模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为该模式
function World:isSurviveMode() return 0, true end

--- 由创造模式转的生存
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为该模式
function World:isCreateRunMode() return 0, true end

--- 自制玩法的编辑模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为编辑模式
function World:isGameMakerMode() return 0, true end

--- 自制玩法的运行模式
--- @return number, boolean @成功返回 ErrorCode.OK 和是否为运行模式
function World:isGameMakerRunMode() return 0, true end

--- 获取游戏当前时间(h)
--- @return number, number @成功返回 ErrorCode.OK 和当前小时数
function World:getHours() return 0, 0 end

--- 设置游戏当前时间(h)
--- @param hour number @小时时间
--- @return number @成功返回 ErrorCode.OK
function World:setHours(hour) return 0 end

--- 获取视角编辑状态
--- @return number, number @成功返回 ErrorCode.OK 和状态(0默认 1编辑 2测试)
function World:getCameraEditState() return 0, 0 end

--- 设置视角编辑状态
--- @param state number @视角编辑状态(CameraEditState)
--- @return number @成功返回 ErrorCode.OK
function World:setCameraEditState(state) return 0 end

--- 获取自定义相机配置
--- @return number, table @成功返回 ErrorCode.OK 和相机配置
function World:getCustomCameraConfig() return 0, {} end

--- 获取区块(chunk)范围，返回区块始末位置
--- @return number, number, number, number, number @成功返回 ErrorCode.OK 和startX,startZ,endX,endZ
function World:getRangeXZ() return 0, 0, 0, 0, 0 end

--- 计算指定方向射线长度(遇到方块结束)
--- @param srcx number @起始点X
--- @param srcy number @起始点Y
--- @param srcz number @起始点Z
--- @param dstx number @终点X
--- @param dsty number @终点Y
--- @param dstz number @终点Z
--- @param distance number @预测的最大距离
--- @return number, number @成功返回 ErrorCode.OK 和两点间的长度
function World:getRayLength(srcx, srcy, srcz, dstx, dsty, dstz, distance) return 0, 0 end

--- 射线打到的方块类型(遇到方块结束)
--- @param srcx number @起始点X
--- @param srcy number @起始点Y
--- @param srcz number @起始点Z
--- @param face number @方向(0西 1东 2南 3北 4下 5上)
--- @param distance number @最大距离
--- @return number, number @成功返回 ErrorCode.OK 和方块ID
function World:getRayBlock(srcx, srcy, srcz, face, distance) return 0, 0 end

--- 获取范围内actor,type参考OBJ_TYPE
--- @param objtype number @类型(1玩家 2生物 3掉落物 4投掷物, 0表示全部)
--- @param x1 number @起点X
--- @param y1 number @起点Y
--- @param z1 number @起点Z
--- @param x2 number @终点X
--- @param y2 number @终点Y
--- @param z2 number @终点Z
--- @return number, number, table @成功返回 ErrorCode.OK, 数量和objid数组
function World:getActorsByBox(objtype, x1, y1, z1, x2, y2, z2) return 0, 0, {} end

--- 获取全部玩家数量
--- @param alive? number @存活(-1全部 0阵亡 1存活，默认-1)
--- @return number, number @成功返回 ErrorCode.OK 和数量
function World:getPlayerTotal(alive) return 0, 0 end

--- 获取全部玩家
--- @param alive? number @存活(-1全部 0阵亡 1存活，默认-1)
--- @return number, number, table @成功返回 ErrorCode.OK, 数量和玩家ID数组
function World:getAllPlayers(alive) return 0, 0, {} end

--- 随机选取一名玩家
--- @param alive? number @存活(-1全部 0阵亡 1存活，默认-1)
--- @return number, number @成功返回 ErrorCode.OK 和随机玩家ID
function World:randomOnePlayer(alive) return 0, 0 end

--- 移除actor
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function World:despawnActor(objid) return 0 end

--- 生成生物(包括怪物、NPC、动物等)
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param actorid number @生物ID
--- @param num number @生成数量
--- @return number, table @成功返回 ErrorCode.OK 和objid数组
function World:spawnCreature(x, y, z, actorid, num) return 0, {} end

--- 移除生物
--- @param objid number @生物objid
--- @return number @成功返回 ErrorCode.OK
function World:despawnCreature(objid) return 0 end

--- 在指定位置生成道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID
--- @param num number @数量
--- @return number, number @成功返回 ErrorCode.OK 和道具objid
function World:spawnItem(x, y, z, itemid, num) return 0, 0 end

--- 移除道具(通过区域)
--- @param x1 number @起点X
--- @param y1 number @起点Y
--- @param z1 number @起点Z
--- @param x2 number @终点X
--- @param y2 number @终点Y
--- @param z2 number @终点Z
--- @return number @成功返回 ErrorCode.OK
function World:despawnItemByBox(x1, y1, z1, x2, y2, z2) return 0 end

--- 移除道具(通过ID)
--- @param objid number @道具objid
--- @return number @成功返回 ErrorCode.OK
function World:despawnItemByObjid(objid) return 0 end

--- 生成投掷物
--- @param shooter number @投掷物归属objid
--- @param itemid number @投掷物id
--- @param x number @起点X
--- @param y number @起点Y
--- @param z number @起点Z
--- @param dstx number @终点X
--- @param dsty number @终点Y
--- @param dstz number @终点Z
--- @param speed number @投掷物速度
--- @return number, number @成功返回 ErrorCode.OK 和投掷物实例ID
function World:spawnProjectile(shooter, itemid, x, y, z, dstx, dsty, dstz, speed) return 0, 0 end

--- 生成投掷物(通过方向)
--- @param shooter number @投掷物归属objid
--- @param itemid number @投掷物id
--- @param x number @起点X
--- @param y number @起点Y
--- @param z number @起点Z
--- @param dirx number @方向X
--- @param diry number @方向Y
--- @param dirz number @方向Z
--- @param speed number @投掷物速度
--- @return number, number @成功返回 ErrorCode.OK 和投掷物实例ID
function World:spawnProjectileByDir(shooter, itemid, x, y, z, dirx, diry, dirz, speed) return 0, 0 end

--- 计算位置之间的距离
--- @param pos1 table @起始位置{x,y,z}
--- @param pos2 table @最终位置{x,y,z}
--- @return number, number @成功返回 ErrorCode.OK 和距离
function World:calcDistance(pos1, pos2) return 0, 0 end

--- 在指定位置播放特效
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param particleId number @特效id
--- @param scale number @特效大小
--- @param ptime? number @播放时长(秒，<=0或nil持续播放)
--- @param bUsePlayerViewRange? boolean @是否根据视野裁剪
--- @return number @成功返回 ErrorCode.OK
function World:playParticalEffect(x, y, z, particleId, scale, ptime, bUsePlayerViewRange) return 0 end

--- 停止指定位置的特效
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param particleId number @特效id
--- @return number @成功返回 ErrorCode.OK
function World:stopEffectOnPosition(x, y, z, particleId) return 0 end

--- 设置指定位置的特效大小
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param particleId number @特效id
--- @param scale number @特效大小
--- @return number @成功返回 ErrorCode.OK
function World:setEffectScaleOnPosition(x, y, z, particleId, scale) return 0 end

--- 随机特效类型，随机返回一种特效ID
--- @return number, number @成功返回 ErrorCode.OK 和随机特效id
function World:randomParticleEffectID() return 0, 0 end

--- 在指定位置上播放指定音效
--- @param pos table @位置{x,y,z}
--- @param soundId number @音效ID
--- @param volume number @音量
--- @param pitch number @音调
--- @param isLoop boolean @是否循环播放
--- @return number @成功返回 ErrorCode.OK
function World:playSoundEffectOnPos(pos, soundId, volume, pitch, isLoop) return 0 end

--- 停止指定位置上的指定音效
--- @param pos table @位置{x,y,z}
--- @param soundId number @音效ID
--- @return number @成功返回 ErrorCode.OK
function World:stopSoundEffectOnPos(pos, soundId) return 0 end

--- 获取光照强度
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和光照级别
function World:getLightByPos(x, y, z) return 0, 0 end

--- 设置光照强度
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param lv number @亮度级别(0-15)
--- @return number @成功返回 ErrorCode.OK
function World:setBlockLightEx(x, y, z, lv) return 0 end

--- 随机出来的音乐ID
--- @return number, number @成功返回 ErrorCode.OK 和随机声音ID
function World:randomSoundID() return 0, 0 end

--- 随机出来的天气ID
--- @return number, number @成功返回 ErrorCode.OK 和随机天气类型ID
function World:randomWeatherID() return 0, 0 end

--- 获取主机时间
--- @param enum number @日期枚举(EVENTDATE)
--- @return number, number @成功返回 ErrorCode.OK 和年/月/日等
function World:getLocalDate(enum) return 0, 0 end

--- 获取完整设备时间
--- @return number, string @成功返回 ErrorCode.OK 和完整日期字符串
function World:getLocalDateString() return 0, "" end

--- 获取服务器时间
--- @param enum number @日期枚举(EVENTDATE)
--- @return number, number @成功返回 ErrorCode.OK 和年/月/日等
function World:getServerDate(enum) return 0, 0 end

--- 获取完整服务器时间
--- @return number, string @成功返回 ErrorCode.OK 和完整服务器日期字符串
function World:getServerDateString() return 0, "" end

--- 转换时间戳为时间单位
--- @param time number @时间戳
--- @param enum number @日期枚举(EVENTDATE)
--- @return number, number @成功返回 ErrorCode.OK 和年/月/日等
function World:getDateFromTime(time, enum) return 0, 0 end

--- 转换时间戳为完整时间
--- @param time number @时间戳
--- @return number, string @成功返回 ErrorCode.OK 和完整日期字符串
function World:getDateStringFromTime(time) return 0, "" end

--- 转换完整时间为时间戳
--- @param timestr string @完整时间(如"2021-03-31 10:05:57")
--- @return number, number @成功返回 ErrorCode.OK 和时间戳
function World:getTimeFromDateString(timestr) return 0, 0 end

--- 设置天空盒时间流逝速度
--- @param speed number @天空盒时间流速
--- @return number @成功返回 ErrorCode.OK
function World:SetTimeVanishingSpeed(speed) return 0 end

--- 设置天空盒模板
--- @param value number @参数值(0-9)
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxTemplate(value) return 0 end

--- 设置天空盒贴图
--- @param time number @游戏时间
--- @param itype number @贴图类型(SKYBOXMAP)
--- @param url string @图片链接
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxMaps(time, itype, url) return 0 end

--- 设置天空盒颜色参数
--- @param time number @游戏时间
--- @param itype number @颜色属性枚举(SKYBOXCOLOR)
--- @param color string @16进制颜色值(0xffffff)
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxColor(time, itype, color) return 0 end

--- 设置天空盒属性参数
--- @param time number @游戏时间
--- @param itype number @参数类型(SKYBOXATTR)
--- @param value number @参数值(0~100)
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxAttr(time, itype, value) return 0 end

--- 设置天空盒滤镜参数（包括滤镜模板）
--- @param itype number @参数类型(SKYBOXFILTER)
--- @param value number|string @参数值(0~100)或16进制颜色值
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxFilter(itype, value) return 0 end

--- 天空盒属性开关
--- @param time number @游戏时间
--- @param itype number @参数类型(SKYBOXSWITCH)
--- @param value number @参数值(0~1)
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxSwitch(time, itype, value) return 0 end

--- 天空盒滤镜属性开关
--- @param itype number @参数类型(SKYBOXFILTERSWITCH)
--- @param value number @参数值(0~1)
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxFilterSwitch(itype, value) return 0 end

--- 设置天气组天气
--- @param groupid number @地形组ID(WEATHERGROUP)
--- @param weatherid number @天气类型(WEATHERSTATUS)
--- @return number @成功返回 ErrorCode.OK
function World:SetGroupWeather(groupid, weatherid) return 0 end

--- 获取天气组天气
--- @param groupid number @地形组ID(WEATHERGROUP)
--- @return number @成功返回 ErrorCode.OK
function World:GetGroupWeather(groupid) return 0 end

--- 设置天空盒贴图(带动效)
--- @param time number @游戏时间
--- @param itype number @贴图类型(SKYBOXMAP)
--- @param url string @图片链接
--- @param animId number @动画ID
--- @param animTime number @动画时间
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxMapsAnim(time, itype, url, animId, animTime) return 0 end

--- 设置天空盒颜色参数(带动效)
--- @param time number @游戏时间
--- @param itype number @颜色属性枚举(SKYBOXCOLOR)
--- @param color string @16进制颜色值
--- @param animId number @动画ID
--- @param animTime number @动画时间
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxColorAnim(time, itype, color, animId, animTime) return 0 end

--- 设置天空盒滤镜参数(带动效，可切换滤镜模板)
--- @param itype number @参数类型(SKYBOXFILTER)
--- @param value number|string @参数值或颜色值
--- @param animId number @动画ID
--- @param animTime number @动画时间
--- @return number @成功返回 ErrorCode.OK
function World:SetSkyBoxFilterAnim(itype, value, animId, animTime) return 0 end
--- @class WorldContainer
--- 世界容器(熔炉/储物箱)管理接口 WorldContainer
local WorldContainer = {}
_G.WorldContainer = WorldContainer

--- 新增熔炉
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:addFurnace(x, y, z) return 0 end

--- 移除熔炉
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeFurnace(x, y, z) return 0 end

--- 检测是否为熔炉
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:checkFurnace(x, y, z) return 0 end

--- 获取熔炉热度百分比
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和热度百分比
function WorldContainer:getFurnaceHeatPercent(x, y, z) return 0, 0 end

--- 获取熔炉融化百分比
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和融化百分比
function WorldContainer:getFurnaceMeltPercent(x, y, z) return 0, 0 end

--- 新增储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:addStorageBox(x, y, z) return 0 end

--- 移除储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeStorageBox(x, y, z) return 0 end

--- 检测是否为储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:checkStorage(x, y, z) return 0 end

--- 清空储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:clearStorageBox(x, y, z) return 0 end

--- 检测储物箱空余格子，传入道具ID则同时检测已存该道具的格子
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID(0表示空余格子)
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:checkStorageEmptyGrid(x, y, z, itemid) return 0 end

--- 设置储物箱道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param offset number @仓库格子索引(从0开始)
--- @param itemid number @道具ID
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:setStorageItem(x, y, z, offset, itemid, num) return 0 end

--- 获取储物箱道具ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param offset number @仓库格子索引(从0开始)
--- @return number, number, number @成功返回 ErrorCode.OK, 道具ID和道具数量
function WorldContainer:getStorageItem(x, y, z, offset) return 0, 0, 0 end

--- 给储物箱添加道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID
--- @param num number @道具数量
--- @return number, number @成功返回 ErrorCode.OK 和成功添加数量
function WorldContainer:addStorageItem(x, y, z, itemid, num) return 0, 0 end

--- 移除储物箱内指定类型的道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具类型ID
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeStorageItemByID(x, y, z, itemid, num) return 0 end

--- 移除储物箱内指定格子的道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param offset number @储物箱格子索引(从0开始)
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeStorageItemByIndex(x, y, z, offset, num) return 0 end

--- 将一定数量道具添加到储物箱中
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具ID
--- @param num number @道具数量
--- @return number, number @成功返回 ErrorCode.OK 和成功添加数量
function WorldContainer:addItemToContainer(x, y, z, itemid, num) return 0, 0 end

--- 移除储物箱内一定数量道具
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itemid number @道具类型ID
--- @param num number @道具数量
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:removeContainerItemByID(x, y, z, itemid, num) return 0 end

--- 清空指定位置的储物箱
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK
function WorldContainer:clearContainer(x, y, z) return 0 end
--- @class Block
--- 方块模块管理接口 Block
local Block = {}
_G.Block = Block

--- 是否为固体方块
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK(是固体方块)
function Block:isSolidBlock(x, y, z) return 0 end

--- 是否为液体方块
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK(是液体方块)
function Block:isLiquidBlock(x, y, z) return 0 end

--- 是否为气体方块
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number @成功返回 ErrorCode.OK(是气体方块)
function Block:isAirBlock(x, y, z) return 0 end

--- 获取block对应id
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和方块ID
function Block:getBlockID(x, y, z) return 0, 0 end

--- 设置blockalldata 更新+通知
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param blockid number @方块ID
--- @param data number @方块数据
--- @return number @成功返回 ErrorCode.OK
function Block:setBlockAll(x, y, z, blockid, data) return 0 end

--- 获得blockdata
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @return number, number @成功返回 ErrorCode.OK 和方块数据
function Block:getBlockData(x, y, z) return 0, 0 end

--- 摧毁方块
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param dropitem? boolean @是否掉落道具(默认false)
--- @return number @成功返回 ErrorCode.OK
function Block:destroyBlock(x, y, z, dropitem) return 0 end

--- 放置方块
--- @param blockid number @方块ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param face number @朝向(0西 1东 2南 3北 4下 5上)
--- @return number @成功返回 ErrorCode.OK
function Block:placeBlock(blockid, x, y, z, face) return 0 end

--- 替换方块
--- @param blockid number @方块ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param face number @朝向(0西 1东 2南 3北 4下 5上)
--- @return number @成功返回 ErrorCode.OK
function Block:replaceBlock(blockid, x, y, z, face) return 0 end

--- 设置blockalldata 通知周围方块
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param blockid number @方块ID
--- @return number @成功返回 ErrorCode.OK
function Block:setBlockAllForUpdate(x, y, z, blockid) return 0 end

--- 设置blockalldata 更新当前位置方块
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param blockid number @方块ID
--- @return number @成功返回 ErrorCode.OK
function Block:setBlockAllForNotify(x, y, z, blockid) return 0 end

--- 设置方块设置属性状态
--- @param blockid number @方块ID
--- @param attrtype number @方块属性(BLOCKATTR_ENABLE: 1破坏 2操作 4推拉 8掉落 16推拉掉落)
--- @param switch boolean @状态(true可以 false不可)
--- @return number @成功返回 ErrorCode.OK
function Block:setBlockSettingAttState(blockid, attrtype, switch) return 0 end

--- 获取方块设置属性状态
--- @param blockid number @方块ID
--- @param attrtype number @方块属性(BLOCKATTR_ENABLE)
--- @return number, boolean @成功返回 ErrorCode.OK 和状态
function Block:getBlockSettingAttState(blockid, attrtype) return 0, true end

--- 获取功能方块的开关状态
--- @param pos table @位置{x,y,z}
--- @return number, boolean @成功返回 ErrorCode.OK 和开关状态
function Block:getBlockSwitchStatus(pos) return 0, true end

--- 设置功能方块的开关状态
--- @param pos table @位置{x,y,z}
--- @param isactive boolean @开关状态
--- @return number @成功返回 ErrorCode.OK
function Block:setBlockSwitchStatus(pos, isactive) return 0 end

--- 通过方向获取方块data值
--- @param blockid number @方块ID
--- @param dir number @朝向(0西 1东 2南 3北 4下 5上)
--- @return number, number @成功返回 ErrorCode.OK 和data值
function Block:getBlockDataByDir(blockid, dir) return 0, 0 end

--- 获取方块的通电状态
--- @param pos table @位置{x,y,z}
--- @return number, boolean @成功返回 ErrorCode.OK 和通电状态
function Block:getBlockPowerStatus(pos) return 0, true end

--- 获取随机方块id
--- @return number, number @成功返回 ErrorCode.OK 和随机方块id
function Block:randomBlockID() return 0, 0 end

--- 获取方块名称
--- @param blockid number @方块类型ID
--- @return number, string @成功返回 ErrorCode.OK 和方块名称
function Block:GetBlockDefName(blockid) return 0, "" end

--- 获取方块描述
--- @param blockid number @方块类型ID
--- @return number, string @成功返回 ErrorCode.OK 和方块描述
function Block:GetBlockDefDesc(blockid) return 0, "" end

--- 获取方块外观
--- @param blockid number @方块类型ID
--- @return number, number @成功返回 ErrorCode.OK 和方块外观名
function Block:GetBlockFacade(blockid) return 0, 0 end

--- 微缩方块播放动作
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param animid number @动作ID
--- @param playmode number @播放模式(ANIMMODE)
--- @return number @成功返回 ErrorCode.OK
function Block:PlayAct(x, y, z, animid, playmode) return 0 end

--- 放置蓝图
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param blueprint string @蓝图资源ID
--- @param angle number @旋转角度
--- @param mirror boolean @是否镜像
--- @param placeMode boolean @是否放置
--- @return number @成功返回 ErrorCode.OK
function Block:ReplaceBluePrint(x, y, z, blueprint, angle, mirror, placeMode) return 0 end
--- @class Actor
--- 角色模块管理接口 Actor
local Actor = {}
_G.Actor = Actor

--- 检测是否为玩家
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:isPlayer(objid) return 0 end

--- 检测是否为怪物
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:isMob(objid) return 0 end

--- 获取对象类型
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和对象类型
function Actor:getObjType(objid) return 0, 0 end

--- 是否在空中
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:isInAir(objid) return 0 end

--- 获取actor位置
--- @param objid number @对象ID
--- @return number, number, number, number @成功返回 ErrorCode.OK 和 x,y,z 坐标
function Actor:getPosition(objid) return 0, 0, 0, 0 end

--- 设置actor位置
--- @param objid number @对象ID
--- @param x number @目标X坐标
--- @param y number @目标Y坐标
--- @param z number @目标Z坐标
--- @return number @成功返回 ErrorCode.OK
function Actor:setPosition(objid, x, y, z) return 0 end

--- 跳跃
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:jump(objid) return 0 end

--- 杀死自己
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:killSelf(objid) return 0 end

--- 获取当前朝向
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和朝向值
function Actor:getCurPlaceDir(objid) return 0, 0 end

--- 向目标行动者移动
--- @param self_objid number @执行动作的对象ID
--- @param target_objid number @目标对象ID
--- @param speed number @移动速度
--- @return number @成功返回 ErrorCode.OK
function Actor:tryMoveToActor(self_objid, target_objid, speed) return 0 end

--- 向目标位置移动
--- @param objid number @对象ID
--- @param x number @目标X坐标
--- @param y number @目标Y坐标
--- @param z number @目标Z坐标
--- @param speed number @移动速度
--- @return number @成功返回 ErrorCode.OK
function Actor:tryMoveToPos(objid, x, y, z, speed) return 0 end

--- 增加当前生命量
--- @param objid number @对象ID
--- @param hp number @血量值
--- @return number @成功返回 ErrorCode.OK
function Actor:addHP(objid, hp) return 0 end

--- 获取当前生命量
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和生命值
function Actor:getHP(objid) return 0, 0 end

--- 获取最大生命量
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和最大生命值
function Actor:getMaxHP(objid) return 0, 0 end

--- 增加当前氧气值
--- @param objid number @对象ID
--- @param oxygen number @氧气值
--- @return number @成功返回 ErrorCode.OK
function Actor:addOxygen(objid, oxygen) return 0 end

--- 获取当前氧气值
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和氧气值
function Actor:getOxygen(objid) return 0, 0 end

--- 增加装备附魔
--- @param objid number @对象ID
--- @param slot number @装备栏ID
--- @param enchantId number @附魔ID
--- @param enchantLevel number @附魔等级
--- @return number @成功返回 ErrorCode.OK
function Actor:addEnchant(objid, slot, enchantId, enchantLevel) return 0 end

--- 移除装备附魔
--- @param objid number @对象ID
--- @param slot number @装备栏ID
--- @param enchantId number @附魔ID
--- @return number @成功返回 ErrorCode.OK
function Actor:removeEnchant(objid, slot, enchantId) return 0 end

--- 寻找附近方块
--- @param objid number @对象ID
--- @param blockid number @方块ID
--- @param blockRange number @搜索范围
--- @return number, number, number, number @成功返回 ErrorCode.OK 和 x,y,z 坐标
function Actor:findNearestBlock(objid, blockid, blockRange) return 0, 0, 0, 0 end

--- 设置actor原地旋转偏移角度
--- @param objid number @对象ID
--- @param yaw number @偏移角度
--- @return number @成功返回 ErrorCode.OK
function Actor:setFaceYaw(objid, yaw) return 0 end

--- 获取actor原地旋转偏移角度
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和偏移角度
function Actor:getFaceYaw(objid) return 0, 0 end

--- 转动actor横向偏移角度
--- @param objid number @对象ID
--- @param offset number @转动角度
--- @return number @成功返回 ErrorCode.OK
function Actor:turnFaceYaw(objid, offset) return 0 end

--- 设置actor视角仰望角度
--- @param objid number @对象ID
--- @param pitch number @仰望角度
--- @return number @成功返回 ErrorCode.OK
function Actor:setFacePitch(objid, pitch) return 0 end

--- 获取actor视角仰望角度
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和仰望角度
function Actor:getFacePitch(objid) return 0, 0 end

--- 转动actor仰望偏移角度
--- @param objid number @对象ID
--- @param offset number @转动角度
--- @return number @成功返回 ErrorCode.OK
function Actor:turnFacePitch(objid, offset) return 0 end

--- 对象播放特效
--- @param objid number @对象ID
--- @param type number @特效类型
--- @return number @成功返回 ErrorCode.OK
function Actor:playBodyEffect(objid, type) return 0 end

--- 对象停止特效
--- @param objid number @对象ID
--- @param type number @特效类型
--- @return number @成功返回 ErrorCode.OK
function Actor:stopBodyEffect(objid, type) return 0 end

--- 播放文件特效
--- @param objid number @对象ID
--- @param filename string @文件名
--- @param sync boolean @同步
--- @return number @成功返回 ErrorCode.OK
function Actor:playBodyEffectByFile(objid, filename, sync) return 0 end

--- 停止文件特效
--- @param objid number @对象ID
--- @param filename string @文件名
--- @return number @成功返回 ErrorCode.OK
function Actor:stopBodyEffectByFile(objid, filename) return 0 end

--- 播放声音
--- @param objid number @对象ID
--- @param name string @声音名称
--- @param volume number @音量
--- @param pitch number @音调
--- @param flag number @参数
--- @return number @成功返回 ErrorCode.OK
function Actor:playSound(objid, name, volume, pitch, flag) return 0 end

--- 播放声音(特定类型)
--- @param objid number @对象ID
--- @param name string @声音名称
--- @param type number @指定类型
--- @return number @成功返回 ErrorCode.OK
function Actor:playSoundSpecial(objid, name, type) return 0 end

--- 清除生物ID为actorid的生物
--- @param actorid number @生物ID
--- @param bkill boolean @是否显示死亡效果
--- @return number @成功返回 ErrorCode.OK
function Actor:clearActorWithId(actorid, bkill) return 0 end

--- 设置伤害类型
--- @param objid number @对象ID
--- @param attacktype number @伤害类型
--- @return number @成功返回 ErrorCode.OK
function Actor:setAttackType(objid, attacktype) return 0 end

--- 设置免疫伤害类型
--- @param objid number @对象ID
--- @param immunetype number @伤害类型
--- @param isadd boolean @是否开启
--- @return number @成功返回 ErrorCode.OK
function Actor:setImmuneType(objid, immunetype, isadd) return 0 end

--- 登上、脱离载具
--- @param objid number @对象ID
--- @param mountobjid number @被骑乘对象ID
--- @param posindex number @骑乘位
--- @return number @成功返回 ErrorCode.OK
function Actor:mountActor(objid, mountobjid, posindex) return 0 end

--- 设置生物行为属性状态
--- @param objid number @对象ID
--- @param actionattr number @属性类型
--- @param switch boolean @是否开启
--- @return number @成功返回 ErrorCode.OK
function Actor:setActionAttrState(objid, actionattr, switch) return 0 end

--- 获取生物特殊属性的状态
--- @param objid number @对象ID
--- @param actionattr number @属性类型
--- @return number, boolean @成功返回 ErrorCode.OK 和状态
function Actor:getActionAttrState(objid, actionattr) return 0, false end

--- 寻路到目标位置
--- @param objid number @对象ID
--- @param x number @目标X坐标
--- @param y number @目标Y坐标
--- @param z number @目标Z坐标
--- @param cancontrol boolean @是否可控制
--- @param showtip boolean @是否显示路线提示
--- @return number @成功返回 ErrorCode.OK
function Actor:tryNavigationToPos(objid, x, y, z, cancontrol, showtip) return 0 end

--- 在资源库里随机创建一个生物
--- @return number, number @成功返回 ErrorCode.OK 和生物ID
function Actor:randomActorID() return 0, 0 end

--- 获取骑乘生物的objid
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和骑乘对象ID
function Actor:getRidingActorObjId(objid) return 0, 0 end

--- 在指定对象身上播放粒子特效
--- @param objid number @对象ID
--- @param particleId number @特效ID
--- @param scale number @特效大小
--- @param ptme number @时长(秒)
--- @return number @成功返回 ErrorCode.OK
function Actor:playBodyEffectById(objid, particleId, scale, ptme) return 0 end

--- 停止指定对象身上的粒子特效
--- @param objid number @对象ID
--- @param particleId number @特效ID
--- @return number @成功返回 ErrorCode.OK
function Actor:stopBodyEffectById(objid, particleId) return 0 end

--- 设置指定对象身上的特效大小
--- @param objid number @对象ID
--- @param particleId number @特效ID
--- @param scale number @特效大小
--- @return number @成功返回 ErrorCode.OK
function Actor:setBodyEffectScale(objid, particleId, scale) return 0 end

--- 在指定对象身上播放音效
--- @param objid number @对象ID
--- @param soundId number @音效ID
--- @param volume number @音量
--- @param pitch number @音调
--- @param isLoop boolean @是否循环播放
--- @return number @成功返回 ErrorCode.OK
function Actor:playSoundEffectById(objid, soundId, volume, pitch, isLoop) return 0 end

--- 停止指定对象身上的音效
--- @param objid number @对象ID
--- @param soundId number @音效ID
--- @return number @成功返回 ErrorCode.OK
function Actor:stopSoundEffectById(objid, soundId) return 0 end

--- 给对象附加一个速度
--- @param objid number @对象ID
--- @param x number @X方向速度
--- @param y number @Y方向速度
--- @param z number @Z方向速度
--- @return number @成功返回 ErrorCode.OK
function Actor:appendSpeed(objid, x, y, z) return 0 end

--- 获取actor朝向
--- @param objid number @对象ID
--- @return number, number, number, number @成功返回 ErrorCode.OK 和方向值
function Actor:getFaceDirection(objid) return 0, 0, 0, 0 end

--- 通过局部坐标方向计算绝对方向
--- @param objid number @对象ID
--- @param vx number @局部X方向
--- @param vy number @局部Y方向
--- @param vz number @局部Z方向
--- @return number, table @成功返回 ErrorCode.OK 和方向表
function Actor:calcDirectionByDirection(objid, vx, vy, vz) return 0, {} end

--- 通过局部球坐标方向计算绝对方向
--- @param objid number @对象ID
--- @param yaw number @局部水平偏移
--- @param pitch number @局部垂直偏移
--- @return number, table @成功返回 ErrorCode.OK 和方向表
function Actor:calcDirectionByAngle(objid, yaw, pitch) return 0, {} end

--- 通过局部坐标方向计算绝对正方向
--- @param objid number @对象ID
--- @param vx number @局部X方向
--- @param vy number @局部Y方向
--- @param vz number @局部Z方向
--- @return number, table @成功返回 ErrorCode.OK 和方向表
function Actor:calcDirectionByYawDirection(objid, vx, vy, vz) return 0, {} end

--- 通过局部球坐标方向计算绝对正方向
--- @param objid number @对象ID
--- @param yaw number @局部水平偏移
--- @param pitch number @局部垂直偏移
--- @return number, table @成功返回 ErrorCode.OK 和方向表
function Actor:calcDirectionByYawAngle(objid, yaw, pitch) return 0, {} end

--- 获取眼睛高度
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和高度
function Actor:getEyeHeight(objid) return 0, 0 end

--- 获取眼睛位置
--- @param objid number @对象ID
--- @return number, number, number, number @成功返回 ErrorCode.OK 和 x,y,z 坐标
function Actor:getEyePosition(objid) return 0, 0, 0, 0 end

--- 获取身体尺寸
--- @param objid number @对象ID
--- @return number, number, number @成功返回 ErrorCode.OK 和宽、高
function Actor:getBodySize(objid) return 0, 0, 0 end

--- 播放动作
--- @param objid number @对象ID
--- @param actid number @动作ID
--- @return number @成功返回 ErrorCode.OK
function Actor:playAct(objid, actid) return 0 end

--- 设置昵称显示
--- @param objid number @对象ID
--- @param bshow boolean @是否显示
--- @return number @成功返回 ErrorCode.OK
function Actor:shownickname(objid, bshow) return 0 end

--- 设置昵称
--- @param objid number @对象ID
--- @param nickname string @名称
--- @return number @成功返回 ErrorCode.OK
function Actor:setnickname(objid, nickname) return 0 end

--- 获取Actor的外观
--- @param objid number @对象ID
--- @return number, string @成功返回 ErrorCode.OK 和外观名称
function Actor:getActorFacade(objid) return 0, "" end

--- 改变Actor外观
--- @param objid number @对象ID
--- @param modelName string @外观名称
--- @return number @成功返回 ErrorCode.OK
function Actor:changeCustomModel(objid, modelName) return 0 end

--- 恢复生物外观
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:recoverinitialModel(objid) return 0 end

--- 增加指定BUFF
--- @param objid number @对象ID
--- @param buffid number @BUFF ID
--- @param bufflv number @BUFF 等级
--- @param customticks number @持续时间
--- @return number @成功返回 ErrorCode.OK
function Actor:addBuff(objid, buffid, bufflv, customticks) return 0 end

--- 是否已经有了指定BUFF
--- @param objid number @对象ID
--- @param buffid number @BUFF ID
--- @return number, boolean @成功返回 ErrorCode.OK 和布尔值
function Actor:hasBuff(objid, buffid) return 0, false end

--- 移除指定BUFF
--- @param objid number @对象ID
--- @param buffid number @BUFF ID
--- @return number @成功返回 ErrorCode.OK
function Actor:removeBuff(objid, buffid) return 0 end

--- 清除全部BUFF
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:clearAllBuff(objid) return 0 end

--- 清除全部减益BUFF
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK
function Actor:clearAllBadBuff(objid) return 0 end

--- 获取已有BUFF
--- @param objid number @对象ID
--- @return number, number, table @成功返回 ErrorCode.OK、BUFF 数量、BUFF ID 数组
function Actor:getBuffList(objid) return 0, 0, {} end

--- 获取BUFF剩余tick
--- @param objid number @对象ID
--- @param buffid number @BUFF ID
--- @return number, number @成功返回 ErrorCode.OK 和剩余 tick
function Actor:getBuffLeftTick(objid, buffid) return 0, 0 end

--- 获取随机外观id字符串
--- @return number, string @成功返回 ErrorCode.OK 和外观ID
function Actor:randomFacadeID() return 0, "" end

--- 使玩家对生物或玩家造成伤害
--- @param objidA number @攻击者对象ID
--- @param objidB number @被攻击者对象ID
--- @param hp number @伤害数值
--- @param attackType number @伤害类型
--- @return number @成功返回 ErrorCode.OK
function Actor:playerHurt(objidA, objidB, hp, attackType) return 0 end

--- 使玩家伤害区域内的目标
--- @param objidA number @攻击者对象ID
--- @param areaid number @区域ID
--- @param hp number @伤害数值
--- @param attackType number @伤害类型
--- @return number @成功返回 ErrorCode.OK
function Actor:playerHurtArea(objidA, areaid, hp, attackType) return 0 end

--- 使生物对生物或玩家造成伤害
--- @param objidA number @攻击者对象ID
--- @param objidB number @被攻击者对象ID
--- @param hp number @伤害数值
--- @param attackType number @伤害类型
--- @return number @成功返回 ErrorCode.OK
function Actor:actorHurt(objidA, objidB, hp, attackType) return 0 end

--- 使生物伤害区域内的目标
--- @param objidA number @攻击者对象ID
--- @param areaid number @区域ID
--- @param hp number @伤害数值
--- @param attackType number @伤害类型
--- @return number @成功返回 ErrorCode.OK
function Actor:actorHurtArea(objidA, areaid, hp, attackType) return 0 end

--- 获取actor位置
--- @param objid number @对象ID
--- @return number, table @成功返回 ErrorCode.OK 和坐标表
function Actor:getPositionV2(objid) return 0, {} end

--- 设置对象朝向
--- @param objid number @对象ID
--- @param x number @X方向
--- @param y number @Y方向
--- @param z number @Z方向
--- @return number @成功返回 ErrorCode.OK
function Actor:setFaceDirection(objid, x, y, z) return 0 end

--- 改变对象为指定玩家ID的皮肤外观
--- @param objid number @对象ID
--- @param uin number @玩家Uin
--- @return number @成功返回 ErrorCode.OK
function Actor:ChangePlayerSkin(objid, uin) return 0 end
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
--- @class Creature
--- 生物模块管理接口 Creature
local Creature = {}
_G.Creature = Creature

--- 生物属性获取
--- @param objid number @生物objid
--- @param attrtype number @生物属性枚举(CREATUREATTR)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Creature:getAttr(objid, attrtype) return 0, 0 end

--- 生物属性设置
--- @param objid number @生物objid
--- @param attrtype number @生物属性枚举(CREATUREATTR)
--- @param val number @设置的数值
--- @return number @成功返回 ErrorCode.OK
function Creature:setAttr(objid, attrtype, val) return 0 end

--- 判断该生物是否成年
--- @param objid number @生物objid
--- @return number @成功返回 ErrorCode.OK(已成年)
function Creature:isAdult(objid) return 0 end

--- 设置是否依赖氧气
--- @param objid number @生物objid
--- @param v boolean @是否需要氧气
--- @return number @成功返回 ErrorCode.OK
function Creature:setOxygenNeed(objid, v) return 0 end

--- 获取驯养主ID
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和驯养主uin(0表示未驯服)
function Creature:getTamedOwnerID(objid) return 0, 0 end

--- 设置是否正在惊慌
--- @param objid number @生物objid
--- @param v boolean @是否正在惊慌
--- @return number @成功返回 ErrorCode.OK
function Creature:setPanic(objid, v) return 0 end

--- 设置AI是否生效
--- @param objid number @生物objid
--- @param v boolean @AI是否生效
--- @return number @成功返回 ErrorCode.OK
function Creature:setAIActive(objid, v) return 0 end

--- 获取生物actorID
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和生物actorID
function Creature:getActorID(objid) return 0, 0 end

--- 获取生物名称
--- @param objid number @生物objid
--- @return number, string @成功返回 ErrorCode.OK 和生物名称
function Creature:getActorName(objid) return 0, "" end

--- 增加模组属性
--- @param objid number @生物objid
--- @param attrtype number @附魔属性类型(MODATTRIB_TYPE)
--- @param value number @设置数值大小
--- @return number @成功返回 ErrorCode.OK
function Creature:addModAttrib(objid, attrtype, value) return 0 end

--- 获取模组属性
--- @param objid number @生物objid
--- @param attrtype number @附魔属性类型(MODATTRIB_TYPE)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Creature:getModAttrib(objid, attrtype) return 0, 0 end

--- 设置生物队伍
--- @param objid number @生物objid
--- @param teamid number @队伍ID
--- @return number @成功返回 ErrorCode.OK
function Creature:setTeam(objid, teamid) return 0 end

--- 获取生物队伍
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和队伍ID
function Creature:getTeam(objid) return 0, 0 end

--- 获取最大饥饿度
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和最大饥饿度
function Creature:getMaxFood(objid) return 0, 0 end

--- 获取饥饿度
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和当前饥饿度
function Creature:getFood(objid) return 0, 0 end

--- 设置饥饿度
--- @param objid number @生物objid
--- @param val number @设置的数值
--- @return number @成功返回 ErrorCode.OK
function Creature:setFood(objid, val) return 0 end

--- HP恢复
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和HP恢复值
function Creature:getHpRecover(objid) return 0, 0 end

--- 最大氧气值
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和最大氧气值
function Creature:getMaxOxygen(objid) return 0, 0 end

--- 行走速度
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和行走速度
function Creature:getWalkSpeed(objid) return 0, 0 end

--- 游泳速度（水中速度）
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和游泳速度
function Creature:getSwimSpeed(objid) return 0, 0 end

--- 跳跃力
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和跳跃力
function Creature:getJumpPower(objid) return 0, 0 end

--- 重量
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和重量
function Creature:getMass(objid) return 0, 0 end

--- 闪避
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和闪避值
function Creature:getDodge(objid) return 0, 0 end

--- 近程攻击
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和近程攻击值
function Creature:getPunchAttack(objid) return 0, 0 end

--- 远程攻击
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和远程攻击值
function Creature:getRangeAttack(objid) return 0, 0 end

--- 近程防御
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和近程防御值
function Creature:getPunchDefense(objid) return 0, 0 end

--- 远程防御
--- @param objid number @生物objid
--- @return number, number @成功返回 ErrorCode.OK 和远程防御值
function Creature:getRangeDefense(objid) return 0, 0 end

--- 设置血量上限
--- @param objid number @生物objid
--- @param val number @设置的最大生命值
--- @return number @成功返回 ErrorCode.OK
function Creature:setMaxHp(objid, val) return 0 end

--- 设置血量
--- @param objid number @生物objid
--- @param val number @设置的当前生命值
--- @return number @成功返回 ErrorCode.OK
function Creature:setHP(objid, val) return 0 end

--- 设置HP恢复
--- @param objid number @生物objid
--- @param val number @设置的生命恢复值
--- @return number @成功返回 ErrorCode.OK
function Creature:setHpRecover(objid, val) return 0 end

--- 设置氧气
--- @param objid number @生物objid
--- @param val number @设置的氧气值
--- @return number @成功返回 ErrorCode.OK
function Creature:setOxygen(objid, val) return 0 end

--- 设置行走速度
--- @param objid number @生物objid
--- @param val number @设置的行走速度
--- @return number @成功返回 ErrorCode.OK
function Creature:setWalkSpeed(objid, val) return 0 end

--- 设置游泳速度（水中速度）
--- @param objid number @生物objid
--- @param val number @设置的游泳速度
--- @return number @成功返回 ErrorCode.OK
function Creature:setSwimSpeed(objid, val) return 0 end

--- 设置跳跃力
--- @param objid number @生物objid
--- @param val number @设置的跳跃力
--- @return number @成功返回 ErrorCode.OK
function Creature:setJumpPower(objid, val) return 0 end

--- 设置闪避
--- @param objid number @生物objid
--- @param val number @设置的闪避值
--- @return number @成功返回 ErrorCode.OK
function Creature:setDodge(objid, val) return 0 end

--- 设置近程攻击
--- @param objid number @生物objid
--- @param val number @设置的近程攻击值
--- @return number @成功返回 ErrorCode.OK
function Creature:setPunchAttack(objid, val) return 0 end

--- 设置远程攻击
--- @param objid number @生物objid
--- @param val number @设置的远程攻击值
--- @return number @成功返回 ErrorCode.OK
function Creature:setRangeAttack(objid, val) return 0 end

--- 设置近程防御
--- @param objid number @生物objid
--- @param val number @设置的近程防御值
--- @return number @成功返回 ErrorCode.OK
function Creature:setPunchDefense(objid, val) return 0 end

--- 设置远程防御
--- @param objid number @生物objid
--- @param val number @设置的远程防御值
--- @return number @成功返回 ErrorCode.OK
function Creature:setRangeDefense(objid, val) return 0 end

--- 替换生物
--- @param objid number @要替换的生物objid
--- @param actorid number @替换为的生物类型ID
--- @param hp number @替换后的生物血量
--- @return number @成功返回 ErrorCode.OK
function Creature:replaceActor(objid, actorid, hp) return 0 end

--- 获取生物名称
--- @param monsterid number @生物类型ID
--- @return number, string @成功返回 ErrorCode.OK 和生物类型名称
function Creature:GetMonsterDefName(monsterid) return 0, "" end

--- 获取生物类型描述
--- @param monsterid number @生物类型ID
--- @return number, string @成功返回 ErrorCode.OK 和生物类型描述
function Creature:GetMonsterDefDesc(monsterid) return 0, "" end
--- @class Item
--- 道具模块管理接口 Item
local Item = {}
_G.Item = Item

--- 获取道具名称
--- @param itemid number @道具ID
--- @return number, string @成功返回 ErrorCode.OK 和道具名称
function Item:getItemName(itemid) return 0, "" end

--- 获取actor对应的道具ID，如球类等
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和道具ID
function Item:getItemId(objid) return 0, 0 end

--- 获取掉落物数量
--- @param objid number @对象ID
--- @return number, number @成功返回 ErrorCode.OK 和掉落物堆叠数量
function Item:getDropItemNum(objid) return 0, 0 end

--- 获取随机道具id
--- @return number, number @成功返回 ErrorCode.OK 和随机道具id
function Item:randomItemID() return 0, 0 end

--- 获取随机投掷物id
--- @return number, number @成功返回 ErrorCode.OK 和随机投掷物id
function Item:randomProjectileID() return 0, 0 end

--- 获取道具类型描述
--- @param itemid number @道具类型ID
--- @return number, number @成功返回 ErrorCode.OK 和道具类型描述
function Item:getItemDesc(itemid) return 0, 0 end

--- 获取道具属性
--- @param itemid number @道具类型ID
--- @param attr number @道具属性枚举(ITEMATTR)
--- @return number, number @成功返回 ErrorCode.OK 和属性值
function Item:GetAttr(itemid, attr) return 0, 0 end

--- 微缩模型掉落物播放动画
--- @param objid number @掉落物objid
--- @param animid number @动作ID
--- @param playmode number @播放模式(ANIMMODE)
--- @return number @成功返回 ErrorCode.OK
function Item:playAct(objid, animid, playmode) return 0 end
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
function Backpack:SetGridItem(playerid, gridid, itemid, num) return true end

--- 移除背包格内一定数量道具
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param num number @道具数量(默认全部移除)
--- @return boolean @是否成功
function Backpack:RemoveGridItem(playerid, gridid, num) return true end

--- 移除背包内一定数量道具,通过道具ID移除,默认全部移除
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量
--- @return number @移除数量(ret and ret>0 成功)
function Backpack:RemoveGridItemByItemID(playerid, itemid, num) return 0 end

--- 清空指定背包栏
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @return boolean @是否成功
function Backpack:ClearPack(playerid, bartype) return true end

--- 清空全部背包(包含背包栏、快捷栏、装备栏)
--- @param playerid number @玩家ID
--- @return boolean @是否成功
function Backpack:ClearAllPack(playerid) return true end

--- 移动背包道具,默认全部转移
--- @param playerid number @玩家ID
--- @param gridsrc number @源格子ID
--- @param griddst number @移动至的目标格子ID
--- @param num number @道具数量(默认全部)
--- @return boolean @是否成功
function Backpack:MoveGridItem(playerid, gridsrc, griddst, num) return true end

--- 交换背包道具
--- @param playerid number @玩家ID
--- @param grid1 number @格子1 ID
--- @param grid2 number @格子2 ID
--- @return boolean @是否成功
function Backpack:SwapGridItem(playerid, grid1, grid2) return true end

--- 背包(包含背包栏、快捷栏)是否有足够的空间存放一定数量的道具
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量(默认1)
--- @return boolean @是否成功
function Backpack:EnoughSpaceForItem(playerid, itemid, num) return true end

--- 计算背包(包含背包栏、快捷栏)能存放的道具剩余总数量
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @return number @可以存放的数量
function Backpack:CalcSpaceNumForItem(playerid, itemid) return 0 end

--- 检测背包是否持有某个道具
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @param itemid number|string @道具类型
--- @return boolean @是否成功
function Backpack:HasItemByBackpackBar(playerid, bartype, itemid) return true end

--- 获取背包持有某个道具总数量,同时返回装有道具的背包格数组
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @param itemid number|string @道具类型
--- @return number,table @道具数量,格子ID数组
function Backpack:GetItemNumByBackpackBar(playerid, bartype, itemid) return 0, {} end

--- 获取背包持有某个道具总数量,同时返回装有道具的背包格数组
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param isAddEquip boolean @是否添加装备栏(默认True)
--- @return number,table @道具数量,格子ID数组
function Backpack:GetItemNum(playerid, itemid, isAddEquip) return 0, {} end

--- 获取背包格道具ID(返回itemid, num)
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @return number,number @道具类型,道具数量(无道具 数量是0 itemid是0)
function Backpack:GetGridItemID(playerid, gridid) return 0, 0 end

--- 获取背包格道具名称
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @return string @道具名称
function Backpack:GetGridItemName(playerid, gridid) return "" end

--- 添加道具到背包
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param num number @道具数量
--- @param prioritytype number @优先快捷栏还是背包栏:1优先快捷栏 2优先背包栏(默认1)
--- @return number @成功添加的数量
function Backpack:AddItem(playerid, itemid, num, prioritytype) return 0 end

--- 丢弃背包某个格子里的道具
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param num number @道具数量
--- @param ablePick boolean @能否拾取
--- @return boolean @是否成功
function Backpack:DiscardItem(playerid, gridid, num, ablePick) return true end

--- 丢弃背包某个格子里的道具
--- @param playerid number @玩家ID
--- @param itemid number|string @道具ID
--- @return boolean @是否成功
function Backpack:DiscardItemByID(playerid, itemid) return true end

--- 玩家穿上装备
--- @param playerid number @玩家ID
--- @param itemid number|string @道具类型
--- @param frompos number @格子ID(可不传,如果不为nil 则必须和itemid一致)
--- @return boolean @是否成功
function Backpack:ActEquipUpByResID(playerid, itemid, frompos) return true end

--- 玩家脱下装备栏装备
--- @param playerid number @玩家ID
--- @param grid number @装备栏ID
--- @param grid2 number @目标格子ID(可不传,如果不为nil 则必须是空格子)
--- @return boolean @是否成功
function Backpack:ActEquipOffByEquipID(playerid, grid, grid2) return true end

--- 销毁装备
--- @param playerid number @玩家ID
--- @param grid number @装备栏ID
--- @return boolean @是否成功
function Backpack:ActDestructEquip(playerid, grid) return true end

--- 创建道具到玩家背包
--- @param playerid number @玩家ID
--- @param itemid number @道具类型
--- @param num number @道具数量
--- @param ipos number @优先存放的位置
--- @return any @操作结果
function Backpack:CreateItem(playerid, itemid, num, ipos) return nil end

--- 在手持道具上播放特效
--- @param playerid number @玩家ID
--- @param effectid number @特效ID
--- @param offset table @偏移量
--- @param rot table @旋转
--- @param scale table @缩放
--- @return boolean @是否成功
function Backpack:PlayShortCutIxParticle(playerid, effectid, offset, rot, scale) return true end

--- 停止手持道具上播放特效
--- @param playerid number @玩家ID
--- @param effectid number @特效ID
--- @return boolean @是否成功
function Backpack:StopShortCutIxEffect(playerid, effectid) return true end

--- 设置玩家快捷栏上某种类型道具手持特效
--- @param playerid number @玩家ID
--- @param itemid number @道具类型
--- @param effectid number @特效ID
--- @return boolean @是否成功
function Backpack:PlayShortCutItemParticle(playerid, itemid, effectid) return true end

--- 删除玩家快捷栏上某种类型道具手持特效
--- @param playerid number @玩家ID
--- @param itemid number @道具类型
--- @param effectid number @特效ID
--- @return boolean @是否成功
function Backpack:StopShortCutItemEffect(playerid, itemid, effectid) return true end

--- 批量获取背包和快捷栏格子信息数据
--- @param playerid number @玩家ID
--- @param begingridId number @开始格子id
--- @param endgridId number @结束格子id
--- @return any @格子信息数据
function Backpack:GetGridInfos(playerid, begingridId, endgridId) return nil end

--- 加载背包和快捷栏格子信息数据
--- @param playerid number @玩家ID
--- @param gridinfo string @格子信息
--- @return boolean @是否成功
function Backpack:LoadGridInfos(playerid, gridinfo) return true end

--- 解析格子信息数据
--- @param str string @GetGridInfos打包字符串
--- @return table @解析后的数据
function Backpack:DecodeGridInfo(str) return {} end

--- 将解析的格子信息数据打包
--- @param infos table @DecodeGridInfo解析后的数据
--- @return string @打包后的字符串
function Backpack:EncodeTableGridInfo(infos) return "" end

--- 设置背包和快捷栏格子锁定状态
--- @param playerid number @玩家ID
--- @param begingridId number @开始格子id
--- @param endgridId number @结束格子id
--- @param lock boolean @true锁定 false打开
--- @return boolean @是否成功
function Backpack:SetGridsLock(playerid, begingridId, endgridId, lock) return true end

--- 批量清理背包格子数据
--- @param playerid number @玩家ID
--- @param begingridId number @开始格子id
--- @param endgridId number @结束格子id
--- @return boolean @是否成功
function Backpack:ClearGrids(playerid, begingridId, endgridId) return true end

--- 设置背包格子数量
--- @param playerid number @玩家ID
--- @param num number @数量暂定范围(0-100)
--- @return boolean @是否成功
function Backpack:SetBackPackNum(playerid, num) return true end

--- 获取指定背包中所有道具实例
--- @param playerid number @玩家ID
--- @param bartype number @背包栏类型
--- @return table @道具实例ID数组
function Backpack:GetAllBackPackInstanceIds(playerid, bartype) return {} end

--- 在玩家的背包内创建一个道具实例
--- @param playerid number @玩家ID
--- @param itemid number|string @道具id
--- @param gridIndex number @格子索引
--- @return string @道具实例ID
function Backpack:CreateItemInstInBackpack(playerid, itemid, gridIndex) return "" end

--- 在玩家的背包内创建一把实例化的枪械
--- @param playerid number @玩家ID
--- @param itemid number|string @道具id
--- @param gridIndex number @格子索引
--- @return string @道具实例ID
function Backpack:CreateGunInBackpack(playerid, itemid, gridIndex) return "" end

--- 根据背包索引获取道具实例id
--- @param playerid number @玩家ID
--- @param gridIndex number @格子索引
--- @return string @道具实例id
function Backpack:GetInstIdByGridIndex(playerid, gridIndex) return "" end

--- 获取背包所有实例化的枪械
--- @param playerid number @玩家ID
--- @return table @实例id数组
function Backpack:GetGunInstIdInBackpack(playerid) return {} end

--- 获取背包格子是否锁定
--- @param playerid number @玩家ID
--- @param gridIndex number @格子索引
--- @return boolean @是否锁定(参数错误返回true)
function Backpack:IsLock(playerid, gridIndex) return true end

--- 获取背包格子属性
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param attr number @属性类型
--- @return number @属性值
function Backpack:GetGridAttr(playerid, gridid, attr) return 0 end

--- 设置背包格子属性
--- @param playerid number @玩家ID
--- @param gridid number @格子ID
--- @param attr number @属性类型
--- @param value number @属性值
--- @return boolean @是否成功
function Backpack:SetGridAttr(playerid, gridid, attr, value) return true end
--- @class Area
--- 区域模块管理接口 Area
local Area = {}
_G.Area = Area

--- 创建矩形区域
--- @param pos table @中心位置{x,y,z}
--- @param dim table @尺寸{x,y,z}
--- @return number, number @成功返回 ErrorCode.OK 和区域ID
function Area:createAreaRect(pos, dim) return 0, 0 end

--- 创建矩形区域(通过范围)
--- @param posBeg table @起点坐标{x,y,z}
--- @param posEnd table @终点坐标{x,y,z}
--- @return number, number @成功返回 ErrorCode.OK 和区域ID
function Area:createAreaRectByRange(posBeg, posEnd) return 0, 0 end

--- 销毁区域
--- @param areaid number @区域ID
--- @return number @成功返回 ErrorCode.OK
function Area:destroyArea(areaid) return 0 end

--- 通过位置查找区域
--- @param pos table @位置{x,y,z}
--- @return number, number @成功返回 ErrorCode.OK 和区域ID
function Area:getAreaByPos(pos) return 0, 0 end

--- 区域偏移
--- @param areaid number @区域ID
--- @param x number @向右偏移距离
--- @param y number @向上偏移距离
--- @param z number @向前偏移距离
--- @return number, number @成功返回 ErrorCode.OK 和新的区域ID
function Area:offsetArea(areaid, x, y, z) return 0, 0 end

--- 扩大区域(产生新的区域)
--- @param areaid number @区域ID
--- @param x number @左右扩充距离
--- @param y number @上下扩充距离
--- @param z number @前后扩充距离
--- @return number, number @成功返回 ErrorCode.OK 和新的区域ID
function Area:expandArea(areaid, x, y, z) return 0, 0 end

--- 获取区域中间点
--- @param areaid number @区域ID
--- @return number, table @成功返回 ErrorCode.OK 和中心位置{x,y,z}
function Area:getAreaCenter(areaid) return 0, {} end

--- 获取区域各边长
--- @param areaid number @区域ID
--- @return number, number, number, number @成功返回 ErrorCode.OK 和各方向边长
function Area:getAreaRectLength(areaid) return 0, 0, 0, 0 end

--- 获取区域范围
--- @param areaid number @区域ID
--- @return number, table, table @成功返回 ErrorCode.OK, 起点坐标和终点坐标
function Area:getAreaRectRange(areaid) return 0, {}, {} end

--- 随机区域内位置
--- @param areaid number @区域ID
--- @return number, table @成功返回 ErrorCode.OK 和随机位置{x,y,z}
function Area:getRandomPos(areaid) return 0, {} end

--- 检测obj是否在区域内
--- @param areaid number @区域ID
--- @param objid number @对象ID
--- @return number @成功返回 ErrorCode.OK(在区域内)
function Area:objInArea(areaid, objid) return 0 end

--- 检测区域内是否有某个方块
--- @param areaid number @区域ID
--- @param blockid number @方块ID
--- @return number @成功返回 ErrorCode.OK(包含该方块)
function Area:blockInArea(areaid, blockid) return 0 end

--- 位置是否在区域内
--- @param pos table @位置{x,y,z}
--- @param areaid number @区域ID
--- @return number @成功返回 ErrorCode.OK(在区域内)
function Area:posInArea(pos, areaid) return 0 end

--- 获取区域中的所有玩家
--- @param areaid number @区域ID
--- @return number, table @成功返回 ErrorCode.OK 和玩家列表
function Area:getAreaPlayers(areaid) return 0, {} end

--- 获取区域中的所有生物
--- @param areaid number @区域ID
--- @return number, table @成功返回 ErrorCode.OK 和生物列表
function Area:getAreaCreatures(areaid) return 0, {} end

--- 用方块填充区域
--- @param areaid number @区域ID
--- @param blockid number @方块ID
--- @param face number @方块朝向(0西 1东 2南 3北 4下 5上)
--- @return number @成功返回 ErrorCode.OK
function Area:fillBlock(areaid, blockid, face) return 0 end

--- 清空区域内全部方块
--- @param areaid number @区域ID
--- @param blockid number @方块ID
--- @return number @成功返回 ErrorCode.OK
function Area:clearAllBlock(areaid, blockid) return 0 end

--- 复制区域内方块到另一个区域
--- @param areaid number @区域ID
--- @param deststartpos table @目标起始位置{x,y,z}
--- @return number @成功返回 ErrorCode.OK
function Area:cloneArea(areaid, deststartpos) return 0 end

--- 传入两个坐标列表，得到相加后的位置
--- @param srcpos table @源位置{x,y,z}
--- @param dim table @偏移距离{x,y,z}
--- @return number, table @成功返回 ErrorCode.OK 和相加后的位置{x,y,z}
function Area:getPosOffset(srcpos, dim) return 0, {} end

--- 替换方块类型为新的方块类型
--- @param areaid number @区域ID
--- @param srcblockid number @被替换的方块ID
--- @param destblockid number @替换为的方块ID
--- @param face number @方块朝向(0西 1东 2南 3北 4下 5上)
--- @return number @成功返回 ErrorCode.OK
function Area:replaceAreaBlock(areaid, srcblockid, destblockid, face) return 0 end

--- 区域范围内有方块
--- @param blockid number @方块ID
--- @param posbeg table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @return number @成功返回 ErrorCode.OK(包含该方块)
function Area:blockInAreaRange(blockid, posbeg, posend) return 0 end

--- 获取区域范围内全部对象
--- @param posbegin table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param objtype number @对象类型(OBJ_TYPE)
--- @return number, table @成功返回 ErrorCode.OK 和对象ID数组
function Area:getAllObjsInAreaRange(posbegin, posend, objtype) return 0, {} end

--- 获取区域范围内全部对象(多类型)
--- @param posbegin table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param objtypes table @对象类型数组(OBJ_TYPE)
--- @return number, table @成功返回 ErrorCode.OK 和对象ID数组
function Area:getAllObjsInAreaRangeByObjTypes(posbegin, posend, objtypes) return 0, {} end

--- 获取区域范围内全部玩家
--- @param posbegin table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @return number, table @成功返回 ErrorCode.OK 和玩家ID数组
function Area:getAllPlayersInAreaRange(posbegin, posend) return 0, {} end

--- 获取区域范围内全部生物
--- @param posbegin table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @return number, table @成功返回 ErrorCode.OK 和生物ID数组
function Area:getAllCreaturesInAreaRange(posbegin, posend) return 0, {} end

--- 用方块填充区域范围
--- @param posbeg table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param blockid number @方块ID
--- @param face number @朝向(0西 1东 2南 3北 4下 5上)
--- @return number @成功返回 ErrorCode.OK
function Area:fillBlockAreaRange(posbeg, posend, blockid, face) return 0 end

--- 清空区域范围内方块
--- @param posbeg table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param blockid number @方块ID
--- @return number @成功返回 ErrorCode.OK
function Area:clearAllBlockAreaRange(posbeg, posend, blockid) return 0 end

--- 复制区域范围内方块到另一个区域
--- @param posbeg table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param deststartpos table @目标起始位置{x,y,z}
--- @return number @成功返回 ErrorCode.OK
function Area:cloneAreaRange(posbeg, posend, deststartpos) return 0 end

--- 替换区域范围方块
--- @param posbeg table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param srcblockid number @被替换的方块ID
--- @param destblockid number @替换为的方块ID
--- @param face number @朝向(0西 1东 2南 3北 4下 5上)
--- @return number @成功返回 ErrorCode.OK
function Area:replaceAreaRangeBlock(posbeg, posend, srcblockid, destblockid, face) return 0 end

--- 破坏区域范围方块
--- @param posbeg table @起点{x,y,z}
--- @param posend table @终点{x,y,z}
--- @param blockid number @破坏的方块ID
--- @return number @成功返回 ErrorCode.OK
function Area:DestroyBlockAreaRange(posbeg, posend, blockid) return 0 end
--- @class Buff
--- 状态模块管理接口 Buff
local Buff = {}
_G.Buff = Buff

--- 给对象附加效果
--- @param objId number @对象ID
--- @param buffId number|string @效果ID
--- @param customticks? number @效果持续时间 **(-1表示默认配置，0表示无限)**
--- @return boolean @成功返回true，失败返回false
function Buff:AddBuff(objId, buffId, customticks) return true end

--- 给对象移除指定效果
--- @param objId number @对象ID
--- @param buffId number|string @效果ID
--- @return boolean @成功返回true，失败返回false
function Buff:RemoveBuff(objId, buffId) return true end

--- 给对象清除所有效果
--- @param objId number @对象ID
--- @return boolean @成功返回true，失败返回false
function Buff:ClearAllBuff(objId) return true end

--- 为对象清除所有负面效果
--- @param objId number @对象ID
--- @return boolean @成功返回true，失败返回false
function Buff:ClearAllBadBuff(objId) return true end

--- 为对象清除所有有益效果
--- @param objId number @对象ID
--- @return boolean @成功返回true，失败返回false
function Buff:ClearAllGoodBuff(objId) return true end

--- 判断对象身上是否有指定效果
--- @param objId number @对象ID
--- @param buffId number|string @效果ID
--- @param bufflv number @效果等级
--- @return boolean @成功返回true，失败返回false
function Buff:HasBuff(objId, buffId, bufflv) return true end

--- 获取对象身上效果列表
--- @param objId number @对象ID
--- @return number, table @效果数量, 效果ID数组
function Buff:GetBuffList(objId) return 0, {} end

--- 获取对象身上指定效果数量
--- @param objId number @对象ID
--- @param buffId number|string @效果ID
--- @return number @数量
function Buff:GetBuffNumByBuffid(objId, buffId) return 0 end

--- 获取对象身上指定效果剩余时间
--- @param objId number @对象ID
--- @param buffId number|string @效果ID
--- @return number @剩余时间 **(秒，0表示永久)**
function Buff:GetBuffLeftTime(objId, buffId) return 0 end

--- 获取状态效果名称
--- @param buffId number|string @效果ID
--- @return string @效果名称
function Buff:GetBuffDefName(buffId) return "" end

--- 获取状态效果描述
--- @param buffId number|string @效果ID
--- @return string @状态效果描述
function Buff:GetBuffDefDesc(buffId) return "" end

--- 替换已有状态
--- @param objId number @对象ID
--- @param buffsrc number|string @源状态ID
--- @param buffsrclv number @源状态等级
--- @param buffdst number|string @目标状态
--- @param buffdstlv number @目标状态等级
--- @param customticks number @持续时间
--- @return boolean @成功返回true，失败返回false
function Buff:ReplaceBuff(objId, buffsrc, buffsrclv, buffdst, buffdstlv, customticks) return true end
--- @class Chat
--- 聊天接口 Chat
local Chat = {}
_G.Chat = Chat

--- 发送聊天消息(默认全部玩家)
--- @param content string @消息内容
--- @param targetuin? number @目标玩家uin(0表示全部玩家，默认0)
--- @return number @成功返回 ErrorCode.OK
function Chat:sendChat(content, targetuin) return 0 end

--- 发送系统消息(默认全部玩家)
--- @param content string @消息内容
--- @param targetuin? number @目标玩家uin(0表示全部玩家，默认0)
--- @return number @成功返回 ErrorCode.OK
function Chat:sendSystemMsg(content, targetuin) return 0 end
--- @class Customui
--- 自定义界面管理接口 Customui
local Customui = {}
_G.Customui = Customui

--- 打开一个UI界面
--- @param objid number @玩家ID
--- @param uiname string @自定义界面的UIID
--- @return number @成功返回 ErrorCode.OK
function Customui:openUIView(objid, uiname) return 0 end

--- 隐藏一个UI界面
--- @param objid number @玩家ID
--- @param uiname string @自定义界面的UIID
--- @return number @成功返回 ErrorCode.OK
function Customui:hideUIView(objid, uiname) return 0 end

--- 设置文本元件内容
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param text string @文本内容
--- @param animid? number @动画ID(缺省参数)
--- @param time? number @动画时长(缺省参数)
--- @param mode? number @播放模式(缺省参数)
--- @return number @成功返回 ErrorCode.OK
function Customui:setText(playerid, uiid, elementid, text, animid, time, mode) return 0 end

--- 设置图片元件图案纹理
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param url string @图片ID
--- @return number @成功返回 ErrorCode.OK
function Customui:setTexture(playerid, uiid, elementid, url) return 0 end

--- 设置元件大小
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param width number @元件宽度
--- @param height number @元件高度
--- @return number @成功返回 ErrorCode.OK
function Customui:setSize(playerid, uiid, elementid, width, height) return 0 end

--- 设置文本元件字体大小
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param size number @字体大小
--- @return number @成功返回 ErrorCode.OK
function Customui:setFontSize(playerid, uiid, elementid, size) return 0 end

--- 设置文本元件颜色
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param color string @16进制颜色值
--- @return number @成功返回 ErrorCode.OK
function Customui:setColor(playerid, uiid, elementid, color) return 0 end

--- 显示元件
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param effectid? number @动画ID(缺省参数)
--- @param time? number @动画时长(缺省参数)
--- @return number @成功返回 ErrorCode.OK
function Customui:showElement(playerid, uiid, elementid, effectid, time) return 0 end

--- 隐藏元件
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param effectid? number @动画ID(缺省参数)
--- @param time? number @动画时长(缺省参数)
--- @return number @成功返回 ErrorCode.OK
function Customui:hideElement(playerid, uiid, elementid, effectid, time) return 0 end

--- 旋转元件
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param rotate number @旋转角度(顺时针)
--- @return number @成功返回 ErrorCode.OK
function Customui:rotateElement(playerid, uiid, elementid, rotate) return 0 end

--- 切换页面状态
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param pageIndex string @状态值(页面状态)
--- @param effectid? number @动作枚举(缺省参数)
--- @param time? number @动画时长(缺省参数)
--- @return number @成功返回 ErrorCode.OK
function Customui:setState(playerid, uiid, pageIndex, effectid, time) return 0 end

--- 设置元件透明度
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param alpha number @透明度
--- @return number @成功返回 ErrorCode.OK
function Customui:setAlpha(playerid, uiid, elementid, alpha) return 0 end

--- 设置元件位置
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param x number @X坐标
--- @param y number @Y坐标
--- @return number @成功返回 ErrorCode.OK
function Customui:setPosition(playerid, uiid, elementid, x, y) return 0 end

--- 获取道具类型图标iconID
--- @param itemid number @道具类型ID
--- @return number, number @成功返回 ErrorCode.OK 和道具iconID
function Customui:getItemIcon(itemid) return 0, 0 end

--- 获取生物图标iconID
--- @param objid number @生物ID
--- @return number, number @成功返回 ErrorCode.OK 和生物iconID
function Customui:getMonsterObjIcon(objid) return 0, 0 end

--- 获取生物类型图标iconID
--- @param actorid number @生物类型ID
--- @return number, number @成功返回 ErrorCode.OK 和生物iconID
function Customui:getMonsterIcon(actorid) return 0, 0 end

--- 获取状态类型图标iconID
--- @param buffid number @状态类型ID
--- @return number, number @成功返回 ErrorCode.OK 和状态iconID
function Customui:getStatusIcon(buffid) return 0, 0 end

--- 获取方块类型图标iconID
--- @param blockid number @方块类型ID
--- @return number, number @成功返回 ErrorCode.OK 和方块iconID
function Customui:getBlockIcon(blockid) return 0, 0 end

--- 获取角色类型图标iconID
--- @param playerid number @玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和角色iconID
function Customui:getRoleIcon(playerid) return 0, 0 end

--- 获取玩家快捷栏道具图标iconID
--- @param playerid number @玩家ID
--- @param ix number @快捷栏索引(1~8)
--- @return number, number @成功返回 ErrorCode.OK 和道具iconID
function Customui:getShuctIcon(playerid, ix) return 0, 0 end

--- 元件平滑移动到指定位置
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @执行时间(需大于0)
--- @param x number @横坐标值
--- @param y number @竖坐标值
--- @return number @成功返回 ErrorCode.OK
function Customui:SmoothMoveTo(playerid, uiid, elementid, time, x, y) return 0 end

--- 元件平滑移动相对距离
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @执行时间(需大于0)
--- @param x number @横向距离
--- @param y number @竖向距离
--- @return number @成功返回 ErrorCode.OK
function Customui:SmoothMoveBy(playerid, uiid, elementid, time, x, y) return 0 end

--- 元件平滑改变到指定宽度和高度
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @执行时间(需大于0)
--- @param w number @宽度
--- @param h number @高度
--- @return number @成功返回 ErrorCode.OK
function Customui:SmoothScaleTo(playerid, uiid, elementid, time, w, h) return 0 end

--- 元件平滑改变相对宽度和高度
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @执行时间(需大于0)
--- @param w number @宽度
--- @param h number @高度
--- @return number @成功返回 ErrorCode.OK
function Customui:SmoothScaleBy(playerid, uiid, elementid, time, w, h) return 0 end

--- 元件平滑旋转到指定角度
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @执行时间(需大于0)
--- @param angle number @角度值
--- @return number @成功返回 ErrorCode.OK
function Customui:SmoothRotateTo(playerid, uiid, elementid, time, angle) return 0 end

--- 元件平滑旋转到相对角度
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @执行时间(需大于0)
--- @param angle number @角度值
--- @return number @成功返回 ErrorCode.OK
function Customui:SmoothRotateBy(playerid, uiid, elementid, time, angle) return 0 end

--- 元件播放动画
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param animid number @动画ID
--- @param time number @单次时长(需大于0)
--- @param mode number @播放模式(1循环 2单次)
--- @return number @成功返回 ErrorCode.OK
function Customui:PlayElementAnim(playerid, uiid, elementid, animid, time, mode) return 0 end

--- 元件停止动画
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @return number @成功返回 ErrorCode.OK
function Customui:StopAnim(playerid, uiid, elementid) return 0 end

--- 设置装载器的模型
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param modleid string @模型ID
--- @return number @成功返回 ErrorCode.OK
function Customui:SetLoaderModel(playerid, uiid, elementid, modleid) return 0 end

--- 设置装载器的模型缩放
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param modlescale number @缩放大小
--- @return number @成功返回 ErrorCode.OK
function Customui:SetLoaderModelScale(playerid, uiid, elementid, modlescale) return 0 end

--- 设置装载器的模型方向
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param yaw number @水平角度(角度制)
--- @return number @成功返回 ErrorCode.OK
function Customui:SetLoaderModelDir(playerid, uiid, elementid, yaw) return 0 end

--- 设置装载器的模型动画
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param animid number @动画ID
--- @param playmode number @播放模式(ANIMMODE)
--- @return number @成功返回 ErrorCode.OK
function Customui:SetLoaderModelAct(playerid, uiid, elementid, animid, playmode) return 0 end

--- 滑动列表跳转到某位置
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param x number @X坐标值
--- @param y number @Y坐标值
--- @return number @成功返回 ErrorCode.OK
function Customui:TurnSliderToPos(playerid, uiid, elementid, x, y) return 0 end

--- 设置滑动列表的滑动方式
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param dir number @滑动方式(0仅左右 1仅上下 2自由滑动)
--- @return number @成功返回 ErrorCode.OK
function Customui:SetSliderDir(playerid, uiid, elementid, dir) return 0 end

--- 设置滑动条的图案
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param url string @图片库链接
--- @return number @成功返回 ErrorCode.OK
function Customui:SetSliderBarImg(playerid, uiid, elementid, url) return 0 end

--- 设置玩家界面进度条的值
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param itype number @类型枚举(1最小值 2最大值 3当前值)
--- @param value number @值
--- @return boolean @是否成功
function Customui:SetProgressBarValue(playerid, uiid, elementid, itype, value) return true end

--- 设置玩家界面进度条的纹理
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param itype number @类型枚举(1背景 2进度条)
--- @param url string @图片ID
--- @return boolean @是否成功
function Customui:SetProgressBarResId(playerid, uiid, elementid, itype, url) return true end

--- 进度条文本平滑计时
--- @param playerid number @玩家ID
--- @param uiid string @界面ID
--- @param elementid string @元件ID
--- @param time number @时长
--- @param ptype number @类型枚举(1增加 2减小 3变化至)
--- @param value number @变化的值
--- @return boolean @是否成功
function Customui:SmoothIncreaseProgress(playerid, uiid, elementid, time, ptype, value) return true end
--- @class UI
--- 游戏UI管理接口 UI
local UI = {}
_G.UI = UI

--- 设置战斗总结UI
--- @param name string @设定名
--- @param value string|boolean @设定值
--- @return number @成功返回 ErrorCode.OK
function UI:setGBattleUI(name, value) return 0 end

--- 世界坐标转换到小地图
--- @param x number @世界X坐标
--- @param y number @世界Y坐标
--- @return number, number, number @成功返回 ErrorCode.OK 和小地图x,z坐标
function UI:world2RadarPos(x, y) return 0, 0, 0 end

--- 世界长度转换到小地图
--- @param length number @世界长度
--- @return number, number @成功返回 ErrorCode.OK 和小地图长度
function UI:world2RadarDist(length) return 0, 0 end

--- 设置小地图模式
--- @param mode number @模式(0默认 1:45度旋转视角 2:全图固定俯视角)
--- @return number @成功返回 ErrorCode.OK
function UI:setMinimapRenderMode(mode) return 0 end

--- 地图标记形状设置，设置成线条(LineShape)
--- @param uiname string @地图标记名称
--- @param p1x number @起点X
--- @param p1y number @起点Y
--- @param p2x number @终点X
--- @param p2y number @终点Y
--- @return number @成功返回 ErrorCode.OK
function UI:setShapeLine(uiname, p1x, p1y, p2x, p2y) return 0 end

--- 地图标记形状设置，设置成圆(CircleShape)
--- @param uiname string @地图标记名称
--- @param x number @圆心X
--- @param y number @圆心Y
--- @param radius number @半径
--- @return number @成功返回 ErrorCode.OK
function UI:setShapeCircle(uiname, x, y, radius) return 0 end

--- 显示屏幕特效
--- @param type number @效果类型(1 speedline 2 powerline 3 fog)
--- @param isloop boolean @是否循环
--- @param incspeed number @增速
--- @return number @成功返回 ErrorCode.OK
function UI:ShowScreenEffect(type, isloop, incspeed) return 0 end
--- @class Graphics
--- 图文信息管理接口 Graphics
local Graphics = {}
_G.Graphics = Graphics

--- 创建文字板信息
--- @param title string @显示的文字标题
--- @param font number @字体大小
--- @param alpha number @不透明度(0完全透明 100不透明)
--- @param itype number @文字板的编号
--- @param autoWrap? boolean @是否自动换行(默认true)
--- @return table @文本信息内容
function Graphics:makeGraphicsText(title, font, alpha, itype, autoWrap) return {} end

--- 创建漂浮文字信息
--- @param title string @显示的文字标题
--- @param font number @字体大小
--- @param itype number @漂浮文字的编号
--- @return table @漂浮文字信息
function Graphics:makeflotageText(title, font, itype) return {} end

--- 创建进度条信息
--- @param v1 number @进度条的当前值
--- @param v2 number @进度条的最大值
--- @param color number @进度条的颜色
--- @param itype number @进度条的编号
--- @return table @进度条信息
function Graphics:makeGraphicsProgress(v1, v2, color, itype) return {} end

--- 生成指向位置的箭头数据
--- @param x number @指向X坐标
--- @param y number @指向Y坐标
--- @param z number @指向Z坐标
--- @param size number @箭头大小
--- @param color number @箭头颜色
--- @param id number @编号
--- @return table @箭头数据
function Graphics:makeGraphicsArrowToPos(x, y, z, size, color, id) return {} end

--- 生成指向位置的线数据
--- @param x number @指向X坐标
--- @param y number @指向Y坐标
--- @param z number @指向Z坐标
--- @param size number @线的大小
--- @param color number @线的颜色
--- @param id number @编号
--- @return table @线数据
function Graphics:makeGraphicsLineToPos(x, y, z, size, color, id) return {} end

--- 生成指向位置的面数据
--- @param x number @指向X坐标
--- @param y number @指向Y坐标
--- @param z number @指向Z坐标
--- @param size number @面的大小
--- @param color number @面的颜色
--- @param id number @编号
--- @return table @面数据
function Graphics:makeGraphicsSurfaceToPos(x, y, z, size, color, id) return {} end

--- 生成指向对象的箭头数据
--- @param objid number @生物id
--- @param size number @箭头大小
--- @param color number @箭头颜色
--- @param id number @编号
--- @return table @箭头数据
function Graphics:makeGraphicsArrowToActor(objid, size, color, id) return {} end

--- 生成指向对象的线数据
--- @param objid number @生物id
--- @param size number @线的大小
--- @param color number @线的颜色
--- @param id number @编号
--- @return table @线数据
function Graphics:makeGraphicsLineToActor(objid, size, color, id) return {} end

--- 生成指向对象的面数据
--- @param objid number @生物id
--- @param size number @面的大小
--- @param color number @面的颜色
--- @param id number @编号
--- @return table @面数据
function Graphics:makeGraphicsSurfaceToActor(objid, size, color, id) return {} end

--- 在位置上创建文字板
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param graphicInfo table @图文设置的属性信息
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsTxtByPos(x, y, z, graphicInfo, x2, y2) return 0, 0 end

--- 在生物身上创建文字板
--- @param objid number @生物objid
--- @param graphicInfo table @图文设置的属性信息
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsTxtByActor(objid, graphicInfo, dir, offset, x2, y2) return 0, 0 end

--- 在位置上创建漂浮文字
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param graphicInfo table @图文设置的属性信息
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createflotageTextByPos(x, y, z, graphicInfo, x2, y2) return 0, 0 end

--- 在生物身上创建漂浮文字
--- @param objid number @生物objid
--- @param graphicInfo table @图文设置的属性信息
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createflotageTextByActor(objid, graphicInfo, dir, offset, x2, y2) return 0, 0 end

--- 在位置上创建进度条
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param graphicInfo table @进度条设置的属性信息
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsProgressByPos(x, y, z, graphicInfo, x2, y2) return 0, 0 end

--- 在生物身上创建进度条
--- @param objid number @生物objid
--- @param graphicInfo table @进度条设置的属性信息
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number, number @成功返回 ErrorCode.OK 和图文信息ID
function Graphics:createGraphicsProgressByActor(objid, graphicInfo, dir, offset, x2, y2) return 0, 0 end

--- 删除位置上的图文信息
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param itype number @图文信息组类型(编号)
--- @param graphType number @图文类型枚举值
--- @return number @成功返回 ErrorCode.OK
function Graphics:removeGraphicsByPos(x, y, z, itype, graphType) return 0 end

--- 删除生物的图文信息
--- @param objid number @生物objid
--- @param itype number @图文信息组类型(编号)
--- @param graphType number @图文类型枚举值
--- @return number @成功返回 ErrorCode.OK
function Graphics:removeGraphicsByObjID(objid, itype, graphType) return 0 end

--- 更新图文信息的文字内容
--- @param graphid number @已创建的图文信息ID
--- @param title string @文字内容
--- @param fontsize? number @字体大小(可不填)
--- @param alpha? number @不透明度
--- @return number @成功返回 ErrorCode.OK
function Graphics:updateGraphicsTextById(graphid, title, fontsize, alpha) return 0 end

--- 更新进度条的进度
--- @param graphid number @已创建的图文信息ID
--- @param curval number @进度条当前值
--- @param maxval number @进度条最大值
--- @return number @成功返回 ErrorCode.OK
function Graphics:updateGraphicsProgressById(graphid, curval, maxval) return 0 end

--- 创建生物指向位置的箭头
--- @param objid number @生物id
--- @param info table @箭头信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByActorToPos(objid, info, dir, offset) return 0 end

--- 创建生物指向生物的箭头
--- @param objid number @生物id
--- @param info table @箭头信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByActorToActor(objid, info, dir, offset) return 0 end

--- 创建位置指向位置的箭头
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @箭头信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByPosToPos(x, y, z, info) return 0 end

--- 创建位置指向生物的箭头
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @箭头信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsArrowByPosToActor(x, y, z, info) return 0 end

--- 创建生物与位置的线
--- @param objid number @生物id
--- @param info table @线信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByActorToPos(objid, info, dir, offset) return 0 end

--- 创建指向生物的线
--- @param objid number @生物id
--- @param info table @线信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByActorToActor(objid, info, dir, offset) return 0 end

--- 创建位置指向位置的线
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @线信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByPosToPos(x, y, z, info) return 0 end

--- 创建位置指向生物的线
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @线信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsLineByPosToActor(x, y, z, info) return 0 end

--- 创建指向位置的面
--- @param objid number @生物id
--- @param info table @面信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByActorToPos(objid, info, dir, offset) return 0 end

--- 创建指向生物的面
--- @param objid number @生物id
--- @param info table @面信息
--- @param dir table @朝向
--- @param offset number @偏移
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByActorToActor(objid, info, dir, offset) return 0 end

--- 创建位置指向位置的面
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @面信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByPosToPos(x, y, z, info) return 0 end

--- 创建位置指向生物的面
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @面信息
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsSurfaceByPosToActor(x, y, z, info) return 0 end

--- 刷新信息至客机(在更新图文信息接口之后调用)
--- @return number @成功返回 ErrorCode.OK
function Graphics:snycGraphicsInfo2Client() return 0 end

--- 创建图片信息
--- @param imgid number @图片ID
--- @param scale number @图片大小缩放
--- @param alpha number @图片透明度
--- @param id number @图片的编号
--- @return table @图片信息
function Graphics:makeGraphicsImage(imgid, scale, alpha, id) return {} end

--- 在生物身上创建图片
--- @param objid table @生物或玩家ID
--- @param info table @图片信息(makeGraphicsImage生成)
--- @param dir table @图文信息在生物身上的朝向
--- @param offset number @方向上的偏移
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsImageByActor(objid, info, dir, offset, x2, y2) return 0 end

--- 在位置上创建图片
--- @param x number @X坐标
--- @param y number @Y坐标
--- @param z number @Z坐标
--- @param info table @图片信息(makeGraphicsImage生成)
--- @param x2 number @2d平面x轴偏移量
--- @param y2 number @2d平面y轴偏移量
--- @return number @成功返回 ErrorCode.OK
function Graphics:createGraphicsImageByPos(x, y, z, info, x2, y2) return 0 end
--- @class MiniTimer
--- 计时器接口 MiniTimer
local MiniTimer = {}
_G.MiniTimer = MiniTimer

--- 判断计时器是否存在
--- @param id number @计时器ID
--- @return boolean @是否存在
function MiniTimer:isExist(id) return true end

--- 添加计时器
--- @param name string @计时器名称
--- @param mapid? any @地图ID(作用不明，默认不传)
--- @param private? boolean @是否为存档私有计时器(默认true)
--- @return number, number @成功返回 ErrorCode.OK 和计时器ID
function MiniTimer:createTimer(name, mapid, private) return 0, 0 end

--- 删除计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:deleteTimer(id) return 0 end

--- 启动倒计时
--- @param id number @计时器ID
--- @param interval number @倒计时间隔时间
--- @param repeated boolean @是否重复执行
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:startBackwardTimer(id, interval, repeated) return 0 end

--- 启动正向计时
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:startForwardTimer(id) return 0 end

--- 暂停计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:pauseTimer(id) return 0 end

--- 恢复计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:resumeTimer(id) return 0 end

--- 停止计时器
--- @param id number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:stopTimer(id) return 0 end

--- 改变计时器计时
--- @param id number @计时器ID
--- @param time number @计时器计时
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:changeTimerTime(id, time) return 0 end

--- 获取计时器时间
--- @param id number @计时器ID
--- @return number, number @成功返回 ErrorCode.OK 和计时器运行时间
function MiniTimer:getTimerTime(id) return 0, 0 end

--- 显示计时器窗口(若其他计时器已经显示，则替换显示)
--- @param playerids table @玩家ID数组(nil表示全部玩家)
--- @param timerid number @计时器ID
--- @param title string @计时器窗口显示的标题
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:showTimerWnd(playerids, timerid, title) return 0 end

--- 隐藏计时器窗口
--- @param playerids table @玩家ID数组(nil表示全部玩家)
--- @param timerid number @计时器ID
--- @return number @成功返回 ErrorCode.OK
function MiniTimer:hideTimerWnd(playerids, timerid) return 0 end
--- @class Team
--- 队伍模块管理接口 Team
local Team = {}
_G.Team = Team

--- 当前队伍数量
--- @return number, number @成功返回 ErrorCode.OK 和队伍数量
function Team:getNumTeam() return 0, 0 end

--- 获取指定队伍玩家数量
--- @param teamid number @队伍ID(默认全部)
--- @param alive number @是否存活(0死亡 1存活 2全部，默认全部)
--- @return number, number @成功返回 ErrorCode.OK 和队伍玩家数量
function Team:getTeamPlayerNum(teamid, alive) return 0, 0 end

--- 获取指定队伍玩家
--- @param teamid number @队伍ID(默认全部)
--- @param alive number @是否存活(0死亡 1存活 2全部，默认全部)
--- @return number, number, table @成功返回 ErrorCode.OK, 玩家数量和成员uin数组
function Team:getTeamPlayers(teamid, alive) return 0, 0, {} end

--- 随机一名玩家
--- @param teamid number @队伍ID(默认全部)
--- @param alive number @是否存活(0死亡 1存活 2全部，默认全部)
--- @return number, number @成功返回 ErrorCode.OK 和随机玩家的uin
function Team:randomTeamPlayer(teamid, alive) return 0, 0 end

--- 获取指定队伍生物 (类似 getTeamPlayers)
--- @param teamid number @队伍ID
--- @return number, table @成功返回 ErrorCode.OK 和objid数组
function Team:getTeamCreatures(teamid) return 0, {} end

--- 队伍分数
--- @param teamid number @队伍ID
--- @param score number @要设置的分数
--- @return number @成功返回 ErrorCode.OK
function Team:setTeamScore(teamid, score) return 0 end

--- 获取组队分数
--- @param teamid number @队伍ID
--- @return number, number @成功返回 ErrorCode.OK 和队伍分数
function Team:getTeamScore(teamid) return 0, 0 end

--- 增加队伍分数
--- @param teamid number @队伍ID
--- @param score number @要增加的分数
--- @return number @成功返回 ErrorCode.OK
function Team:addTeamScore(teamid, score) return 0 end

--- 队伍胜负结果
--- @param teamid number @队伍ID
--- @param result number @胜负结果(1获胜 2失败)
--- @return number @成功返回 ErrorCode.OK
function Team:setTeamResults(teamid, result) return 0 end

--- 获取当前队伍胜负
--- @param teamid number @队伍ID
--- @return number, number @成功返回 ErrorCode.OK 和胜负结果(1获胜 2失败)
function Team:getTeamResults(teamid) return 0, 0 end

--- 队伍阵亡次数
--- @param teamid number @队伍ID
--- @param times number @阵亡次数
--- @return number @成功返回 ErrorCode.OK
function Team:setTeamDieTimes(teamid, times) return 0 end

--- 获取队伍总死亡数
--- @param teamid number @队伍ID
--- @return number, number @成功返回 ErrorCode.OK 和总死亡数
function Team:getTeamDieTimes(teamid) return 0, 0 end

--- 增加队伍总死亡数
--- @param teamid number @队伍ID
--- @return number @成功返回 ErrorCode.OK
function Team:addTeamDieTimes(teamid) return 0 end

--- 改变玩家队伍
--- @param playerid number @玩家ID或迷你号
--- @param teamid number @目标队伍ID
--- @return number @成功返回 ErrorCode.OK
function Team:changePlayerTeam(playerid, teamid) return 0 end
--- @class ObjectLib
--- 对象库接口 ObjectLib
local ObjectLib = {}
_G.ObjectLib = ObjectLib

--- 获取区域数据
--- @param uuid number @区域ID
--- @return number, number @成功返回 ErrorCode.OK 和区域运行ID
function ObjectLib:getAreaData(uuid) return 0, 0 end

--- 获取位置数据
--- @param uuid number @位置ID
--- @return number, number @成功返回 ErrorCode.OK 和位置运行ID
function ObjectLib:getPositionData(uuid) return 0, 0 end

--- 获取生物数据
--- @param uuid number @生物ID
--- @return number, number @成功返回 ErrorCode.OK 和生物运行ID
function ObjectLib:getLivingData(uuid) return 0, 0 end

--- 获取道具点数据
--- @param uuid number @道具ID
--- @return number, number @成功返回 ErrorCode.OK 和道具运行ID
function ObjectLib:getItemData(uuid) return 0, 0 end
--- @class ListenParam
--- 函数监听接口 ListenParam
local ListenParam = {}
_G.ListenParam = ListenParam

--- 添加图文信息 监听触发器参数 刷新的对象id 参数信息 回调方法
--- @param graphid number @已创建的图文信息ID
--- @param funcs table @监听函数列表
--- @param param table @监听函数需要的参数
--- @return number @成功返回 ErrorCode.OK
function ListenParam:AddGraphicsListenParam(graphid, funcs, param) return 0 end
--- @class VarLib2
--- 变量库接口 VarLib2
local VarLib2 = {}
_G.VarLib2 = VarLib2

--- 设置变量库全局变量
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @param val number @设置的值
--- @return number @成功返回 ErrorCode.OK
function VarLib2:setGlobalVarByName(actionattr, msg, val) return 0 end

--- 获取变量库全局变量
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @return number, number @成功返回 ErrorCode.OK 和变量值
function VarLib2:getGlobalVarByName(actionattr, msg) return 0, 0 end

--- 设置变量库私有变量
--- @param objid number @私有变量所属对象ID
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @param val number @设置的值
--- @return number @成功返回 ErrorCode.OK
function VarLib2:setPlayerVarByName(objid, actionattr, msg, val) return 0 end

--- 获取变量库私有变量
--- @param objid number @私有变量所属对象ID
--- @param actionattr number @变量类型(VARTYPE)
--- @param msg string @变量名(在变量库中创建)
--- @return number, number @成功返回 ErrorCode.OK 和变量值
function VarLib2:getPlayerVarByName(objid, actionattr, msg) return 0, 0 end
--- @class Valuegroup
--- 变量组管理接口 Valuegroup
local Valuegroup = {}
_G.Valuegroup = Valuegroup

--- 获取组中所有值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, table @成功返回 ErrorCode.OK 和所有元素
function Valuegroup:getAllGroupItem(vartype, libname, playerid) return 0, {} end

--- 添加任意值到任意组(加在组的最后一位)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param value any @要添加的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:insertInGroupByName(vartype, libname, value, playerid) return 0 end

--- 从任意组移除指定编号的值(变为nil，编号不会移除)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param indx number @组中的编号索引
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:removeValueIndexByName(vartype, libname, indx, playerid) return 0 end

--- 从任意组移除任意值为nil
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param value any @要移除的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:removeValueByName(vartype, libname, value, playerid) return 0 end

--- 清空任意组(编号和内容全部清空)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:clearGroupByName(vartype, libname, playerid) return 0 end

--- 获取数组长度
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, number @成功返回 ErrorCode.OK 和数组长度
function Valuegroup:getGrouplengthByName(vartype, libname, playerid) return 0, 0 end

--- 获取组中指定编号的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param indx number @组中的编号索引
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, any @成功返回 ErrorCode.OK 和编号的值
function Valuegroup:getValueNoByName(vartype, libname, indx, playerid) return 0, nil end

--- 设置组中编号索引的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param indx number @组中的编号索引
--- @param value any @设置的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:setValueNoByName(vartype, libname, indx, value, playerid) return 0 end

--- 随机获得数组里面的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, any @成功返回 ErrorCode.OK 和随机获取的值
function Valuegroup:getRandomValueByName(vartype, libname, playerid) return 0, nil end

--- 在任意组任意编号位置插入任意值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @插入的编号位置
--- @param value any @设置的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:insertValueByName(vartype, libname, no, value, playerid) return 0 end

--- 从任意组清空指定编号的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @清空的编号位置
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:deleteNoByName(vartype, libname, no, playerid) return 0 end

--- 从任意组清空指定值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @清空的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:deleteValueByName(vartype, libname, val, playerid) return 0 end

--- 在任意组中添加一组值(在组1的末尾添加组2的值)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:addGroupByName(vartype, libname, libname2, playerid1, playerid2) return 0 end

--- 在任意组中将一组值设为空值(比较组1和组2，若组1中有与组2相同的值则设为nil)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:removeGroupByName(vartype, libname, libname2, playerid1, playerid2) return 0 end

--- 在任意组中删除一组值(比较组1和组2，若组1中有与组2相同的值则清除)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:deleteGroupByName(vartype, libname, libname2, playerid1, playerid2) return 0 end

--- 在任意组插入一组值(在组1指定编号位置插入组2的值)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @插入的位置
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:insertGroupByName(vartype, libname, no, libname2, playerid1, playerid2) return 0 end

--- 替换任意组中的任意值为新的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param oldval any @旧值
--- @param newval any @新值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:replaceValueByName(vartype, libname, oldval, newval, playerid) return 0 end

--- 对任意组的值排序
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param sortType number @排序类型(0升序 1降序)
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:sortGroupByName(vartype, libname, sortType, playerid) return 0 end

--- 任意组是否有任意值(有则result返回0)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @查询的值
--- @param playerid number @私有组玩家ID
--- @return number @成功返回 ErrorCode.OK(有值)
function Valuegroup:hasValueByName(vartype, libname, val, playerid) return 0 end

--- 任意组位置上是否有值(有则result返回0)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @索引值
--- @param playerid number @私有组玩家ID
--- @return number @成功返回 ErrorCode.OK(有值)
function Valuegroup:hasNoByName(vartype, libname, no, playerid) return 0 end

--- 获取任意组中任意值的数量
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @查询的值
--- @param playerid number @私有组玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和值数量
function Valuegroup:getValueCountByName(vartype, libname, val, playerid) return 0, 0 end

--- 获取任意组中任意值的编号(如果多个相同值，只返回第一个)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @查询的值
--- @param playerid number @私有组玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和编号
function Valuegroup:getGroupNoByValue(vartype, libname, val, playerid) return 0, 0 end

--- 获取最大最小值
--- @param libname string @组名
--- @param itype number @获取类型(0最小值 1最大值)
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, any @成功返回 ErrorCode.OK 和最值
function Valuegroup:getSpcialValueByName(libname, itype, playerid) return 0, nil end
--- @class CloudSever
--- 云服数据存储接口 CloudSever
local CloudSever = {}
_G.CloudSever = CloudSever

--- 设置排行榜中指定键的数值
--- @param libvarname string @排行榜变量设计名
--- @param key string @获取的键值
--- @param value number @设置的数值
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:setOrderDataBykey(libvarname, key, value) return 0 end

--- 删除排行榜中指定键的数值
--- @param libvarname string @排行榜变量设计名
--- @param key string @获取的键值
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:removeOrderDataByKey(libvarname, key) return 0 end

--- 获取排行榜中指定键的数值
--- @param libvarname string @排行榜变量设计名
--- @param key string @获取的键值
--- @param callback function @更新回调(function(code/错误码 ...) 0成功 1失败 2数据不存在)
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:getOrderDataByKeyEx(libvarname, key, callback) return 0 end

--- 获取排行榜中指定排名的数值
--- @param libvarname string @排行榜变量设计名
--- @param index number @获取数据的名次
--- @param callback function @更新回调(function(code/错误码 ...) 0成功 1失败 2数据不存在)
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:getOrderDataIndexValueEx(libvarname, index, callback) return 0 end

--- 清理排行榜
--- @param libvarname string @排行榜变量设计名
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:ClearOrderData(libvarname) return 0 end

--- 变量自运算
--- @param libvarname string @排行榜变量设计名
--- @param key string @获取的键值
--- @param value number @每次加的值
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:automaticByKey(libvarname, key, value) return 0 end

--- 获取排行榜中多条数据
--- @param libvarname string @排行榜变量设计名
--- @param icount number @获取数据的条数
--- @param callback function @更新回调(function(code/错误码 ...) 0成功 1失败 2数据不存在)
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:getOrderDataIndexAreaEx(libvarname, icount, callback) return 0 end

--- 获取排行榜中指定值区域的前多少名数据
--- @param libvarname string @排行榜变量设计名
--- @param icount number @获取数据的条数
--- @param minvalue number @最小值
--- @param maxvalue number @最大值
--- @param callback function @更新回调(function(code/错误码 ...) 0成功 1失败)
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:getOrderDataValueAreaEx(libvarname, icount, minvalue, maxvalue, callback) return 0 end

--- 设置表中指定键的值
--- @param libvarname string @表变量设计名
--- @param key string @获取的键值
--- @param value any @任意值(number, string, table)
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:setDataListBykey(libvarname, key, value) return 0 end

--- 删除表中指定键的值
--- @param libvarname string @表变量设计名
--- @param key string @获取的键值
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:removeDataListByKey(libvarname, key) return 0 end

--- 获取表中指定键的值
--- @param libvarname string @表变量设计名
--- @param key string @获取的键值
--- @param callback function @更新回调(function(code/错误码 ...) 0成功 1失败 2数据不存在)
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:getDataListByKeyEx(libvarname, key, callback) return 0 end

--- 清空表数据
--- @param libvarname string @表变量设计名
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:ClearDataList(libvarname) return 0 end

--- 获取表或排行榜当前缓存数据
--- @param libvarname string @表变量设计名
--- @return number, any @成功返回 ErrorCode.OK 和当前缓存数据
function CloudSever:getlistCache(libvarname) return 0, nil end

--- 安全更新数据
--- @param libvarname string @表变量设计名
--- @param key string @更新的键值
--- @param callback function @更新回调(function(code/错误码 ...))
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:UpdateDataListByKey(libvarname, key, callback) return 0 end

--- 发送服务通知消息
--- @param msg string @消息名称
--- @param customdata any @消息附带参数
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:SendSeverMsg(msg, customdata) return 0 end

--- 传送玩家到指定地图
--- @param playerid number|table @玩家UIN或玩家UIN数组
--- @param mapid number @地图ID
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:TransmitToMap(playerid, mapid) return 0 end

--- 传送玩家到指定房间
--- @param playerid number|table @玩家UIN或玩家UIN数组
--- @param roomid string @房间ID
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:TransmitToRoom(playerid, roomid) return 0 end

--- 传送玩家到其他房间
--- @param playerid number|table @玩家UIN或玩家UIN数组
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:TransmitOtherRoom(playerid) return 0 end

--- 获取当前云服房间ID
--- @return number, string @成功返回 ErrorCode.OK 和房间ID
function CloudSever:GetRoomID() return 0, "" end

--- 传送玩家到指定分类房间
--- @param playerid number|table @玩家UIN或玩家UIN数组
--- @param roomtype string @分类ID(数值和字符串组合)
--- @param mapid string @地图ID
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:TransmitToCategoryRoom(playerid, roomtype, mapid) return 0 end

--- 当前房间停止进入玩家（仅云服生效）
--- @param seconds number @倒计时事件（小于等于零立即生效，默认0）
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:SetForbidJoin(seconds) return 0 end

--- 关闭当前房间（仅云服生效）
--- @param countdown number @倒计时事件（小于等于零立即生效，默认0）
--- @param msg string @提示语
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function CloudSever:CloseCurRoom(countdown, msg) return 0 end

--- 获取当前房间的分类信息（仅云服生效）
--- @return number, string @成功返回 ErrorCode.OK 和分类信息
function CloudSever:GetRoomCategory() return 0, "" end
--- @class DisPlayBoard
--- 显示板管理接口 DisPlayBoard
local DisPlayBoard = {}
_G.DisPlayBoard = DisPlayBoard

--- 对玩家显示显示板
--- @param playerid number @玩家ID
--- @param boardid number @显示板ID
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function DisPlayBoard:showBoard(playerid, boardid) return 0 end

--- 对玩家隐藏显示板
--- @param playerid number @玩家ID
--- @param boardid number @显示板ID
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function DisPlayBoard:hideBoard(playerid, boardid) return 0 end

--- 对玩家设置显示板的图片
--- @param playerid number @玩家ID
--- @param boardid number @显示板ID
--- @param pictureid string @图片ID
--- @return number @成功返回 ErrorCode.OK，失败返回 ErrorCode
function DisPlayBoard:setBoardPicture(playerid, boardid, pictureid) return 0 end
--- @class Spawnport
--- 出生点接口 Spawnport
local Spawnport = {}
_G.Spawnport = Spawnport

--- 获取默认出生点
--- @return number @成功返回 ErrorCode.OK
--- @return number @x 坐标
--- @return number @y 坐标
--- @return number @z 坐标
function Spawnport:GetSpawnPoint() return 0, 0, 0, 0 end

--- 设置出生点位置
--- @param x number @x 坐标
--- @param y number @y 坐标
--- @param z number @z 坐标
--- @return number @成功返回 ErrorCode.OK
function Spawnport:SetSpawnPoint(x, y, z) return 0 end

--- 获取区块有效刷新点，可作为出生点
--- @param x number @区块 x 坐标
--- @param y number @区块 y 坐标
--- @param z number @区块 z 坐标
--- @return number @成功返回 ErrorCode.OK
--- @return number @x 坐标
--- @return number @y 坐标
--- @return number @z 坐标
function Spawnport:GetChunkValidSpawnPos(x, y, z) return 0, 0, 0, 0 end
--- @class MapMark
--- 小地图接口 MapMark
local MapMark = {}
_G.MapMark = MapMark

--- 新增一个形状(线，矩形，圆形)
--- @param type number @形状类型(0线 1矩形 2圆形)
--- @param isshow boolean @是否显示
--- @param r number @颜色R值(0~255)
--- @param g number @颜色G值(0~255)
--- @param b number @颜色B值(0~255)
--- @return number, number @成功返回 ErrorCode.OK 和形状ID
function MapMark:newShape(type, isshow, r, g, b) return 0, 0 end

--- 删除一个形状
--- @param shapeid number @形状ID
--- @return number @成功返回 ErrorCode.OK
function MapMark:deleteShape(shapeid) return 0 end

--- 设置形状颜色
--- @param shapeid number @形状ID
--- @param r number @颜色R值(0~255)
--- @param g number @颜色G值(0~255)
--- @param b number @颜色B值(0~255)
--- @return number @成功返回 ErrorCode.OK
function MapMark:setShapeColor(shapeid, r, g, b) return 0 end

--- 设置形状显示 or 隐藏
--- @param shapeid number @形状ID
--- @param showflag boolean @是否显示(true显示 false隐藏)
--- @return number @成功返回 ErrorCode.OK
function MapMark:showShape(shapeid, showflag) return 0 end

--- 更新形状(线形)，传入起始坐标和末尾坐标
--- @param shapeid number @形状ID
--- @param sx number @起始X坐标
--- @param sz number @起始Z坐标
--- @param ex number @末尾X坐标
--- @param ez number @末尾Z坐标
--- @return number @成功返回 ErrorCode.OK
function MapMark:updateLine(shapeid, sx, sz, ex, ez) return 0 end

--- 更新形状(矩形)，传入起始坐标和尺寸
--- @param shapeid number @形状ID
--- @param sx number @起始X坐标
--- @param sz number @起始Z坐标
--- @param w number @X方向宽度
--- @param h number @Z方向高度
--- @return number @成功返回 ErrorCode.OK
function MapMark:updateRectangle(shapeid, sx, sz, w, h) return 0 end

--- 更新形状(圆形)，传入圆心坐标和半径
--- @param shapeid number @形状ID
--- @param cx number @圆心X坐标
--- @param cz number @圆心Z坐标
--- @param r number @半径
--- @return number @成功返回 ErrorCode.OK
function MapMark:updateCircle(shapeid, cx, cz, r) return 0 end
