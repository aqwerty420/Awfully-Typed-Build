local Unlocker, awful, myWork = ...
local ____modules = {}
local ____moduleCache = {}
local ____originalRequire = require
local function require(file, ...)
    if ____moduleCache[file] then
        return ____moduleCache[file].value
    end
    if ____modules[file] then
        local module = ____modules[file]
        ____moduleCache[file] = { value = (select("#", ...) > 0) and module(...) or module(file) }
        return ____moduleCache[file].value
    else
        if ____originalRequire then
            return ____originalRequire(file)
        else
            error("module '" .. file .. "' not found")
        end
    end
end
____modules = {
["lualib_bundle"] = function(...) 
local function __TS__Class(self)
    local c = {prototype = {}}
    c.prototype.__index = c.prototype
    c.prototype.constructor = c
    return c
end

local function __TS__New(target, ...)
    local instance = setmetatable({}, target.prototype)
    instance:____constructor(...)
    return instance
end

return {
  __TS__Class = __TS__Class,
  __TS__New = __TS__New
}
 end,
["gui"] = function(...) 
local green = {170, 211, 114, 1}
local white = {255, 255, 255, 1}
local dark = {21, 21, 21, 0.45}
local awfulGui, awfulSettings, awfulCmd = awful.UI:New("myWork", {title = "My Work", show = true, colors = {title = green, primary = white, accent = green, background = dark}})
 end,
["spells"] = function(...) 
local ____exports = {}
local NewSpell = awful.NewSpell
____exports.Recklessness = NewSpell(1719, {targeted = false})
____exports.Recklessness:Callback(function(spell)
    spell:Cast()
end)
____exports.Rampage = NewSpell(184367)
____exports.Rampage:Callback(function(spell)
    spell:Cast(awful.target)
end)
____exports.Execute = NewSpell(5308)
____exports.Execute:Callback(function(spell)
    if awful.target.hp <= 20 then
        spell:Cast(awful.target)
    end
end)
____exports.RagingBlow = NewSpell(85288)
____exports.RagingBlow:Callback(function(spell)
    spell:Cast(awful.target)
end)
____exports.Bloodthirst = NewSpell(23881)
____exports.Bloodthirst:Callback(function(spell)
    spell:Cast(awful.target)
end)
____exports.Whirlwind = NewSpell(190411, {targeted = false})
____exports.Whirlwind:Callback(function(spell)
    if awful.target.distance <= 8 then
        spell:Cast()
    end
end)
return ____exports
 end,
["myWork"] = function(...) 
local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local ____exports = {}
local spells = require("spells")
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
    awful.call("StartAttack")
    spells.Recklessness()
    spells.Rampage()
    spells.Execute()
    spells.RagingBlow()
    spells.Bloodthirst()
    spells.Whirlwind()
end)
____exports.test = function()
    local a = 1
end
local function test2()
    local a = 1
end
____exports.func = {test = ____exports.test}
return ____exports
 end,
}
require("myWork", ...)
