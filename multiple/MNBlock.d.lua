--- @class Block
--- 方块模块管理接口 Block
local Block = {}
_G.Block = Block

--- 是否为固体方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @是否为固体方块
function Block:IsSolidBlock(x, y, z, worldId) return true end

--- 是否是液体方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @是否为液体方块
function Block:IsLiquidBlock(x, y, z, worldId) return true end

--- 是否是空气方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @是否为空气方块
function Block:IsAirBlock(x, y, z, worldId) return true end

--- 获取指定位置的方块类型
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return number @方块类型ID
function Block:GetBlockID(x, y, z, worldId) return 0 end

--- 摧毁方块
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dropItem? boolean @是否掉落物品(缺省参数，默认false)
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @param btrigger? boolean @是否触发方块事件(缺省参数，默认true)
--- @return boolean @操作是否成功
function Block:DestroyBlock(x, y, z, dropItem, worldId, btrigger) return true end

--- 放置方块
--- @param blockId number|string @方块ID
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dir number @方块方向
--- @param color? number @HEX颜色值(0XFFFFFF，颜色方块类型才生效，默认-1)
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @param btrigger? boolean @是否触发方块事件(缺省参数，默认true)
--- @return boolean @操作是否成功
function Block:PlaceBlock(blockId, x, y, z, dir, color, worldId, btrigger) return true end

--- 替换指定位置的方块 (支持颜色方块)
--- @param blockId number|string @新方块ID
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param face? number @朝向 (默认为0)
--- @param color? number @HEX颜色值(0XFFFFFF，颜色方块类型才生效，默认-1)
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @param btrigger? boolean @是否触发方块事件(缺省参数，默认true)
--- @return boolean @操作是否成功
function Block:ReplaceBlock(blockId, x, y, z, face, color, worldId, btrigger) return true end

--- 设置指定位置方块的 data 数据 (更新当前位置方块)
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param data number @方块数据
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:SetBlockData(x, y, z, data, worldId) return true end

--- 获取方块数据
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return number @方块数据值
function Block:GetBlockData(x, y, z, worldId) return 0 end

--- 获取方块朝向
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return number @方块朝向 (FaceDir枚举)
function Block:GetBlockDir(x, y, z, worldId) return 0 end

--- 播放方块动作
--- @param pos table @位置坐标表{x=x, y=y, z=z}
--- @param animid number|string @动作id
--- @param speed number @播放速度
--- @param animMode number @动画模式 (AnimMode枚举)
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:PlayAnim(pos, animid, speed, animMode, worldId) return true end

--- 设置方块设置属性状态 (全局设置)
--- @param blockId number|string @方块ID
--- @param attrType number @方块属性类型 (BlockLimits)
--- @param switch boolean @是否开关
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:SetBlockSettingAttState(blockId, attrType, switch, worldId) return true end

--- 获取方块设置属性状态 (全局设置)
--- @param blockId number|string @方块ID
--- @param attrType number @方块属性类型
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @是否开启
function Block:GetBlockSettingAttState(blockId, attrType, worldId) return true end

--- 获取功能方块的开关状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @是否开启
function Block:GetBlockSwitchStatus(x, y, z, worldId) return true end

--- 获取方块的通电状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @是否开启
function Block:GetBlockPowerStatus(x, y, z, worldId) return true end

--- 在资源库里随机获取一个方块
--- @return number @随机的方块类型ID
function Block:RandomBlockID() return 0 end

--- 获取方块名称
--- @param blockId number|string @方块ID
--- @return string @方块名称
function Block:GetBlockDefName(blockId) return "" end

--- 获取方块描述
--- @param blockId number|string @方块ID
--- @return string @方块描述
function Block:GetBlockDefDesc(blockId) return "" end

--- 放置蓝图 (未支持多星球)
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param blueprintid string @蓝图ID
--- @param angle number @旋转角度
--- @param mirror boolean @是否镜像
--- @param placeMode boolean @是否蓝图区域全部覆盖
--- @return boolean @操作是否成功
function Block:ReplaceBluePrint(x, y, z, blueprintid, angle, mirror, placeMode) return true end

--- 播放方块裂纹特效
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param process number @裂纹进度 (`-1` ~ `10`)
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:PlayCrackEffect(x, y, z, process, worldId) return true end

--- 播放方块损毁特效
--- @param x number @方块位置的X坐标
--- @param y number @方块位置的Y坐标
--- @param z number @方块位置的Z坐标
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:PlayDestroyEffect(x, y, z, worldId) return true end

--- 获取方块掉落物信息
--- @param blockId number|string @方块ID
--- @param iType number @类型 (1手持敲方块, 2手持道具正确, 3手持道具不正确)
--- @return table @返回掉落道具信息 {itemid:道具ID, itemnum:数量, odds:概率}
function Block:GetBlockDropItemType(blockId, iType) return {} end

--- 获取方块的采集经验
--- @param blockId number|string @方块ID
--- @param iType number @采集类型
--- @return number @经验值
function Block:GetBlockDropExp(blockId, iType) return 0 end

--- 设置方块颜色
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param color number @颜色值
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:SetBlockColor(x, y, z, color, worldId) return true end

--- 设置方块方向
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param dir number @方块方向 (FaceDir枚举)
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:SetBlockDir(x, y, z, dir, worldId) return true end

--- 获取方块类型外观
--- @param blockId number|string @方块类型ID或方块预制ID
--- @return string @方块类型外观
function Block:GetFacade(blockId) return "" end

--- 设置方块纹理颜色 (仅支持草块、土块、树叶、花草等方块，其它方块暂不支持；设置后不会存档；玩法转编辑后需要重进地图才可还原)
--- @param blockId number|string @方块ID
--- @param color number @颜色值(0:还原默认颜色)
--- @param alpha number @混合比例(0-100)
--- @param slotindex? number @材质槽索引 (默认1)
--- @return boolean @操作是否成功
function Block:SetBlockTextureColor(blockId, color, alpha, slotindex) return true end

--- 设置指定位置功能方块的开关状态
--- @param x number @位置坐标x
--- @param y number @位置坐标y
--- @param z number @位置坐标z
--- @param isActive boolean @开关状态
--- @param worldId? number|nil @星球ID(缺省参数，默认当前主机所在星球)
--- @return boolean @操作是否成功
function Block:SetBlockSwitchStatus(x, y, z, isActive, worldId) return true end