local Unlocker, awful, myWork = ...

local ____lualib = myWork["lualib_bundle"]
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local spells = myWork["spells"]
local Dummy = __TS__Class()
Dummy.name = "Dummy"
function Dummy.prototype.____constructor(self)
    self.none = nil
end
local dummy = __TS__New(Dummy)
awful.DevMode = true
myWork.warrior = {fury = awful.Actor:New({spec = 2, class = "warrior"})}
myWork.warrior.fury:Init(function()
    if not awful.target.exists or awful.target.dead or awful.target.ally then
        return
    end
    StartAttack()
    spells.Recklessness()
    spells.Rampage()
    spells.Execute()
    spells.RagingBlow()
    spells.Bloodthirst()
    spells.Whirlwind()
end)
awful.Populate(
    {
        ["myWork"] = ____exports,
    },
    myWork,
    getfenv(1)
)
