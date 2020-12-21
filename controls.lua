local Module = {}


function Module.load_my_Controls()
  controlsFont = love.graphics.newFont("assets/Fonts/Letters.ttf", 25)
  controlsBoldFont = love.graphics.newFont("assets/Fonts/theboldfont.ttf", 25)
  controlsBackground = love.graphics.newImage("assets/Scenes/Options/KeyConfig/background.png")
  controlsMap = love.graphics.newImage("assets/Scenes/Options/KeyConfig/map.png")
  controlsReset = love.graphics.newImage("assets/Scenes/Options/KeyConfig/reset.png")
  controlsPointeur = love.graphics.newImage("assets/Scenes/Options/KeyConfig/pointeur.png")
  controlsLabel = love.graphics.newImage("assets/Scenes/Options/KeyConfig/label.png")
  controlsLabel2 = love.graphics.newImage("assets/Scenes/Options/KeyConfig/label2.png")
  controls_pointeurX = 250
  controls_pointeurY = 163
  controls_pointeurRotation = 0

  controls_valueX = 500

  check_up_select = false
  check_down_select = false
  check_left_select = false
  check_right_select = false

  canIReset = false

end

function Module.keyreleased_my_Controls(key)
  if (key == "return" and controls_check_keyreleased == 1) then
    controls_check_keyreleased = 0
  end
end

function Module.update_my_Controls(dt)

  -- Collision with reset
  if (love.mouse.getX() >= 350 and love.mouse.getX() <= (350 + 543) and love.mouse.getY() >= 500 and love.mouse.getY() <= (500 + 110)) then
    canIReset = true
    controls_pointeurX = 385
    controls_pointeurY = 565
    isCollide = false
  else
    canIReset = false
  end

  -- Collision with UP
  if (love.mouse.getX() >= 130 and love.mouse.getX() <= (130 + 500) and love.mouse.getY() >= 120 and love.mouse.getY() <= (120 + 75)) then
    controls_pointeurX = 250
    controls_pointeurY = 163
  end

end

function Module.keypressed_my_Controls(key)
  if (key == 'return' and controls_pointeurY == 163 and controls_check_keyreleased == 0) then
    controls_pointeurX = controls_valueX + 220
    controls_pointeurRotation = 60
    controls_pointeurY = 165
    Keybinds.up = "Press any key..."
    function love.keyreleased(key)
      if (key == 'return') then
        check_up_select = true
      end
    end
  elseif (key == 'return' and controls_pointeurY == 212) then
    controls_pointeurX = controls_valueX + 220
    controls_pointeurRotation = 60
    controls_pointeurY = 214
    Keybinds.down = "Press any key..."
    function love.keyreleased(key)
      if (key == 'return') then
        check_down_select = true
      end
    end
  elseif (key == 'return' and controls_pointeurY == 261) then
    controls_pointeurX = controls_valueX + 220
    controls_pointeurRotation = 60
    controls_pointeurY = 263
    Keybinds.left = "Press any key..."
    function love.keyreleased(key)
      if (key == 'return') then
        check_left_select = true
      end
    end
  elseif (key == 'return' and controls_pointeurY == 312) then
    controls_pointeurX = controls_valueX + 220
    controls_pointeurRotation = 60
    controls_pointeurY = 314
    Keybinds.right = "Press any key..."
    function love.keyreleased(key)
      if (key == 'return') then
        check_right_select = true
      end
    end
  end

  if (check_up_select == true) then
      Keybinds.up = key
      controls_pointeurX = 250
      controls_pointeurRotation = 0
      controls_pointeurY = 163
      check_up_select = false
  end

  if (check_down_select == true) then
      Keybinds.down = key
      controls_pointeurX = 220
      controls_pointeurRotation = 0
      controls_pointeurY = 163
      check_down_select = false
  end

  if (check_left_select == true) then
      Keybinds.left = key
      controls_pointeurX = 230
      controls_pointeurRotation = 0
      controls_pointeurY = 261
      check_left_select = false
  end

  if (check_right_select == true) then
      Keybinds.right = key
      controls_pointeurX = 220
      controls_pointeurRotation = 0
      controls_pointeurY = 312
      check_right_select = false
  end


  -- Position pointeur

  if (key == Keybinds.down and controls_pointeurY == 163) then
    controls_pointeurY = 212
    controls_pointeurX = 220
  elseif (key == Keybinds.down and controls_pointeurY == 212) then
    controls_pointeurY = 261
    controls_pointeurX = 230
  elseif (key == Keybinds.down and controls_pointeurY == 261) then
    controls_pointeurY = 312
    controls_pointeurX = 220
  elseif (key == Keybinds.down and controls_pointeurY == 312) then
    controls_pointeurY = 565
    controls_pointeurX = 385
  end

  if (key == Keybinds.up and controls_pointeurY == 212) then
    controls_pointeurY = 163
    controls_pointeurX = 250
  elseif (key == Keybinds.up and controls_pointeurY == 261) then
    controls_pointeurY = 212
    controls_pointeurX = 220
  elseif (key == Keybinds.up and controls_pointeurY == 312) then
    controls_pointeurY = 261
    controls_pointeurX = 230
  elseif (key == Keybinds.up and controls_pointeurY == 565) then
    controls_pointeurY = 312
    controls_pointeurX = 220
  end

  
end

function Module.draw_my_Controls()
  love.graphics.draw(controlsBackground, 0, 0, 0, 2.7, 2.7)
  love.graphics.draw(controlsMap, 130, 100, 0, 2.5, 2.5)
  love.graphics.draw(controlsReset, 350, 500, 0, 2.5, 2.5)
  love.graphics.draw(controlsPointeur, controls_pointeurX, controls_pointeurY, controls_pointeurRotation, 2, 2, 6, 7)
  love.graphics.draw(controlsLabel, 500, 45, 0, 2, 2)
  love.graphics.draw(controlsLabel2, 420, 535, 0, 2.5, 2.5)
  love.graphics.draw(optionsBack, 0, 560, 0, 2.5, 2.5)
  love.graphics.draw(optionsSelect, 1050, 520, 0, 2.5, 2.5)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Up / Menu Up", 300, 150, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.up, controls_valueX, 152, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Down / Menu Down", 255, 200, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.down, controls_valueX, 202, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Left / Menu Left", 270, 250, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.left, controls_valueX, 252, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Right / Menu Right", 254, 300, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.right, controls_valueX, 300, 0)
  love.graphics.setFont(controlsFont)
--[[  love.graphics.print("Shoot", 300, 350, 0)
  love.graphics.print("Pause / Unpause", 300, 400, 0)
  love.graphics.print("Menu Confirm", 300, 450, 0)
  love.graphics.print("Menu Back", 300, 500, 0)--]]

  love.graphics.setColor(1, 1, 1)

  
end

function love.mousepressed(x, y, button)
  if (button == 1 and canIReset) then
    Keybinds.up = Keybinds.default_up
    Keybinds.down = Keybinds.default_down
    Keybinds.left = Keybinds.default_left
    Keybinds.right = Keybinds.default_right
    controls_pointeurX = 250
    controls_pointeurY = 163
    controls_pointeurRotation = 0
    check_up_select = false
    check_down_select = false
    check_left_select = false
    check_right_select = false
  end
end

return Module