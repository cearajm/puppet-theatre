local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
-- local imagePlayer <const> = gfx.image.new(SpriteImage.player)
-- class("Player").extends(gfx.sprite)

class("Textbox").extends(gfx.sprite)

local textbox = nil
local currentLine = nil
local currentText = nil

function Textbox:init(text)

    Textbox.super.init(self, textbox)

    self.textbox = gfx.sprite.new()
    self.currentLine = 1
    self.currentText = nil


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
        "Do let me know if something interesting happens."
    }

    self.elevatorText = {
        "Still out of service..."
    }


    
    self.player = Player.instance
    self.isActive = false -- dialogue is running

    if text == "concierge" then
        self.currentText = self.text
    elseif text == "elevators" then
        self.currentText = self.elevatorText
    end

end

function Textbox:getSelectedText(text)
    if text == "concierge" then
        currentText = self.text
    elseif text == "elevators" then
        currentText = self.elevatorText
    end
end

-- << DIALOGUE >>
function Textbox:startDialogue(text)
    -- start dialogue and pause character movement
    self:addSprite()
    
    self:setVisible(true)
    self.isActive = true
    Player.instance:toggleMove()
end

function Textbox:endDialogue()
    -- hide textbox
    self:setVisible(false)
    self.isActive = false
    self:remove()
end

function Textbox:getNextLine()
    -- get next dialogue line to display
    if self.currentLine < #self.currentText then
        self.currentLine += 1
    else
        -- end when dialog has finished
        self:endDialogue()
        Player.instance:toggleMove()
        if self.currentText == self.text then
            self.currentText = self.text2
        elseif self.currentText == self.text2 then
            self.currentText = self.text3
            
        end
        
        self.currentLine = 1
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
        gfx.drawTextInRect(self.currentText[self.currentLine], 16, 16, 300, 160)

    gfx.popContext()
    
end



function Textbox:update()
    Textbox.super.update(self)

    self:draw()
end






