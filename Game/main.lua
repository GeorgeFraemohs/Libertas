require("camera")
require("entity")
function love.load()
	 Tileset = love.graphics.newImage('assets/dirtset3.png')
	 TileW, TileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()

width = {}
width = love.graphics.getWidth()
height = {}
height = love.graphics.getHeight()
ChasmTileset = love.graphics.newImage('assets/chasm.png')
	 TileW2, TileH2 = 160,96
  local tilesetW2, tilesetH2 = ChasmTileset:getWidth(), ChasmTileset:getHeight()

RareTileset = love.graphics.newImage('assets/rare.png')
	 TileW, TileH = 32,32
	 local tilesetW3, tilesetH3 = RareTileset:getWidth(), RareTileset:getHeight()

	 BedTileset = love.graphics.newImage('assets/bed2.png')
	 	 TileW4, TileH4 = 160,96
	 	 local tilesetW4, tilesetH4 = BedTileset:getWidth(), BedTileset:getHeight()

	Cockroach = love.graphics.newImage('assets/cockroach.png')
 	Cockroachdown = love.graphics.newImage('assets/cockroachdown.png')
  Cockroachleft = love.graphics.newImage('assets/cockroachleft.png')
 	Cockroachright = love.graphics.newImage('assets/cockroachright.png')




math.randomseed(os.time())
  board = {}          -- create the matrix
    for i=1,100 do    -- 100 denotes the size of the map. If changed, border control will need to be changed.
      board [i] = {}     -- create a new row
      for j=1,100 do     -- 100 denotes the size of the map. If changed, border control will need to be changed.
        board[i][j] = math.random(1,8)

 if math.random(1,200) == 1 then
	 board[i][j] = math.random(10,13) end -- Rare Tile set is assigned here.
			end
    end

for i=1,100 do
  for j=1,100 do
		if math.random(1,30) == 1 and i % 3 == 0 and j % 5 == 0 and board[i][j] ~= -1 then -- i % 3 means blocks can only spawn when i is divisible by 3.
			for n=0,2 do -- -1 denotes empty blocks. Whenever a space needs to be reserved, use -1.
			 for m=0,4 do
				 if i+n<100 and j+m<100 then board[i+n][j+m] = -1
				 end
			 end
		 end
		 board[i][j] = 9
	 end
	end
end

    Quads = {}
Quads[1] = love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH) -- 1 = grass
Quads[2] = love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH) -- 2 = box
Quads[3] = love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH) -- 3 = flowers
Quads[4] = love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH) -- 4 = boxtop
Quads[5] = love.graphics.newQuad(64,   0, TileW, TileH, tilesetW, tilesetH) -- 1 = grass
Quads[6] = love.graphics.newQuad(96,  0, TileW, TileH, tilesetW, tilesetH) -- 2 = box
Quads[7] = love.graphics.newQuad(64,  32, TileW, TileH, tilesetW, tilesetH) -- 3 = flowers
Quads[8] = love.graphics.newQuad(96, 32, TileW, TileH, tilesetW, tilesetH) -- 4 = boxtop

Quads[9] = love.graphics.newQuad(0, 0, TileW2, TileH2, tilesetW2, tilesetH2) -- 5 = bedroom

Quads[10] = love.graphics.newQuad(0,   0, TileW, TileH, tilesetW3, tilesetH3) -- 1 = grass
Quads[11] = love.graphics.newQuad(32,  0, TileW, TileH, tilesetW3, tilesetH3) -- 2 = box
Quads[12] = love.graphics.newQuad(64,  0, TileW, TileH, tilesetW3, tilesetH3) -- 3 = flowers
Quads[13] = love.graphics.newQuad(96, 0, TileW, TileH, tilesetW3, tilesetH3) -- 4 = boxtop

