--create Class
local BagScene = class("BagScene", function ()
    return cc.Scene:create()
end)

-- overwrite
function BagScene:init()
    
    local bg = gd.createSceneBg()
    self:addChild(bg)

    local backItem = cc.MenuItemImage:create("ui/global_backbtn.pvr.ccz","ui/global_backbtn_disabled.pvr.ccz","ui/global_backbtn_disabled.pvr.ccz")
    backItem:setAnchorPoint(cc.p(0,1))
    backItem:setPosition(cc.p(0,self._winSize.height))
    local menu = cc.Menu:create(backItem)
    menu:setPosition(self._zeroPoint)
    self:addChild(menu)
    local backItemHandle = function ()
        cc.Director:getInstance():popScene()
    end 
    ScriptHandlerMgr:getInstance():registerScriptHandler(backItem,backItemHandle,cc.Handler.MENU_CLICKED)

    local test = cc.Sprite:create("ui/bag_test1.png")
    test:setAnchorPoint(0.5,0)
    test:setPosition(self._winSize.width * 0.5,20)
    self:addChild(test)

    gd.addMenuLayer(self)
    gd.addCurrencyLayer(self)

    return true
end

--static create object
function BagScene:create()
    local scene = BagScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function BagScene:ctor()
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0) 
end

return BagScene