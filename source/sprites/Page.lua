local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer


local area <const> = gfx.sprite.new()
class("Page").extends(gfx.sprite)


-- local panels = myComicData
local cutsceneHasPlayed = false

function Page:init()
    Page.super.init(self, area)

    self:setSize(12, 12)
    self:setCollideRect(0, 0, 12, 12)
    -- self:setCenter(0.5, 0.5)
	self:moveTo(164, 164)
    self:setTag(1)
    self:setCollidesWithGroups(2)

    
    -- stage interaction
    self.stage = gfx.sprite.new()
    self.stage:setSize(30, 50)
    self.stage:setCollideRect(0, 0, 30, 50)
    -- self.stage:setCenter(0.5, 0.5)
	self.stage:moveTo(220, 90)
    self.stage:setTag(1)
    self.stage:setCollidesWithGroups(2)
    
    local text = {
        -- {"hi puppy :)"},
        {"looks yummy. but no eating on the job."}
    }
    self.textbox = Textbox(text)
    self.textbox:setVisible(false)

    local stageText = {
        {"oh hey puppet. you have a song request for tonight?"}
    }
    self.stageTextbox = Textbox(stageText)
    self.stageTextbox:setVisible(false)
    
    self.canInteract = false
    self.canInteractStage = false

end


function Page:collisionResponse(other)
    -- if getmetatable(other).class == Player then
    -- end
    return gfx.sprite.kCollisionTypeOverlap
end


local playing = false
function Page:update()

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)

    -- collisions for both character and stage interactions
    local stage = self.stage
    local _, _, collisions, length = self:checkCollisions(self.x, self.y)
    local _, _, collisionsStage, lengthStage = self.stage:checkCollisions(stage.x, stage.y)

    -- table
    if length == 0 then
        self.canInteract = false
    end
    for _, collision in pairs(collisions) do
        local other = collision.other
        if getmetatable(other).class == Player then
            self.canInteract = true
        -- else
        --     self.canInteract = false
        end
        -- print(other)
    end

    -- stage
    if lengthStage == 0 then
        self.canInteractStage = false
    end
    for _, collision in pairs(collisionsStage) do
        local other = collision.other
        if getmetatable(other).class == Player then
            self.canInteractStage = true
        end
    end

    -- table
    if self.canInteract and isAButtonPressed then
        print("table")

            if not self.textbox.isActive and not cutsceneIsPlaying then
                self.textbox:startDialogue()
            else
                self.textbox:getNextLine()
            end
            self.textbox.currentBlock = 1
    end

    if isAButtonPressed then
        print("can interact: ", self.canInteract)
    end

    -- stage
    if self.canInteractStage and isAButtonPressed then
        print("stage")

        if not self.stageTextbox.isActive and not cutsceneIsPlaying then
            self.stageTextbox:startDialogue()
        else
            self.stageTextbox:getNextLine()
        end

        self.stageTextbox.currentBlock = 1
    end


end