local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer



local area <const> = gfx.sprite.new()
class("Concierge").extends(gfx.sprite)


local sfx_dialogue = sfx.new(Audio.concierge)
local cutsceneHasPlayed = false
local resultText = nil



function Concierge:init()
    Concierge.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 8, 8)
    self:setCenter(0.5, 0.5)
	self:moveTo(200, 124)
    self:setCollidesWithGroups(2)

    

    self.canInteract = true

    -- set concierge dialogue
    local text = {
        {"Puppet. Good evening to you.",
        "It's been a slow week, so I intend to slack off today.",
        "...",
        "... ...",
        "... ... ...",
        "You keep up the good work though."},
        {"Huh? I can only see the top of your head, Puppet."},
        -- {"Do let me know if something interesting happens."}
        {"Come see me after you've finished your rounds today."}
    }

    local goodText = {
        {"Very good, Puppet. You are truly the heart of this hotel.",
        "In fact, we staff have prepared a gift for you. To show our gratitude."}
    }
    local badText = {
        {"Is that so...? I see.",
        "You must be feeling unwell.",
        "Take a break downstairs. I will take care of everything else today.",}
    }

    self.textbox = Textbox(text)
    self.goodTextbox = Textbox(goodText)
    self.badTextbox = Textbox(badText)
    self.textbox:setVisible(false)
    self.goodTextbox:setVisible(false)
    self.badTextbox:setVisible(false)

    self.currentTextbox = self.textbox
    
end


function Concierge:collisionResponse(other)
    return gfx.sprite.kCollisionTypeOverlap
end


function Concierge:update()
    Concierge.super.update(self)
    -- print(cutsceneIsPlaying)

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
        -- set dialogue to display: before vs after cutscene
        -- scenesFound = 2
        if scenesFound < 2 then
            self.currentTextbox = self.textbox

        -- play cutscene when all comics have been found
        elseif scenesFound == 2 then
            if not cutsceneHasPlayed then
                startCutScene(conciergeCutscene)
                cutsceneHasPlayed = true
                isEndSequence = true
            end
        end

        if not cutsceneIsPlaying then
            -- after cutscene, set textbox based on the selected choices
            if cutsceneHasPlayed then
                local result = Panels.vars.garden + Panels.vars.garden + Panels.vars.garden
                if result < 3 then
                    self.currentTextbox = self.badTextbox
                elseif result == 3 then
                    self.currentTextbox = self.goodTextbox
                end
            end
            -- show textbox
            if not self.currentTextbox.isActive then
                self.currentTextbox:startDialogue()
            else
                self.currentTextbox:getNextLine()
            end
        end

    end

end