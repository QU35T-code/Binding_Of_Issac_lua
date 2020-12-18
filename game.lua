local Module = {}

local workerFrame_avant = {}
local workerFrame_arriere = {}
local frame_Width = 32
local frame_Height = 37
local total_Frames = 6

local currentFrame = 1
local animSpeed = 0.25
local TimePassed = 0


function Module.load_my_Game()
	gameCharacter = {}
	POSITIONY = 350
	POSITIONX = 350
	vitesse = 1
	gameCharacter = love.graphics.newImage("assets/Scenes/Game/avant2.png")
	gameCharacter_arriere = love.graphics.newImage("assets/Scenes/Game/arriere.png")
	--[[preMenuLabel = love.graphics.newImage("assets/Scenes/PreMenu/label.png")
	preMenuCharacter = love.graphics.newImage("assets/Scenes/PreMenu/character.png")--]]
	for frame = 1, total_Frames do
		workerFrame_avant[frame] = love.graphics.newQuad((frame - 1) * frame_Width, 0, frame_Width, frame_Height, gameCharacter:getDimensions())
		workerFrame_arriere[frame] = love.graphics.newQuad((frame - 1) * frame_Width, 0, frame_Width, frame_Height, gameCharacter_arriere:getDimensions())

	end
end



function Module.keypressed_my_Game(key)
	if love.keyboard.isDown("z") then
		POSITIONY = POSITIONY - 10
	end	
end

function Module.update_my_Game(dt)
	TimePassed = TimePassed + dt
	if TimePassed > animSpeed then
		TimePassed = TimePassed - animSpeed
		currentFrame = currentFrame % total_Frames + 1
	end

	if love.keyboard.isDown("z") then
		POSITIONY = POSITIONY - vitesse
	end	
	if love.keyboard.isDown("s") then
		POSITIONY = POSITIONY + vitesse
	end	
	if love.keyboard.isDown("q") then
		POSITIONX = POSITIONX - vitesse
	end	
	if love.keyboard.isDown("d") then
		POSITIONX = POSITIONX + vitesse
	end	
end

function Module.draw_my_Game()
	love.graphics.draw(gameCharacter, workerFrame_avant[currentFrame], POSITIONX, POSITIONY, 0, 2.7, 2.7)
	love.graphics.draw(gameCharacter_arriere, workerFrame_arriere[currentFrame], 450, 250, 0, 2.7, 2.7)
	--[[love.graphics.draw(preMenuLabel, 30, 25, 0, 2.7, 2.7)--]]
end

return Module