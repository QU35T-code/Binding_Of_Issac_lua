local Module = {}

function Module.load_my_options()
	optionsBackground = love.graphics.newImage("assets/Scenes/Options/background.png")
	optionsMap = love.graphics.newImage("assets/Scenes/Options/map.png")
	optionsLabels = love.graphics.newImage("assets/Scenes/Options/labels.png")
	optionsOnOff = love.graphics.newImage("assets/Scenes/Options/on_off.png")
	optionsControls = love.graphics.newImage("assets/Scenes/Options/controls.png")
	optionsGamma = love.graphics.newImage("assets/Scenes/Options/gamma.png")
	optionsPopUps = love.graphics.newImage("assets/Scenes/Options/pop-ups.png")
	optionsPointeur = love.graphics.newImage("assets/Scenes/Options/pointeur.png")
	optionsBack = love.graphics.newImage("assets/Scenes/Options/back.png")
	optionsExit = love.graphics.newImage("assets/Scenes/Options/exit.png")
	optionsRestart = love.graphics.newImage("assets/Scenes/Options/restart.png")
	optionsSelect = love.graphics.newImage("assets/Scenes/Options/select.png")
end

function Module.draw_my_options()
	love.graphics.draw(optionsBackground, 0, 0, 0, 2.7, 2.7)
	love.graphics.draw(optionsMap, 320, 45, 0, 2.5, 3)
	love.graphics.draw(optionsPointeur, 367, 359, 0, 2.5, 2.5) --[[442 -179  Controls --]] --[[ 390 - 247 SFX--]] --[[ 390 - 303 Music--]]
	love.graphics.draw(optionsControls, 490, 175, 0, 2.5, 2.5)
	love.graphics.draw(optionsLabels, 410, 240, 0, 2.5, 2.5)
	--[[love.graphics.draw(optionsOnOff, 0, 0, 0, 2.5, 2.5)--]]
	love.graphics.draw(optionsGamma, 430, 530, 0, 2.5, 2.5)
	love.graphics.draw(optionsPopUps, 430, 593, 0, 2.5, 2.5)
	love.graphics.draw(optionsBack, 0, 555, 0, 2.5, 2.5)
	love.graphics.draw(optionsSelect, 1050, 510, 0, 2.5, 2.5)
end

function Module.keypressed_my_options(key)
	--[[if (key == Keybinds.up and pause_pointeurY == 445) then
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
  end--]]
end

return Module