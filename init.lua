-----------------------------------------------------------------------------
-- grid setup
-----------------------------------------------------------------------------

local grid = require "hs.grid"

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDHEIGHT = 20
grid.GRIDWIDTH = 20

-----------------------------------------------------------------------------
-- window management
-----------------------------------------------------------------------------

-- snap to left half of screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  --local f = win:frame() testing colon syntax stuff
  local f = hs.window.frame(win)
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- snap to right half of screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end)

-- snap to left lower corner
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x / 2
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- snap to right lower corner
hs.hotkey.bind({"alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- snap to left upper corner
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x / 2
  f.y = max.y / 2
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)

-- snap to right upper corner
hs.hotkey.bind({"alt", "ctrl"}, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h / 2
  win:setFrame(f)
end)


-- full window (not 'full screen')
hs.hotkey.bind({"alt", "ctrl"}, "F", function()
  local win = hs.window.focusedWindow()
  --local f = win:frame() testing colon syntax stuff
  local f = hs.window.frame(win)
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f)
end)

-- resize/nudge-size windows
hs.hotkey.bind({"alt", "ctrl"}, "Right", grid.resizeWindowWider)
hs.hotkey.bind({"alt", "ctrl"}, "Left", grid.resizeWindowThinner)

-- move windows
hs.hotkey.bind({"alt", "ctrl", "shift"}, "Right", grid.pushWindowRight)
hs.hotkey.bind({"alt", "ctrl", "shift"}, "Left", grid.pushWindowLeft)
hs.hotkey.bind({"alt", "ctrl", "shift"}, "Up", grid.pushWindowUp)
hs.hotkey.bind({"alt", "ctrl", "shift"}, "Down", grid.pushWindowDown)


-----------------------------------------------------------------------------
-- other stuff
-----------------------------------------------------------------------------

-- display battery percentage
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "B", function()
pct = hs.battery.percentage()
hs.alert.show(string.format(
    "battery percentage %d%%", pct))
end)

-- manually reload config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
