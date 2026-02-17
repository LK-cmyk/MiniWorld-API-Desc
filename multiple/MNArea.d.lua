---@class Area
---区域模块管理接口 Area
local Area = {}
_G.Area = Area

---创建一个区域对象
---@param pos table @区域底部中心位置
---@param size table @区域大小
---@return number @区域对象ID
function Area:CreateAreaPrefab(pos, size)
    return 0
end

---通过区域对象id获取区域uuid
---@param objId number @区域对象ID
---@return any @区域UUID
function Area:GetAreaUuidByObjId(objId)
    return nil
end

---创建矩形区域(通过范围)
---@param posBeg table @区域起始坐标
---@param posEnd table @区域结束坐标
---@param btmp boolean @是否是临时区域
---@return any @操作结果
function Area:CreateAreaRectByRange(posBeg, posEnd, btmp)
    return nil
end

---销毁区域
---@param areaid number @区域ID
---@return boolean @操作是否成功
function Area:DestroyArea(areaid)
    return true
end

---获取区域中间点
---@param areaid number @区域ID
---@return table @区域中心位置
function Area:GetAreaCenter(areaid)
    return {}
end

---获取区域各边长
---@param areaid number @区域ID
---@return number,number,number @x轴向长度,y轴向长度,z轴向长度
function Area:GetAreaRectLength(areaid)
    return 0, 0, 0
end

---获取区域范围
---@param areaid number @区域ID
---@return table,table @区域起始坐标,区域结束坐标
function Area:GetAreaRectRange(areaid)
    return {}, {}
end

---随机区域内位置
---@param areaid number @区域ID
---@return table @随机坐标
function Area:GetRandomPos(areaid)
    return {}
end

---检测obj是否在区域内
---@param areaid number @区域ID
---@param objid number @对象ID
---@return boolean @是否在区域内
function Area:ObjInArea(areaid, objid)
    return true
end

---检测区域内是否有某个方块
---@param areaid number @区域ID
---@param blockid number|string @方块类型ID
---@return boolean @是否在区域内
function Area:BlockInArea(areaid, blockid)
    return true
end

---位置是否在区域内
---@param areaid number @区域ID
---@param pos table @位置坐标
---@return boolean @是否在区域内
function Area:PosInArea(areaid, pos)
    return true
end

---获取区域中的所有玩家
---@param areaid number @区域ID
---@return table @玩家objid组
function Area:GetAreaPlayers(areaid)
    return {}
end

---获取区域中的所有生物(当帧创建的生物获取不到)
---@param areaid number @区域ID
---@return table @生物objid组
function Area:GetAreaCreatures(areaid)
    return {}
end

---清空区域内全部方块
---@param areaid number @区域ID
---@param blockid number|string @方块类型ID
---@param num number @最大清除数量
---@param btriggerevent boolean @是否触发事件
---@return boolean @操作是否成功
function Area:ClearAllBlock(areaid, blockid, num, btriggerevent)
    return true
end

---复制区域内方块到另一个区域
---@param areaid number @区域ID
---@param pos table @目标起始位置
---@return boolean @操作是否成功
function Area:CloneAreaBlock(areaid, pos)
    return true
end

---替换方块类型为新的方块类型
---@param areaid number @区域ID
---@param srcblockid number|string @区域内的方块类型
---@param destblockid number|string @替换的方块类型
---@param face number @方块朝向
---@param color string|number @颜色
---@return boolean @操作是否成功
function Area:ReplaceAreaBlock(areaid, srcblockid, destblockid, face, color)
    return true
end

---获取区域范围内全部对象
---@param posbeg table @起始位置
---@param posend table @末点位置
---@param objtype number @对象类型
---@return table @对象列表
function Area:GetAllObjsInAreaRange(posbeg, posend, objtype)
    return {}
end

---获取区域范围内全部玩家
---@param posbeg table @起始位置
---@param posend table @末点位置
---@return table @玩家列表
function Area:GetAllPlayersInAreaRange(posbeg, posend)
    return {}
end

---获取区域范围内全部生物
---@param posbeg table @起始位置
---@param posend table @末点位置
---@return table @生物列表
function Area:GetAllCreaturesInAreaRange(posbeg, posend)
    return {}
end

---用方块填充区域范围(分帧处理,当前帧率操作不到填充的方块)
---@param posbeg table @起始位置
---@param posend table @末点位置
---@param blockid number|string @方块类型
---@param face number @方块朝向
---@param color string|number @颜色
---@param switch boolean @是否开启
---@param filltype number @填充类型
---@return boolean @操作是否成功
function Area:FillBlockAreaRange(posbeg, posend, blockid, face, color, switch, filltype)
    return true
end

---清空区域范围内方块
---@param posbeg table @起始位置
---@param posend table @末点位置
---@param blockid number|string @方块类型
---@param btriggerevent boolean @是否触发事件
---@return boolean @操作是否成功
function Area:ClearAllBlockAreaRange(posbeg, posend, blockid, btriggerevent)
    return true
end

---破坏区域内的方块
---@param areaid number @区域ID
---@param blockid string|number @方块ID或资产ID
---@param n number @销毁数量(不填或者0则全部销毁)
---@param candrop boolean @是否掉落物品
---@param btriggerevent boolean @是否触发事件
---@return boolean @操作是否成功
function Area:DestroyAllBlock(areaid, blockid, n, candrop, btriggerevent)
    return true
end

---复制区域范围内方块到另一个区域
---@param posbeg table @起始位置
---@param posend table @末点位置
---@param deststartpos table @目标起始位置
---@param itype number @复制类型
---@return boolean @操作是否成功
function Area:CloneAreaRange(posbeg, posend, deststartpos, itype)
    return true
end

---替换区域范围方块
---@param posbeg table @起始位置
---@param posend table @末点位置
---@param srcblockid number|string @方块类型
---@param destblockid number|string @目标方块类型
---@param face number @方块朝向
---@param inair boolean @是否包括空气方块
---@return boolean @操作是否成功
function Area:ReplaceAreaRangeBlock(posbeg, posend, srcblockid, destblockid, face, inair)
    return true
end

---获取一个区域内随机空气方块
---@param posbeg table @区域起始位置
---@param posend table @区域结束位置
---@return table @随机空气位置(x y z)
function Area:GetRandomAirPos(posbeg, posend)
    return {}
end

---获取区域内的方块类型
---@param areaid number @区域ID
---@return table @类型组
function Area:GetAreaBlockTypes(areaid)
    return {}
end

---获取区域内的方块数量
---@param areaid number @区域ID
---@param blockid string|number @方块ID
---@return number @方块数量
function Area:GetBlockNum(areaid, blockid)
    return 0
end

---检查指定范围内是否可以放置方块
---@param posbeg table @区域起始位置
---@param posend table @区域结束位置
---@param blockid string|number @方块ID
---@return boolean @是否可以放置方块(true/false)
function Area:CheckRangeCanPlace(posbeg, posend, blockid)
    return true
end

---获取区域中指定玩家关系的角色
---@param posbeg table @区域起始位置
---@param posend table @区域结束位置
---@param uin number @玩家uin
---@param relativing number @关系类型
---@param actortype number @角色类型
---@return number,table @数量,角色数组
function Area:GetRelativeActors(posbeg, posend, uin, relativing, actortype)
    return 0, {}
end