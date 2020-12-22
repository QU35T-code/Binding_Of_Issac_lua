local Module = {}
local CurrentRoom = {}
ListDoors = {}

function collide_Door(pX, pY)
	for n = 1, #ListDoors do
		local c = ListDoors[n]

		if (pX > c.x and pX < c.x + c.Width and pY > c.y and pY < c.y + c.Height) then
			return c.type
		end
	end
	return ""
end

function create_Door(pType, pX, pY, pRotation)
	local newDoor = {}

	newDoor.x = pX
	newDoor.y = pY
	newDoor.Width = 122.5
	newDoor.Height = 82.5
	newDoor.type = pType
	newDoor.Rotation = pRotation

	return newDoor
end

function prepare_my_Room(pRoom)
	ListDoors = {}
	largeur_tuile = 50
	hauteur_tuile = 40

	if pRoom.Up_Door then
		local door = create_Door("Up_Door", (screen_width / 2) - largeur_tuile, 0, 0)
		table.insert(ListDoors, door)
	end
	if pRoom.Down_Door then
		local door = create_Door("Down_Door", (screen_width / 2) - largeur_tuile, screen_height - (hauteur_tuile * 2), -3.14159)
		table.insert(ListDoors, door)
	end
	if pRoom.Left_Door then
		local door = create_Door("Left_Door", 0, (screen_height / 2) - hauteur_tuile, -1.5708)
		table.insert(ListDoors, door)
	end
	if pRoom.Right_Door then
		local door = create_Door("Right_Door", screen_width - (largeur_tuile * 2), (screen_height / 2) - hauteur_tuile, 1.5708)
		table.insert(ListDoors, door)
	end
	CurrentRoom.Room = pRoom
end

function Module.load_my_Rooms()
	doorSprite = love.graphics.newImage("assets/Game/Map/door.png")
	prepare_my_Room(donjon.StartRoom)
end

function Module.update_my_Rooms(dt)
	local typeDoor = collide_Door(gameCharacter.x, gameCharacter.y)
	if (typeDoor ~= "") then
		print("Collision avec : " .. typeDoor)
		local newRoom = nil
		local newX, newY
		if (typeDoor == "Up_Door") then
			newRoom = donjon.map[CurrentRoom.Room.line - 1][CurrentRoom.Room.column]
			newX = gameCharacter.x
			newY = screen_height - (hauteur_tuile * 2) - 30
		elseif (typeDoor == "Down_Door") then
			newRoom = donjon.map[CurrentRoom.Room.line + 1][CurrentRoom.Room.column]
			newX = gameCharacter.x
			newY = 0 + (hauteur_tuile * 2) + 50
		elseif (typeDoor == "Left_Door") then
			newRoom = donjon.map[CurrentRoom.Room.line][CurrentRoom.Room.column - 1]
			newX = screen_width - (largeur_tuile * 2) - 30
			newY = gameCharacter.y
		elseif (typeDoor == "Right_Door") then
			newRoom = donjon.map[CurrentRoom.Room.line][CurrentRoom.Room.column + 1]
			newX = 0 + (largeur_tuile * 2) + 30
			newY = gameCharacter.y
		end
		if newRoom ~= nil then
			prepare_my_Room(newRoom)
			gameCharacter.x = newX
			gameCharacter.y = newY
		end
	end
end

function Module.draw_my_Rooms()
	donjon.drawMapDonjon(CurrentRoom.Room)
	for nDoor = 1, #ListDoors do
		local p = ListDoors[nDoor]
		love.graphics.draw(doorSprite, p.x, p.y, p.Rotation, 2.5, 2.5)
	end
end

return Module