Quads[15] = love.graphics.newQuad(0, 0, TileW4, TileH4, tilesetW4, tilesetH4) -- 4 = boxtop




	player = {
		grid_x = 1600,
		grid_y = 1600,
		act_x = 200,
		act_y = 200,
		speed = 10,
		}
		mouse={}

		mouse= {
			position_x = 0,
			position_y = 0,
		}

love.keyboard.setKeyRepeat(0.001, 0)
end

clickx = 1600
clicky = 1600

function love.update(dt)

mouse.x, mouse.y = love.mouse.getPosition()

mouse.position_x = player.grid_x - 720 + mouse.x -- this converts the player position into the origin of the screen, adding the pixel position of the mouse.
mouse.position_y = player.grid_y - 450 + mouse.y



player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)

camera:setPosition(player.grid_x - (love.graphics.getWidth()/2), player.grid_y - (love.graphics.getHeight()/2) )

if entity.x < mouse.position_x then
		entity.x = entity.x + 1
		entity.direction = 'right' elseif

entity.x > mouse.position_x then
		entity.x = entity.x - 1
		entity.direction = 'left' elseif

entity.y < mouse.position_y then
		entity.y = entity.y + 1
		entity.direction = 'down' elseif

entity.y > mouse.position_y then
		entity.y = entity.y - 1
		entity.direction = 'up'
end
end

function love.draw()

  camera:set() -- DRAW EVERYTHING AFTER THIS

	for i=1,100 do
		 for j=1,100 do
			  if board[i][j] < 9 and board[i][j] ~= -1 then love.graphics.draw(Tileset, Quads[board[i][j]], (j-1)*TileW, (i-1)*TileH)
					elseif
	 					board[i][j] > 9 and board[i][j] < 14 and board[i][j] ~= -1 then love.graphics.draw(RareTileset, Quads[board[i][j]], (j-1)*TileW, (i-1)*TileH)
						elseif
						board[i][j] == 9 then love.graphics.draw(ChasmTileset, Quads[board[i][j]], (j-1)*TileW, (i-1)*TileH)
				end
      end
    end



		love.graphics.setColor(255, 255, 255)
		    love.graphics.print("Mouse Coordinates: " .. mouse.position_x .. ", " ..mouse.position_y, player.grid_x-720, player.grid_y-450)



				if entity.direction == 'up' then love.graphics.draw(Cockroach, entity.x, entity.y)
				end
						if entity.direction == 'down' then love.graphics.draw(Cockroachdown, entity.x, entity.y)
						end
								if entity.direction == 'left' then love.graphics.draw(Cockroachleft, entity.x, entity.y)
								end
										if entity.direction == 'right' then love.graphics.draw(Cockroachright, entity.x, entity.y)
										end

if click == true then love.graphics.draw(BedTileset, mouse.position_x, mouse.position_y) end

  camera:unset()

end



function love.focus(bool) -- if you click out of the game, the game will 'unfocus' and may be used to pause the game if you tab out! (Bool)
end

function love.keypressed(key, unicode, isrepeat)

if key == "up" then
player.grid_y = player.grid_y - 32
if player.grid_y < height/2 then player.grid_y = height/2; end
end
if key == "down" then
player.grid_y = player.grid_y + 32
if player.grid_y > 3200 - (height/2) then player.grid_y = 3200 - (height/2); end
end
if key == "left" then
player.grid_x = player.grid_x - 32
if player.grid_x < width/2 then player.grid_x = width/2; end
end
if key == "right" then
player.grid_x = player.grid_x + 32
if player.grid_x > 3200 - (width/2) then player.grid_x = 3200 - (width/2); end
end

if key == 'escape' then
		love.event.push('quit')
end


end

function love.keyreleased (key, unicode)
end

function love.mousepressed (x, y, button) -- origin is top left, button r is right, l is left


	if button == 1 then
	click = true
	end
end

function love.mousereleased( x, y, button)
	if button == 1 then
	click = false
	end
end

function love.quit()
end
