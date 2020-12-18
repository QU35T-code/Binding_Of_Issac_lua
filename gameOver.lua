local Module = {}

function Module.load_my_GameOver()
	GameOverDiary = love.graphics.newImage("assets/Scenes/GameOver/diary.png")
end

function Module.keypressed_my_GameOver(key)
end

function Module.draw_my_GameOver()
	love.graphics.draw(GameOverDiary, 400, 50, 0, 2.5, 2.5)
	love.graphics.draw(pauseCode, 190, 130, 0, 2.8, 2.8)
end

return Module