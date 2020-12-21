local Module = {}
local CurrentRoom = {}
ListDoors = {}

function create_Door(pType, pX, pY, pWidth, pHeight)
	print("New door : " .. pType)
	local newDoor = {}

	newDoor.x = pX
	newDoor.y = pY
	newDoor.Width = pWidth
	newDoor.Height = pHeight

	return newDoor
end

function prepare_my_Room(pRoom)
	ListDoors = {}
	local largeur_tuile = 10
	local hauteur_tuile = 20

	if pRoom.Up_Door then
		local door = create_Door("Up_Door", (screen_width / 2) - largeur_tuile, 0, largeur_tuile * 2, hauteur_tuile * 2)
		table.insert(ListDoors, door)
	end
	if pRoom.Down_Door then
		local door = create_Door("Down_Door", (screen_width / 2) - largeur_tuile, screen_height - (hauteur_tuile * 2), largeur_tuile * 2, hauteur_tuile * 2)
		table.insert(ListDoors, door)
	end
	if pRoom.Left_Door then
		local door = create_Door("Left_Door", 0, (screen_height / 2) - hauteur_tuile, largeur_tuile * 2, hauteur_tuile * 2)
		table.insert(ListDoors, door)
	end
	if pRoom.Right_Door then
		local door = create_Door("Right_Door", screen_width - (largeur_tuile * 2), (screen_height / 2) - hauteur_tuile, largeur_tuile * 2, hauteur_tuile * 2)
		table.insert(ListDoors, door)
	end
	CurrentRoom.Room = pRoom
end

function Module.load_my_Rooms()
	prepare_my_Room(donjon.StartRoom)
end

function Module.draw_my_Rooms()
	donjon.drawMapDonjon(CurrentRoom.Room)
	for nDoor = 1, #ListDoors do
		local p = ListDoors[nDoor]
		love.graphics.rectangle("line", p.x, p.y, p.Width, p.Height)
	end
end

return Module