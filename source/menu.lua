local pd <const> = playdate
local gfx <const> = pd.graphics


gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))

local spriteTitle = gfx.sprite.new()
local spriteButton = gfx.sprite.spriteWithText("(A) enter", 400, 240)

local imageSpriteTitle = gfx.image.new(200, 120)

-- draw text on the image (centered)
-- push: save imageSpriteTitle as the current image to draw to, with draw functions
gfx.pushContext(imageSpriteTitle)
gfx.drawTextAligned("puppet theatre !!!", 100, 60, kTextAlignment.center)
gfx.popContext()  -- release image

 -- scale into a separate image and move
spriteTitle:setImage(imageSpriteTitle:scaledImage(1.6))
spriteTitle:moveTo(200, 80)
spriteButton:moveTo(200, 150)

spriteTitle:setZIndex(200)
spriteButton:setZIndex(200)


function showMenu()
    spriteTitle:add()
    spriteButton:add()
end

function hideMenu()
    spriteTitle:remove()
    spriteButton:remove()
end