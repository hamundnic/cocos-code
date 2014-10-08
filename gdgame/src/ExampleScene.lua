--create Class
local ExampleScene = class("ExampleScene",function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function ExampleScene:init()
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