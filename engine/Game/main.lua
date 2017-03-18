require("camera")
function love.load()
	 Tileset = love.graphics.newImage('dirtset3.png')
	 TileW, TileH = 32,32
  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  
BedTileset = love.graphics.newImage('bed2.png')
	 TileW2, TileH2 = 160,96
  local tilesetW2, tilesetH2 = BedTileset:getWidth(), BedTileset:getHeight()

math.randomseed(os.time())
  board = {}          -- create the matrix
    for i=1,100 do
      board [i] = {}     -- create a new row
      for j=1,100 do
        board[i][j] = math.random(1,8)
        	      if math.random(1,20) == 1 and i % 3 == 0 and j % 5 == 0 then
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



	player = {
		grid_x = 256,
		grid_y = 256,
		act_x = 200,
		act_y = 200,
		speed = 10,
	}
		
	
end

function love.update(dt)

player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)

	
	
end

function love.draw()   
   for i=1,100 do
      for j=1,100 do
			  love.graphics.draw(Tileset, Quads[board[i][j]], (j-1)*TileW, (i-1)*TileH)
      end
    end   
    for i=1,100 do
      for j=1,100 do
		      if board[i][j] == 9 then love.graphics.draw(BedTileset, Quads[9],(j-1)*TileW, (i-1)*TileH) end
      end
    end 
    
    love.graphics.rectangle("fill", player.act_x, player.act_y, 32, 32)
    
   

      
end


function love.focus(bool) -- if you click out of the game, the game will 'unfocus' and may be used to pause the game if you tab out! (Bool)	
end

function love.keypressed(key, unicode)
	if key == "up" then
		player.grid_y = player.grid_y - 32
	elseif key == "down" then
		player.grid_y = player.grid_y + 32
	elseif key == "left" then
		player.grid_x = player.grid_x - 32
	elseif key == "right" then
		player.grid_x = player.grid_x + 32
	end
	
		if key == "up" then
		camera:move(0, 32)
	elseif key == "down" then
		camera:move(0, -32)
	elseif key == "left" then
		camera:move(-32, 0)
	elseif key == "right" then
		camera:move(32, 0)
	end

end

function love.keyreleased (key, unicode)
end

function love.mousepressed (x, y, button) -- origin is top left, button r is right, l is left
if button == l then
local tempx = x/32
local tempy = y/32
board[tempy][tempx] = 5
end

end


function love.mousepressed (x,y, button)
end



function love.quit()
end