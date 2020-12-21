local Module = {}
local CurrentRoom = {}
function Module.load_my_Rooms()
	CurrentRoom.Room = donjon.StartRoom
end

function Module.draw_my_Rooms()
	donjon.drawMapDonjon(CurrentRoom.Room)
end

return Module