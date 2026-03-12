local gfx <const> = playdate.graphics
local ldtk <const> = LDtk

-- load data from ldtk file (does not yet show anything)
ldtk.load("levels/world.ldtk", false)
class("GameScene").extends()

function GameScene:init()
    -- level name == name in ldtk
    self:showLevel("Level_1")
end


-- this creates the tilemap for the game scene.
-- call in a noble Scene, to instantiate
function GameScene:showLevel(level_name)

    -- get all layers for the level
    for layer_name, layer in pairs(ldtk.get_layers(level_name)) do
        if layer.tiles then
             -- create tilemap
             local tilemap = ldtk.create_tilemap(level_name, layer_name)

             -- create sprite for each layer and set a tilemap on the sprite
             -- sprite == world sprite
             local layerSprite = gfx.sprite.new()
             layerSprite:setTilemap(tilemap)
             layerSprite:setCenter(0,0)
             layerSprite:moveTo(0,0)
             layerSprite:setZIndex(layer.zIndex)
             layerSprite:add()

             -- create collision boxes
             -- get empty tiles: empty != "Solid"
             local emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)
             if emptyTiles then
                -- create collision boxes
                gfx.sprite.addWallSprites(tilemap, emptyTiles)
                
             end
        end
    end
end