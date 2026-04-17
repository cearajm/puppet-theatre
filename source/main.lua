import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/crank"

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
import 'ElevatorRide'

-- comic
import 'myComicData.lua'

-- mine
import 'assets'
import 'sprites'
-- import 'menu'


local pd <const> = playdate
local gfx <const> = pd.graphics
local musicPlayer = pd.sound.fileplayer.new(Audio.music)

-- local player = Player()
-- local concierge = Concierge()
-- local staff = Staff()
-- player:add()
-- concierge:add()
-- staff:add()

-- local lobbyScene = Noble.new(LobbyScene)
-- GameScene()
-- local textbox = Textbox()

cutsceneIsPlaying = false
comicData = myComicData


function cutsceneDidFinish()
    cutsceneIsPlaying = false
    print("nope")
    -- LobbyScene.resume()
end

function startCutScene()
    cutsceneIsPlaying = true
    -- LobbyScene:pause()
    print("yup")
    print(cutsceneIsPlaying)
    Panels.startCutscene(comicData, cutsceneDidFinish())
end

local function init()

    -- showMenu()
    -- print("hi")
    Noble.new(LobbyScene)

    LobbyScene:start()
    musicPlayer:setVolume(0.6)
    musicPlayer:play()

end


function pd.update()
    -- print("hi it's puppet theatre")
    -- if cutsceneIsPlaying then
    --     Panels.update()
    --     pd.timer.updateTimers()
    -- else
    --     LobbyScene.update()
    -- end
    LobbyScene.update()

    gfx.sprite.update()

    -- print(cutsceneIsPlaying)

end


init()