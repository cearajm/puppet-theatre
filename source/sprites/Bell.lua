local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer


local area <const> = gfx.sprite.new()
class("Bell").extends(gfx.sprite)


-- local sfx_bell = sfx.new(Audio.bell2)
local sfx_bell = sfx.new(Audio.bell)
-- local panels = myComicData

function Bell:init()
    Bell.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 8, 8)
    self:setCenter(0.5, 0.5)
	self:moveTo(270, 124)

    self.canInteract = true
    self.ringCount = 0

    -- self.textbox = Textbox()
    -- self.textbox:addSprite()
    -- self.textbox:setVisible(false)

end

function Bell:collisionResponse(other)
    
    return gfx.sprite.kCollisionTypeOverlap
end


function Bell:update()
    Bell.super.update(self)

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)

    local _, _, collisions, length = self:checkCollisions(self.x, self.y)
    if length == 0 then
        self.canInteract = false
    end

    for _, collision in pairs(collisions) do
        local other = collision.other
        self.canInteract = true
    end

    if self.canInteract and isAButtonPressed then
        sfx_bell:play()
        self.ringCount += 1
        print(self.ringCount)
        -- Panels.Settings.snapToPanels = true
        -- Panels.start(comicData)
        
    end
end