---@class Backpack
---背包模块管理接口 Backpack
local Backpack = {}
_G.Backpack = Backpack

---设置背包格道具
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@param itemid number|string @道具类型
---@param num number @道具数量(默认1)
---@return boolean @是否成功
function Backpack:SetGridItem(playerid, gridid, itemid, num)
    return true
end

---移除背包格内一定数量道具
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@param num number @道具数量(默认全部移除)
---@return boolean @是否成功
function Backpack:RemoveGridItem(playerid, gridid, num)
    return true
end

---移除背包内一定数量道具,通过道具ID移除,默认全部移除
---@param playerid number @玩家ID
---@param itemid number|string @道具类型
---@param num number @道具数量
---@return number @移除数量(ret and ret>0 成功)
function Backpack:RemoveGridItemByItemID(playerid, itemid, num)
    return 0
end

---清空指定背包栏
---@param playerid number @玩家ID
---@param bartype number @背包栏类型
---@return boolean @是否成功
function Backpack:ClearPack(playerid, bartype)
    return true
end

---清空全部背包(包含背包栏、快捷栏、装备栏)
---@param playerid number @玩家ID
---@return boolean @是否成功
function Backpack:ClearAllPack(playerid)
    return true
end

---移动背包道具,默认全部转移
---@param playerid number @玩家ID
---@param gridsrc number @源格子ID
---@param griddst number @移动至的目标格子ID
---@param num number @道具数量(默认全部)
---@return boolean @是否成功
function Backpack:MoveGridItem(playerid, gridsrc, griddst, num)
    return true
end

---交换背包道具
---@param playerid number @玩家ID
---@param grid1 number @格子1 ID
---@param grid2 number @格子2 ID
---@return boolean @是否成功
function Backpack:SwapGridItem(playerid, grid1, grid2)
    return true
end

---背包(包含背包栏、快捷栏)是否有足够的空间存放一定数量的道具
---@param playerid number @玩家ID
---@param itemid number|string @道具类型
---@param num number @道具数量(默认1)
---@return boolean @是否成功
function Backpack:EnoughSpaceForItem(playerid, itemid, num)
    return true
end

---计算背包(包含背包栏、快捷栏)能存放的道具剩余总数量
---@param playerid number @玩家ID
---@param itemid number|string @道具类型
---@return number @可以存放的数量
function Backpack:CalcSpaceNumForItem(playerid, itemid)
    return 0
end

---检测背包是否持有某个道具
---@param playerid number @玩家ID
---@param bartype number @背包栏类型
---@param itemid number|string @道具类型
---@return boolean @是否成功
function Backpack:HasItemByBackpackBar(playerid, bartype, itemid)
    return true
end

---获取背包持有某个道具总数量,同时返回装有道具的背包格数组
---@param playerid number @玩家ID
---@param bartype number @背包栏类型
---@param itemid number|string @道具类型
---@return number,table @道具数量,格子ID数组
function Backpack:GetItemNumByBackpackBar(playerid, bartype, itemid)
    return 0, {}
end

---获取背包持有某个道具总数量,同时返回装有道具的背包格数组
---@param playerid number @玩家ID
---@param itemid number|string @道具类型
---@param isAddEquip boolean @是否添加装备栏(默认True)
---@return number,table @道具数量,格子ID数组
function Backpack:GetItemNum(playerid, itemid, isAddEquip)
    return 0, {}
end

---获取背包格道具ID(返回itemid, num)
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@return number,number @道具类型,道具数量(无道具 数量是0 itemid是0)
function Backpack:GetGridItemID(playerid, gridid)
    return 0, 0
end

---获取背包格道具名称
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@return string @道具名称
function Backpack:GetGridItemName(playerid, gridid)
    return ""
end

---添加道具到背包
---@param playerid number @玩家ID
---@param itemid number|string @道具类型
---@param num number @道具数量
---@param prioritytype number @优先快捷栏还是背包栏:1优先快捷栏 2优先背包栏(默认1)
---@return number @成功添加的数量
function Backpack:AddItem(playerid, itemid, num, prioritytype)
    return 0
end

---丢弃背包某个格子里的道具
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@param num number @道具数量
---@param ablePick boolean @能否拾取
---@return boolean @是否成功
function Backpack:DiscardItem(playerid, gridid, num, ablePick)
    return true
end

---丢弃背包某个格子里的道具
---@param playerid number @玩家ID
---@param itemid number|string @道具ID
---@return boolean @是否成功
function Backpack:DiscardItemByID(playerid, itemid)
    return true
end

---玩家穿上装备
---@param playerid number @玩家ID
---@param itemid number|string @道具类型
---@param frompos number @格子ID(可不传,如果不为nil 则必须和itemid一致)
---@return boolean @是否成功
function Backpack:ActEquipUpByResID(playerid, itemid, frompos)
    return true
end

---玩家脱下装备栏装备
---@param playerid number @玩家ID
---@param grid number @装备栏ID
---@param grid2 number @目标格子ID(可不传,如果不为nil 则必须是空格子)
---@return boolean @是否成功
function Backpack:ActEquipOffByEquipID(playerid, grid, grid2)
    return true
