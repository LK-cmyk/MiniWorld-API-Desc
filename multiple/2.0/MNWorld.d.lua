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
