local Unlocker, awful, myWork = ...

local ____exports = {}
local function callProtectedFunction(func, ...)
    if Unlocker.type == "daemonic" then
        return CallProtectedApi(func, ...)
    else
        return Unlocker.Util.Evaluator:CallProtectedFunction(func, ...)
    end
end
____exports.callProtectedFunction = callProtectedFunction
awful.Populate(
    {
        ["system"] = ____exports,
    },
    myWork,
    getfenv(1)
)
