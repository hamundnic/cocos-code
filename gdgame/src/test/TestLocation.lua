--create Class
local TestLocation = class("TestLocation",function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function TestLocation:init()
    
    local bg = cc.Sprite:create("ui/test_location_bg.jpg")
    bg:setAnchorPoint(0.5,0.5)
    bg:setPosition(self._centerPoint)
    bg:setScale(self._winSize.height / bg:getContentSize().height) 
    self:addChild(bg)    
    
    local cell = cc.Sprite:create("ui/test_location_cell.jpg")
    cell:setAnchorPoint(self._zeroPoint)
    cell:setPosition(self._zeroPoint)
    cell:setOpacity(100)
    self:addChild(cell)  
    
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