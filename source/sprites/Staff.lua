local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
-- local imageStaff <const> = gfx.image.new(SpriteImage.staff)
-- class("Staff").extends(gfx.sprite)

class("Staff").extends(AnimatedSprite)

local x = 200
local y = 44

local area <const> = gfx.sprite.new()

function Staff:init()
    -- Staff.super.init(self, imageStaff)

    -- self:setCollideRect(4, 4, 45, 50)
    -- self:moveTo(startX, startY)

    local staffImageTable = gfx.imagetable.new("assets/images/puppet-table-32-32")
    Staff.super.init(self, staffImageTable)

    self:addState("idle", 1, 1)
    self:playAnimation()

    self:moveTo(x,y)
    self:setZIndex(100)
    self:setTag(2)
    self:setCollideRect(0, 0, 32, 32)
    -- self:setCollideRect(3,3,10,13)

    -- set interaction collision area, to talk to the character
    -- area:setSize(0,0,32,32)
    -- area:setCollideRect(0,0,32,32)
    -- area:moveTo(x, y + 16)
    -- area:setZIndex(100)
    -- area.collisionResponse = kCollisionTypeOverlap
    -- area:addSprite()

end


function Staff:collisionResponse()
    -- return gfx.sprite.kCollisionTypeFreeze
    return gfx.sprite.kCollisionTypeOverlap
end


function Staff:update()
    Staff.super.update(self)

    self:updateAnimation()

end