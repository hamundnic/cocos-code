--create Class
local MainScene = class("MainScene")
MainScene.__index = MainScene

function MainScene.extend(target)
    local t = tolua.getpeer(target)
    if not t then
        t = {}
        tolua.setpeer(target, t)
    end
    setmetatable(t, MainScene)
    return target
end
-- end create Class

-- overwrite
function MainScene:init()
    -- do samething my init()
    local bg1 = cc.Sprite:create("main_bg_sky_left.jpg")
    bg1:setScale(2.689)
    bg1:setAnchorPoint(0,0)
    bg1:setPosition(0,0)
    
    local bg2 = cc.Sprite:create("main_bg_mountain.png")
    bg2:setScale(2.689)
    bg2:setAnchorPoint(0,0)
    bg2:setPosition(0,0)
    
    local  voidNode = cc.ParallaxNode:create()
    voidNode:addChild(bg1, -1, cc.p(0.4,0), cc.p(0,0))
    voidNode:addChild(bg2, 1, cc.p(2.2,0), cc.p(0,0))
    
    local moveby = cc.MoveBy:create(2.0,cc.p(-300,0))
    voidNode:runAction(moveby)
    
    self:addChild(voidNode)
    return true
end

--static create object
function MainScene.create()
    local scene = MainScene.extend(cc.Scene:create())
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object


return MainScene