---@class World
---世界模块管理接口 World
local World = {}
_G.World = World

---停止指定位置的特效
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param particleId number @特效ID
---@return boolean @操作是否成功
function World:StopParticleOnPos(x, y, z, particleId)
    return true
end

---设置指定位置的特效偏移旋转缩放
---@param pos table @位置坐标表{x=x, y=y, z=z}
---@param particleIdArg number|table @特效ID或ID数组
---@param offset table @偏移量(缺省参数)
---@param rot table @旋转角度(缺省参数)
---@param scale table @缩放比例
---@return boolean @操作是否成功
function World:SetParticleTransform(pos, particleIdArg, offset, rot, scale)
    return true
end

---在指定位置播放特效
---@param pos table @位置坐标表{x=x, y=y, z=z}
---@param particleIdArg number|table @特效ID或ID数组
---@param ptimeArg number @播放时长(秒)
---@param scale table @缩放比例(缺省参数)
---@return boolean @操作是否成功
function World:PlayParticle(pos, particleIdArg, ptimeArg, scale)
    return true
end

---生成生物(包括怪物、NPC、动物等)
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@param actorid number|string @生物类型ID
---@param num number @生成数量(默认1)
---@param trigger boolean @是否触发事件(默认true)
---@return table @生成的生物对象ID数组
function World:SpawnCreature(x, y, z, actorid, num, trigger)
    return {}
end

---移除生物
---@param creatureId number @生物对象ID
---@return boolean @操作是否成功
function World:DespawnActor(creatureId)
    return true
end

---获取全部玩家数量
---@param alive number @玩家状态(0阵亡,1存活,-1全体玩家)
---@return number @玩家数量
function World:GetPlayerTotal(alive)
    return 0
end

---获取全部玩家
---@param alive number @玩家状态(0阵亡,1存活,-1全体玩家)
---@return table @玩家ID数组
function World:GetAllPlayers(alive)
    return {}
end

---获取默认出生点
---@return number,number,number @x,y,z方块坐标
function World:GetSpawnPoint()
    return 0, 0, 0
end

---获取附近合适的生物出生点位置(方块坐标单位)
---@param centerX number @中心位置x
---@param centerY number @中心位置y
---@param centerZ number @中心位置z
---@param radius number @搜索半径
---@param includeCenterPos boolean @是否包含中心位置(默认true)
---@return table @位置坐标表数组
function World:FindCanSpawnMobPosList(centerX, centerY, centerZ, radius, includeCenterPos)
    return {}
end

---获取距离某点最近的玩家(方块坐标单位)
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param worldId number @世界ID(默认米拉星)
---@return number @最近的玩家ID
function World:FindNearestPlayerByPos(x, y, z, worldId)
    return 0
end

---在指定位置上播放指定音效
---@param pos table @位置坐标表{x=x, y=y, z=z}
---@param soundId number @音效ID
---@param volume number @音量调节
---@param pitch number @音调调节
---@param isLoop boolean @是否循环播放
---@return boolean @操作是否成功
function World:PlaySoundEffectOnPos(pos, soundId, volume, pitch, isLoop)
    return true
end

---停止指定位置上的指定音效
---@param pos table @位置坐标表{x=x, y=y, z=z}
---@param soundId number @音效ID
---@return boolean @操作是否成功
function World:StopSoundEffectOnPos(pos, soundId)
    return true
end

---暂停/恢复指定位置上的指定音效
---@param pos table @位置坐标表{x=x, y=y, z=z}
---@param soundId number @音效ID
---@param pause boolean @true暂停/false恢复
---@return boolean @操作是否成功
function World:PauseSoundEffectOnPos(pos, soundId, pause)
    return true
end

---是否是白天
---@return boolean @是否白天
function World:IsDaytime()
    return true
end

---设置游戏当前时间(小时)
---@param time number @时间(小时)
---@return boolean @操作是否成功
function World:SetHours(time)
    return true
end

---获取游戏当前时间(小时)
---@return number @当前时间(小时)
function World:GetHours()
    return 0
end

---获取游戏当前天数
---@return number @当前天数
function World:GetDay()
    return 0
end

---设置重力
---@param gravity number @重力值
---@return boolean @操作是否成功
function World:SetGravity(gravity)
    return true
end

---获取重力
---@return number @重力值
function World:GetGravity()
    return 0
end

---获取XZ位置上是否可创建生物并返回对应的Y轴位置
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return number @可创建的Y轴位置(不可创建返回0)
function World:CanMobSpawnOnPosXZ(x, y, z)
    return 0
end

---获取当前地图的mapid
---@return number @地图ID
function World:GetCurMapId()
    return 0
end

---生成投掷物
---@param uin number @玩家uin
---@param itemid number|string @道具类型
---@param srcX number @起点坐标x
---@param srcY number @起点坐标y
---@param srcZ number @起点坐标z
---@param dstX number @目标坐标x
---@param dstY number @目标坐标y
---@param dstZ number @目标坐标z
---@param speed number @速度
---@return number @投掷物对象ID
function World:SpawnProjectile(uin, itemid, srcX, srcY, srcZ, dstX, dstY, dstZ, speed)
    return 0
