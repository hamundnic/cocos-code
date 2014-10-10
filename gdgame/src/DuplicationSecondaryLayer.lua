--create Class
local DuplicationSecondaryLayer = class("DuplicationSecondaryLayer",function ()
    return cc.Layer:create()
end)
-- end create Class

-- overwrite
function DuplicationSecondaryLayer:init()
    
    local layer = cc.LayerColor:create(cc.c4b(100,100,100,200),self._winSize.width,560)
    --阻断touch
    local listenerSwallow = cc.EventListenerTouchOneByOne:create()
    listenerSwallow:setSwallowTouches(true)
    listenerSwallow:registerScriptHandler(function() return true end,cc.Handler.EVENT_TOUCH_BEGAN )
    self:getEventDispatcher():addEventListenerWithSceneGraphPriority(listenerSwallow, layer)
    self:addChild(layer)
    
    local test = cc.Sprite:create("ui/duplication_secondary_test.png")
    test:setPosition(layer:getContentSize().width * 0.5, layer:getContentSize().height * 0.5) 
    layer:addChild(test) 
    
    local backItem = cc.MenuItemImage:create("ui/global_backbtn.pvr.ccz","ui/global_backbtn_disabled.pvr.ccz","ui/global_backbtn_disabled.pvr.ccz")
    backItem:setAnchorPoint(cc.p(0,1))
    backItem:setPosition(cc.p(0,self._winSize.height))
    local menu = cc.Menu:create(backItem)
    menu:setPosition(self._zeroPoint)
    self:addChild(menu)
    local backItemHandle = function ()
        cclog("backItemHandle")
        self:removeFromParent()
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(backItem,backItemHandle,cc.Handler.MENU_CLICKED)
    
    return true
end

--static create object
function DuplicationSecondaryLayer:create()
    local scene = DuplicationSecondaryLayer.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function DuplicationSecondaryLayer:ctor()
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object
return DuplicationSecondaryLayer