---设置组对应索引的值
---
---**1.索引值不允许大于数组当前大小**
---
---**2.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value any @设置的值
---@param index number @索引值
---@return boolean @是否成功
function Data.Array:SetValue(varId, playerId, value, index)
    return true
end

---插入数据到数组
---
---**1.如果index为空就加到最后**
---
---**2.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value any @插入的值
---@param index? number @索引值 **(为空则加到最后)**
---@return boolean @是否成功
function Data.Array:InsertValue(varId, playerId, value, index)
    return true
end

---替换组中的值
---
---将数值组的全部 **{oldValue}** 替换为 **{newValue}**
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param newValue any @新值
---@param oldValue any @旧值
---@return boolean @是否成功
function Data.Array:ReplaceValue(varId, playerId, newValue, oldValue)
    return true
end

---获取对应索引数据
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param index number @索引值
function Data.Array:GetValue(varId, playerId, index)
    return nil
end

---获取数据对应索引
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value any @值
function Data.Array:GetIndexByValue(varId, playerId, value)
    return 0
end

---删除数组中全部的 **{value}**
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value any @值
function Data.Array:RemoveByValue(varId, playerId, value)
    return true
end

---删除索引的值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param index number @索引值
function Data.Array:Remove(varId, playerId, index)
    return true
end

---清理数组数据
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@return boolean @是否成功
function Data.Array:Clear(varId, playerId)
    return true
end

---数组排序
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param isUp number @排序方式枚举(SortType)
---@return boolean @是否成功
function Data.Array:Sort(varId, playerId, isUp)
    return true
end

---获取数组长度
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@return number @数组长度
function Data.Array:GetSize(varId, playerId)
    return 0
end

---获取数组所有数据
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@return table @数组所有数据
function Data.Array:GetAllValue(varId, playerId)
    return {}
end

---获取数组最大值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@return number @数组最大值
function Data.Array:GetMax(varId, playerId)
    return 0
end

---获取数组最小值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@return number @数组最小值
function Data.Array:GetMin(varId, playerId)
    return 0
end

---获取数组随机值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@return number @数组随机值
function Data.Array:RandomValue(varId, playerId)
    return 0
end

---组是否有指定值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value any @值
---@return boolean @是否有指定值
function Data.Array:HasValue(varId, playerId, value)
    return true
end

---任意组索引是否有任意值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param index number @索引值
---@return boolean @是否有指定值
function Data.Array:HasValueByNo(varId, playerId, index)
    return true
end

---在指定索引位置插入组
---
---**1.全局变量playerId传nil**
---
---**2.全局变量playerId2传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param index number @索引值(插入位置)
---@param varId2 string @表ID2
---@param playerId2 number @玩家ID2
---@return boolean @是否成功
function Data.Array:InsertValues(varId, playerId, index, varId2, playerId2)
    return true
end

---删除 **{var}** 中 **{var2}** 含有的值
---
---**1.全局变量playerId传nil**
---
---**2.全局变量playerId2传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param varId2 string @表ID2
---@param playerId2 number @玩家ID2
---@return boolean @是否成功
function Data.Array:RemoveByValues(varId, playerId, varId2, playerId2)
    return true
end

---获取任意组种任意值的数量
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value any @值
---@return number @数量
function Data.Array:GetCountByValue(varId, playerId, value)
    return 0
end

---数值组指定索引值增加指定值
---
---**1.全局变量playerId传nil**
---@param varId string @表ID
---@param playerId number @玩家ID
---@param value number @增加值
---@param index number @索引值
function Data.Array:IncreasesValue(varId, playerId, value, index)
    return true
end