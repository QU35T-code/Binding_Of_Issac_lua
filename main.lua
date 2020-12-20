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
local fileGameOver = require("gameOver")
local fileMenu = require("menu")
local fileOptions = require("options")
local filePlayerCreation = require("player_creation")

function love.load()
  screen_width = love.graphics.getWidth()
  screen_height = love.graphics.getHeight()
  init_my_game()
  filePreMenu.load_my_preMenu()
  fileMenu.load_my_Menu()
  filePause.load_my_pause()
  fileOptions.load_my_options()
  fileGameOver.load_my_GameOver()
  filePlayerCreation.create_my_Player("Unknown")
end

function init_my_game()
	gameState = {}
	gameState.preMenu = false
	gameState.menu = false
	gameState.pause = false
	gameState.options = false
	gameState.game = true
	gameState.gameOver = false
	pause_pointeurX = 570
	pause_pointeurY = 510
	menu_pointeurX = 455
	menu_pointeurY = 177
	options_pointeurX = 442
	options_pointeurY = 179
	menu_check_keyreleased = 1
end


function love.update(dt)
	filePreMenu.update_my_preMenu(dt)
	filePlayerCreation.update_my_Player(dt)

end

function love.draw()
	love.graphics.setBackgroundColor(1, 1, 1)
	if gameState.preMenu then
		filePreMenu.draw_my_preMenu()
	end
	if gameState.menu then
		fileMenu.draw_my_Menu()
	end
	if gameState.pause then
		filePause.draw_my_pause()		
	end
	if gameState.options then
		fileOptions.draw_my_options()		
	end
	if gameState.gameOver then
		fileGameOver.draw_my_GameOver()		
	end
	if gameState.game then
		filePlayerCreation.draw_my_Player()		
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
	if gameState.options then
		fileOptions.keypressed_my_options(key)		
	end
	if gameState.gameOver then
		fileGameOver.keypressed_my_GameOver(key)		
	end
end

function love.keyreleased(key)
	if gameState.menu then
		fileMenu.keyreleased_my_Menu(key)
	end
end