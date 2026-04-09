local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer


local area <const> = gfx.sprite.new()
class("Guy").extends(gfx.sprite)


-- local panels = myComicData

function Guy:init(string)
    Guy.super.init(self, area)

    self:setSize(8, 8)
    self:setCollideRect(0, 0, 8, 20)
    self:setCenter(0.5, 0.5)
	self:moveTo(330, 94)

    self.canInteract = true
    self.ringCount = 0
    self:setTag(1)
    self.string = string

    -- self.textbox = Textbox()
    -- self.textbox:addSprite()
    -- self.textbox:setVisible(false)

    local text = {
        {"hi puppy!!", "the lounge is under maintenance. you do NOT want to go in there", "so far like five people have gone in and haven't come out.",
        "no, i didn't warn them. i didn't think to do that until now..."},
        -- {"hey puppy, i got a stellar tip today!"}
        {"hi puppy :)"}
    }

    self.textbox = Textbox(text)
    self.textbox:setVisible(false)

end

function Guy:collisionResponse(other)
    
    return gfx.sprite.kCollisionTypeOverlap
end


function Guy:update()
    Guy.super.update(self)

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)

    local _, _, collisions, length = self:checkCollisions(self.x, self.y)
    if length == 0 then
        self.canInteract = false
    end

    for _, collision in pairs(collisions) do
        local other = collision.other
        self.canInteract = true
    end

    if self.string == "1" then
        print("1")
    elseif self.string == "2" then
        print("2")
    end
    if self.canInteract and isAButtonPressed then
        -- self.ringCount += 1
        -- print(self.ringCount)
        -- Panels.Settings.snapToPanels = true
        -- Panels.start(comicData)
        if self.string == "1" then
            if not self.textbox.isActive then
                self.textbox:startDialogue()
            else
                self.textbox:getNextLine()
            end
            self.textbox.currentBlock = 1
        else
            Panels.start(comicData)
        end



    end
end