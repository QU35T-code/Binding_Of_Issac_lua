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
local fileMonsterCreation = require("monster_creation")
local fileOptionsControls = require("controls")
local fileGenerateMap = require("generate_map")
local fileRooms = require("rooms")

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
  fileMonsterCreation.load_my_Monster("oeil", 5)
  fileOptionsControls.load_my_Controls()
  fileGenerateMap.load_my_Map()
  fileRooms.load_my_Rooms()
end

function init_my_game()
	gameState = {}
	gameState.preMenu = false
	gameState.menu = false
	gameState.pause = false
	gameState.options = false
	gameState.game = true
	gameState.gameOver = false
	gameState.controls = false
	gameState.map = false
	pause_pointeurX = 570
	pause_pointeurY = 510
	menu_pointeurX = 455
	menu_pointeurY = 177
	options_pointeurX = 442
	options_pointeurY = 179
	menu_check_keyreleased = 1
	options_check_keyreleased = 1
	controls_check_keyreleased = 1
end


function love.update(dt)
	if gameState.preMenu then
		filePreMenu.update_my_preMenu(dt)
	end
	if gameState.game then
		filePlayerCreation.update_my_Player(dt)
		fileMonsterCreation.update_my_Monster(dt)
	end
	if gameState.controls then
		fileOptionsControls.update_my_Controls()
	end

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
	if gameState.options then
		fileOptions.draw_my_options()		
	end
	if gameState.gameOver then
		fileGameOver.draw_my_GameOver()		
	end
	if gameState.game then
		filePlayerCreation.draw_my_Player()
		love.graphics.print("Vitesse larmes : " .. playerStats.tearsSpeed, 0, 130)
		love.graphics.print("Portée larmes : " .. playerStats.tearsScope, 0, 140)
		love.graphics.print("Vitesse déplacement : " .. playerStats.moveSpeed, 0, 150)
		love.graphics.print("Cadence de tir : " .. playerStats.rate, 0, 160)
		love.graphics.print("Dégâts : " .. playerStats.damage, 0, 170)
		love.graphics.print("Chance : " .. playerStats.luck, 0, 180)
		fileMonsterCreation.draw_my_Monster()
		--[[fileGenerateMap.draw_my_Map()--]]
		fileRooms.draw_my_Rooms()
	end
	if gameState.controls then
		fileOptionsControls.draw_my_Controls()
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
	if gameState.controls then
		fileOptionsControls.keypressed_my_Controls(key)
	end
	if (key == 'm') then
		print("----------------")
		print(menu_check_keyreleased)
		print(options_check_keyreleased)
		print(controls_check_keyreleased)
		print("----------------")

	end
	if gameState.game then
		fileGenerateMap.keypressed_my_Map(key)
	end
end

function love.keyreleased(key)
	if gameState.menu then
		fileMenu.keyreleased_my_Menu(key)
	end
	if gameState.options then
		fileOptions.keyreleased_my_Options(key)
	end
	if gameState.controls then
		fileOptionsControls.keyreleased_my_Controls(key)
	end
end

function love.mousepressed(x, y, button)
	if gameState.game then
		filePlayerCreation.player_mousepressed(x, y, button)
	end
	if gameState.controls then
		fileOptionsControls.controls_mousepressed(x, y, button)
	end
end