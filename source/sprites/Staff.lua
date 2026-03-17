local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
-- local imageStaff <const> = gfx.image.new(SpriteImage.staff)
-- class("Staff").extends(gfx.sprite)

class("Staff").extends(AnimatedSprite)

local x = 300
local y = 60

local interactArea = nil
-- local textbox = Textbox()
local textbox = nil

-- local area <const> = gfx.sprite.new()

function Staff:init()
    -- Staff.super.init(self, imageStaff)

    -- self:setCollideRect(4, 4, 45, 50)
    -- self:moveTo(startX, startY)

    local staffImageTable = gfx.imagetable.new("assets/images/puppet-table-32-32")
    Staff.super.init(self, staffImageTable)

    self:addState("idle", 1, 1)
    self:playAnimation()

    self:setZIndex(90)
    self:setTag(2)
    self:setCollideRect(0,0,32,32)
    self:moveTo(x,y)

    interactArea = InteractArea(self)
    interactArea:setArea()
    -- interactArea:addSprite()
    textbox = Textbox()
    textbox:addSprite()
    textbox:setVisible(false)



    -- self:setCollideRect(3,3,10,13)

    -- set interaction collision area, to talk to the character
    -- area:setSize(0,0,32,32)
    -- area:setCollideRect(0,0,32,32)
    -- area:moveTo(x, y + 16)
    -- area:setZIndex(100)
    -- area.collisionResponse = kCollisionTypeOverlap
    -- area:addSprite()

end


function Staff:collisionResponse(other)
    return gfx.sprite.kCollisionTypeFreeze
    -- return gfx.sprite.kCollisionTypeOverlap
end


function Staff:update()
    Staff.super.update(self)

    self:updateAnimation()

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)

    if interactArea.canInteract and isAButtonPressed then
        if not textbox.isActive then
            textbox:startDialogue()
        else
            textbox:getNextLine()
        end
    end

    -- local _, _, collisions = self:checkCollisions(self.x, self.y)
    -- for _, collision in pairs(collisions) do 
    --     local other = collision.other
    --     if getmetatable(other).class == Player then
    --         print("collided")
    --     end
    -- end

end