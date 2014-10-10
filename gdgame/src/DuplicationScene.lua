--create Class
local DuplicationScene = class("DuplicationScene", function ()
    return cc.Scene:create()
end)

-- overwrite
function DuplicationScene:init()

    local bg = gd.createSceneBg()
    self:addChild(bg)
    
    local backItem = cc.MenuItemImage:create("ui/global_backbtn.pvr.ccz","ui/global_backbtn_disabled.pvr.ccz","ui/global_backbtn_disabled.pvr.ccz")
    backItem:setAnchorPoint(cc.p(0,1))
    backItem:setPosition(cc.p(0,self._winSize.height))
    
    local nextItem = cc.MenuItemLabel:create(cc.Label:createWithTTF("next","fonts/Marker Felt.ttf",32))
    nextItem:setPosition(300,300)
    
    local menu = cc.Menu:create(backItem, nextItem)
    menu:setPosition(self._zeroPoint)
    self:addChild(menu)
    local backItemHandle = function ()
        cc.Director:getInstance():popScene()
    end
    local nextItemHandle = function ()
        cclog("nextItemHandle")
        local layer = require("DuplicationSecondaryLayer"):create()
        self:addChild(layer)
    end 
    ScriptHandlerMgr:getInstance():registerScriptHandler(backItem,backItemHandle,cc.Handler.MENU_CLICKED)
    ScriptHandlerMgr:getInstance():registerScriptHandler(nextItem,nextItemHandle,cc.Handler.MENU_CLICKED)

    gd.addMenuLayer(self)
    gd.addCurrencyLayer(self)

    return true
end

--static create object
function DuplicationScene:create()
    local scene = DuplicationScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function DuplicationScene:ctor()
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0) 
end

return DuplicationScene