require "Cocos2d"
gd = gd or {}

function gd.load()
    gd.loadObject = cc.Sprite:create("ui/logo.jpg")
    local origin = cc.Director:getInstance():getVisibleOrigin()
    local size = cc.Director:getInstance():getVisibleSize()
    gd.loadObject:setPosition(origin.x + size.width * 0.5,origin.y + size.height * 0.5) 
    cc.Director:getInstance():getRunningScene():addChild(gd.loadObject)
    cc.Director:getInstance():getRunningScene():setEnabled(false)
end

function gd.unload()
    gd.loadObject:removeFromParent()
    cc.Director:getInstance():getRunningScene():setEnabled(true)
end

function gd.getSceneBg()
    local visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local winSize = cc.Director:getInstance():getWinSize() 
    local centerPoint = cc.p(visibleOrigin.x + visibleSize.width * 0.5, visibleOrigin.y + visibleSize.height * 0.5)

    local bg = cc.Sprite:create("ui/bg.jpg")
    bg:setScale(winSize.height / bg:getContentSize().height)
    bg:setPosition(centerPoint)
    return bg
end

function gd.getLayerBg()
    local winSize = cc.Director:getInstance():getWinSize()
    local bg = cc.LayerColor:create(cc.c4b(0, 0, 0, 200), winSize.width, winSize.height)  
    bg:setPosition(0,0)
    return bg
end