end

---销毁装备
---@param playerid number @玩家ID
---@param grid number @装备栏ID
---@return boolean @是否成功
function Backpack:ActDestructEquip(playerid, grid)
    return true
end

---创建道具到玩家背包
---@param playerid number @玩家ID
---@param itemid number @道具类型
---@param num number @道具数量
---@param ipos number @优先存放的位置
---@return any @操作结果
function Backpack:CreateItem(playerid, itemid, num, ipos)
    return nil
end

---在手持道具上播放特效
---@param playerid number @玩家ID
---@param effectid number @特效ID
---@param offset table @偏移量
---@param rot table @旋转
---@param scale table @缩放
---@return boolean @是否成功
function Backpack:PlayShortCutIxParticle(playerid, effectid, offset, rot, scale)
    return true
end

---停止手持道具上播放特效
---@param playerid number @玩家ID
---@param effectid number @特效ID
---@return boolean @是否成功
function Backpack:StopShortCutIxEffect(playerid, effectid)
    return true
end

---设置玩家快捷栏上某种类型道具手持特效
---@param playerid number @玩家ID
---@param itemid number @道具类型
---@param effectid number @特效ID
---@return boolean @是否成功
function Backpack:PlayShortCutItemParticle(playerid, itemid, effectid)
    return true
end

---删除玩家快捷栏上某种类型道具手持特效
---@param playerid number @玩家ID
---@param itemid number @道具类型
---@param effectid number @特效ID
---@return boolean @是否成功
function Backpack:StopShortCutItemEffect(playerid, itemid, effectid)
    return true
end

---批量获取背包和快捷栏格子信息数据
---@param playerid number @玩家ID
---@param begingridId number @开始格子id
---@param endgridId number @结束格子id
---@return any @格子信息数据
function Backpack:GetGridInfos(playerid, begingridId, endgridId)
    return nil
end

---加载背包和快捷栏格子信息数据
---@param playerid number @玩家ID
---@param gridinfo string @格子信息
---@return boolean @是否成功
function Backpack:LoadGridInfos(playerid, gridinfo)
    return true
end

---解析格子信息数据
---@param str string @GetGridInfos打包字符串
---@return table @解析后的数据
function Backpack:DecodeGridInfo(str)
    return {}
end

---将解析的格子信息数据打包
---@param infos table @DecodeGridInfo解析后的数据
---@return string @打包后的字符串
function Backpack:EncodeTableGridInfo(infos)
    return ""
end

---设置背包和快捷栏格子锁定状态
---@param playerid number @玩家ID
---@param begingridId number @开始格子id
---@param endgridId number @结束格子id
---@param lock boolean @true锁定 false打开
---@return boolean @是否成功
function Backpack:SetGridsLock(playerid, begingridId, endgridId, lock)
    return true
end

---批量清理背包格子数据
---@param playerid number @玩家ID
---@param begingridId number @开始格子id
---@param endgridId number @结束格子id
---@return boolean @是否成功
function Backpack:ClearGrids(playerid, begingridId, endgridId)
    return true
end

---设置背包格子数量
---@param playerid number @玩家ID
---@param num number @数量暂定范围(0-100)
---@return boolean @是否成功
function Backpack:SetBackPackNum(playerid, num)
    return true
end

---获取指定背包中所有道具实例
---@param playerid number @玩家ID
---@param bartype number @背包栏类型
---@return table @道具实例ID数组
function Backpack:GetAllBackPackInstanceIds(playerid, bartype)
    return {}
end

---在玩家的背包内创建一个道具实例
---@param playerid number @玩家ID
---@param itemid number|string @道具id
---@param gridIndex number @格子索引
---@return string @道具实例ID
function Backpack:CreateItemInstInBackpack(playerid, itemid, gridIndex)
    return ""
end

---在玩家的背包内创建一把实例化的枪械
---@param playerid number @玩家ID
---@param itemid number|string @道具id
---@param gridIndex number @格子索引
---@return string @道具实例ID
function Backpack:CreateGunInBackpack(playerid, itemid, gridIndex)
    return ""
end

---根据背包索引获取道具实例id
---@param playerid number @玩家ID
---@param gridIndex number @格子索引
---@return string @道具实例id
function Backpack:GetInstIdByGridIndex(playerid, gridIndex)
    return ""
end

---获取背包所有实例化的枪械
---@param playerid number @玩家ID
---@return table @实例id数组
function Backpack:GetGunInstIdInBackpack(playerid)
    return {}
end

---获取背包格子是否锁定
---@param playerid number @玩家ID
---@param gridIndex number @格子索引
---@return boolean @是否锁定(参数错误返回true)
function Backpack:IsLock(playerid, gridIndex)
    return true
end

---获取背包格子属性
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@param attr number @属性类型
---@return number @属性值
function Backpack:GetGridAttr(playerid, gridid, attr)
    return 0
end

---设置背包格子属性
---@param playerid number @玩家ID
---@param gridid number @格子ID
---@param attr number @属性类型
---@param value number @属性值
---@return boolean @是否成功
function Backpack:SetGridAttr(playerid, gridid, attr, value)
    return true
end