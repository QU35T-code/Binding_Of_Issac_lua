local Module = {}

local workerFrame_global = {}
workerFrame_global.tete_up = {}
workerFrame_global.tete_down = {}
workerFrame_global.tete_left = {}
workerFrame_global.tete_right = {}

-- Body Variable
workerFrame_global.body_up = {}
workerFrame_global.body_side = {}
workerFrame_global.body_side_rev = {}

local state = {}
state.head_up = false
state.head_down = false
state.head_left = false
state.head_right = false

-- Body State
state.body_up = false
state.body_down = false
state.body_left = false
state.body_right = false
state.body_idle_front = true
state.body_idle_side = false
state.body_idle_side_rev = false

local animation_head_settings = {}
animation_head_settings.frameWidth = 32
animation_head_settings.frameHeight = 28
animation_head_settings.totalFrames = 1
animation_head_settings.currentFrame = 1


-- Variables Animation Body

local animation_body_settings = {}
animation_body_settings.frameWidth = 18
animation_body_settings.frameHeight = 15
animation_body_settings.totalFrames = 10
animation_body_settings.currentFrame = 1
animation_body_settings.speed = 0.07
animation_body_settings.timePassed = 0

local bulletsList = {}

-- Player Stats

playerStats = {}
playerStats.table = {}

-- Cadence de tir variables

countSecond = 0
canShoot = true

-- Reset and Set Head State

function reset_status()
	state.head_up = false
	state.head_down = false
	state.head_left = false
	state.head_right = false
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

-- Reset and Set Body State

function reset_status_body()
	state.body_up = false
	state.body_down = false
	state.body_left = false
	state.body_right = false
	state.body_idle_front = false
	state.body_idle_side = false
	state.body_idle_side_rev = false
end

function state_attribute_body(value)
	reset_status_body()
	if (value == 1) then
		state.body_up = true
	elseif (value == 2) then
		state.body_down = true
	elseif (value == 3) then
		state.body_left = true
	elseif (value == 4) then
		state.body_right = true
	elseif (value == 5) then
		state.body_idle_front = true
	elseif (value == 6) then
		state.body_idle_side = true
	elseif (value == 7) then
		state.body_idle_side_rev = true
	end
end


function Module.create_my_Player(player_name)
	-- Parser file Stats
	for line in love.filesystem.lines("assets/Players/".. player_name .. "/stats.json") do
		for name, data in line:gmatch("(.-):(.*)") do
			playerStats.table[name] = data
		end
	end

	-- Set parsed values (file)
	playerStats.tearsSpeed = playerStats.table["tearsSpeed"]
	playerStats.moveSpeed = playerStats.table["moveSpeed"]
	playerStats.tearsScope = playerStats.table["tearsScope"]
	playerStats.tearsScope = tonumber(playerStats.tearsScope)
	playerStats.rate = playerStats.table["rate"]
	playerStats.damage = playerStats.table["damage"]
	playerStats.luck = playerStats.table["luck"]
	shootDelay = tonumber(playerStats.rate)


	-- Load and setup my character
	gameCharacter = {}
	gameCharacter.y = 350
	gameCharacter.x = 350
	gameCharacter.vx = 0
	gameCharacter.vy = 0
	gameCharacter.speed = playerStats.moveSpeed


	-- Load Images
	gameCharacter.head_down = love.graphics.newImage("assets/Players/".. player_name .. "/down.png")
	gameCharacter.head_left = love.graphics.newImage("assets/Players/".. player_name .. "/left.png")
	gameCharacter.head_up = love.graphics.newImage("assets/Players/".. player_name .. "/up.png")
	gameCharacter.head_right = love.graphics.newImage("assets/Players/".. player_name .. "/right.png")
	gameCharacter.walk = love.graphics.newImage("assets/Players/".. player_name .. "/walk.png")
	gameCharacter.direction = love.graphics.newImage("assets/Players/".. player_name .. "/direction.png")
	gameCharacter.direction_rev = love.graphics.newImage("assets/Players/".. player_name .. "/direction_rev.png")

	-- Load Tears
	gameCharacter.tears = love.graphics.newImage("assets/Game/tears.png")

	-- Load Head Player on table
	for frame = 1, animation_head_settings.totalFrames do
		workerFrame_global.tete_up[frame] = love.graphics.newQuad((frame - 1) * animation_head_settings.frameWidth, 0, animation_head_settings.frameWidth, animation_head_settings.frameHeight, gameCharacter.head_up:getDimensions())
		workerFrame_global.tete_down[frame] = love.graphics.newQuad((frame - 1) * animation_head_settings.frameWidth, 0, animation_head_settings.frameWidth, animation_head_settings.frameHeight, gameCharacter.head_down:getDimensions())
		workerFrame_global.tete_left[frame] = love.graphics.newQuad((frame - 1) * animation_head_settings.frameWidth, 0, animation_head_settings.frameWidth, animation_head_settings.frameHeight, gameCharacter.head_left:getDimensions())
		workerFrame_global.tete_right[frame] = love.graphics.newQuad((frame - 1) * animation_head_settings.frameWidth, 0, animation_head_settings.frameWidth, animation_head_settings.frameHeight, gameCharacter.head_right:getDimensions())
	end

	-- Load Body Player on table
	for frame_body = 1, animation_body_settings.totalFrames do
		workerFrame_global.body_up[frame_body] = love.graphics.newQuad((frame_body - 1) * animation_body_settings.frameWidth, 0, animation_body_settings.frameWidth, animation_body_settings.frameHeight, gameCharacter.walk:getDimensions())
		workerFrame_global.body_side[frame_body] = love.graphics.newQuad((frame_body - 1) * animation_body_settings.frameWidth, 0, animation_body_settings.frameWidth, animation_body_settings.frameHeight, gameCharacter.direction:getDimensions())
		workerFrame_global.body_side_rev[frame_body] = love.graphics.newQuad((frame_body - 1) * animation_body_settings.frameWidth, 0, animation_body_settings.frameWidth, animation_body_settings.frameHeight, gameCharacter.direction_rev:getDimensions())
	end
