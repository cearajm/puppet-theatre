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

-- level name == name in ldtk
function GameScene:init(player)
    GameScene.super.init(self)

    self:loadLevel("LobbyScene")
    self.player = player
    self.player:addSprite()
    self.currentLevel = "LobbyScene"


    concierge:addSprite()
    bell:addSprite()

end


function GameScene:moveToRoom(direction)
    local level = ldtk.get_neighbours(self.levelName, direction)[1] -- one neighbor per direction

    local x, y
    self:loadLevel(level)
    self.player:addSprite()
    self.currentLevel = level

    self:loadInteractions(level)
end


function GameScene:loadInteractions(level)
    print(level)

    if level == "LobbyScene" then
        concierge:addSprite()
    end
end

function GameScene:loadLevel(level_name)
    gfx.sprite.removeAll()

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
            layerSprite:setCenter(0,0)
            layerSprite:moveTo(0,0)
            layerSprite:setZIndex(layer.zIndex)
            print(layerSprite:getZIndex())
            layerSprite:add()

            -- create collision boxes
            -- get empty tiles: empty != "Solid"
            self.emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)
            if self.emptyTiles then
                gfx.sprite.addWallSprites(self.tilemap, self.emptyTiles)
            end
        end
    end
end

function GameScene:update()
    GameScene.super.update(self)
    -- concierge.textbox:draw()
end








