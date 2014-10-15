require "Cocos2d"
gd = gd or {}
gd["name"] = "aaa"

function gd.load()
    gd.loadLayer = cc.Layer:create()
    local listenerSwallow = cc.EventListenerTouchOneByOne:create()
    listenerSwallow:setSwallowTouches(true)
    listenerSwallow:registerScriptHandler(function() return true end,cc.Handler.EVENT_TOUCH_BEGAN ) 
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listenerSwallow, gd.loadLayer)

    gd.loadObject = cc.Sprite:create("ui/logo.jpg")
    local origin = cc.Director:getInstance():getVisibleOrigin()
    local size = cc.Director:getInstance():getVisibleSize()
    gd.loadObject:setPosition(origin.x + size.width * 0.5,origin.y + size.height * 0.5) 
    gd.loadLayer:addChild(gd.loadObject)
    cc.Director:getInstance():getRunningScene():addChild(gd.loadLayer)
end

function gd.unload()
    gd.loadLayer:removeFromParent()
end

function gd.createSceneBg()
    local visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local winSize = cc.Director:getInstance():getWinSize() 
    local centerPoint = cc.p(visibleOrigin.x + visibleSize.width * 0.5, visibleOrigin.y + visibleSize.height * 0.5)

    local bg = cc.Sprite:create("ui/bg.jpg")
    bg:setScale(winSize.height / bg:getContentSize().height)
    bg:setPosition(centerPoint)
    return bg
end

function gd.createLayerBg(isSwallow, isAutoRemove)
    local winSize = cc.Director:getInstance():getWinSize()
    local bg = cc.LayerColor:create(cc.c4b(0, 0, 0, 100))  
    bg:setPosition(0,0)
    
    local listenerSwallow = cc.EventListenerTouchOneByOne:create()
    listenerSwallow:setSwallowTouches(true)
    local onTouchBeganHandle = function()
        return true
    end
    local onTouchEndedHandle = function()
        bg:removeFromParent()
    end
    if isSwallow then
        listenerSwallow:registerScriptHandler(onTouchBeganHandle,cc.Handler.EVENT_TOUCH_BEGAN )	
    end
    if isAutoRemove then
        listenerSwallow:registerScriptHandler(onTouchEndedHandle,cc.Handler.EVENT_TOUCH_ENDED )    	
    end
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(listenerSwallow, bg)
    
    return bg
end

function gd.addMenuLayer(parent)
    local MenuLayer = require("global/MenuLayer")
    local menuLayer = MenuLayer:create()
    parent:addChild(menuLayer,999)
end

function gd.addCurrencyLayer(parent)
    local CurrencyLayer = require("global/CurrencyLayer")
    local currencyLayer = CurrencyLayer:create()
    parent:addChild(currencyLayer,999)
end
