local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer



local area <const> = gfx.sprite.new()
class("Concierge").extends(gfx.sprite)


local sfx_dialogue = sfx.new(Audio.concierge)

function Concierge:init()
    Concierge.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 8, 8)
    self:setCenter(0.5, 0.5)
	self:moveTo(200, 124)

    self.canInteract = true

    self.textbox = Textbox()
    self.textbox:addSprite()
    self.textbox:setVisible(false)

end

function Concierge:collisionResponse(other)
    
    return gfx.sprite.kCollisionTypeOverlap
end


function Concierge:update()
    Concierge.super.update(self)

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
        print("ok")
        sfx_dialogue:play()
        if not self.textbox.isActive then
            self.textbox:startDialogue()
        else
            self.textbox:getNextLine()
        end
    end
end