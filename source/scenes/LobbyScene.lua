local pd <const> = playdate
local gfx <const> = pd.graphics

-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- !!! Rename 'SceneTemplate' to your scene's name in these first three lines. !!!
-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

import "../assets"
import "../sprites"

LobbyScene = {}
class("LobbyScene").extends(NobleScene)


local scene = LobbyScene
local concierge = Concierge()
local bell = Bell()


-- local staff = Staff(300, 60)
scene.backgroundColor = Graphics.kColorWhite


-- create game scene: display sprites
function scene:init(__sceneProperties)
	scene.super.init(self)

	-- create map sprite, and add player sprite
	GameScene()
	self:addSprite(concierge)
	self:addSprite(bell)
	



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
	
	Graphics.drawTextAligned("hii", 200, 120, kTextAlignment.center)

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
	cranked = function(change, acceleratedChange)	-- Runs when the crank is rotated. See Playdate SDK documentation for details.
		-- Your code here
	end,
	crankDocked = function()						-- Runs once when when crank is docked.
		-- Your code here
	end,
	crankUndocked = function()						-- Runs once when when crank is undocked.
		-- Your code here
	end
}