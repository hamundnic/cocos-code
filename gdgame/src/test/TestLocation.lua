--create Class
local TestLocation = class("TestLocation",function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function TestLocation:init()
    
    local parent = cc.Sprite:create("ui/test_location_bg.jpg")
    parent:setAnchorPoint(0.5,0.5)
    parent:setPosition(self._centerPoint)
    parent:setScale(self._winSize.height / parent:getContentSize().height) 
    self:addChild(parent)   
    
--    local bg = cc.LayerColor:create(cc.c4b(0, 0, 0, 200), self._winSize.width, self._winSize.height)  
--    bg:setPosition(self._zeroPoint)
--    self:addChild(bg)
    
--    local bg = cc.Sprite:create("ui/bg.jpg")
--    bg:setScale(self._winSize.height / bg:getContentSize().height)
--    bg:setPosition(self._centerPoint)
--    self:addChild(bg)


--    local bg = gd.getLayerBg()
    local bg = gd.getSceneBg()
    self:addChild(bg)
    
    local frameLayer = cc.Sprite:create("ui/test_location_layer.jpg") 
    frameLayer:setPosition(self._centerPoint)
    self:addChild(frameLayer)
    
    local cell = cc.Sprite:create("ui/test_location_cell.jpg")
    cell:setAnchorPoint(self._zeroPoint)
    cell:setPosition(self._zeroPoint) 
    frameLayer:addChild(cell)  
    
    -- do something my init()
    return true
end

--static create object
function TestLocation:create()
    local scene = TestLocation.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function TestLocation:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object

--set Scene which is Touched
function TestLocation:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
        widget:setEnabled(enabled)
    end
end


return TestLocation