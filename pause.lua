local Module = {}

function Module.load_my_pause()
	pauseScreen = love.graphics.newImage("assets/Scenes/Pause/Pause.png")
	pauseCode = love.graphics.newImage("assets/Scenes/Pause/Code.png")
	pauseStuff = love.graphics.newImage("assets/Scenes/Pause/Mystuff.png")
	pausePointeur = love.graphics.newImage("assets/Scenes/Pause/Pointeur.png")
end

function Module.draw_my_pause()
	love.graphics.draw(pauseScreen, 500, 160, 0, 2.5, 2.5)
	love.graphics.draw(pauseCode, 200, 160, 0, 2.5, 2.5)
	love.graphics.draw(pauseStuff, 200, 300, 0, 2.5, 2.5)
	love.graphics.draw(pausePointeur, pause_pointeurX, pause_pointeurY, 0, 2.5, 2.5)
end

function Module.keypressed_my_pause(key)
	if (key == Keybinds.up and pause_pointeurY == 445) then
  	pause_pointeurY = 445
  elseif (key == Keybinds.up and pause_pointeurY == 510) then
		pause_pointeurY = 445
  elseif (key == Keybinds.up and pause_pointeurY == 564) then
  	pause_pointeurY = 510
  end

	if (key == Keybinds.down and pause_pointeurY == 445) then
  	pause_pointeurY = 510
  elseif (key == Keybinds.down and pause_pointeurY == 510) then
  	pause_pointeurY = 564
  elseif (key == Keybinds.down and pause_pointeurY == 564) then
  	pause_pointeurY = 564
  end
end

return Module