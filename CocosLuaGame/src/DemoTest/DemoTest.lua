--------------------------------------------
---- test sprite1
--------------------------------------------
local Sprite1 = {}
Sprite1.__index = Sprite1

function Sprite1.addNewSpriteWithCoords(layer, point)
--    local idx = math.floor(math.random() * 1400 / 100)
--    local x = math.floor(math.mod(idx,5) * 85)
--    local y = math.floor(idx / 5) * 121
--
--    local sprite = cc.Sprite:create("Images/grossini_dance_atlas.png", cc.rect(x,y,85,121) )
--    layer:addChild( sprite )
--
--    sprite:setPosition( cc.p(point.x, point.y) )
--
--    local action = nil
--    local random = math.random()
--    cclog("random = " .. random)
--    if( random < 0.20 ) then
--        action = cc.ScaleBy:create(3, 2)
--    elseif(random < 0.40) then
--        action = cc.RotateBy:create(3, 360)
--    elseif( random < 0.60) then
--        action = cc.Blink:create(1, 3)
--    elseif( random < 0.8 ) then
--        action = cc.TintBy:create(2, 0, -255, -255)
--    else 
--        action = cc.FadeOut:create(2)
--    end
--
--    local action_back = action:reverse()
--    local seq = cc.Sequence:create( action, action_back)
--
--    sprite:runAction( cc.RepeatForever:create(seq) )
end

function Sprite1.onTouchesEnd(touches, event)
    for i = 1,table.getn(touches) do
        local location = touches[i]:getLocation()
        Sprite1.addNewSpriteWithCoords(Helper.currentLayer, location)
    end
end

function Sprite1.create()
    cclog("sprite1")
    local layer = cc.Layer:create()
    Helper.initWithLayer(layer)
    createSprite(layer)
    Sprite1.addNewSpriteWithCoords(layer, cc.p(size.width/2, size.height/2))
--
--    local listener = cc.EventListenerTouchAllAtOnce:create()
--    listener:registerScriptHandler(Sprite1.onTouchesEnd,cc.Handler.EVENT_TOUCHES_ENDED )
--    local eventDispatcher = layer:getEventDispatcher()
--    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layer)
--
--    Helper.titleLabel:setString("Sprite (tap screen)")
    Helper.titleLabel:setString("Sprite (tap screen)")
    return layer
end

function createSprite(scene)
    local visibleSize = cc.Director:getInstance():getVisibleSize()
    local origin = cc.Director:getInstance():getVisibleOrigin()

    local stoneSprite = cc.Sprite:create("Images/stone.png")
    stoneSprite:setPosition(origin.x + visibleSize.width * 0.2, origin.y + visibleSize.height * 0.5)
    scene:addChild(stoneSprite) 
end

function DemoTestMain()
    cclog("DemoTestMain")
    Helper.index = 1
    cc.Director:getInstance():setDepthTest(true)
    local scene = cc.Scene:create()
    
    Helper.createFunctionTable = {
        Sprite1.create
    }
    
    scene:addChild(Sprite1.create())
    scene:addChild(CreateBackMenuItem())
    return scene
    
end
