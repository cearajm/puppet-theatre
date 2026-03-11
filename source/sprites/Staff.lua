local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
local imageStaff <const> = gfx.image.new(SpriteImage.staff)
class("Staff").extends(gfx.sprite)

local startX = 50
local startY = 100

function Staff:init()
    Staff.super.init(self, imageStaff)

    self:setCollideRect(4, 4, 45, 50)
    self:moveTo(startX, startY)

end

function Staff:update()
    Staff.super.update(self)
end