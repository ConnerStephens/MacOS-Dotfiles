-- Speed this baby up!
hs.window.animationDuration = 0

--local tiling = {}

local application = require "hs.application"
local window = require "hs.window"
local screen = require "hs.screen"
local fnutils = require "hs.fnutils"
local geometry = require "hs.geometry"
local alert = require "hs.alert"
local spaces = {}
local settings = { layouts = {} }
local layouts = {}


-------------------------
-- -- Reload Config -- --
-------------------------
function startUpSound()
--    hs.applescript._applescript([[
-- tell application "Play Sound" 
--    play "HD:Users:cyanide:.hammerspoon:start.m4a" 
   -- end tell]])
   os.execute("afplay start.m4a")
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
--startUpSound() 
hs.alert.show("All Systems: ONLINE \n\nBrace For Impact!")

------------------------------
-- -- Window Management --  --
------------------------------

local mash = {"ctrl", "cmd"}
local tmash = {"ctrl", "cmd", "shift"}
local smash = {"ctrl"}
local amash = {"alt", "shift"}
local cmash = {"cmd"}

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

local function fullScreen()
   local win = hs.window.focusedWindow()
   local f = win:frame()
   local screen = win:screen()
   local max = screen:frame()

   f.x = max.x - 2 
   f.y = max.y 
   f.w = max.w 
   f.h = max.h 

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

-- Toggle an application between being the frontmost app, and being hidden
hs.hotkey.bind(cmash, 'up', function()
     if hs.window.focusedWindow() then
	hs.window.focusedWindow():focusWindowNorth()
     else
         hs.alert.show("No active window")
     end
end)
hs.hotkey.bind(cmash, 'right', function()
     if hs.window.focusedWindow() then
	hs.window.focusedWindow():focusWindowEast() 
     else
         hs.alert.show("No active window")
     end
end)
hs.hotkey.bind(cmash, 'down', function()
     if hs.window.focusedWindow() then
	hs.window.focusedWindow():focusWindowSouth() 
     else
         hs.alert.show("No active window")
     end
 end)
 hs.hotkey.bind(cmash, 'left', function()
     if hs.window.focusedWindow() then
         hs.window.focusedWindow():focusWindowWest()
     else
         hs.alert.show("No active window")
     end
 end)

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

------------------------
-- --  Caffeine  -- --
------------------------

-- Replace Caffeine.app with 18 lines of Lua :D
local caffeine = hs.menubar.new()

function setCaffeineDisplay(state)
    local result
    if state then
        result = caffeine:setIcon("caffeine-on.pdf")
    else
        result = caffeine:setIcon("caffeine-off.pdf")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

------------------------
-- --  Clock  -- --
------------------------
-- function getTime()
--    hs.alert.show(time.hour)
-- end  

------------------------
-- -- Key Bindings -- --
------------------------

-- Notes
-- local mash = {"ctrl", "cmd"}
-- local tmash = {"ctrl", "cmd", "shift"}
-- local smash = {"ctrl"}
-- local cmash = {"cmd"}
-- local amash = {"alt", "shift"}



hs.hotkey.bind(mash, "left", function() leftSlam() end)
hs.hotkey.bind(mash, "right", function() rightSlam() end)
hs.hotkey.bind(mash, "return", function() centerWindow() end)

hs.hotkey.bind(tmash, "left", function() leftBottomSlam() end)
hs.hotkey.bind(tmash, "up", function() leftTopSlam() end)
hs.hotkey.bind(tmash, "right", function() rightTopSlam() end)
hs.hotkey.bind(tmash, "down", function() rightBottomSlam() end)

hs.hotkey.bind(tmash, "return", function() centerfocused() end)
hs.hotkey.bind(mash, "f", function() fullScreen() end)

hs.hotkey.bind(amash, "x", runTerminal)
hs.hotkey.bind(amash, 'w', caffeineClicked)
-- hs.hotkey.bind(amash, 'q', getTime)

-----------------------------------------------------------

-- local wifiWatcher = nil
-- local homeSSID = "NETGEAR78"
-- local lastSSID = hs.wifi.currentNetwork()

-- function ssidChangedCallback()
--     newSSID = hs.wifi.currentNetwork()

--     if newSSID == homeSSID and lastSSID ~= homeSSID then
--         -- We just joined our home WiFi network
--         hs.audiodevice.defaultOutputDevice():setVolume(25)
--     elseif newSSID ~= homeSSID and lastSSID == homeSSID then
--         -- We just departed our home WiFi network
--         hs.audiodevice.defaultOutputDevice():setVolume(0)
--     end

--     lastSSID = newSSID
-- end

-- wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
-- wifiWatcher:start()

-- local tiling = require "hs.tiling"
-- local hotkey = require "hs.hotkey"


-- hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
-- hotkey.bind(mash, "j", function() tiling.cycle(1) end)
-- hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
-- hotkey.bind(mash, "space", function() tiling.promote() end)
-- --hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)

-- -- If you want to set the layouts that are enabled
-- tiling.set('layouts', {
--   'fullscreen', 'main-vertical'
-- })

-- -- Set up hotkey combinations
-- local mash      = {"cmd", "alt"}

-- hs.hotkey.bind(mash, 'M', hs.grid.maximizeWindow)

-- hs.hotkey.bind(mash, 'F', function() hs.window.focusedWindow():toggleFullScreen() end)

-- )

-- hs.hotkey.bind(mash, 'T', function() hs.alert.show(os.date("%A %b %d, %Y - %I:%M%p"), 4) end)

