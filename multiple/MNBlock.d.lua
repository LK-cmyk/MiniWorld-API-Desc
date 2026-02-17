---@class Block
---方块模块管理接口 Block
local Block = {}
_G.Block = Block

---是否为固体方块
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return boolean @是否为固体方块
function Block:IsSolidBlock(x, y, z)
    return true
end

---是否是液体方块
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return boolean @是否为液体方块
function Block:IsLiquidBlock(x, y, z)
    return true
end

---是否是空气方块
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return boolean @是否为空气方块
function Block:IsAirBlock(x, y, z)
    return true
end

---获取指定位置的方块类型
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return number @方块类型ID
function Block:GetBlockID(x, y, z)
    return 0
end

---设置位置方块数据
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param blockid number @方块ID
---@param data number @方块朝向等数据
---@return boolean @操作是否成功
function Block:SetBlockAll(x, y, z, blockid, data)
    return true
end

---摧毁方块
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param dropItem boolean @是否掉落物品(缺省参数)
---@return boolean @操作是否成功
function Block:DestroyBlock(x, y, z, dropItem)
    return true
end

---放置方块
---@param blockid number @方块ID
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param dir number @方块方向
---@param color number @十六进制颜色值(0XFFFFFF 颜色方块类型才生效)
---@return boolean @操作是否成功
function Block:PlaceBlock(blockid, x, y, z, dir, color)
    return true
end

---替换方块
---@param blockid number @新方块ID
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param color number @十六进制颜色值(0XFFFFFF 颜色方块类型才生效)
---@return boolean @操作是否成功
function Block:ReplaceBlock(blockid, x, y, z, color)
    return true
end

---设置blockalldata 更新当前位置方块
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param data number @方块数据
---@return boolean @操作是否成功
function Block:SetBlockData(x, y, z, data)
    return true
end

---获取方块数据
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return number @方块数据值
function Block:GetBlockData(x, y, z)
    return 0
end

---获取方块朝向
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return number @方块朝向
function Block:GetBlockDir(x, y, z)
    return 0
end

---播放方块动作
---@param pos table @位置坐标表{x=x, y=y, z=z}
---@param animid number|string @动作id
---@param speed number @播放速度
---@param animmode number @动画模式
---@return boolean @操作是否成功
function Block:PlayAnim(pos, animid, speed, animmode)
    return true
end

---设置方块设置属性状态
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param attrtype number @方块属性类型
---@param switch boolean @是否开关
---@return boolean @操作是否成功
function Block:SetBlockSettingAttState(x, y, z, attrtype, switch)
    return true
end

---获取方块设置属性状态
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param attrtype number @方块属性类型
---@return boolean @是否开启
function Block:GetBlockSettingAttState(x, y, z, attrtype)
    return true
end

---获取功能方块的开关状态
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return boolean @是否开启
function Block:GetBlockSwitchStatus(x, y, z)
    return true
end

---获取方块的通电状态
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return boolean @是否开启
function Block:GetBlockPowerStatus(x, y, z)
    return true
end

---在资源库里随机获取一个方块
---@return number @随机的方块类型ID
function Block:RandomBlockID()
    return 0
end

---获取方块名称
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return string @方块名称
function Block:GetBlockDefName(x, y, z)
    return ""
end

---获取方块描述
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@return string @方块描述
function Block:GetBlockDefDesc(x, y, z)
    return ""
end

---放置蓝图
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param blueprintid string @蓝图ID
---@param angle number @旋转角度
---@param mirror boolean @是否镜像
---@param placeMode boolean @是否蓝图区域全部覆盖
---@return boolean @操作是否成功
function Block:ReplaceBluePrint(x, y, z, blueprintid, angle, mirror, placeMode)
    return true
end

---播放方块裂纹特效
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param process number @裂纹进度
---@return boolean @操作是否成功
function Block:PlayCrackEffect(x, y, z, process)
    return true
end

---播放方块损毁特效
---@param x number @方块位置的X坐标
---@param y number @方块位置的Y坐标
---@param z number @方块位置的Z坐标
---@return boolean @操作是否成功
function Block:PlayDestroyEffect(x, y, z)
    return true
end

---获取方块掉落物信息
---@param blockid number @方块ID
---@param itype number @类型(1手持敲方块,2手持道具正确,3手持道具不正确)
---@return table @返回掉落道具信息{itemid, itemnum, odds} 道具ID,数量,概率
function Block:GetBlockDropItemType(blockid, itype)
    return {}
end

---获取方块的采集经验
---@param blockid number @方块ID
---@param itype number @采集类型
---@return number @经验值
function Block:GetBlockDropExp(blockid, itype)
    return 0
end

---设置方块颜色
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param color number @颜色值
---@return boolean @操作是否成功
function Block:SetBlockColor(x, y, z, color)
    return true
end

---设置方块开关状态
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param state boolean @开关状态
---@return boolean @操作是否成功
function Block:SetBlockSwichState(x, y, z, state)
    return true
end

---设置方块方向
---@param x number @位置坐标x
---@param y number @位置坐标y
---@param z number @位置坐标z
---@param dir number @方块方向
---@return boolean @操作是否成功
function Block:SetBlockDir(x, y, z, dir)
    return true
end

---获取方块类型外观
---@param blockid number|string @方块类型ID或方块预制ID
---@return string @方块类型外观
function Block:GetFacade(blockid)
    return ""
end

---设置方块纹理颜色
---@param blockid number @方块ID
---@param color number @颜色值(0:还原默认颜色)
---@param alpha number @混合比例(0-100)
---@param slotindex number @材质槽索引(默认1)
---@return boolean @操作是否成功
function Block:SetBlockTextureColor(blockid, color, alpha, slotindex)
    return true
end