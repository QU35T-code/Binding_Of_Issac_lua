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
end

function Module.update_my_Controls(dt)
end

function Module.draw_my_Controls()
  love.graphics.draw(controlsBackground, 0, 0, 0, 2.7, 2.7)
  love.graphics.draw(controlsMap, 130, 100, 0, 2.5, 2.5)
  love.graphics.draw(controlsReset, 350, 500, 0, 2.5, 2.5)
  love.graphics.draw(controlsPointeur, 300, 300, 0, 2.5, 2.5)
  love.graphics.draw(controlsLabel, 500, 45, 0, 2, 2)
  love.graphics.draw(controlsLabel2, 420, 535, 0, 2.5, 2.5)
  love.graphics.draw(optionsBack, 0, 560, 0, 2.5, 2.5)
  love.graphics.draw(optionsSelect, 1050, 520, 0, 2.5, 2.5)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Up / Menu Up", 300, 150, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.up, 500, 152, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Down / Menu Down", 255, 200, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.down, 500, 202, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Left / Menu Left", 270, 250, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.left, 499, 252, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Walk Right / Menu Right", 254, 300, 0)
  love.graphics.setFont(controlsBoldFont)
  love.graphics.print(Keybinds.right, 500, 300, 0)
  love.graphics.setFont(controlsFont)
  love.graphics.print("Shoot", 300, 350, 0)
  love.graphics.print("Pause / Unpause", 300, 400, 0)
  love.graphics.print("Menu Confirm", 300, 450, 0)
  love.graphics.print("Menu Back", 300, 500, 0)

  love.graphics.setColor(1, 1, 1)

  
end

return Module