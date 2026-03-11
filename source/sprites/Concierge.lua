local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
local imageConcierge <const> = gfx.image.new(SpriteImage.concierge)
class("Concierge").extends(gfx.sprite)

local startX = 250
local startY = 100

function Concierge:init()
    Concierge.super.init(self, imageConcierge)

    self:setScale(2)
    self:setCollideRect(4, 4, 45, 50)
    self:moveTo(startX, startY)

end

function Concierge:update()
    Concierge.super.update(self)
end