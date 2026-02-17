---@class Actor
---角色模块管理接口 Actor
local Actor = {}
_G.Actor = Actor

---获取掉落物的类型ID
---@param objId number @对象ID
---@return number @掉落物类型ID
function Actor:GetItemId(objId)
    return 0
end

---获取掉落物品数量
---@param objId number @对象ID
---@return number @掉落物品数量
function Actor:GetDropItemNum(objId)
    return 0
end

---设置角色队伍
---@param objid number @对象ID
---@param teamType number @队伍类型
---@param bResetAttr boolean @是否重置属性(玩家有效，默认false)
---@return boolean @成功状态
function Actor:SetTeam(objid, teamType, bResetAttr)
    return true
end

---获取角色队伍
---@param objid number @对象ID
---@return number @队伍类型
function Actor:GetTeam(objid)
    return 0
end

---增加角色当前生命量
---@param objid number @对象ID
---@param hp number @血量值(hp>0增加血量，hp<0减少血量)
---@return boolean @成功状态
function Actor:AddHp(objid, hp)
    return true
end

---获取最大血量(包括加成)
---@param objid number @对象ID
---@return number @最大生命值
function Actor:GetMaxHP(objid)
    return 0
end

---设置对象昵称是否显示
---@param objid number @对象ID
---@param bshow boolean @是否显示
---@return boolean @成功状态
function Actor:ShowNickName(objid, bshow)
    return true
end

---设置角色昵称
---@param objid number @对象ID
---@param nickname string @昵称
---@return boolean @成功状态
function Actor:SetNickName(objid, nickname)
    return true
end

---获取角色昵称
---@param objid number @对象ID
---@return string @角色昵称
function Actor:GetNickName(objid)
    return ""
end

---获取角色所在的mapid
---@param objId number @对象ID
---@return number @地图ID
function Actor:GetCurMapId(objId)
    return 0
end

---检查对象是否为玩家
---@param objId number @对象ID
---@return boolean @是否为玩家
function Actor:IsPlayer(objId)
    return false
end

---在指定角色身上播放音效
---@param objid number @对象ID
---@param soundId number @音效ID
---@param volume number @音量
---@param pitch number @音调
---@param isLoop boolean @是否循环播放
---@return boolean @成功状态
function Actor:PlaySoundEffectById(objid, soundId, volume, pitch, isLoop)
    return true
end

---停止指定对象身上的音效
---@param objid number @对象ID
---@param soundId number @音效ID
---@return boolean @成功状态
function Actor:StopSoundEffectById(objid, soundId)
    return true
end

---暂停/恢复指定对象身上的音效
---@param objid number @对象ID
---@param soundId number @音效ID
---@param pause boolean @true暂停/false恢复
---@return boolean @成功状态
function Actor:PauseSoundEffectById(objid, soundId, pause)
    return true
end

---使生物朝向目标生物
---@param objid number @对象ID
---@param targetid number @目标对象ID
---@return boolean @成功状态
function Actor:RotateFaceToActor(objid, targetid)
    return true
end

---获取对象的当前移动速度
---@param objId number @对象ID
---@return number, number, number @x,y,z方向速度
function Actor:GetMotion(objId)
    return 0, 0, 0
end

---对象是否存在
---@param objId number @对象ID
---@return boolean @是否存在
function Actor:HasActor(objId)
    return false
end

---设置目标仇恨目标
---@param objId number @对象ID
---@param targetId number @目标对象ID
---@return boolean @成功状态
function Actor:SetBeHurtTarget(objId, targetId)
    return true
end

---获取角色外观(需要确保对象在场景中存在)
---@param objid number @对象ID
---@return string @对象外观
function Actor:GetActorFacade(objid)
    return ""
end

---比较两个主模型外观是否相等
---@param facade1 string @外观类型1
---@param facade2 string @外观类型2
---@return boolean @是否相等
function Actor:CompareMainModel(facade1, facade2)
    return false
end

---在指定对象身上播放粒子特效
---@param objid number @对象ID
---@param particleId number|table @粒子特效ID或ID列表
---@param time number @时长(秒)
---@param offset table @偏移位置
---@param rotation table @旋转角度
---@param scale table @缩放比例
---@return boolean @成功状态
function Actor:PlayBodyParticleById(objid, particleId, time, offset, rotation, scale)
    return true
end

---停止指定对象身上的粒子特效
---@param objid number @对象ID
---@param particleId number @粒子特效ID
---@return boolean @成功状态
function Actor:StopBodyEffectById(objid, particleId)
    return true
end

---设置指定对象身上的特效大小
---@param objid number @对象ID
---@param particleId number @粒子特效ID
---@param offset table @偏移位置
---@param rotation table @旋转角度
---@param scale table @缩放比例
---@return boolean @成功状态
function Actor:SetBodyParticleTransform(objid, particleId, offset, rotation, scale)
    return true
end

