local Module = {}

function Module.load_my_Menu()
	MenuBackground = love.graphics.newImage("assets/Scenes/Menu/background.png")
	MenuPointeur = love.graphics.newImage("assets/Scenes/Menu/pointeur.png")
	MenuLabels = love.graphics.newImage("assets/Scenes/Menu/labels.png")
end



function Module.keypressed_my_Menu(key)
end

function Module.draw_my_Menu()
	love.graphics.draw(MenuBackground, 0, 0, 0, 2.7, 2.7)
	love.graphics.draw(MenuPointeur, 200, 450, 250, 0, 2.7, 2.7)
	love.graphics.draw(MenuLabels, 30, 25, 0, 2.7, 2.7)
end

return Module