local Module = {}

function Module.load_my_Menu()
	MenuBackground = love.graphics.newImage("assets/Scenes/Menu/background.png")
	MenuPointeur = love.graphics.newImage("assets/Scenes/Menu/pointeur.png")
	MenuLabels = love.graphics.newImage("assets/Scenes/Menu/labels4.png")
	MenuResumeNot = love.graphics.newImage("assets/Scenes/Menu/resumeNot.png")
end

function Module.keyreleased_my_Menu(key)
	if (key == "return" and menu_check_keyreleased == 1) then
		menu_check_keyreleased = 0
	end
end


function Module.keypressed_my_Menu(key)
	
	if (key == Keybinds.up and menu_pointeurY == 177) then
	  	menu_pointeurY = 177
	elseif (key == Keybinds.up and menu_pointeurY == 345) then
		menu_pointeurY = 177
	elseif (key == Keybinds.up and menu_pointeurY == 436) then
		menu_pointeurY = 345
	elseif (key == Keybinds.up and menu_pointeurY == 530) then
		menu_pointeurY = 436
	end
	if (key == Keybinds.down and menu_pointeurY == 177) then
	    menu_pointeurY = 345
	elseif (key == Keybinds.down and menu_pointeurY == 345) then
		menu_pointeurY = 436
	elseif (key == Keybinds.down and menu_pointeurY == 436) then
		menu_pointeurY = 530
	elseif (key == Keybinds.down and menu_pointeurY == 530) then
		menu_pointeurY = 530
	end
  	if (key == 'return' and menu_pointeurY == 177 and menu_check_keyreleased == 0) then
	  	gameState.menu = false
	  	gameState.game = true
	elseif (key == 'return' and menu_pointeurY == 345 and menu_check_keyreleased == 0) then
		print("Not Up (Challenges)")
	elseif (key == 'return' and menu_pointeurY == 436 and menu_check_keyreleased == 0) then
		print("Not Up (Stats)")
	elseif (key == 'return' and menu_pointeurY == 530 and menu_check_keyreleased == 0) then
		print("Not Up (Options)")
	end
end

function Module.draw_my_Menu()
	love.graphics.draw(MenuBackground, 0, 0, 0, 2.7, 2.7)
	love.graphics.draw(MenuLabels, 500, 130, 0, 2.8, 2.8)
	love.graphics.draw(MenuPointeur, menu_pointeurX, menu_pointeurY, 0, 2.7, 2.7)
	love.graphics.draw(MenuResumeNot, 500, 210, 0, 2.8, 2.8)
end

return Module