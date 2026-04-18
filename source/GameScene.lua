local pd <const> = playdate
local gfx <const> = playdate.graphics
local ldtk <const> = LDtk

import "assets"
import "sprites"

-- load data from ldtk file (does not yet show anything)
ldtk.load("levels/world.ldtk", false)
class("GameScene").extends()

-- local textbox = Textbox()
local concierge = Concierge()
local bell = Bell()
local elevators = Elevators()
local elevatorRide = ElevatorRide()
local guy = Guy("1")
local window = Window()
local cutscene = Cutscene()
local cutsceneHasPlayed = false

-- level name == name in ldtk
function GameScene:init(player)
    GameScene.super.init(self)

    -- self.currentLevel = "LobbyScene"
    self.currentLevel = nil
    self.player = player
    self.player:addSprite()
    GameScene.instance = self

end




function GameScene:moveToRoom(direction)
    local level = ldtk.get_neighbours(self.levelName, direction)[1]-- one neighbor per direction

    local x, y
    self:loadLevel(level)

end


function GameScene:loadInteractions(level)
    print(level)

    if level == "LobbyScene" then
        self.player:addSprite()
        concierge:addSprite()
        bell:addSprite()
    elseif level == "Elevators" then
        self.player:addSprite()
        elevators:addSprite()
        elevators.elevator1:addSprite()
    elseif level == "ElevatorRide" then
        print("here")
        elevatorRide.textbox:addSprite()
        elevatorRide.isInElevator = true
        -- self.player:addSprite()

    elseif level == "Window" then
        self.player:addSprite()
        window:addSprite()
        guy:addSprite()
    elseif level == "Lounge" then

        if not cutsceneHasPlayed then
            startCutScene()
            cutsceneHasPlayed = true
        end
        self.player:addSprite()

    end

end

function GameScene:loadLevel(level_name)
    gfx.sprite.removeAll()
    self.currentLevel = level_name
    -- LobbyScene.currentLevel = self.currentLevel
    -- print("lobby: ", LobbyScene.currentLevel)
    self:loadInteractions(level_name)
    -- self.player:addSprite()
	



    -- get all layers for the level and create tilemap
    self.levelName = level_name
    for layer_name, layer in pairs(ldtk.get_layers(level_name)) do
        if layer.tiles then
            self.tilemap = ldtk.create_tilemap(level_name, layer_name)

            -- create sprite for each layer and set a tilemap on the sprite
            -- sprite == world sprite
            local layerSprite = gfx.sprite.new()
            layerSprite:setSize(400, 240)
            layerSprite:setTilemap(self.tilemap)
            layerSprite:setCenter(0, 0)
            layerSprite:moveTo(0, 0)
            layerSprite:setZIndex(layer.zIndex)
            layerSprite:add()

            -- create collision boxes
            -- get empty tiles: empty != "Solid"
            self.emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)
            if self.emptyTiles then
                gfx.setDrawOffset(0,0)
                gfx.sprite.addWallSprites(self.tilemap, self.emptyTiles)
            end
            -- if level_name ~= "Lounge" then
            --     layerSprite:setIgnoresDrawOffset(true)
            -- end
        end

    end
   

end

function GameScene:update()
    elevatorRide:update()
    


    -- window:update()

    -- if playing == true then
    --     Panels.update()
    -- end
    -- concierge.textbox:draw()6
    -- print(self.currentLevel)

    -- print(self.currentLevel)
    
    -- if self.currentLevel == "Lounge" then
    --     local x, y = self.player:getPosition()
    --     local camx = 50 - x
    --     local camy = 50 - y
    --     gfx.setDrawOffset(-x, 0)
    --     self.tilemap:draw(0, 0)
       
    
    -- end

    -- gfx.setDrawOffset(0,0)

        
    --     -- gfx.sprite.addWallSprites(self.tilemap, self.emptyTiles)
    --     -- self.emptyTiles:draw(0, 104)
    -- end

    -- gfx.clear()
    -- gfx.setDrawOffset(0, 0)
end








