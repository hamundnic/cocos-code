--create Class
local BagScene = class("BagScene", function ()
    return cc.Scene:create()
end)

-- overwrite
function BagScene:init()
    
    local layer = cc.Layer:create()
    self:addChild(layer)
    
    local bg = cc.Sprite:create("bg.jpg")
    bg:setPosition(self._centerPoint) --设置中心点
    local scale = cc.Director:getInstance():getWinSize().height / bg:getContentSize().height --缩放以height为准
    bg:setScale(scale)
    layer:addChild(bg)
    
    local backItem = cc.MenuItemImage:create("login_btn0.png","login_btn0_select.png")
    backItem:setPosition(self._centerPoint)
    local menu = cc.Menu:create(backItem)
    menu:setPosition(self._zeroPoint)
    layer:addChild(menu)
    local backItemHandle = function ()
        cc.Director:getInstance():popScene()
    end 
    ScriptHandlerMgr:getInstance():registerScriptHandler(backItem,backItemHandle,cc.Handler.MENU_CLICKED)

    return true
end

--static create object
function BagScene.create()
    local scene = BagScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function BagScene:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0) 
end

--set Scene which is Touched
function BagScene:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
        widget:setEnabled(enabled)
    end
end


return BagScene