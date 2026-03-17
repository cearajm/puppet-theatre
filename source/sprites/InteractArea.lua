local pd <const> = playdate
local gfx <const> = pd.graphics


local area <const> = gfx.sprite.new()
class("InteractArea").extends(gfx.sprite)


-- entity == sprite that this area belongs to
function InteractArea:init(entity)

    InteractArea.super.init(self, area)

    -- local width, height = entity.getSize() / 2

    -- to position the collision area directly below the entity,
    -- move by only half the width and height. because entity coords is centered, but self is at corner
    local width = entity.width / 2
    local height = entity.height / 2
    self:setCollideRect(0, 0, 32, 32)
    self:setCenter(entity.x, entity.y)
    self:moveTo(entity.x - width, entity.y + height)

    self.canInteract = false
    

end


function InteractArea:setArea()
    self:addSprite()
end


function InteractArea:collisionResponse(other)
    return gfx.sprite.kCollisionTypeOverlap
end


function InteractArea:update()

    local _, _, collisions, length = self:checkCollisions(self.x, self.y)

    if length == 0 then
        self.canInteract = false
    end

    for _, collision in pairs(collisions) do
        local other = collision.other
        -- if collision == true then
        -- if length == 0 then
        --     self.canInteract = false
        -- else
        --     self.canInteract = true
        -- end
        self.canInteract = true

        -- if getmetatable(other).class == Player then
        --     self.canInteract = true
        --     print(self.canInteract)
        -- end
    end
    -- print(self.canInteract)

end

