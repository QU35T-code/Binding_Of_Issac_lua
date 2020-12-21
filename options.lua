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
	optionsOverlay = love.graphics.newImage("assets/Scenes/Options/overlay.png")
	optionsShadow = love.graphics.newImage("assets/Scenes/Options/shadow.png")
end

function Module.draw_my_options()
	love.graphics.draw(optionsBackground, 0, 0, 0, 2.7, 2.7)
	love.graphics.draw(optionsMap, 320, 45, 0, 2.5, 3)
	love.graphics.draw(optionsPointeur, options_pointeurX, options_pointeurY, 0, 2.5, 2.5)
	love.graphics.draw(optionsControls, 490, 175, 0, 2.5, 2.5)
	love.graphics.draw(optionsLabels, 410, 240, 0, 2.5, 2.5)
	--[[love.graphics.draw(optionsOnOff, 0, 0, 0, 2.5, 2.5)--]]
	love.graphics.draw(optionsGamma, 430, 530, 0, 2.5, 2.5)
	love.graphics.draw(optionsPopUps, 430, 593, 0, 2.5, 2.5)
	love.graphics.draw(optionsBack, 0, 555, 0, 2.5, 2.5)
	love.graphics.draw(optionsSelect, 1050, 510, 0, 2.5, 2.5)
	love.graphics.draw(optionsOverlay, 0, 0, 0, 2.7, 2.7)
	love.graphics.draw(optionsShadow, 0, 350, 0, 2.7, 2.7)
end

function Module.keyreleased_my_Options(key)
  if (key == "return" and options_check_keyreleased == 1) then
    options_check_keyreleased = 0
  end
end


function Module.keypressed_my_options(key)
	if (key == Keybinds.up and options_pointeurY == 179) then
		options_pointeurX = 442
  	options_pointeurY = 179
  elseif (key == Keybinds.up and options_pointeurY == 247) then
  	options_pointeurX = 442
		options_pointeurY = 179
  elseif (key == Keybinds.up and options_pointeurY == 303) then
  	options_pointeurX = 390
  	options_pointeurY = 247
  elseif (key == Keybinds.up and options_pointeurY == 359) then
  	options_pointeurX = 390
  	options_pointeurY = 303
  elseif (key == Keybinds.up and options_pointeurY == 415) then
  	options_pointeurX = 367
  	options_pointeurY = 359
  elseif (key == Keybinds.up and options_pointeurY == 478) then
  	options_pointeurX = 367
  	options_pointeurY = 415
  elseif (key == Keybinds.up and options_pointeurY == 535) then
    options_pointeurX = 367
  	options_pointeurY = 478
  elseif (key == Keybinds.up and options_pointeurY == 597) then
  	options_pointeurX = 367
  	options_pointeurY = 535
  end

  if (key == Keybinds.down and options_pointeurY == 179) then
		options_pointeurX = 390
  	options_pointeurY = 247
  elseif (key == Keybinds.down and options_pointeurY == 247) then
  	options_pointeurX = 390
		options_pointeurY = 303
  elseif (key == Keybinds.down and options_pointeurY == 303) then
  	options_pointeurX = 357
  	options_pointeurY = 359
  elseif (key == Keybinds.down and options_pointeurY == 359) then
  	options_pointeurX = 367
  	options_pointeurY = 415
  elseif (key == Keybinds.down and options_pointeurY == 415) then
  	options_pointeurX = 367
  	options_pointeurY = 478
  elseif (key == Keybinds.down and options_pointeurY == 478) then
  	options_pointeurX = 380
  	options_pointeurY = 535
  elseif (key == Keybinds.down and options_pointeurY == 535) then
  	options_pointeurX = 380
  	options_pointeurY = 597
  elseif (key == Keybinds.down and options_pointeurY == 597) then
  	options_pointeurX = 380
  	options_pointeurY = 597
  end

  if (key == 'return' and options_pointeurY == 179 and options_check_keyreleased == 0) then
    gameState.options = false
    gameState.controls = true
  end

end

return Module