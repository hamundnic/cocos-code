--create Class
local ExampleScene = class("ExampleScene",function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function ExampleScene:init()
    local ttfConfig = {}
    ttfConfig.fontFilePath="fonts/Marker Felt.ttf"
    ttfConfig.fontSize=36
    
    local label1 = cc.Label:createWithTTF(ttfConfig,"back", cc.VERTICAL_TEXT_ALIGNMENT_CENTER, self._winSize.width)
    label1:setTextColor( cc.c4b(0, 255, 0, 255))
    local backItem = cc.MenuItemLabel:create(label1)
    backItem:setPosition(self._centerPoint)
    local menu = cc.Menu:create(backItem)
    menu:setPosition(self._zeroPoint)
    self:addChild(menu)
    local backItemHandle = function ()
        cc.Director:getInstance():popScene()
    end 
    ScriptHandlerMgr:getInstance():registerScriptHandler(backItem,backItemHandle,cc.Handler.MENU_CLICKED)
    -- do something my init()
    return true
end

--static create object
function ExampleScene:create()
    local scene = ExampleScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function ExampleScene:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object

--set Scene which is Touched
function ExampleScene:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
        widget:setEnabled(enabled)
    end
end


return ExampleScene