local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
-- local imagePlayer <const> = gfx.image.new(SpriteImage.player)
-- class("Player").extends(gfx.sprite)
class("Player").extends(AnimatedSprite)

-- attributes
-- local startX = pd.display.getWidth()/2
-- local startY = pd.display.getHeight()/2

local velocity = 4
local x = 200
local y = 100

-- sfx players
local sfx_shoot = sfx.new(Audio.shoot)


function Player:init(gameManager)


    local playerImageTable = gfx.imagetable.new("assets/images/puppet-table-64-64")
    Player.super.init(self, playerImageTable)

    Player.instance = self

    self:addState("idle", 1, 1)
    self:addState("run", 1, 3, {tickStep = 4})
    self:playAnimation()

    -- sprite properties
    -- self:setScale(2)
    self:moveTo(x, y)
    self:setZIndex(100)
    self:setTag(1)
    self:setCollideRect(14, 54, 36, 12)
    -- self:setCollideRect(3, 3, 10, 13)

    self.canMove = true
    self.gameManager = gameManager

end

function Player:toggleMove()
    -- toggle to false if the player runs out of ammo
    if self.canMove then
        self.canMove = false
    else
        self.canMove = true
    end
end

function Player:mirror()
    self:moveTo(400, self.y)
end

function Player:collisionResponse(other)
    -- return gfx.sprite.kCollisionTypeFreeze
    -- if getmetatable(other).class == Staff then
    --     return gfx.sprite.kCollisionTypeFreeze
    -- else
    --     return gfx.sprite.kCollisionTypeOverlap
    -- end
    if getmetatable(other).class == Concierge or getmetatable(other).class == Bell or other:getTag() == 1 then
        return gfx.sprite.kCollisionTypeOverlap
    else
        return gfx.sprite.kCollisionTypeFreeze
    end
end

-- function Player:handleState()
--     if self.currentState == "idle" then
        
--     end

function Player:handleMovementAndCollisions()
    local _, _, collisions, length = self:moveWithCollisions(self.x, self.y)

    for _, collision in pairs(collisions) do
        local other = collision.other
    end
end


function Player:update()
    Player.super.update(self)

    self:updateAnimation()
    -- self:handleState()
    self:handleMovementAndCollisions()

    if self.canMove then
        if pd.buttonIsPressed(pd.kButtonUp) then
            self:moveBy(0, -velocity)
        end
        if pd.buttonIsPressed(pd.kButtonDown) then
            self:moveBy(0, velocity)
        end
        if pd.buttonIsPressed(pd.kButtonLeft) then
            self:moveBy(-velocity, 0)
        end
        if pd.buttonIsPressed(pd.kButtonRight) then
            self:moveBy(velocity, 0)
        end
    
        if pd.buttonJustPressed(pd.kButtonB) then
            sfx_shoot:play()
        end
    end


end
