local gfx <const> = playdate.graphics
local ldtk <const> = LDtk

-- load data from ldtk file (does not yet show anything)
ldtk.load("levels/world.ldtk", false)
class("GameScene").extends()




function GameScene:init(level_name)
    
    GameScene.super.init(self)
    -- level name == name in ldtk
    
    self.left = nil
    self.right = nil
    self.tilemap = nil

    self.emptyTiles = nil
    self.layerSprite = gfx.sprite.new()
    self:loadLevel(level_name)
end


-- this creates the tilemap for the game scene.
-- call in a noble Scene, to instantiate
function GameScene:loadLevel(level_name)

    -- get all layers for the level
    for layer_name, layer in pairs(ldtk.get_layers(level_name)) do
        if layer.tiles then
            -- create tilemap
            self.tilemap = ldtk.create_tilemap(level_name, layer_name)

            -- create sprite for each layer and set a tilemap on the sprite
            -- sprite == world sprite
            self.layerSprite:setSize(400, 240)
            self.layerSprite:setTilemap(self.tilemap)
            self.layerSprite:setCenter(0,0)
            self.layerSprite:moveTo(0,0)
            self.layerSprite:setZIndex(layer.zIndex)


            -- create collision boxes
            -- get empty tiles: empty != "Solid"
            -- self.emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)
            -- if self.emptyTiles then
            --     -- create collision boxes
            --     gfx.sprite.addWallSprites(self.tilemap, self.emptyTiles)
            -- end
        end

    end
end

function GameScene:showElevators()
    self.layerSprite:setTilemap(elevators)
end

function GameScene:show()
    self.layerSprite:add()
    self.emptyTiles = ldtk.get_empty_tileIDs(level_name, "Solid", layer_name)
    if self.emptyTiles then
        -- create collision boxes
        gfx.sprite.addWallSprites(self.tilemap, self.emptyTiles)
    end

end


function GameScene:hide()
    gfx.sprite:removeAll()
end

function GameScene:setLeft(levelName)
    self.left = levelName
    print(self.left)
end

function GameScene:update()
    GameScene.super.update(self)
end

