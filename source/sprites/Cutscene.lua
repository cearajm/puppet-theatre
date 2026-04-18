local pd <const> = playdate
local gfx <const> = pd.graphics


local area <const> = gfx.sprite.new()
class("Cutscene").extends(gfx.sprite)



function Cutscene:init()
    Cutscene.super.init(self, area)
    
    self:setSize(8, 8)
    self:setCollideRect(0, 0, 8, 8)
    self:setCenter(0.5, 0.5)
	self:moveTo(200, 142)

    self.canInteract = true
    self:setTag(1)

end


function Cutscene:collisionResponse(other)
    return gfx.sprite.kCollisionTypeOverlap
end

function Cutscene:start()
    Panels.start(comicData)
end
function Cutscene:update()
    Cutscene.super.update(self)

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
        print("cutscene start")
        -- Panels.Settings.snapToPanels = true
        -- self:start(comicData)
        
    end
end