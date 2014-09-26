require "Cocos2d"
require "Cocos2dConstants"

local HelloLua = class("HelloLua",function()
    return cc.Scene:create()
end)

function HelloLua.create()
    local scene = HelloLua.new()
    scene:addChild(scene:createDog())
    return scene
end

function HelloLua:createDog()
    local stoneSprite = cc.Sprite:create("Images/stone.png")
    stoneSprite:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
    return stoneSprite
end

function HelloLua:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.schedulerID = nil
end 


return HelloLua
