local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
-- local imagePlayer <const> = gfx.image.new(SpriteImage.player)
-- class("Player").extends(gfx.sprite)

local textbox <const> = gfx.sprite.new()
class("Textbox").extends(gfx.sprite)


function Textbox:init()

    Textbox.super.init(self, textbox)

    self:setSize(380, 80)
    self:moveTo(200, 190)
    self:setZIndex(900)
    self.text = "hello"
    self.currentChar = 1
    self.currentText = ""
    self.typing = true

end


function Textbox:update()
    Textbox.super.update(self)

    self:draw()
end


function Textbox:draw()

    -- pushContext == draw only in this block
    gfx.pushContext()

        gfx.setColor(gfx.kColorWhite)
        gfx.fillRect(0,0,380,80)

        gfx.setLineWidth(4)
        gfx.setColor(gfx.kColorBlack)
        gfx.drawRect(0,0,380,80)

        gfx.drawTextInRect(self.text, 10, 10, 200, 160)
        print("yo")

    gfx.popContext()
    
end



