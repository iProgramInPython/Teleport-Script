local the_world = ""
local pos_x = 0
local pos_y = 0

function Teleport(x, y)
  local start_x = 21
  local start_y = 23

  if (x > start_x) then
     for i = start_x, x do
       FindPath(i * 32, start_y * 32)
     end
  elseif (x < start_x) then
     for i = start_x, x, -1 do
       FindPath(i * 32, start_y * 32)
     end
  end

  if (y > start_y) then
     for i = start_y, y do
       FindPath(x * 32, i * 32)
     end
  elseif (y < start_y) then
     for i = start_y, y, -1 do
       FindPath(x * 32, i * 32)
     end
  end
end

function Warp(world_name)
  SendPacket(3, "action|join_request\nname|" .. world_name .. "\ninvitedWorld|0")
end

function Quit()
  SendPacket(3, "action|quit_to_exit")
end

Warp(the_world)
Sleep(500)
Quit()
Sleep(100)
Quit()
Teleport(pos_x, pos_y)
