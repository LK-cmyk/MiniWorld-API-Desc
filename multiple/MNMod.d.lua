---@class Mod
---资源模块管理接口 Mod
local Mod = {}
_G.Mod = Mod

---通过资源id获取defid
---@param assetId string @资源id
---@return number @defid
function Mod:GetCfgIdByAssetId(assetId)
    return 0
end