local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer

-- player class
local imagePlayer <const> = gfx.image.new(SpriteImage.player)
class("Player").extends(gfx.sprite)

-- attributes
-- local startX = pd.display.getWidth()/2
-- local startY = pd.display.getHeight()/2
local startX = 200
local startY = 100
local velocity = 4

-- sfx players
local sfx_shoot = sfx.new(Audio.shoot)


function Player:init()
    Player.super.init(self, imagePlayer)

    self:setScale(2)
    self:setCollideRect(4, 4, 45, 50)
    self:moveTo(startX, startY)

    print(startX)

end


function Player:update()
    Player.super.update(self)

        if pd.buttonIsPressed(pd.kButtonUp) then
            self:moveBy(0, -velocity)
        end
        if pd.buttonIsPressed(pd.kButtonDown) then
            self:moveBy(0, velocity)
        end
        if pd.buttonIsPressed(pd.kButtonLeft) then
            self:moveBy(-velocity, 0)
        end
        if pd.buttonIsPressed(pd.kButtonRight) then
            self:moveBy(velocity, 0)
        end

        if pd.buttonJustPressed(pd.kButtonB) then
            sfx_shoot:play()
        end

end
