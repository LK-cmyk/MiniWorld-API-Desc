--- @class Valuegroup
--- 变量组管理接口 Valuegroup
local Valuegroup = {}
_G.Valuegroup = Valuegroup

--- 获取组中所有值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, table @成功返回 ErrorCode.OK 和所有元素
function Valuegroup:getAllGroupItem(vartype, libname, playerid) return 0, {} end

--- 添加任意值到任意组(加在组的最后一位)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param value any @要添加的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:insertInGroupByName(vartype, libname, value, playerid) return 0 end

--- 从任意组移除指定编号的值(变为nil，编号不会移除)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param indx number @组中的编号索引
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:removeValueIndexByName(vartype, libname, indx, playerid) return 0 end

--- 从任意组移除任意值为nil
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param value any @要移除的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:removeValueByName(vartype, libname, value, playerid) return 0 end

--- 清空任意组(编号和内容全部清空)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:clearGroupByName(vartype, libname, playerid) return 0 end

--- 获取数组长度
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, number @成功返回 ErrorCode.OK 和数组长度
function Valuegroup:getGrouplengthByName(vartype, libname, playerid) return 0, 0 end

--- 获取组中指定编号的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param indx number @组中的编号索引
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, any @成功返回 ErrorCode.OK 和编号的值
function Valuegroup:getValueNoByName(vartype, libname, indx, playerid) return 0, nil end

--- 设置组中编号索引的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param indx number @组中的编号索引
--- @param value any @设置的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:setValueNoByName(vartype, libname, indx, value, playerid) return 0 end

--- 随机获得数组里面的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, any @成功返回 ErrorCode.OK 和随机获取的值
function Valuegroup:getRandomValueByName(vartype, libname, playerid) return 0, nil end

--- 在任意组任意编号位置插入任意值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @插入的编号位置
--- @param value any @设置的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:insertValueByName(vartype, libname, no, value, playerid) return 0 end

--- 从任意组清空指定编号的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @清空的编号位置
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:deleteNoByName(vartype, libname, no, playerid) return 0 end

--- 从任意组清空指定值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @清空的值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:deleteValueByName(vartype, libname, val, playerid) return 0 end

--- 在任意组中添加一组值(在组1的末尾添加组2的值)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:addGroupByName(vartype, libname, libname2, playerid1, playerid2) return 0 end

--- 在任意组中将一组值设为空值(比较组1和组2，若组1中有与组2相同的值则设为nil)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:removeGroupByName(vartype, libname, libname2, playerid1, playerid2) return 0 end

--- 在任意组中删除一组值(比较组1和组2，若组1中有与组2相同的值则清除)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:deleteGroupByName(vartype, libname, libname2, playerid1, playerid2) return 0 end

--- 在任意组插入一组值(在组1指定编号位置插入组2的值)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @插入的位置
--- @param libname2 string @组名
--- @param playerid1 number @私有组玩家ID(全局组为0)
--- @param playerid2 number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:insertGroupByName(vartype, libname, no, libname2, playerid1, playerid2) return 0 end

--- 替换任意组中的任意值为新的值
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param oldval any @旧值
--- @param newval any @新值
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:replaceValueByName(vartype, libname, oldval, newval, playerid) return 0 end

--- 对任意组的值排序
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param sortType number @排序类型(0升序 1降序)
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number @成功返回 ErrorCode.OK
function Valuegroup:sortGroupByName(vartype, libname, sortType, playerid) return 0 end

--- 任意组是否有任意值(有则result返回0)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @查询的值
--- @param playerid number @私有组玩家ID
--- @return number @成功返回 ErrorCode.OK(有值)
function Valuegroup:hasValueByName(vartype, libname, val, playerid) return 0 end

--- 任意组位置上是否有值(有则result返回0)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param no number @索引值
--- @param playerid number @私有组玩家ID
--- @return number @成功返回 ErrorCode.OK(有值)
function Valuegroup:hasNoByName(vartype, libname, no, playerid) return 0 end

--- 获取任意组中任意值的数量
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @查询的值
--- @param playerid number @私有组玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和值数量
function Valuegroup:getValueCountByName(vartype, libname, val, playerid) return 0, 0 end

--- 获取任意组中任意值的编号(如果多个相同值，只返回第一个)
--- @param vartype number @变量组类型(VARTYPE)
--- @param libname string @组名
--- @param val any @查询的值
--- @param playerid number @私有组玩家ID
--- @return number, number @成功返回 ErrorCode.OK 和编号
function Valuegroup:getGroupNoByValue(vartype, libname, val, playerid) return 0, 0 end

--- 获取最大最小值
--- @param libname string @组名
--- @param itype number @获取类型(0最小值 1最大值)
--- @param playerid number @私有组玩家ID(全局组为0)
--- @return number, any @成功返回 ErrorCode.OK 和最值
function Valuegroup:getSpcialValueByName(libname, itype, playerid) return 0, nil end
