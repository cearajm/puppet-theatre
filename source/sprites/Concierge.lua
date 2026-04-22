local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer



local area <const> = gfx.sprite.new()
class("Concierge").extends(gfx.sprite)


local sfx_dialogue = sfx.new(Audio.concierge)
cutsceneHasPlayed = false


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
        {"Do let me know if something interesting happens."}
    }

    self.textbox = Textbox(text)
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
        if not cutsceneHasPlayed then
            startCutScene(conciergeCutscene)
            cutsceneHasPlayed = true
        else
            sfx_dialogue:play()
            if not self.textbox.isActive and not cutsceneIsPlaying then
                self.textbox:startDialogue()
            else
                self.textbox:getNextLine()
            end
        end
    end
end