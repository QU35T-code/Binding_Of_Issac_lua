local Module = {}

local donjon = {}
donjon.nbLines = 6
donjon.nbColumn = 9
donjon.map = {}
donjon.StartRoom = nil
display_doors = false


function Create_Room(line, column)
	local newRoom = {}
	newRoom.line = line
	newRoom.column = column
	newRoom.isOpen = false
	newRoom.Up_Door = false
	newRoom.Down_Door = false
	newRoom.Left_Door = false
	newRoom.Right_Door = false

	return newRoom
end

function Generate_donjon()
	donjon.map = {}
	for line = 1, donjon.nbLines do
		donjon.map[line] = {}
		for column = 1, donjon.nbColumn do
			donjon.map[line][column] = Create_Room(line, column)
		end
	end

	local RoomList = {}
	local nbRooms = 20

	local start_x = love.math.random(1, donjon.nbLines)
	local start_y = love.math.random(1, donjon.nbColumn)
	local StartRoomObj = donjon.map[start_x][start_y]
	StartRoomObj.isOpen = true
	table.insert(RoomList, StartRoomObj)
	donjon.StartRoom = StartRoomObj

	while (#RoomList < nbRooms) do
		local nRoom = love.math.random(1, #RoomList)
		local lineRoom = RoomList[nRoom].line
		local ColumnRoom = RoomList[nRoom].column
		local Room = RoomList[nRoom]
		local newRoom = nil

		local direction = love.math.random(1, 4)
		local AddRoom = false

		if (direction == 1 and lineRoom > 1) then
			newRoom = donjon.map[lineRoom - 1][ColumnRoom]
			if (newRoom.isOpen == false) then
				Room.Up_Door = true
				newRoom.Down_Door = true
				AddRoom = true
			end
		elseif (direction == 2 and ColumnRoom < donjon.nbColumn) then
			newRoom = donjon.map[lineRoom][ColumnRoom + 1]
			if (newRoom.isOpen == false) then
				Room.Right_Door = true
				newRoom.Left_Door = true
				AddRoom = true
			end
		elseif (direction == 3 and lineRoom < donjon.nbLines) then
			newRoom = donjon.map[lineRoom + 1][ColumnRoom]
			if (newRoom.isOpen == false) then
				Room.Down_Door = true
				newRoom.Up_Door = true
				AddRoom = true
			end
		elseif (direction == 4 and ColumnRoom > 1) then
			newRoom = donjon.map[lineRoom][ColumnRoom - 1]
			if (newRoom.isOpen == false) then
				Room.Left_Door = true
				newRoom.Right_Door = true
				AddRoom = true
			end
		end

		if AddRoom then
			newRoom.isOpen = true
			table.insert(RoomList, newRoom)
		end
	end
end


function Module.load_my_Map()
	Generate_donjon()
end

function Module.keypressed_my_Map(key)
	if (key == 'space') then
		Generate_donjon()
	end
	if (key == 'h') then
		display_doors = true
	end
	if (key == 'l') then
		display_doors = false
	end
end

function Module.draw_my_Map()
	local x = 5
	local y = 5
	local Case_Width = 34
	local Case_Height = 13
	local Space_between = 5

	for line = 1, donjon.nbLines do
		x = 5
		for column = 1, donjon.nbColumn do
			local Room = donjon.map[line][column]
			if Room.isOpen == false then
				love.graphics.setColor(0.5, 0.5, 0.5)
				love.graphics.rectangle("fill", x, y, Case_Width, Case_Height)
			else
				if (donjon.StartRoom == Room) then
					love.graphics.setColor(0, 1, 0)
				else
					love.graphics.setColor(1, 1, 1)
				end
				love.graphics.rectangle("fill", x, y, Case_Width, Case_Height)
				if (display_doors) then
					love.graphics.setColor(1, 0, 0)
					if Room.Up_Door then
						love.graphics.rectangle("fill", (x + Case_Width / 2) - 2, y - 2, 4, 6)
					end
					if Room.Down_Door then
						love.graphics.rectangle("fill", (x + Case_Width / 2) - 2, (y + Case_Height) - 2, 4, 6)
					end
					if Room.Left_Door then
						love.graphics.rectangle("fill", (x - 2), (y + Case_Height/2) - 2, 6, 4)
					end
					if Room.Right_Door then
						love.graphics.rectangle("fill", (x + Case_Width) - 2, (y + Case_Height/2) - 2, 6, 4)
					end
				end
			end
			x = x + Case_Width + Space_between
		end
		y = y + Case_Height + Space_between
	end
end

return Module