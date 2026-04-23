local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer


local area <const> = gfx.sprite.new()
class("Maid").extends(gfx.sprite)


-- local panels = myComicData
local cutsceneHasPlayed = false

function Maid:init()
    Maid.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 112, 30)
    self:setCenter(0.5, 0.5)
	self:moveTo(86, 150)

    self.canInteract = false
    self.ringCount = 0
    self:setTag(1)
    self:setCollidesWithGroups(2)




    local text = {
        -- {"hi puppy :)"},
        {"(the guest is always right, or something like that...)",

        }
    }
    self.textbox = Textbox(text)
    self.textbox:setVisible(false)

end


function Maid:collisionResponse(other)
    return gfx.sprite.kCollisionTypeOverlap
end


local playing = false
function Maid:update()

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)
    local _, _, collisions, length = self:checkCollisions(self.x, self.y)
    if length == 0 then
        self.canInteract = false
    end

    for _, collision in pairs(collisions) do
        local other = collision.other
        if getmetatable(other).class == Player then
            self.canInteract = true
        end
    end

    if self.canInteract and isAButtonPressed then
        print("maid")
        if not cutsceneHasPlayed then
            startCutScene(maidCutscene)
            cutsceneHasPlayed = true
            scenesFound += 1
        else
            if not self.textbox.isActive and not cutsceneIsPlaying then
                self.textbox:startDialogue()
            else
                self.textbox:getNextLine()
            end
            self.textbox.currentBlock = 1
        end
    end


end