end

function distance ( x1, y1, x2, y2 )
  local dx = x1 - x2
  local dy = y1 - y2
  return math.sqrt ( dx * dx + dy * dy )
end

function movement_animation(dt)
	if (state.body_up) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == Keybinds.up) then
				state_attribute_body(5)
			end
		end
	end
	if (state.body_down) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == Keybinds.down) then
				state_attribute_body(5)
			end
		end
	end
	if (state.body_left) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == Keybinds.left) then
				state_attribute_body(7)
			end
		end
	end
	if (state.body_right) then
		timePassed(dt)
		function love.keyreleased(key)
			if (key == Keybinds.right) then
				state_attribute_body(6)
			end
		end
	end
end

function timePassed(dt)
	animation_body_settings.timePassed = animation_body_settings.timePassed + dt
	if animation_body_settings.timePassed > animation_body_settings.speed then
		animation_body_settings.timePassed = animation_body_settings.timePassed - animation_body_settings.speed
		animation_body_settings.currentFrame = animation_body_settings.currentFrame % animation_body_settings.totalFrames + 1
	end
end

function Module.update_my_Player(dt)
	gameCharacter.vx = gameCharacter.vx * .9
	gameCharacter.vy = gameCharacter.vy * .9
	if math.abs(gameCharacter.vx) < 0.01 then gameCharacter.vx = 0 end
	if math.abs(gameCharacter.vy) < 0.01 then gameCharacter.vy = 0 end

	gameCharacter.x = gameCharacter.x + gameCharacter.vx
	gameCharacter.y = gameCharacter.y + gameCharacter.vy

	movement_animation(dt)
	if love.keyboard.isDown(Keybinds.up) then
		gameCharacter.vy = gameCharacter.vy - gameCharacter.speed / 6
		state.body_up = true
		state.body_idle_front = false
		state_attribute_body(1)
	end	
	if love.keyboard.isDown(Keybinds.down) then
		gameCharacter.vy = gameCharacter.vy + gameCharacter.speed / 6
		state.body_down = true
		state.body_idle_front = false
		state_attribute_body(2)
	end	
	if love.keyboard.isDown(Keybinds.left) then
		gameCharacter.vx = gameCharacter.vx - gameCharacter.speed / 6
		state.body_left = true
		state_attribute_body(3)
	end	
	if love.keyboard.isDown(Keybinds.right) then
		gameCharacter.vx = gameCharacter.vx + gameCharacter.speed / 6
		state.body_right = true
		state_attribute_body(4)
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

	-- Bullets
	for bulletId, bullets in ipairs(bulletsList) do
    	bullets.x = bullets.x + bullets.speed * math.cos(bullets.direction) * dt
    	bullets.y = bullets.y + bullets.speed * math.sin(bullets.direction) * dt

    	-- Portée des larmes
	  	bullets.distance = distance(bullets.position_startX, bullets.position_startY, bullets.x, bullets.y)
	  	if (bullets.distance > playerStats.tearsScope) then
	  		table.remove(bulletsList, bulletId)
	  	end
  	end

  	-- Cadence de tir
 	countSecond = countSecond + 1 * dt
 	if countSecond > shootDelay then
  		canShoot = true
  		countSecond = 0
	end
