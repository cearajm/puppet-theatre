local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
-- local imagePlayer <const> = gfx.image.new(SpriteImage.player)
-- class("Player").extends(gfx.sprite)

local textbox <const> = gfx.sprite.new()
class("Textbox").extends(gfx.sprite)

local currentLine = 1
local currentText = nil

function Textbox:init()

    Textbox.super.init(self, textbox)

    self:setSize(380, 80)
    self:moveTo(200, 190)
    self:setZIndex(900)
    
    -- index the table for each line of dialogue
    self.currentChar = 1
    -- self.text = {
    --     "well met",
    --     "how are you",
    --     "i fare thee well"
    -- }
    self.text = {
        "Puppet. Good evening to you.",
        "It's been a slow week, so I intend to slack off today.",
        "...",
        "You keep up the good work though."

    }

    self.text2 = {
        "Huh? I can only see the top of your head, Puppet.",
    }

    self.text3 = {
        "Let me know if something interesting happens."
    }


    
    self.player = Player.instance
    self.isActive = false -- dialogue is running

    currentText = self.text

end


-- << DIALOGUE >>
function Textbox:startDialogue()
    -- start dialogue and pause character movement
    self:setVisible(true)
    self.isActive = true
    self.player:toggleMove()
end

function Textbox:endDialogue()
    -- hide textbox
    self:setVisible(false)
    self.isActive = false
end

function Textbox:getNextLine()
    -- get next dialogue line to display
    if currentLine < #currentText then
        currentLine += 1
    else
        -- end when dialog has finished
        self:endDialogue()
        self.player:toggleMove()
        if currentText == self.text then
            currentText = self.text2
        elseif currentText == self.text2 then
            currentText = self.text3
        end
        currentLine = 1
    end
end


-- << TEXTBOX >>
function Textbox:draw()
    -- pushContext == draw only in this block
    gfx.pushContext()

        gfx.setColor(gfx.kColorWhite)
        gfx.fillRect(0,0,380,80)

        gfx.setLineWidth(4)
        gfx.setColor(gfx.kColorBlack)
        gfx.drawRect(0,0,380,80)

        -- gfx.drawTextInRect(self.text[currentLine], 10, 10, 200, 160)
        gfx.drawTextInRect(currentText[currentLine], 10, 10, 200, 160)

    gfx.popContext()
    
end



function Textbox:update()
    Textbox.super.update(self)

    self:draw()
end