---使玩家/生物跳跃一次
---@param objId number @对象ID
---@return boolean @成功状态
function Actor:Jump(objId)
    return true
end

---获取骑乘生物的objid
---@param objid number @对象ID
---@return number @骑乘对象ID
function Actor:GetRidingActorObjId(objid)
    return 0
end

---获取actor朝向
---@param objId number @对象ID
---@return table @轴向上的方向
function Actor:GetFaceDirection(objId)
    return {}
end

---使对象向目标行动者移动
---@param objid number @执行动作的对象id
---@param targetid number @目标对象id
---@param speed number @移动速度
---@return boolean @成功状态
function Actor:TryMoveToActor(objid, targetid, speed)
    return true
end

---设置对象朝向
---@param objId number @对象ID
---@param x number @x方向
---@param y number @y方向
---@param z number @z方向
---@return boolean @成功状态
function Actor:SetFaceDirection(objId, x, y, z)
    return true
end

---击败对象
---@param objId number @对象ID
---@return boolean @成功状态
function Actor:KillSelf(objId)
    return true
end

---设置角色属性
---@param objId number @对象ID
---@param attrType number @属性类型
---@param val number @属性值
---@return boolean @成功状态
function Actor:SetAttr(objId, attrType, val)
    return true
end

---增加角色属性值
---@param objid number @对象ID
---@param atttype number @属性类型
---@param val number @增加值
---@return boolean @成功状态
function Actor:IncreasesAttr(objid, atttype, val)
    return true
end

---获取角色属性值
---@param objId number @对象ID
---@param attrType number @属性类型
---@return number @属性值
function Actor:GetAttr(objId, attrType)
    return 0
end

---设置对象权限
---@param objId number @对象ID
---@param abilityType number @权限类型
---@param switch boolean @是否开启
---@return boolean @成功状态
function Actor:SetActorPermissions(objId, abilityType, switch)
    return true
end

---获取对象权限
---@param objId number @对象ID
---@param abilityType number @权限类型
---@return boolean @权限状态
function Actor:GetActorPermissions(objId, abilityType)
    return false
end

---设置对象面向角度
---@param objId number @对象ID
---@param yaw number @面朝角度
---@return boolean @成功状态
function Actor:SetFaceYaw(objId, yaw)
    return true
end

---获取actor视角偏移角度
---@param objId number @对象ID
---@return number @面朝角度
function Actor:GetFaceYaw(objId)
    return 0
end

---设置actor视角仰望角度
---@param objid number @对象ID
---@param pitch number @面仰角度
---@return boolean @成功状态
function Actor:SetFacePitch(objid, pitch)
    return true
end

---获取actor视角仰望角度
---@param objid number @对象ID
---@return number @仰望角度
function Actor:GetFacePitch(objid)
    return 0
end

---设置角色位置
---@param objId number @对象ID
---@param x number @目标X坐标
---@param y number @目标Y坐标
---@param z number @目标Z坐标
---@return boolean @成功状态
function Actor:SetPosition(objId, x, y, z)
    return true
end

---获取对象位置
---@param objId number @对象ID
---@return number, number, number @x,y,z坐标
function Actor:GetPosition(objId)
    return 0, 0, 0
end

---改变对象外观
---@param objid number @对象ID
---@param modleName string @对象外观描述
---@return boolean @成功状态
function Actor:ChangeCustomModel(objid, modleName)
    return true
end

---恢复对象外观
---@param objid number @对象ID
---@return boolean @成功状态
function Actor:RecoverinitialModel(objid)
    return true
end

---使对象A对对象B造成伤害
---@param attackerId number @攻击者对象ID
---@param targetId number @目标对象ID
---@param damage number @伤害值
---@param hurtType number @伤害类型
---@param ignoreResist boolean @忽略伤害抵抗
---@param ignoreTriggerEvent boolean @忽略触发伤害事件
---@return boolean @成功状态
function Actor:ActorHurt(attackerId, targetId, damage, hurtType, ignoreResist, ignoreTriggerEvent)
    return true
end

---设置免疫伤害类型
---@param objId number @对象ID
---@param hurtType number @伤害类型
---@param enable boolean @是否开启
---@return boolean @成功状态
function Actor:SetImmuneType(objId, hurtType, enable)
    return true
end

---改变玩家移动方式
---@param objid number @对象ID
---@param moveType number @移动类型
---@return boolean @成功状态
function Actor:ChangActorMoveType(objid, moveType)
    return true
end

---取角色的移动模式
---@param objid number @对象ID
---@return number @移动模式
function Actor:GetActorMovementMode(objid)
    return 0
end

---获取模型大小值
---@param objId number @对象ID
---@return table @模型大小
function Actor:GetBoundSzie(objId)
    return {}
end

---随机一个外观获取其id字符串
---@return string @随机外观ID
function Actor:RandomFacadeID()
    return ""
end

