local Unlocker, awful, myWork = ...
local green = {170, 211, 114, 1}
local white = {255, 255, 255, 1}
local dark = {21, 21, 21, 0.45}
local awfulGui, awfulSettings, awfulCmd = awful.UI:New("myWork", {title = "My Work", show = true, colors = {title = green, primary = white, accent = green, background = dark}})
