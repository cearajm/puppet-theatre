local pd <const> = playdate
local gfx <const> = pd.graphics
local ldtk <const> = LDtk


-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- !!! Rename 'SceneTemplate' to your scene's name in these first three lines. !!!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

import "../assets"
import "../sprites"
import "ElevatorRide"

LobbyScene = {}
class("LobbyScene").extends(NobleScene)


local scene = LobbyScene
local isInElevator = false
-- local concierge = Concierge()
-- local bell = Bell()
player = Player()
gameScene = GameScene(player)
local currentLevel = "Elevators"



-- local staff = Staff(300, 60)
scene.backgroundColor = Graphics.kColorWhite

function scene:setValues()
	self.currentLevel = nil
end
-- create game scene: display sprites
function scene:init(__sceneProperties)
	scene.super.init(self)

	-- gameScene:loadLevel("LobbyScene")
	gameScene:loadLevel("LobbyScene")
	-- player:addSprite()
	player:moveTo(200, 160)

end


function scene:enter()
	scene.super.enter(self)

end

-- This runs once a transition from another scene is complete.
-- Use this method to begin this scene's game logic.
function scene:start()
	scene.super.start(self)

end

-- This runs once per frame.
function scene:update()
	scene.super.update(self)
	gameScene:update()
	currentLevel = gameScene.currentLevel
	-- print("from main: ", currentLevel)
		


	
	-- move to new room and teleport player to the opposite
	local posx, posy = player:getPosition()
    if posx <= 0 then
        player:moveWithCollisions(400, player.y)
        GameScene.instance:moveToRoom("west")
    elseif posx >= 400 then
        player:moveWithCollisions(0, player.y)
        GameScene.instance:moveToRoom("east")
	elseif posy <=0 then
		player:moveWithCollisions(player.x, 240)
		GameScene.instance:moveToRoom("north")
	elseif posy >= 240 then
		player:moveWithCollisions(player.x, 0)
		GameScene.instance:moveToRoom("south")
    end


end








-- This runs once per frame, and is meant for drawing code.
function scene:drawBackground()
	scene.super.drawBackground(self)

end

-- This runs as as soon as a transition to another scene begins.
function scene:exit()
	scene.super.exit(self)
	-- Your code here
end

-- This runs once a transition to another scene completes.
function scene:finish()
	scene.super.finish(self)
	-- Your code here
end

function scene:pause()
	scene.super.pause(self)
	-- Your code here
end
function scene:resume()
	scene.super.resume(self)
	-- Your code here
end

-- Define the inputHandler for this scene here, or use a previously defined inputHandler.

-- scene.inputHandler = someOtherInputHandler
-- OR
scene.inputHandler = {

	-- A button
	--
	AButtonDown = function()			-- Runs once when button is pressed.
	
	end,
	AButtonHold = function()			-- Runs every frame while the player is holding button down.
		-- Your code here
	end,
	AButtonHeld = function()			-- Runs after button is held for 1 second.
		-- Your code here
	end,
	AButtonUp = function()				-- Runs once when button is released.
		-- Your code here
	end,

	-- B button
	--
	BButtonDown = function()
		-- lobby:remove()
		-- elevators:show()
	end,
	BButtonHeld = function()
		-- Your code here
	end,
	BButtonHold = function()
		-- Your code here
	end,
	BButtonUp = function()
		-- Your code here
	end,

	-- D-pad left
	--
	leftButtonDown = function()
		-- Your code here
	end,
	leftButtonHold = function()
		-- Your code here
	end,
	leftButtonUp = function()
		-- Your code here
	end,

	-- D-pad right
	--
	rightButtonDown = function()
		-- Your code here
	end,
	rightButtonHold = function()
		-- Your code here
	end,
	rightButtonUp = function()
		-- Your code here
	end,

	-- D-pad up
	--
	upButtonDown = function()
		-- Your code here
	end,
	upButtonHold = function()
		-- Your code here
	end,
	upButtonUp = function()
		-- Your code here
	end,

	-- D-pad down
	--
	downButtonDown = function()
		-- Your code here
	end,
	downButtonHold = function()
		-- Your code here
	end,
	downButtonUp = function()
		-- Your code here
	end,

	-- Crank
	--
	-- cranked = function(change, acceleratedChange)	-- Runs when the crank is rotated. See Playdate SDK documentation for details.
	-- 	-- Your code here
	-- end,
	-- crankDocked = function()						-- Runs once when when crank is docked.
	-- 	-- Your code here
	-- end,
	-- crankUndocked = function()						-- Runs once when when crank is undocked.
	-- 	-- Your code here
	-- end
}