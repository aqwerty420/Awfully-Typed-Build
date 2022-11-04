local Unlocker, awful, myWork = ...

local ____exports = {}
awful.DevMode = true
myWork.warrior = {fury = awful.Actor:New({spec = 2, class = "warrior"})}
awful.Populate(
    {
        ["myWork"] = ____exports,
    },
    myWork,
    getfenv(1)
)
