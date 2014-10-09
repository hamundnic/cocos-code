--create Class
local MenuLayer = class("MenuLayer",function ()
    return cc.Layer:create()
end)
-- end create Class

-- overwrite
function MenuLayer:init()
    -- do something my init()
    self._switchStatus = false --开关状态
    --init layer
    self._layer = cc.LayerColor:create(cc.c4b(0, 0, 0, 100), self._winSize.width, self._winSize.height)
    self._layer:_setLocalZOrder(-1)
    self._layer:retain()
    
    --init menu
    local switchItem = cc.MenuItemImage:create("ui/menu_switch.png","ui/menu_switch_select.png","ui/menu_switch.png")
    switchItem:setAnchorPoint(1,1)
    switchItem:setPosition(self._winSize.width, self._winSize.height)
    local menu = cc.Menu:create(switchItem)
    menu:setPosition(0,0)
    self:addChild(menu)

    local switchItemHandle = function ()
        if self._switchStatus then
            self._switchStatus = false
            self._layer:removeFromParent()
        else
            self._switchStatus = true
            self:addChild(self._layer)
        end
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(switchItem,switchItemHandle,cc.Handler.MENU_CLICKED)

    local function onNodeEvent(event)
        if (event == "cleanup") then
            self._layer:release()
        end
    end
    self:registerScriptHandler(onNodeEvent)
    return true
end

--static create object
function MenuLayer:create()
    local layer = MenuLayer.new()
    if nil ~= layer then
        layer:init()
    end
    return layer
end

function MenuLayer:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object

--set Scene which is Touched
function MenuLayer:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
        widget:setEnabled(enabled)
    end
end

return MenuLayer