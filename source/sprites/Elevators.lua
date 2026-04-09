local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer
import "assets"
import "ElevatorRide"

local area <const> = gfx.sprite.new()
class("Elevators").extends(gfx.sprite)


local sfx_elevators = sfx.new(Audio.concierge)
-- elevatorRide = ElevatorRide()



function Elevators:init()
    Elevators.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 8, 8)
    self:setCenter(0.5, 0.5)
	self:moveTo(220, 80)
    self:setTag(1)

    self.elevator1 = gfx.sprite.new()
    self.elevator1:setSize(8, 8)
    self.elevator1:setCollideRect(0, 0, 8, 8)
    self.elevator1:setCenter(0.5, 0.5)
	self.elevator1:moveTo(172, 80)
    self.elevator1:setTag(1)
    self.gameScene = GameScene.instance


    -- set text for each interaction
    local leftElevatorText = {
        {"What floor?", "Just kidding. Guests only."},
        {"Guests only."}
    }
    local rightElevatorText = {
        {"This one is still out of service..."},
    }

    self.leftTextbox = Textbox(leftElevatorText)
    self.rightTextbox = Textbox(rightElevatorText)
    self.leftTextbox:setVisible(false)
    self.rightTextbox:setVisible(false)

end


function Elevators:collisionResponse(other)
    return gfx.sprite.kCollisionTypeOverlap
end


function Elevators:update()
    Elevators.super.update(self)

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)

    -- check collisions for each elevator button
    local elevatorLeft = self.elevator1
    local _, _, collisions, length = self:checkCollisions(self.x, self.y)
    local _, _, collisionsLeft, lengthLeft = self.elevator1:checkCollisions(elevatorLeft.x, elevatorLeft.y)

    if length == 0 then
        self.canInteract = false
    end
    if lengthLeft == 0 then
        self.canInteractLeft = false
    end

    for _, collision in pairs(collisions) do
        local other = collision.other
        self.canInteract = true
        print("hello")
    end
    for _, collision in pairs(collisionsLeft) do
        local other = collision.other
        self.canInteractLeft = true
    end

    -- start dialogue for right side elevator
    if self.canInteract and isAButtonPressed then
        sfx_elevators:play()
        if not self.rightTextbox.isActive then
            self.rightTextbox:startDialogue()
        else
            self.rightTextbox:getNextLine()

        end
    end

    -- start dialogue for left side elevator
    if self.canInteractLeft and isAButtonPressed then
        sfx_elevators:play()
        -- if not self.leftTextbox.isActive then
        --     self.leftTextbox:startDialogue()
        -- else
        --     self.leftTextbox:getNextLine()
        -- end
        print("asdfasdf")
        GameScene.instance:moveToRoom("west")
    end

end

