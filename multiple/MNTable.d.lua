---更新整个表的数据信息
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param value table @表内的值
---@return boolean @是否成功
function Data.Table:UpdateAllValue(varId, playerId, value)
    return true
end

---清理表格数据
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@return boolean @是否成功
function Data.Table:Clear(varId, playerId)
    return true
end

---在末尾插入一行数据
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param ... any @按照列顺序编写的值(中间值不能传nil)
---@return boolean @是否成功
function Data.Table:InsertValue(varId, playerId, ...)
    return true
end

---在某行插入一行数据
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param data table @插入的数据表{[列索引] = 值, ...} or {[列名] = 值, ...}
---@param rowIndex number @行索引(可选，默认插入到最后)
---@return boolean @是否成功
function Data.Table:InsertValueByRow(varId, playerId, data, rowIndex)
    return true
end

---获取表格数据
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param row number @行索引
---@param col number @列索引或列名
---@return any @返回的值
function Data.Table:GetValue(varId, playerId, row, col)
    return nil
end

---获取表格所有数据
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@return table @返回的表格数据
function Data.Table:GetAllValue(varId, playerId)
    return {}
end

---设置表格数据
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param row number|table @行索引或行索引数组
---@param col number @列索引或列名
---@param value any @设置的值
---@return boolean @是否成功
function Data.Table:SetValue(varId, playerId, row, col, value)
    return true
end

---删除序列号的值
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param row number|table @行索引或行索引数组
---@return boolean @是否成功
function Data.Table:RemoveRow(varId, playerId, row)
    return true
end

---获取某列的所有值
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param col number @列索引或列名
---@return table @列值数组
function Data.Table:GetValuesByCol(varId, playerId, col)
    return {}
end

---获取行数
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@return number @行数
function Data.Table:GetRows(varId, playerId)
    return 0
end

---获取列数
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@return number @列数
function Data.Table:GetCols(varId, playerId)
    return 0
end

---获取列索引
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param colName string @列名
---@return number @列索引
function Data.Table:GetColIndex(varId, playerId, colName)
    return 0
end

---获取指定列和值的行索引(默认判断值相等)
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param col number @列索引或列名
---@param value any @查询的值
---@param cmp function @筛选函数(可选, function(actionvalue) return a == value end)
---@return number @行索引
function Data.Table:GetRowIndex(varId, playerId, col, value, cmp)
    return 0
end

---获取指定列和值的所有行索引(默认判断值相等)
---@param varId number @变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param col number @列索引或列名
---@param value any @查询的值
---@param cmp function @筛选函数(可选, function(actionvalue) return a == value end)
---@return table @行索引数组
function Data.Table:GetRowIndexs(varId, playerId, col, value, cmp)
    return {}
end

---获取表格列的key
---@param varId number @变量ID
---@return table @列键名数组
function Data.Table:GetTableColKeys(varId)
    return {}
end