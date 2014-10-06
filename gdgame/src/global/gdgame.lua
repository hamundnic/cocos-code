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