end

---生成投掷物(通过方向向量)
---@param uin number @玩家uin
---@param itemid number|string @道具类型
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param dirX number @方向向量x
---@param dirY number @方向向量y
---@param dirZ number @方向向量z
---@param speed number @速度
---@return number @投掷物对象ID
function World:SpawnProjectileByDir(uin, itemid, x, y, z, dirX, dirY, dirZ, speed)
    return 0
end

---获取某个位置的地形类型
---@param x number @位置坐标x
---@param z number @位置坐标z
---@return number @地形类型
function World:GetBiomeType(x, z)
    return 0
end

---获取地形类型所属的地形组类型
---@param x number @位置坐标x
---@param z number @位置坐标z
---@return number @地形组类型
function World:GetBiomeGroup(x, z)
    return 0
end

---查找地形位置
---@param centerX number @查找起点x
---@param centerY number @查找起点y
---@param centerZ number @查找起点z
---@param biomeType number @地形类型
---@param radius number @查找范围半径(单位chunk)
---@return number,number,number @找到的地形位置x,y,z
function World:FindEcosystem(centerX, centerY, centerZ, biomeType, radius)
    return 0, 0, 0
end

---添加地图标记
---@param uin number @玩家ID
---@param markId string @标记ID
---@param params table @标记参数表
---@return boolean @操作是否成功
function World:PixelMapAddMarker(uin, markId, params)
    return true
end

---刷新地图标记
---@param uin number @玩家ID
---@param markId string @标记ID
---@param params table @标记参数表
---@return boolean @操作是否成功
function World:PixelMapRefreshMarker(uin, markId, params)
    return true
end

---删除地图标记
---@param uin number @玩家ID
---@param markId string @标记ID
---@return boolean @操作是否成功
function World:PixelMapDelMarker(uin, markId)
    return true
end

---添加地图纹理
---@param uin number @玩家ID
---@param textureId string @纹理ID
---@param params table @纹理参数表
---@return boolean @操作是否成功
function World:PixelMapAddTexture(uin, textureId, params)
    return true
end

---刷新地图纹理
---@param uin number @玩家ID
---@param textureId string @纹理ID
---@param params table @纹理参数表
---@return boolean @操作是否成功
function World:PixelMapRefreshTexture(uin, textureId, params)
    return true
end

---删除地图纹理
---@param uin number @玩家ID
---@param textureId string @纹理ID
---@return boolean @操作是否成功
function World:PixelMapDelTexture(uin, textureId)
    return true
end

---设置天空盒颜色参数(带动效)
---@param uin number @玩家ID
---@param colorType number @颜色类型
---@param colorValue string @颜色值
---@param easingType number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function World:SetSkyBoxColorAnim(uin, colorType, colorValue, easingType, time)
    return true
end

---设置天空盒时间流逝速度
---@param speed number @时间流逝速度
---@return boolean @操作是否成功
function World:SetTimeVanishingSpeed(speed)
    return true
end

---设置天空盒模板
---@param templateId number @模板ID
---@return boolean @操作是否成功
function World:SetSkyBoxTemplate(templateId)
    return true
end

---设置天空盒贴图
---@param mapType number @贴图类型
---@param url string @图片链接
---@return boolean @操作是否成功
function World:SetSkyBoxMaps(mapType, url)
    return true
end

---设置天空盒颜色参数
---@param timeType number @时间类型
---@param colorType number @颜色类型
---@param colorValue string @颜色值
---@return boolean @操作是否成功
function World:SetSkyBoxColor(timeType, colorType, colorValue)
    return true
end

---设置天空盒属性参数
---@param timeType number @时间类型
---@param attrType number @属性类型
---@param value number @属性值
---@return boolean @操作是否成功
function World:SetSkyBoxAttr(timeType, attrType, value)
    return true
end

---设置天空盒滤镜参数
---@param uin number @玩家ID
---@param filterType number @滤镜类型
---@param value number|string @参数值
---@return boolean @操作是否成功
function World:SetSkyBoxFilter(uin, filterType, value)
    return true
end

---天空盒属性开关
---@param timeType number @时间类型
---@param switchType number @开关类型
---@param enable boolean @是否开启
---@return boolean @操作是否成功
function World:SetSkyBoxSwitch(timeType, switchType, enable)
    return true
end

---设置天空盒贴图(带动效)
---@param uin number @玩家ID
---@param mapType number @贴图类型
---@param url string @图片链接
---@param easingType number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function World:SetSkyBoxMapsAnim(uin, mapType, url, easingType, time)
    return true
end

---设置天空盒滤镜参数(带动效)
---@param uin number @玩家ID
---@param filterType number @滤镜类型
---@param value number|string @参数值
---@param easingType number @缓动类型
---@param time number @动画时间
---@return boolean @操作是否成功
function World:SetSkyBoxFilterAnim(uin, filterType, value, easingType, time)
    return true
