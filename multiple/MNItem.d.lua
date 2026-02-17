---@class Item
---道具模块管理接口 Item
local Item = {}
_G.Item = Item

---获取道具名称
---@param itemid number|string @道具ID
---@return string @道具名称
function Item:GetItemName(itemid)
    return ""
end

---在资源库里随机获取一个道具ID
---@return number @随机道具ID
function Item:RandomItemID()
    return 0
end

---在资源库里随机获取一个投掷物ID
---@return number @随机投掷物ID
function Item:RandomProjectileID()
    return 0
end

---获取道具属性
---@param itemid number|string @道具ID
---@param attrtype number @属性类型
---@return number @属性值
function Item:GetAttr(itemid, attrtype)
    return 0
end

---获取道具描述
---@param itemid number|string @道具ID
---@return string @道具描述
function Item:GetItemDesc(itemid)
    return ""
end

---获取自定义枪械的属性(仅自定义枪械有效)
---@param itemid number|string @道具ID
---@param attrname string @属性名称
---@return any @属性值
function Item:GetCustomGunAttr(itemid, attrname)
    return nil
end

---获取道具配方的数量
---@param itemid number|string @道具ID
---@return number @配方数量
function Item:GetCraftIDNum(itemid)
    return 0
end

---获取道具的配方材料和数量
---@param itemid number|string @道具ID
---@param index number @配方索引
---@return table @配方材料表{{材料ID, 数量}, ...}
function Item:GetCraftMaterialAndNum(itemid, index)
    return {}
end

---获取道具类型外观
---@param itemid number|string @道具类型ID或道具预制ID
---@return string @道具类型外观
function Item:GetFacade(itemid)
    return ""
end

---在位置上创建道具实例的掉落物
---@param itemid number|string @道具ID
---@param pos table @掉落物位置{x=0, y=0, z=0}
---@return number @掉落物对象ID
function Item:CreateItemInstInWorld(itemid, pos)
    return 0
end

---在位置上创建枪械道具实例的掉落物
---@param itemid number|string @道具ID
---@param pos table @掉落物位置
---@return number @掉落物对象ID
function Item:CreateGunInWorld(itemid, pos)
    return 0
end

---获取装备道具所对应的装备栏
---@param itemid number|string @装备道具ID
---@return number @装备栏位置(BackpackBeginIndex.Equip + EquipSlotType)
function Item:GetEquipItemGridID(itemid)
    return 0
end

---修改枪械道具实例的属性
---@param instId number @道具实例ID
---@param key string @属性键
---@param value any @属性值(number|string|bool)
---@return boolean @操作是否成功
function Item:ModifyGunAttribute(instId, key, value)
    return true
end

---获取枪械道具实例的属性
---@param instId number @道具实例ID
---@param key string @属性键
---@return any @属性值(number|string|bool|nil)
function Item:GetGunAttribute(instId, key)
    return nil
end

---获取枪预制的属性
---@param instId number @道具实例ID
---@param key string @属性键
---@return any @属性值(number|string|bool|nil)
function Item:GetGunPrefabAttribute(instId, key)
    return nil
end

---根据道具实例ID获取道具ID
---@param instId number @道具实例ID
---@return number|string @道具ID
function Item:GetItemIdByInstanceId(instId)
    return 0
end

---给道具实例添加一个模型子部件
---@param instId number @道具实例ID
---@param partName string @子部件名字
---@param boneName string @骨骼名称
---@param modelStr string @模型字符串
---@param offset table @位置偏移{x=0, y=0, z=0}
---@param rot table @旋转角度{x=0, y=0, z=0}
---@param scale table @缩放比例{x=1, y=1, z=1}
---@return string @部件名字
function Item:AddSubModelPart(instId, partName, boneName, modelStr, offset, rot, scale)
    return ""
end

---删除一个道具实例的模型子部件
---@param instId number @道具实例ID
---@param partName string @子部件名字
---@return boolean @操作是否成功
function Item:DeleteSubModelPart(instId, partName)
    return true
end

---修改一个道具实例的模型子部件
---@param instId number @道具实例ID
---@param partName string @子部件名字
---@param boneName string @骨骼名称
---@param modelStr string @模型字符串
---@param offset table @位置偏移
---@param rot table @旋转角度
---@param scale table @缩放比例
---@return boolean @操作是否成功
function Item:ReplaceSubModelPart(instId, partName, boneName, modelStr, offset, rot, scale)
    return true
end

---设置道具实例的自定义数据string
---@param instId number @道具实例ID
---@param key string @数据键
---@param value string @字符串值
---@return boolean @操作是否成功
function Item:SetStringCustomData(instId, key, value)
    return true
end

---设置道具实例的自定义数据bool
---@param instId number @道具实例ID
---@param key string @数据键
---@param value boolean @布尔值
---@return boolean @操作是否成功
function Item:SetBoolCustomData(instId, key, value)
    return true
end

---设置道具实例的自定义数据number
---@param instId number @道具实例ID
---@param key string @数据键
---@param value number @数值
---@return boolean @操作是否成功
function Item:SetNumberCustomData(instId, key, value)
    return true
end

---设置道具实例的自定义数据Object
---@param instId number @道具实例ID
---@param key string @数据键
---@param value table @对象值
---@return boolean @操作是否成功
function Item:SetObjCustomData(instId, key, value)
    return true
end

---设置道具实例的自定义数据Array
---@param instId number @道具实例ID
---@param key string @数据键
---@param value table @数组值
---@return boolean @操作是否成功
function Item:SetArrayCustomData(instId, key, value)
    return true
end

---获取道具实例的自定义数据string
---@param instId number @道具实例ID
---@param key string @数据键
---@return string @字符串值
function Item:GetStringCustomData(instId, key)
    return ""
end

---获取道具实例的自定义数据bool
---@param instId number @道具实例ID
---@param key string @数据键
---@return boolean @布尔值
function Item:GetBoolCustomData(instId, key)
    return true
end

---获取道具实例的自定义数据number
---@param instId number @道具实例ID
---@param key string @数据键
---@return number @数值
function Item:GetNumberCustomData(instId, key)
    return 0
end

---获取道具实例的自定义数据Object
---@param instId number @道具实例ID
---@param key string @数据键
---@return table @对象值
function Item:GetObjCustomData(instId, key)
    return {}
end

---获取道具实例的自定义数据Array
---@param instId number @道具实例ID
---@param key string @数据键
---@return table @数组值
function Item:GetArrayCustomData(instId, key)
    return {}
end

---获取具有道具实例ID的道具外观
---@param instId number @道具实例ID
---@return string @道具实例外观
function Item:GetItemInstFacade(instId)
    return ""
end

---获取掉落物或者投掷物的格子属性
---@param objId number @对象ID
---@param attrType number @属性类型
---@return number @属性值
function Item:GetGridAttr(objId, attrType)
    return 0
end