end

function Module.draw_my_Player()
	-- Bullets
	for bulletId, bullets in ipairs(bulletsList) do
   		love.graphics.circle('line', bullets.x + 48, bullets.y + 45, bullets.r)
    	love.graphics.draw(gameCharacter.tears, bullets.x + 65, bullets.y + 45, bullets.r)
  	end

  	-- Direction Player
	if (state.body_up or state.body_down) then
		love.graphics.draw(gameCharacter.walk, workerFrame_global.body_up[animation_body_settings.currentFrame], gameCharacter.x + 14, gameCharacter.y + 53, 0, 2.7, 2.7)
	end

	if (state.body_right) then
		love.graphics.draw(gameCharacter.direction, workerFrame_global.body_side[animation_body_settings.currentFrame], gameCharacter.x + 14, gameCharacter.y + 53, 0, 2.7, 2.7)
	end

	if (state.body_left) then
		love.graphics.draw(gameCharacter.direction_rev, workerFrame_global.body_side[animation_body_settings.currentFrame], gameCharacter.x + 14, gameCharacter.y + 53, 0, 2.7, 2.7)
	end

	if (state.body_idle_front) then
		love.graphics.draw(gameCharacter.walk, workerFrame_global.body_up[1], gameCharacter.x + 14, gameCharacter.y + 53, 0, 2.7, 2.7)
	end

	if (state.body_idle_side) then
		love.graphics.draw(gameCharacter.walk, workerFrame_global.body_up[1], gameCharacter.x + 14, gameCharacter.y + 53, 0, 2.7, 2.7)
	end
	if (state.body_idle_side_rev) then
		love.graphics.draw(gameCharacter.walk, workerFrame_global.body_up[1], gameCharacter.x + 14, gameCharacter.y + 53, 0, 2.7, 2.7)
	end

  	-- Head Player
	if (state.head_up) then
		love.graphics.draw(gameCharacter.head_up, workerFrame_global.tete_up[1], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
	if (state.head_down) then
		love.graphics.draw(gameCharacter.head_down, workerFrame_global.tete_down[1], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
	if (state.head_left) then
		love.graphics.draw(gameCharacter.head_left, workerFrame_global.tete_left[1], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
	if (state.head_right) then
		love.graphics.draw(gameCharacter.head_right, workerFrame_global.tete_right[1], gameCharacter.x, gameCharacter.y, 0, 2.7, 2.7)
	end
end

-- Bullets Shoot

function shoot(x, y)
	bullets = {}
  	bullets.w = 30
  	bullets.h = 30
  	bullets.r = 15
  	bullets.x = gameCharacter.x - bullets.w/2
  	bullets.position_startX = gameCharacter.x - bullets.w/2
  	bullets.y = gameCharacter.y - bullets.h/2
  	bullets.position_startY = gameCharacter.y - bullets.h/2
  	bullets.speed = playerStats.tearsSpeed * 300
  	bullets.direction = math.atan2(y - gameCharacter.y, x - gameCharacter.x)
  	bullets.distance = 0
  	table.insert(bulletsList, bullets)

end

function Module.player_mousepressed(x, y, button)
  if (button == 1 and canShoot) then
    shoot(x, y)
    canShoot = false
  end
end

return Module