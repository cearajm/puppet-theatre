local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer


local area <const> = gfx.sprite.new()
class("Window").extends(gfx.sprite)


-- local panels = myComicData

function Window:init()
    Window.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 200, 12)
    self:setCenter(0.5, 0.5)
	self:moveTo(42, 76)

    self.canInteract = false
    self.ringCount = 0
    self:setTag(1)


    local text = {
        -- {"hi puppy :)"},
        {"A sprawling mountain range, obscured by an impenetrable abyss of dense fog.",
        "Somehow, you can't seem to recall what lies beyond the hotel's grounds ...",
        "... don't think about that. It's not important anymore."}
    }

    self.textbox = Textbox(text)
    self.textbox:setVisible(false)

end

function Window:collisionResponse(other)
    
    return gfx.sprite.kCollisionTypeOverlap
end


local playing = false
function Window:update()
    -- Window.super.update(self)

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


        print("window")
        -- startCutScene()

        if not self.textbox.isActive then
            self.textbox:startDialogue()
        else
            self.textbox:getNextLine()
        end
        self.textbox.currentBlock = 1
        
    end
    -- print(cutsceneIsPlaying)

    -- if cutsceneIsPlaying then
    --     print("playing")
    --     Panels.update()
    --     pd.timer.updateTimers()
    -- end

end