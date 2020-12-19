local Module = {}

local workerFrame_global = {}
workerFrame_global.tete_up = {}
workerFrame_global.tete_down = {}
workerFrame_global.tete_left = {}
workerFrame_global.tete_right = {}

local state = {}
state.head_up = false
state.head_down = false
state.head_left = false
state.head_right = false

local animation_settings = {}
animation_settings.frameWidth = 32
animation_settings.frameHeight = 28
animation_settings.totalFrames = 1
animation_settings.currentFrame = 1
animation_settings.speed = 0.1
animation_settings.timePassed = 0


function reset_status()
	state.head_up = false
	state.head_down = false
	state.head_left = false
	state.head_right = false
end


function Module.load_my_Player()
	-- Load and setup my character
	gameCharacter = {}
	gameCharacter.y = 350
	gameCharacter.x = 350
	gameCharacter.speed = 1
	gameCharacter.head_down = love.graphics.newImage("assets/Players/Issac/down.png")
	gameCharacter.head_left = love.graphics.newImage("assets/Players/Issac/left.png")
	gameCharacter.head_up = love.graphics.newImage("assets/Players/Issac/up.png")
	gameCharacter.head_right = love.graphics.newImage("assets/Players/Issac/right.png")

	-- Load Head Character on table
	for frame = 1, animation_settings.totalFrames do
		workerFrame_global.tete_up[frame] = love.graphics.newQuad((frame - 1) * animation_settings.frameWidth, 0, animation_settings.frameWidth, animation_settings.frameHeight, gameCharacter.head_up:getDimensions())
		workerFrame_global.tete_down[frame] = love.graphics.newQuad((frame - 1) * animation_settings.frameWidth, 0, animation_settings.frameWidth, animation_settings.frameHeight, gameCharacter.head_down:getDimensions())
		workerFrame_global.tete_left[frame] = love.graphics.newQuad((frame - 1) * animation_settings.frameWidth, 0, animation_settings.frameWidth, animation_settings.frameHeight, gameCharacter.head_left:getDimensions())
		workerFrame_global.tete_right[frame] = love.graphics.newQuad((frame - 1) * animation_settings.frameWidth, 0, animation_settings.frameWidth, animation_settings.frameHeight, gameCharacter.head_right:getDimensions())
	end
end


function Module.keyreleased_my_Player(key)
	--[[if (key == 'z') then
		state.head_up = false
	end
	if (key == 's') then
		state.head_down = false
	end
	if (key == 'q') then
		state.head_left = false
	end
	if (key == 'd') then
		state.head_right = false
	end--]]
end

function Module.keypressed_my_Player(key)
	--[[if love.keyboard.isDown("z") then
		state_attribute(1)
	elseif love.keyboard.isDown("s") then
		state_attribute(2)
	elseif love.keyboard.isDown("q") then
		state_attribute(3)
	elseif love.keyboard.isDown("d") then
		state_attribute(4)
	end
	if (key == 'm') then
		user_angle = math.pi/2 + math.atan2(mouse_y - gameCharacter.y, mouse_x - gameCharacter.x)
		print(user_angle)
	end--]]
end

function movement(dt)
	if (state.head_up) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == 'z') then
				state_attribute(1)
			end
		end
	end
	if (state.head_down) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == 's') then
				state_attribute(2)
			end
		end
	end
	if (state.head_left) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == 'q') then
				state_attribute(3)
			end
		end
	end
	if (state.head_right) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == 'd') then
				state_attribute(4)
			end
		end
	end
end

function timePassed(dt)
	animation_settings.timePassed = animation_settings.timePassed + dt
	if animation_settings.timePassed > animation_settings.speed then
		animation_settings.timePassed = animation_settings.timePassed - animation_settings.speed
		animation_settings.currentFrame = animation_settings.currentFrame % animation_settings.totalFrames + 1
	end
end

function Module.update_my_Player(dt)
	movement(dt)
	if love.keyboard.isDown("z") then
		gameCharacter.y = gameCharacter.y - gameCharacter.speed
	end	
	if love.keyboard.isDown("s") then
		gameCharacter.y = gameCharacter.y + gameCharacter.speed
	end	
	if love.keyboard.isDown("q") then
		gameCharacter.x = gameCharacter.x - gameCharacter.speed
	end	
	if love.keyboard.isDown("d") then
		gameCharacter.x = gameCharacter.x + gameCharacter.speed
	end

	-- Mouse direction Head Player
	mouse_x = love.mouse.getX()
	mouse_y = love.mouse.getY()
	user_angle = math.pi/2 + math.atan2(mouse_y - gameCharacter.y, mouse_x - gameCharacter.x)

	if (user_angle > -1 and user_angle < 1) then
		state_attribute(1)
	elseif (user_angle > 1 and user_angle < 2.08) then
		state_attribute(4)
	elseif (user_angle > 2.08 and user_angle < 3.78) then
		state_attribute(2)
	else
		state_attribute(3)
	end
end

function state_attribute(value)
	reset_status()
	if (value == 1) then
		state.head_up = true
	elseif (value == 2) then
		state.head_down = true
	elseif (value == 3) then
		state.head_left = true
	elseif (value == 4) then
		state.head_right = true
	end
end


function Module.draw_my_Player()
	if (state.head_up) then
		love.graphics.draw(gameCharacter.head_up, workerFrame_global.tete_up[animation_settings.currentFrame], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
	if (state.head_down) then
		love.graphics.draw(gameCharacter.head_down, workerFrame_global.tete_down[animation_settings.currentFrame], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
	if (state.head_left) then
		love.graphics.draw(gameCharacter.head_left, workerFrame_global.tete_left[animation_settings.currentFrame], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
	if (state.head_right) then
		love.graphics.draw(gameCharacter.head_right, workerFrame_global.tete_right[animation_settings.currentFrame], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
end


return Module