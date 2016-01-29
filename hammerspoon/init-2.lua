hs.window.animationDuration = 0

local tiling = {}

local application = require "hs.application"
local window = require "hs.window"
local screen = require "hs.screen"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local alert = require "hs.alert"
local spaces = {}
local settings = { layouts = {} }
local layouts = {}

------------------------------
-- -- Window Management --  --
------------------------------

local mash = {"ctrl", "cmd"}
local tmash = {"ctrl", "cmd", "shift"}
local smash = {"cmd"}
local amash = {"alt", "shift"}

local function leftSlam()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x + 5
   f.y = max.y 
   f.w = max.w / 2 - 10
   f.h = max.h - 10
   win:setFrame(f)
   
end


local function rightSlam()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x + (max.w / 2) + 2
   f.y = max.y 
   f.w = max.w / 2 - 10
   f.h = max.h - 10
   win:setFrame(f)

end

local function leftBottomSlam()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x / 2 
   f.y = max.y + (max.h / 2) 
   f.w = max.w / 2 - 3
   f.h = max.h / 2 - 5
   win:setFrame(f)
   
end

local function leftTopSlam()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x / 2
   f.y = max.y / 2
   f.w = max.w / 2 - 3
   f.h = max.h / 2 - 5
   win:setFrame(f)
end

local function rightTopSlam()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x + (max.w / 2) 
   f.y = max.y / 2
   f.w = max.w / 2 - 3
   f.h = max.h / 2 - 5
   win:setFrame(f)
end

local function rightBottomSlam()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x + (max.w / 2)
   f.y = max.y + (max.h / 2)
   f.w = max.w / 2 - 3
   f.h = max.h / 2 - 5

   win:setFrame(f)
end

local function centerfocused(full)
   win = hs.window.focusedWindow()

   if (not win) then
      return
   end

   frame = win:screen():frame()

   if not full then
      frame.x = .10*frame.w
      frame.y = 0
      frame.w = .80*frame.w
      frame.h = frame.h
   end
   win:setFrame(frame)
end

-- center without changing window size
local function centerWindow(full)
   local win = hs.window.focusedWindow()

   if (not win) then return end

   local wf = win:frame()
   local sf = win:screen():frame()

   if full then
      sf.x = .10*sf.w
      sf.y = 0
      sf.w = .80*sf.w
      sf.h = sf.h
      win:setFrame(sf)
   else
      wf.x = (sf.w - wf.w)/2
      wf.y = (sf.h - wf.h)/2
      win:setFrame(wf)
   end
end

local function fullScreen()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x
   f.y = max.y
   f.w = max.w
   f.h = max.h
   win:setFrame(f)
end

-- Toggle an application between being the frontmost app, and being hidden
hs.hotkey.bind(smash, 'up', function()
     if hs.window.focusedWindow() then
	hs.window.focusedWindow():focusWindowNorth()
     else
         hs.alert.show("No active window")
     end
end)
hs.hotkey.bind(smash, 'right', function()
     if hs.window.focusedWindow() then
	hs.window.focusedWindow():focusWindowEast() 
     else
         hs.alert.show("No active window")
     end
end)
hs.hotkey.bind(smash, 'down', function()
     if hs.window.focusedWindow() then
	hs.window.focusedWindow():focusWindowSouth() 
     else
         hs.alert.show("No active window")
     end
 end)
 hs.hotkey.bind(smash, 'left', function()
     if hs.window.focusedWindow() then
         hs.window.focusedWindow():focusWindowWest()
     else
         hs.alert.show("No active window")
     end
 end)


-------------------
-- -- iTunes --  --
-------------------
-- local function iTunesDisplay()
--    hs.itunes.displayCurrentTrack()
-- end

----------------
-- -- Apps -- --
----------------
local function runTerminal()
   local terminal = hs.appfinder.appFromName("Terminal")
   if terminal then
      hs.applescript.applescript('tell application "Terminal" to do script ""')
      terminal:activate()
   else
      hs.applescript.applescript('tell application "Terminal" to activate')
      hs.application.launchOrFocus("Terminal")
      terminal = hs.appfinder.appFromName("Terminal")
      hs.alert.show("Summoning Terminal")
   end

   local win = terminal:focusedWindow()
   local frame = win:screen():frame()

   frame.w = frame.w / 2
   frame.h = frame.h / 2
   frame.x = frame.x+frame.w
   frame.y = frame.y+frame.h

   win:setFrame(frame)
end

-------------------------
-- -- Reload Config -- --
-------------------------

function reloadConfig(files)
   doReload = false
   for _,file in pairs(files) do
      if file:sub(-4) == ".lua" then
	 doReload = true
      end
   end
   if doReload then
      hs.reload()
   end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Welcome back: \nCommander \n\n All Systems:\n ONLINE")

------------------------
-- -- Key Bindings -- --
------------------------

-- Mash
--hs.hotkey.bind(mash, "left", function() leftSlam() end)

hs.hotkey.bind(mash, "left", function() leftSlam() end)
hs.hotkey.bind(mash, "right", function() rightSlam() end)
hs.hotkey.bind(mash, "return", function() centerWindow() end)


-- Tmash
hs.hotkey.bind(tmash, "left", function() leftBottomSlam() end)
hs.hotkey.bind(tmash, "up", function() leftTopSlam() end)
hs.hotkey.bind(tmash, "right", function() rightTopSlam() end)
hs.hotkey.bind(tmash, "down", function() rightBottomSlam() end)
hs.hotkey.bind(tmash, "return", function() centerfocused() end)

-- Amash
-- Launch Iterm2
--hs.hotkey.bind(amash, "t", function() os.execute("/Applications/iTerm.app") end)

--hs.hotkey.bind(amash, "s", function() iTunesDisplay() end)
hs.hotkey.bind(amash, "x", runTerminal)

