require("camera")
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

math.randomseed(os.time())
  board = {}          -- create the matrix
    for i=1,100 do    -- if change, change border control
      board [i] = {}     -- create a new row
      for j=1,100 do     -- if change, change border control
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
		grid_x = 1600,
		grid_y = 1600,
		act_x = 200,
		act_y = 200,
		speed = 10,
		}
		mouse={}

		love.keyboard.setKeyRepeat(0.001, 0)

		end

function love.update(dt)

player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)

camera:setPosition(player.grid_x - (love.graphics.getWidth()/2), player.grid_y - (love.graphics.getHeight()/2) )
  mouse.x, mouse.y = love.mouse.getPosition()
end

function love.draw()

  camera:set() -- DRAW EVERYTHING AFTER THIS

   for i=1,100 do
      for j=1,100 do
			  love.graphics.draw(Tileset, Quads[board[i][j]], (j-1)*TileW, (i-1)*TileH)
      end
    end
    for i=1,100 do
      for j=1,100 do
		      if board[i][j] == 9 then love.graphics.draw(ChasmTileset, Quads[9],(j-1)*TileW, (i-1)*TileH) end
      end
    end
--love.graphics.rectangle("fill", player.act_x, player.act_y, 32, 32)

		love.graphics.setColor(255, 255, 255)
		    love.graphics.print("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y, 0, 0)

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

end

function love.keyreleased (key, unicode)
end

function love.mousepressed (x, y, button) -- origin is top left, button r is right, l is left


end


function love.mousepressed (x,y, button)
end



function love.quit()
end
