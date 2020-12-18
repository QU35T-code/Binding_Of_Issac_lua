function SetMode()
  local r = {}
  r.fullscreen = false
  r.fullscreentype = "desktop"
  r.vsync = true
  r.resizable = false
  r.borderless = false
  r.centered = true
  r.display = 1
  r.minwidth = 1
  r.minheight = 1
  r.highdpi = false
  r.x = nil
  r.y = nil
  
  return r
end

love.window.setMode(1280, 720, SetMode())


Keybinds = {}
Keybinds.up = "z"
Keybinds.down = "s"
Keybinds.left = "q"
Keybinds.right = "d"