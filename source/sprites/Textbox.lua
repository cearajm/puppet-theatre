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

local currentBlock = 1

function Textbox:init(text)

    Textbox.super.init(self, textbox)

    self.textbox = gfx.sprite.new()


    self:setSize(380, 80)
    self:moveTo(200, 190)
    self:setZIndex(900)
    



    self.elevatorText1 = {
        "What floor?"
    }
    self.elevatorText2 = {
        "Still out of service..."
    }


    
    self.player = Player.instance
    self.isActive = false -- dialogue is running

    -- if text == "concierge" then
    --     self.currentText = self.text
    -- elseif text == "elevator1" then
    --     self.currentText = self.elevatorText2
    -- -- elseif text == "elevator2" then
    -- --     self.currentText = self.elevatorText2
    -- end
    self.currentText = text
    self.currentBlock = 1
    self.currentLine = 1
    self.isEnded = false

end

function Textbox:setText(text)
end

function Textbox:getSelectedText(text)
    if text == "concierge" then
        currentText = self.text
    elseif text == "elevator2" then
        currentText = self.elevatorText2
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

    -- advance dialogue on each interaction until the last line, then repeat that last line only
    if self.currentBlock < #self.currentText then
        self.currentBlock += 1
    end
    self.currentLine = 1
end

function Textbox:getNextLine()
    print(self.currentBlock, #self.currentText)

    -- get next dialogue line to display
    if self.currentLine < #self.currentText[self.currentBlock] then
        self.currentLine += 1
    else
        -- end when dialog has finished
        self:endDialogue()
        Player.instance:toggleMove()
        -- if self.currentText == self.text then
        --     self.currentText = self.text2
        -- elseif self.currentText == self.text2 then
        --     self.currentText = self.text3
            
        -- end
        
        -- self.currentLine = 1
    end


end


-- << TEXTBOX >>
function Textbox:draw()
    -- pushContext == draw only in this block
    gfx.pushContext()

        gfx.setColor(gfx.kColorWhite)
        gfx.fillRoundRect(0,0,380,80,10)

        gfx.setLineWidth(4)
        gfx.setColor(gfx.kColorBlack)
        gfx.drawRect(0,0,380,80)
        -- gfx.drawRoundRect(0,0,380,80,5)

        -- gfx.drawTextInRect(self.text[currentLine], 10, 10, 200, 160)
        gfx.drawTextInRect(self.currentText[self.currentBlock][self.currentLine], 16, 16, 300, 160)

    gfx.popContext()
    
end



function Textbox:update()
    Textbox.super.update(self)

    if isAButtonPressed then
        print(self.currentText)
    end
    self:draw()
end