---判断对象是否是玩家/生物
---@param objId number @对象ID
---@return number @对象类型
function Actor:GetObjType(objId)
    return 0
end

---尝试移动到某个位置走寻路(方块坐标)
---@param objId number @对象ID
---@param x number @目标X坐标
---@param y number @目标Y坐标
---@param z number @目标Z坐标
---@param cancontrol boolean @是否能控制
---@param bshowtip boolean @是否显示提示
---@return boolean @成功状态
function Actor:TryMoveToPos(objId, x, y, z, cancontrol, bshowtip)
    return true
end

---给对象附加一个速度
---@param objId number @对象ID
---@param x number @x轴速度
---@param y number @y轴速度
---@param z number @z轴速度
---@return boolean @成功状态
function Actor:AppendSpeed(objId, x, y, z)
    return true
end

---寻找对象附近某个类型方块的最近位置
---@param objid number @对象ID
---@param blockid number @查找的方块类型
---@param blockRange number @查找范围(格子数)
---@return number, number, number @x,y,z方块坐标
function Actor:FindNearestBlock(objid, blockid, blockRange)
    return 0, 0, 0
end

---获取角色高度
---@param objId number @对象ID
---@return number @角色高度
function Actor:GetEyeHeight(objId)
    return 0
end

---清除生物ID为actorid的生物
---@param actorid number @生物类型ID
---@param bkill boolean @是否杀死生物(默认false)
---@return boolean @成功状态
function Actor:ClearActorWithId(actorid, bkill)
    return true
end

---对象是否存在
---@param objId number @对象ID
---@return boolean @是否存在
function Actor:IsExist(objId)
    return false
end

---对象播放动作
---@param objId number @对象ID
---@param animid number|string @动作id
---@param speed number @播放速度
---@param animMode number @动画模式
---@return boolean @成功状态
function Actor:PlayAnim(objId, animid, speed, animMode)
    return true
end

---对象手持播放动作
---@param objId number @对象ID
---@param animid number|string @动作id
---@param speed number @播放速度
---@param loop boolean|number @是否循环或循环模式
---@return boolean @成功状态
function Actor:PlayHandAnim(objId, animid, speed, loop)
    return true
end

---角色骑乘
---@param riderId number @骑乘者ID
---@param mountId number @被骑乘者ID
---@param isContrl boolean @是否控制
---@param isCloseAI boolean @是否关闭AI
---@return boolean @成功状态
function Actor:MountActor(riderId, mountId, isContrl, isCloseAI)
    return true
end

---角色取消骑乘
---@param objid number @对象ID
---@return boolean @成功状态
function Actor:DisMountActor(objid)
    return true
end

---对象抓举对象
---@param grabberId number @抓举者ID
---@param targetId number @目标对象ID
---@return boolean @成功状态
function Actor:PickupActor(grabberId, targetId)
    return true
end

---尝试抓取前方指定距离的对象
---@param objid number @对象ID
---@param distance number @距离
---@return boolean @成功状态
function Actor:TryPickupActorForward(objid, distance)
    return true
end

---尝试投掷角色
---@param throwerId number @投掷者ID
---@param dir table @投掷方向
---@param useDir boolean @是否使用方向
---@param speed number @投掷速度
---@param useGravity boolean @是否使用重力
---@return boolean @成功状态
function Actor:DropActor(throwerId, dir, useDir, speed, useGravity)
    return true
end

---尝试逃脱抓举
---@param objid number @被抓举的对象objid
---@return boolean @成功状态
function Actor:EscapePickup(objid)
    return true
end

---设置行为树变量
---@param objid number @生物对象objid
---@param varid string @变量id
---@param val any @变量值(数字/字符/boolean)
---@return boolean @成功状态
function Actor:SetBtreeVarValue(objid, varid, val)
    return true
end

---获取行为树变量
---@param objid number @生物对象objid
---@param varid string @变量id
---@return any @变量值
function Actor:GetBtreeVarValue(objid, varid)
    return nil
end

---根据掉落物objid获取道具实例id
---@param objid number @掉落物对象ID
---@return string @道具实例id
function Actor:GetDropItemInstanceId(objid)
    return ""
end

---设置掉落物是否可以拾取
---@param objId number @对象ID
---@param able boolean @是否可以拾取
---@return boolean @成功状态
function Actor:SetAblePick(objId, able)
    return true
end

---获取实体类型外观
---@param entityId string @实体类型ID
---@return string @外观描述
function Actor:GetEntityFacade(entityId)
    return ""
end

---角色拾取地上的掉落物或者投掷物
---@param objid number @角色ID
---@param itemobjid number @掉落物或投掷物objid
---@return number @拾取数量
function Actor:PickupItem(objid, itemobjid)
    return 0
end

---获取角色举起的角色objid
---@param objid number @对象ID
---@return number @举起的角色objid
function Actor:GetPickupObjID(objid)
    return 0
end