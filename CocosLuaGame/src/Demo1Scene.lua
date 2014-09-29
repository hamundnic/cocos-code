require "Cocos2d"
require "Cocos2dConstants"

local Demo1Scene = class("Demo1Scene",function()
    return cc.Scene:create()
end)

function Demo1Scene.create()
    local scene = Demo1Scene.new()
    scene:addChild(scene:createLayerFarm())
    return scene
end

function Demo1Scene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.schedulerID = nil
end

function Demo1Scene:creatDog()
    local frameWidth = 105
    local frameHeight = 95

--    local textureDog = cc.Director:getInstance():getTextureCache():addImage("Images/stone.png")
--    local rect = cc.rect(0, 0, frameWidth, frameHeight)
--    local frame0 = cc.SpriteFrame:createWithTexture(textureDog, rect)
--    local spriteDog = cc.Sprite:createWithSpriteFrame(frame0)
--    spriteDog:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
--    spriteDog.isPaused = false
--    spriteDog:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5);
--    return spriteDog

    local stoneSprite = cc.Sprite:create("Images/stone.png")
    stoneSprite:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
    return stoneSprite
end

function Demo1Scene:createLayerFarm()
    local layerFarm = cc.Layer:create()
--    local spriteDog = self:creatDog()
    local stoneSprite = cc.Sprite:create("Images/stone.png")
    stoneSprite:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
    layerFarm:addChild(stoneSprite)

    local function onNodeEvent(event)
        if "exit" == event then
        end
    end
    layerFarm:registerScriptHandler(onNodeEvent)

    return layerFarm
end

return Demo1Scene
