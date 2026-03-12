-- import "CoreLibs/graphics"
-- import "CoreLibs/sprites"
-- import "CoreLibs/crank"

import 'CoreLibs/object'
import 'CoreLibs/graphics'
import 'CoreLibs/sprites'
import 'CoreLibs/timer'

-- libraries
import 'libraries/AnimatedSprite'
import 'libraries/LDtk'
import 'libraries/panels/Panels'
import 'libraries/noble/Noble'
import 'libraries/noble/utilities/Utilities'

-- game
import 'GameScene'
import 'scenes/LobbyScene'

-- comic
import 'myComicData.lua'

-- mine
import 'assets'
import 'sprites'


local pd <const> = playdate
local gfx <const> = pd.graphics

-- local player = Player()
-- local concierge = Concierge()
-- local staff = Staff()
-- player:add()
-- concierge:add()
-- staff:add()

-- local lobbyScene = Noble.new(LobbyScene)
-- GameScene()

comicData = myComicData

local function init()
    print("hi")
    Noble.new(LobbyScene)
    -- Panels.start(comicData)


	

    -- local player = Player()
    -- noblescene:addSprite(player)
    


    
end

function pd.update()
    -- print("hi it's puppet theatre")
    gfx.sprite.update()
    pd.timer.updateTimers()
end

init()