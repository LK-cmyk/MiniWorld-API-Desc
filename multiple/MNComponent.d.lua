---@class Component
---组件管理接口 Component
local Component = {}
_G.Component = Component

---获取该组件挂载的对象实例
---@return nil @挂载对象
function Component:GetGameObject()    
    return nil
end

---获取组件挂载的对象实例id
---@return number @对象实例id
function Component:GetGameObjectId()
    return 0
end

---获取组件是否有效
---@return boolean @是否有效
function Component:IsValid()
    return true
end

---在组件所在的对象上添加指定组件
---@param componentId string @组件ID
---@return nil @组件对象
function Component:AddComponent(componentId)
    return nil
end

---删除在组件所在的对象上的指定组件
---@param componentId string @组件ID
---@return nil
function Component:RemoveComponent(componentId)
end

---获取组件所在对象上的指定组件
---@param componentId string @组件ID
---@return nil @组件对象
function Component:GetComponent(componentId)
    return nil
end

---发送自定义消息(异步)
---@param eventId string @消息ID
---@param ... any @消息参数
---@return nil
function Component:PushCustomEvent(eventId, ...)
end

---发送自定义消息(同步)
---@param eventId string @消息ID
---@param ... any @消息参数
---@return nil
function Component:PushCustomEventSync(eventId, ...)
end

---监听自定义消息(广播)
---@param eventId string @消息ID
---@param callback function @回调函数
---@return nil
function Component:AddCustomEvent(eventId, callback)
end

---移除自定义事件监听
---@param eventId string @消息ID
---@return nil
function Component:RemoveCustomEvent(eventId)
end

---添加触发事件(该函数只在UI跟世界类型组件有效)
---@param eventType number @事件类型
---@param callback function @回调函数
---@param filterParam1? any @过滤参数1(缺省参数)
---@param filterParam2? any @过滤参数2(缺省参数)
---@return nil
function Component:AddTriggerEvent(eventType, callback, filterParam1, filterParam2)
end

---移除触发事件监听
---@param eventType number @事件类型
---@return nil
function Component:RemoveTriggerEvent(eventType)
end

---发送对象事件(异步)，只有同个对象上监听的组件才能收到事件
---@param eventType string @自定义事件类型
---@param ... any @事件内容
---@return nil
function Component:PushEvent(eventType, ...)
end

---发送对象事件(同步)，只有同个对象上监听的组件才能收到事件
---@param eventType string @自定义事件类型
---@param ... any @消息内容
---@return nil
function Component:PushEventSync(eventType, ...)
    return nil
end

---监听对象事件(可以监听自定义的，也能监听官方内置对象事件)
---@param eventType string|number @事件类型
---@param callback function @回调函数
---@return nil
function Component:AddEvent(eventType, callback)
    return nil
end

---移除对象的事件监听
---@param eventType string|number @事件类型
---@return nil
function Component:RemoveEvent(eventType)
    return nil
end

---启动定时器在指定时间执行任务
---@param callback function @回调函数
---@param delay number @时间间隔(秒)
---@return nil @定时器任务对象
function Component:DoTaskInTime(callback, delay)
    return nil
end

---启动定时器周期性执行任务
---@param callback function @回调函数
---@param interval number @间隔时间(秒)
---@param delay number @延迟开始第一次执行时间(默认0)
---@param count number @执行次数(默认无限次)
---@return nil @定时器任务对象
function Component:DoPeriodicTask(callback, interval, delay, count)
    return nil
end

---清除所有定时器任务
---@return nil
function Component:ClearAllTask()
    return nil
end

---设置是否启用事件
---@param callback function @事件回调函数
---@param enable boolean @是否启用
---@return nil
function Component:SetEventIsEnable(callback, enable)
    return nil
end

---启动新协程
---@param callback function @协程函数
---@return nil
function Component:ThreadWork(callback)
    return nil
end

---线程等待
---@param delay number @等待时间(默认一帧)
---@return nil
function Component:ThreadWait(delay)
    return nil
end

---发送云服广播消息(异步)
---@param eventType string @自定义事件类型
---@param ... any @事件内容
---@return nil
function Component:PushCloudServerMsg(eventType, ...)
    return nil
end

---接收云服事件
---@param eventType string @消息类型
---@param callback function @回调函数
---@return nil
function Component:AddCloudSeverEvent(eventType, callback)
    return nil
end

---移除云服消息监听
---@param eventType string @消息类型
---@return nil
function Component:RemoveCloudSeverEvent(eventType)
    return nil
end