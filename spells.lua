local Unlocker, awful, myWork = ...
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
awful.Populate(
    {
        ["spells"] = ____exports,
    },
    myWork,
    getfenv(1)
)
