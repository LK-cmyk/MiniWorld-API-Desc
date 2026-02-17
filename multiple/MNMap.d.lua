---回调设置kv数据
---@param varId string @排行榜/排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（数值key会转换成字符串）
---@param value string|number|boolean @具体值
---@param callback function @回调函数
---@return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:SetValueAndCallBack(varId, playerId, key, value, callback)
    return true
end

---阻塞设置kv数据
---@param varId string @排行榜/排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（数值key会转换成字符串）
---@param value string|number|boolean @具体值
---@param call_back function @内部回调(缺省参数)
---@return number,string,string|number|boolean @错误码,键值,具体值
function Data.Map:SetValueAndBlock(varId, playerId, key, value, call_back)
    return 0, "", ""
end

---回调删除指定key的数据
---@param varId string @排行榜/排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（数值会转换成字符串）
---@param callback function @回调函数
---@return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:RemoveValueAndCallBack(varId, playerId, key, callback)
    return true
end

---阻塞删除指定key的数据
---@param varId string @排行榜/排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（小数会向下取整，科学计数法会返回失败）
---@param call_back function @内部回调(缺省参数)
---@return number,string @错误码,键值
function Data.Map:RemoveValueAndBlock(varId, playerId, key, call_back)
    return 0, ""
end

---更新指定key的数据
---@param varId string @kv表变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（数值会转换成字符串）
---@param value string|number|boolean @具体值
---@return boolean @是否成功(全局云KV变量可用)
function Data.Map:UpdateValueAndCallback(varId, playerId, key, value)
    return true
end

---回调获取kv数据
---@param varId string @kv/排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（数值会转换成字符串）
---@param callback function @回调函数
---@return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:GetValueAndCallBack(varId, playerId, key, callback)
    return true
end

---阻塞获取kv数据
---@param varId string @kv/排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（数值会转换成字符串）
---@return number,string,string|number|boolean @错误码,键值,具体值
function Data.Map:GetValueAndBlock(varId, playerId, key)
    return 0, "", ""
end

---获取排行榜指定排名索引的值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param index number @排名索引
---@param ascending boolean @是否升序
---@param callback function @回调函数
---@return boolean @是否调用成功(非全局云变量建议使用阻塞接口)
function Data.Map:GetIndexValueAndCallback(varId, playerId, index, ascending, callback)
    return true
end

---获取排行榜指定排名索引的值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param index number @排名索引
---@param ascending boolean @是否升序
---@return number,string,any,number,boolean @错误码,键值,具体值,排名索引,是否升序
function Data.Map:GetIndexValueAndBlock(varId, playerId, index, ascending)
    return 0, "", nil, 0, true
end

---获取排行榜指定前num个值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param num number @数量
---@param ascending boolean @是否升序
---@param callback function @回调函数
---@return boolean @是否调用成功
function Data.Map:GetNumValuesAndCallback(varId, playerId, num, ascending, callback)
    return true
end

---获取排行榜值为min~max区间的所有值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param min number @最小值
---@param max number @最大值
---@param ascending boolean @是否升序
---@param pagesize number @单次返回数量
---@param callback function @回调函数
---@return boolean @是否调用成功
function Data.Map:GetRangeValuesAndCallback(varId, playerId, min, max, ascending, pagesize, callback)
    return true
end

---阻塞设置排行榜的值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（小数会向下取整，科学计数法会返回失败）
---@param value number @数值
---@param extendvalue string|number|boolean @附带信息（附带信息只会更新不会删除）
---@param call_back function @内部回调(缺省参数)
---@return number,string,number @错误码,键值,数值
function Data.Map:SetRankValueAndBlock(varId, playerId, key, value, extendvalue, call_back)
    return 0, "", 0
end

---清空kv表/排行榜
---@param varId string @表ID
---@param playerId number @玩家uin(全局变量传nil)
---@return boolean @是否成功
function Data.Map:ClearData(varId, playerId)
    return true
end

---阻塞增加排行榜的值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（小数会向下取整，科学计数法会返回失败）
---@param value number @数值
---@param extendvalue string|number|boolean @附带信息（附带信息只会更新不会删除）
---@param call_back function @内部回调(缺省参数)
---@return number,string,number @错误码,键值,数值
function Data.Map:IncreasesRankValueAndBlock(varId, playerId, key, value, extendvalue, call_back)
    return 0, "", 0
end

---回调增加排行榜的值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param key string @键值（小数会向下取整，科学计数法会返回失败）
---@param value number @数值
---@param extendvalue string|number|boolean @附带信息（附带信息只会更新不会删除）
---@param call_back function @内部回调(缺省参数)
---@return number,string,number @错误码,键值,数值
function Data.Map:IncreasesRankValueAndCallback(varId, playerId, key, value, extendvalue, call_back)
    return 0, "", 0
end

---获取排行榜排名为min~max区间的所有值
---@param varId string @排行榜变量ID
---@param playerId number @玩家uin(全局变量传nil)
---@param min number @最小排名
---@param max number @最大排名
---@param ascending boolean @是否升序
---@param pagesize number @单次返回数量
---@param callback function @回调函数
---@return boolean @是否调用成功
function Data.Map:GetRangeIndexsAndCallback(varId, playerId, min, max, ascending, pagesize, callback)
    return true
end