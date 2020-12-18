local Module = {}

local workerFrame = {}
local frame_Width = 145
local frame_Height = 134
local total_Frames = 2

local currentFrame = 1
local animSpeed = 0.3
local TimePassed = 0


function Module.load_my_preMenu()
	preMenuBackground = love.graphics.newImage("assets/Scenes/PreMenu/background.png")
	preMenuLabel = love.graphics.newImage("assets/Scenes/PreMenu/label.png")
	preMenuCharacter = love.graphics.newImage("assets/Scenes/PreMenu/character.png")
	for frame = 1, total_Frames do
		workerFrame[frame] = love.graphics.newQuad((frame - 1) * frame_Width, 0, frame_Width, frame_Height, preMenuCharacter:getDimensions())
	end
end



function Module.keypressed_my_preMenu(key)
	if (key == 'return') then
		gameState.preMenu = false
		gameState.menu = true
	end
end

function Module.update_my_preMenu(dt)
	TimePassed = TimePassed + dt
	if TimePassed > animSpeed then
		TimePassed = TimePassed - animSpeed
		currentFrame = currentFrame % total_Frames + 1
	end
end

function Module.draw_my_preMenu()
	love.graphics.draw(preMenuBackground, 0, 0, 0, 2.7, 2.7)
	love.graphics.draw(preMenuCharacter, workerFrame[currentFrame], 450, 250, 0, 2.7, 2.7)
	love.graphics.draw(preMenuLabel, 30, 25, 0, 2.7, 2.7)
end

return Module