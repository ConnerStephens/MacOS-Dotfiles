hs.window.animationDuration = 0
hs.ipc.cliInstall()
local computer = hs.screen.mainScreen():name()


-- functions called by Alfred

function listWins()
   apps = hs.application.runningApplications()
   for _, app in pairs(apps) do
      if app:kind() == 1 then
         --         wins = app:visibleWindows()
         wins = app:allWindows()
         for _, win in pairs(wins) do
            print(app:title() .. '|' .. win:title())
         end
      end
   end
end


   
function selectWin(appname, wintitle)
   app = hs.appfinder.appFromName(appname)
   app:activate(false)
   for _,win in pairs(app:allWindows()) do
      if win:title() == wintitle then
         win:unminimize()
         win:focus()
         break
      end
   end
end
   

-- replacement for Alfred functionality that was too slow
local function runTerminal()
   local terminal = hs.appfinder.appFromName("Terminal")
   if terminal then
      hs.applescript.applescript('tell application "Terminal" to do script ""')
      terminal:activate()
   else
      hs.applescript.applescript('tell application "Terminal" to activate')
      hs.application.launchOrFocus("Terminal")
      terminal = hs.appfinder.appFromName("Terminal")
      hs.alert.show("launching terminal")
   end

   local win = terminal:focusedWindow()
   local frame = win:screen():frame()

   frame.w = frame.w / 2
   frame.h = frame.h / 2
   frame.x = frame.x+frame.w
   frame.y = frame.y+frame.h

   win:setFrame(frame)
end

hs.hotkey.bind({"shift", "alt"}, "x", runTerminal)




-- tiling setup
local tiling = require "hs.tiling"
local tmash = {"ctrl", "cmd"}

local non_tiled_apps = { "Dash", "Howler Pro", "Toodledo", "Mail" }
local function  is_tiled_app(x)
   return  not hs.fnutils.contains(non_tiled_apps, x:application():title())
end

-- Push/resize the window into thecenter of the screen
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
      win:setFrame(sf)
   else
      wf.x = (sf.w - wf.w)/2
      wf.y = (sf.h - wf.h)/2
      win:setFrame(wf)
   end
   
end

-- push the window onto the left half of the screen

local function leftify_window()
   local win = hs.window.focusedWindow()

   if not win then
      return
   end   

   local f = win:screen():frame()
   f.w = f.w/2 - 3
   win:setFrame(f)
end



tiling.addlayout('crt-vertical-right', function(windows)

                    windows = hs.fnutils.filter(windows, is_tiled_app)

                    local wincount = #windows

                    for index, win in pairs(windows) do
                       local frame = win:screen():frame()


                       if index == 1 then
                          frame.x = frame.x + frame.w / 2
                          frame.w = frame.w / 2
                       else
                          frame.x = frame.x
                          frame.w = frame.w / 2 - 3
                          frame.h = frame.h / (wincount - 1) - 3
                          frame.y = frame.y + frame.h * (index - 2)
                       end
                       
                       win:setFrame(frame)
                    end
end)

-- tiling.addlayout('crt-fullscreen', function(windows)

--                     windows = fnutils.filter(windows, is_tiled_app)
--                     local wincount = #windows

--                     for index, win in pairs(windows) do
--                        local frame = win:screen():frame()

--                        if index == 1 then
--                           win:setframe(frame)
--                        else
--                           frame.x = frame.x
--                           break
--                        end
--                     end
-- end)


-- If you want to set the layouts that are enabled
tiling.set('layouts', {
              'crt-vertical-right' -- , 'crt-fullscreen'
})


-- hotkeys

hs.hotkey.bind(tmash, "up", function() tiling.cycle(-1) end)
hs.hotkey.bind(tmash, "down", function() tiling.cycle(1) end)
hs.hotkey.bind(tmash, "right", function() tiling.promote() end)
hs.hotkey.bind({'alt'}, "tab", function() tiling.cycle(-1) tiling.promote() end)
-- hs.hotkey.bind(tmash, "return", function() centerfocused() end)
hs.hotkey.bind(tmash, "return", function() centerWindow() end)
-- hs.hotkey.bind({"ctrl", "cmd", "shift"}, "return", function() centerfocused(1) end)
hs.hotkey.bind({"ctrl", "cmd", "shift"}, "return", function() centerWindow(1) end)
hs.hotkey.bind(tmash, "left", function() leftify_window() end)




-- hs.grid experiments

-- hs.grid.GRIDHEIGHT=4
-- hs.grid.GRIDWIDTH=4

-- local gmash = {"ctrl", "cmd"}
-- local gmashs = {"ctrl", "cmd", "shift"}
-- hs.hotkey.bind(gmash, "up", hs.grid.pushWindowUp)
-- hs.hotkey.bind(gmash, "down", hs.grid.pushWindowDown)
-- hs.hotkey.bind(gmash, "left", hs.grid.pushWindowLeft)
-- hs.hotkey.bind(gmash, "right", hs.grid.pushWindowRight)
-- hs.hotkey.bind(gmashs, "up", hs.grid.resizeWindowShorter)
-- hs.hotkey.bind(gmashs, "down", hs.grid.resizeWindowTaller)
-- hs.hotkey.bind(gmashs, "left", hs.grid.resizeWindowThinner)
-- hs.hotkey.bind(gmashs, "right", hs.grid.resizeWindowWider)

--
local winLines={}

function traceWin(win)
   local frame = win:frame()

   for _,l in pairs(winLines) do
      l:delete()
   end

   winLines = {}

   local corner1 = {x=frame.x, y=frame.y}
   local corner2 = {x=frame.x, y=frame.y+frame.h}
   local corner3 = {x=frame.x+frame.w, y=frame.y+frame.h}
   local corner4 = {x=frame.x+frame.w, y=frame.y}


   winLines[#winLines+1] = hs.drawing.line(corner1, corner2)
   winLines[#winLines+1] = hs.drawing.line(corner2, corner3)
   winLines[#winLines+1] = hs.drawing.line(corner3, corner4)
   winLines[#winLines+1] = hs.drawing.line(corner4, corner1)

   for _,l in pairs(winLines) do
      l:setStrokeWidth(5)
      l:show()
   end
end

function clearTrace()
   for _,l in pairs(winLines) do
      l:delete()
   end
   winLines={}
end

-- function traceCB(args)
--    print 'trace cb called'
--    traceWin(args[element])
-- end


-- local traceWatcher = hs.window.focusedWindow():newWatcher(traceCB)

-- traceWatcher:start {"focusedWindowChanged",
--                     "windowCreated",
--                     "windowMoved",
--                     "windowResized",
--                     "windowMinimized",
--                     "windowUnminimized"}


function allWindowsAllScreens()
   local i=1
   for k,v in pairs(hs.window.focusedWindow():otherWindowsAllScreens()) do
      print (i)
      i = i+1
      if v:application() then
         print (v:application():title())
      end

      print (v:title())
      -- for k2,v2 in {v} do
      --    print (k2,v2)
      -- end         
   end
end