end

---获取对象到某个方向上的射线检测目标
---@param pos table @对象位置{x=x, y=y, z=z}
---@param dir table @方向向量{x=x, y=y, z=z}
---@param maxLen number @最大检测距离
---@param detectType number @检测类型
---@return number @检测到的对象ID
function World:GetDirRayDetection(pos, dir, maxLen, detectType)
    return 0
end

---计算指定方向射线长度(遇到方块结束)
---@param srcX number @起点坐标x
---@param srcY number @起点坐标y
---@param srcZ number @起点坐标z
---@param dstX number @终点坐标x
---@param dstY number @终点坐标y
---@param dstZ number @终点坐标z
---@param distance number @最大检测距离
---@return number @射线长度
function World:GetRayLength(srcX, srcY, srcZ, dstX, dstY, dstZ, distance)
    return 0
end

---射线打到的方块类型(遇到方块结束)
---@param srcX number @起点坐标x
---@param srcY number @起点坐标y
---@param srcZ number @起点坐标z
---@param faceDir number @面方向
---@param distance number @最大检测距离
---@return number @方块类型ID
function World:GetRayBlock(srcX, srcY, srcZ, faceDir, distance)
    return 0
end

---通过局部坐标方向计算绝对正方向(忽略视角仰角)
---@param uin number @玩家uin
---@param vx number @局部坐标x方向
---@param vy number @局部坐标y方向
---@param vz number @局部坐标z方向
---@return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByYawDirection(uin, vx, vy, vz)
    return {}
end

---通过局部球坐标方向计算绝对正方向(忽略视角仰角)
---@param uin number @玩家uin
---@param yaw number @水平偏移夹角
---@param pitch number @垂直偏移夹角
---@return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByYawAngle(uin, yaw, pitch)
    return {}
end

---绝对坐标方向
---@param x number @坐标x
---@param y number @坐标y
---@param z number @坐标z
---@return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByCoord(x, y, z)
    return {}
end

---角度坐标方向
---@param yaw number @水平偏移夹角
---@param pitch number @垂直偏移夹角
---@return table @绝对方向向量{x=x, y=y, z=z}
function World:CalcDirectionByAngle(yaw, pitch)
    return {}
end

---随机特效类型,随机返回一种特效ID
---@return number @随机特效ID
function World:RandomParticleEffectID()
    return 0
end

---随机音效ID,随机返回一种音效ID
---@return number @随机音效ID
function World:RandomSoundID()
    return 0
end

---计算两个三维坐标之间的距离
---@param posSrc table @源坐标{x=x, y=y, z=z}
---@param posDst table @目标坐标{x=x, y=y, z=z}
---@return number @两点之间的距离
function World:CalcDistance(posSrc, posDst)
    return 0
end

---设置天气组的天气状态
---@param groupId number @天气组ID
---@param weatherType number @天气类型
---@return boolean @操作是否成功
function World:SetGroupWeather(groupId, weatherType)
    return true
end

---随机天气
---@return number @随机天气ID
function World:RandomWeatherID()
    return 0
end

---获取天气组天气
---@param groupId number @天气组ID
---@return number @天气值
function World:GetGroupWeather(groupId)
    return 0
end

---设置出生点
---@param x number @方块坐标x
---@param y number @方块坐标y
---@param z number @方块坐标z
---@return boolean @操作是否成功
function World:SetSpawnPoint(x, y, z)
    return true
end

---位置到位置的单位方向
---@param pos1 table @位置1{x=x, y=y, z=z}
---@param pos2 table @位置2{x=x, y=y, z=z}
---@return table @单位方向向量
function World:CalcDirectionByPos2Pos(pos1, pos2)
    return {}
end

---设置世界创建生物规则(设置不保存,退出游戏后失效,只适用迷拉星)
---@param cfgs table @生物规则配置表
---@return boolean @操作是否成功
function World:SetWorldCreateMobRule(cfgs)
    return true
end

---设置生物生成密度(设置不保存,退出游戏后失效,只适用迷拉星)
---@param mobType number @生物类型
---@param density number @生成密度
---@return boolean @操作是否成功
function World:SetMobSpawnDensity(mobType, density)
    return true
end

---设置农作物生长时间要求修正(设置不保存,退出游戏后失效,只适用迷拉星)
---@param rate number @时间修正系数
---@return boolean @操作是否成功
function World:SetPlantGrowRate(rate)
    return true
end

---设置游戏内的界面是否禁用
---@param popupType number @弹窗类型
---@param enable boolean @是否启用
---@return boolean @操作是否成功
function World:SetInnerViewEnable(popupType, enable)
    return true
end

---设置是否可中途加入
---@param enable boolean @是否开启中途加入
---@return boolean @操作是否成功
function World:SetMidJoin(enable)
    return true
end

---获取游戏模式
---@return number @游戏模式
function World:GetGameMode()
    return 0
end