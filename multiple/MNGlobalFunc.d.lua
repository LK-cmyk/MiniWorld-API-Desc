---@class json
local json = {
    ---解码Json字符串
    ---@return table @解码后的Table数据
    ---@param data string @Json字符串
    decode = function(self, data) 
        return {}
    end,

    ---编码Table数据
    ---@return string @编码后的Json字符串
    ---@param data table @Table数据
    encode = function(self, data) 
        return ""
    end
}
_G.json = json

---@class threadpool
local threadpool = {
    ---等待时间
    ---@return nil
    ---@param time number @等待时间（秒）
    wait = function(self, time)
        return nil
    end
}
_G.threadpool = threadpool

---获取当前世界对象
---@return table @世界对象
local GetWorld = function()
    return {}
end
_G.GetWorld = GetWorld

---打印信息
---@param message any @要打印的信息
local print = function(message)
    return nil
end
_G.print = print

---打印错误信息
---@param message any @要打印的错误信息
local printError = function(message)
    return nil
end
_G.printError = printError

---定义类对象
---@param className string @类名
---@param super table|string @父类原表|父类名
local Class = function(className, super, isSingle)
    return {}
end
_G.Class = Class

---创建类实例
---@param className string @类名
---@return table @对象实例
local instance = function(className)
    return {}
end
_G.instance = instance

---获取类单例
---@param className string @类名
---@return table @类单例
local GetInst = function(className)
    return {}
end
_G.GetInst = GetInst