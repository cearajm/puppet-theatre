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


cutsceneIsPlaying = false
comicData = myComicData


function cutsceneDidFinish()
    -- Player.instance.canMove = true
    cutsceneIsPlaying = false
    print("nope")
    -- LobbyScene.resume()
end

function startCutScene()
    -- Player.instance.canMove = false
    cutsceneIsPlaying = true
    -- LobbyScene:pause()
    print("yup")
    print("playing: ", cutsceneIsPlaying)
    Panels.startCutscene(comicData, cutsceneDidFinish)
end

local function init()

    -- showMenu()
    -- print("hi")
    Panels.Settings.useChapterMenu = false
    Noble.new(LobbyScene)
    LobbyScene:start()
    musicPlayer:setVolume(0.6)
    musicPlayer:play()

end


function pd.update()
    -- print("asdfadf", cutsceneIsPlaying)
    gfx.sprite.update()

    -- if pd.buttonIsPressed(pd.kButtonA) then
    --     -- playdate.inputHandlers.pop()
    --     startCutScene()
    --     -- Panels.startCutScene(comicData)
    -- end
    if cutsceneIsPlaying then
        Panels.update()
    else
        LobbyScene.update()
    end
    -- LobbyScene.update()
    pd.timer.updateTimers()
    pd.timer.updateTimers()
    
    


    -- print(cutsceneIsPlaying)

end


init()