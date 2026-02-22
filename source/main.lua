-- import "CoreLibs/graphics"
-- import "CoreLibs/sprites"
-- import "CoreLibs/crank"

import 'libraries/noble/Noble'
import 'assets'
import 'sprites'


local pd <const> = playdate
local gfx <const> = pd.graphics

local player = Player()
player:add()


local function init()
    print("hi")
end

function pd.update()
    -- print("hi it's puppet theatre")
    gfx.sprite.update()
end

init()