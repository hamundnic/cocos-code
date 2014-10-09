--create Class
local CurrencyLayer = class("CurrencyLayer",function ()
    return cc.Layer:create()
end)
-- end create Class

-- overwrite
function CurrencyLayer:init()
    local head = cc.Sprite:create("ui/global_head.png")
    head:setAnchorPoint(0.5,1)
    head:setPosition(self._winSize.width * 0.5,self._winSize.height)
    self:addChild(head)
    return true
end

--static create object
function CurrencyLayer:create()
    local scene = CurrencyLayer.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function CurrencyLayer:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object

--set Scene which is Touched
function CurrencyLayer:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
        widget:setEnabled(enabled)
    end
end


return CurrencyLayer