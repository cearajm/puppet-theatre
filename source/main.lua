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
loungeCutscene = LoungePanels
gardenCutscene = GardenPanels
conciergeCutscene = ConciergePanels
elevatorCutscene = ElevatorPanels
maidCutscene = MaidPanels


function cutsceneDidFinish()
    Player.instance.canMove = true
    cutsceneIsPlaying = false
    print("nope")
end


function startCutScene(cutscene)
    -- start sequence, callback upon end
    Player.instance.canMove = false
    cutsceneIsPlaying = true
    Panels.startCutscene(cutscene, cutsceneDidFinish)
end


local function init()
    -- default Panels settings
    Panels.Settings.useChapterMenu = false
    Panels.Settings.borderRadius = 8
    Panels.Settings.borderWidth = 2
    Panels.Settings.defaultFrame = { margin = 4, gap = 8 }
    gfx.setFontFamily(gfx.getFont(gfx.font.kVariantBold))
    
    
    Noble.new(LobbyScene)
    LobbyScene:start()
    musicPlayer:setVolume(0.6)
    musicPlayer:play()

end


function pd.update()
    gfx.sprite.update()

    if cutsceneIsPlaying then
        Panels.update()
    else
        LobbyScene.update()
    end
    pd.timer.updateTimers()

end


init()