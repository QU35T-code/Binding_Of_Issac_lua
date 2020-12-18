-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end
require("config")

-- ------------------------------------------------ -- 

local filePause = require("pause")
local filePreMenu = require("preMenu")
local fileMenu = require("menu")

function love.load()
  screen_width = love.graphics.getWidth()
  screen_height = love.graphics.getHeight()
  init_my_game()
  filePreMenu.load_my_preMenu()
  fileMenu.load_my_Menu()
  filePause.load_my_pause()
end

function init_my_game()
	gameState = {}
	gameState.preMenu = true
	gameState.menu = false
	gameState.pause = false
	gameState.options = false
	gameState.game = false
	gameState.gameOver = false
	pause_pointeurX = 570
	pause_pointeurY = 510
	menu_pointeurX = 455
	menu_pointeurY = 177
	menu_check_keyreleased = 1
end


function love.update(dt)
	filePreMenu.update_my_preMenu(dt)

end

function love.draw()
	if gameState.preMenu then
		filePreMenu.draw_my_preMenu()
	end
	if gameState.menu then
		fileMenu.draw_my_Menu()
	end
	if gameState.pause then
		filePause.draw_my_pause()		
	end
    
end

function love.keypressed(key)
	if gameState.preMenu then
		filePreMenu.keypressed_my_preMenu(key)
	end
	if gameState.menu then
		fileMenu.keypressed_my_Menu(key)
	end
	if gameState.pause then
		filePause.keypressed_my_pause(key)
	end
end

function love.keyreleased(key)
	if gameState.menu then
		fileMenu.keyreleased_my_Menu(key)
	end
end