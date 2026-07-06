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
