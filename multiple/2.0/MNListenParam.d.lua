--- @class ListenParam
--- 函数监听接口 ListenParam
local ListenParam = {}
_G.ListenParam = ListenParam

--- 添加图文信息 监听触发器参数 刷新的对象id 参数信息 回调方法
--- @param graphid number @已创建的图文信息ID
--- @param funcs table @监听函数列表
--- @param param table @监听函数需要的参数
--- @return number @成功返回 ErrorCode.OK
function ListenParam:AddGraphicsListenParam(graphid, funcs, param) return 0 end
