local Module = {}

local workerFrame_global = {}
local animation_body_settings = {}
animation_body_settings.frameWidth = 32
animation_body_settings.frameHeight = 27
animation_body_settings.totalFrames = 12
animation_body_settings.currentFrame = 1
animation_body_settings.speed = 0.07
animation_body_settings.timePassed = 0

local monsterList = {}

function Module.load_my_Monster(monster_name, nb_monsters)
	
  for i = 1, nb_monsters do
    create_Monster(monster_name, nb_monsters)
  end
end

function Module.update_my_Monster(dt)
  	for monsterId, monster in ipairs(monsterList) do
      monster.direction = math.atan2(gameCharacter.y + 20 - monster.y, gameCharacter.x + 13 - monster.x)
    	monster.velocityX = monster.speed * math.cos(monster.direction)
    	monster.velocityY = monster.speed * math.sin(monster.direction)
    	monster.x = monster.x + monster.velocityX * dt
    	monster.y = monster.y + monster.velocityY * dt
	end
end

function create_Monster(monster_name)
	  monsters = {}
    monsters.sprite = love.graphics.newImage("assets/Monsters/" .. monster_name .. "/oeil.png")
  	monsters.w = 32
  	monsters.h = 27
  	monsters.x = love.math.random(200, 500)
    monsters.y = love.math.random(200, 500)
    monsters.speed = 100

    for frame = 1, animation_body_settings.totalFrames do
      workerFrame_global[frame] = love.graphics.newQuad((frame - 1) * animation_body_settings.frameWidth, 0, animation_body_settings.frameWidth, animation_body_settings.frameHeight, monsters.sprite:getDimensions())
    end
  	table.insert(monsterList, monsters)
end


function Module.draw_my_Monster()
  for monsterId, monster in ipairs(monsterList) do
    if (monster.direction < 2.023311772243 and monster.direction > 1.2443128800841) then
	   love.graphics.draw(monster.sprite, workerFrame_global[1], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < 2.6765831114849 and monster.direction > 2.023311772243) then
     love.graphics.draw(monster.sprite, workerFrame_global[2], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < 3.0896802227184 and monster.direction > 2.6765831114849) then 
     love.graphics.draw(monster.sprite, workerFrame_global[3], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < 3.5 and monster.direction > 3.0896802227184) then
     love.graphics.draw(monster.sprite, workerFrame_global[4], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < -2.6495838568831 and monster.direction > -3.5) then
     love.graphics.draw(monster.sprite, workerFrame_global[5], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < -2.0558020199477 and monster.direction > -2.6495838568831) then
     love.graphics.draw(monster.sprite, workerFrame_global[6], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < -1.0836449093804 and monster.direction > -2.0558020199477) then
     love.graphics.draw(monster.sprite, workerFrame_global[7], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < -0.32706258942494 and monster.direction > -1.0836449093804) then
     love.graphics.draw(monster.sprite, workerFrame_global[8], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < -0.29693104325035 and monster.direction > -0.32706258942494) then
     love.graphics.draw(monster.sprite, workerFrame_global[9], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < 0.086057118287715 and monster.direction > -0.29693104325035) then
     love.graphics.draw(monster.sprite, workerFrame_global[10], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < 0.88417475546512 and monster.direction > 0.086057118287715) then
     love.graphics.draw(monster.sprite, workerFrame_global[11], monster.x, monster.y, 0, 2, 2)
    elseif (monster.direction < 1.3986359610875 and monster.direction > 0.88417475546512) then
     love.graphics.draw(monster.sprite, workerFrame_global[12], monster.x, monster.y, 0, 2, 2)
    else
     love.graphics.draw(monster.sprite, workerFrame_global[1], monster.x, monster.y, 0, 2, 2)
    end
  end
end

return Module