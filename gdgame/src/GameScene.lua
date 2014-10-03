require "Cocos2d"
require "Cocos2dConstants"
local GameScene = class("GameScene",function()
    return cc.Scene:create()
end)

function GameScene.create()
    local scene = GameScene.new()
    scene:addChild(scene:createLayer())
    return scene
end


function GameScene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.winSize = cc.Director:getInstance():getWinSize()
end

function GameScene:playBgMusic()
    local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("background.mp3") 
    cc.SimpleAudioEngine:getInstance():playMusic(bgMusicPath, true)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
    cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath)
end

-- create farm
function GameScene:createLayer()
    local layer = cc.Layer:create()
    local bg = cc.Sprite:create("bg_main_169.png")
    bg:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
    layer:addChild(bg)
    
    local btn = cc.Sprite:create("logo.jpg")
    btn:setAnchorPoint(0,0)
--    btn:setPosition(self.origin.x, self.origin.y) 
    btn:setPosition(0,0)
    layer:addChild(btn) 
    
    cclog(self.origin.x ..":".. self.origin.y   ..":".. self.visibleSize.width ..":".. self.visibleSize.height)
    
--    local btnItem = cc.MenuItemImage:create("main_head_name_bg_gold.pvr.ccz","main_head_name_bg_silver.pvr.ccz","main_head_name_bg_silver.pvr.ccz")
--    btnItem:setPosition(self.winSize.width / 2, self.winSize.height / 2)
    
--    local menu = cc.Menu:create(btnItem)
--    menu:setPosition(0,0)
--    layer:addChild(menu)
    return layer
end

return GameScene
