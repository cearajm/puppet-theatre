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
pageCutscene = PagePanels

scenesFound = 0
isEndSequence = false
isEndScene = false

local bgImage <const> = gfx.image.new("assets/images/end.png")
local bgSprite = gfx.sprite.new(bgImage)
local elevator <const> = gfx.image.new("assets/images/elevator.png")
local elevatorSprite = gfx.sprite.new(elevator)

local baseY = 1200
local velocity = 20



function cutsceneDidFinish()
    Player.instance.canMove = true
    cutsceneIsPlaying = false
    print("finished")
    print("garden: ", Panels.vars.garden)
    print("garden: ", Panels.vars.elevators)
    print("garden: ", Panels.vars.lounge)
end


function startCutScene(cutscene)
    -- start sequence, callback upon end
    Player.instance.canMove = false
    cutsceneIsPlaying = true
    Panels.startCutscene(cutscene, cutsceneDidFinish)
end

function startEndScene()
    isEndScene = true
    print("goodbye")
    bgSprite:setZIndex(20)
    bgSprite:setCenter(0, 0)
    bgSprite:moveTo(0, 0)
    bgSprite:addSprite()

    elevatorSprite:setZIndex(22)
    elevatorSprite:setCenter(0, 0)
    elevatorSprite:moveTo(14, 14)
    elevatorSprite:addSprite()
    -- Player.instance:addSprite()


end

function scrollElevator()
    local change, acceleratedChange = pd.getCrankChange()
    baseY -= change
    

    if change > 0 and bgSprite.y > -960 then
        print("going down")
        bgSprite:moveBy(0, -velocity)

    elseif change < 0 then
        print("going up")
    end

    if bgSprite.y == -960 then
        print("it's over man")
        -- startCutScene(maidCutscene)
        -- isEndScene = false
    end

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
        -- print(Panels.vars.isPuppetized)
    elseif isEndScene then
        scrollElevator()
    else
        LobbyScene.update()
    end
    pd.timer.updateTimers()

end


init()