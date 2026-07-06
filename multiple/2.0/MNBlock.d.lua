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
