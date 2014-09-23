require "Cocos2d"
require "Cocos2dConstants"

local Demo1Scene = class("Demo1Scene",function()
    return cc.Scene:create()
end)

function Demo1Scene.create()
    local scene = Demo1Scene.new()
    scene:addChild(scene:createLayerFarm())
    return scene
end


function Demo1Scene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.schedulerID = nil
end

function Demo1Scene:playBgMusic()
    local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("background.mp3") 
    cc.SimpleAudioEngine:getInstance():playMusic(bgMusicPath, true)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
    cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath)
end

function Demo1Scene:creatDog()
    local frameWidth = 105
    local frameHeight = 95

    -- create dog animate
    local textureDog = cc.Director:getInstance():getTextureCache():addImage("dog.png")
    local rect = cc.rect(0, 0, frameWidth, frameHeight)
    local frame0 = cc.SpriteFrame:createWithTexture(textureDog, rect)
    rect = cc.rect(frameWidth, 0, frameWidth, frameHeight)
    local frame1 = cc.SpriteFrame:createWithTexture(textureDog, rect)

    local spriteDog = cc.Sprite:createWithSpriteFrame(frame0)
    spriteDog:setPosition(self.origin.x, self.origin.y + self.visibleSize.height / 4 * 3)
    spriteDog.isPaused = false

    local animation = cc.Animation:createWithSpriteFrames({frame0,frame1}, 0.5)
    local animate = cc.Animate:create(animation);
    spriteDog:runAction(cc.RepeatForever:create(animate))

    -- moving dog at every frame
    local function tick()
        if spriteDog.isPaused then return end
        local x, y = spriteDog:getPosition()
        if x > self.origin.x + self.visibleSize.width then
            x = self.origin.x
        else
            x = x + 1
        end

        spriteDog:setPositionX(x)
    end

    self.schedulerID = cc.Director:getInstance():getScheduler():scheduleScriptFunc(tick, 0, false)

    return spriteDog
end

-- create farm
function Demo1Scene:createLayerFarm()
    local layerFarm = cc.Layer:create()
    -- add in farm background
    local bg = cc.Sprite:create("farm.jpg")
    bg:setPosition(self.origin.x + self.visibleSize.width / 2 + 80, self.origin.y + self.visibleSize.height / 2)
    layerFarm:addChild(bg)

    -- add land sprite
    for i = 0, 3 do
        for j = 0, 1 do
            local spriteLand = cc.Sprite:create("land.png")
            spriteLand:setPosition(200 + j * 180 - i % 2 * 90, 10 + i * 95 / 2)
            layerFarm:addChild(spriteLand)
        end
    end

    -- add crop
    local frameCrop = cc.SpriteFrame:create("crop.png", cc.rect(0, 0, 105, 95))
    for i = 0, 3 do
        for j = 0, 1 do
            local spriteCrop = cc.Sprite:createWithSpriteFrame(frameCrop);
            spriteCrop:setPosition(210 + j * 180 - i % 2 * 90, 40 + i * 95 / 2)
            layerFarm:addChild(spriteCrop)
        end
    end

    -- add moving dog
    local spriteDog = self:creatDog()
    layerFarm:addChild(spriteDog)

    -- handing touch events
    local touchBeginPoint = nil
    local function onTouchBegan(touch, event)
        local location = touch:getLocation()
        --cclog("onTouchBegan: %0.2f, %0.2f", location.x, location.y)
        touchBeginPoint = {x = location.x, y = location.y}
        spriteDog.isPaused = true
        -- CCTOUCHBEGAN event must return true
        return true
    end

    local function onTouchMoved(touch, event)
        local location = touch:getLocation()
        --cclog("onTouchMoved: %0.2f, %0.2f", location.x, location.y)
        if touchBeginPoint then
            local cx, cy = layerFarm:getPosition()
            layerFarm:setPosition(cx + location.x - touchBeginPoint.x,
                cy + location.y - touchBeginPoint.y)
            touchBeginPoint = {x = location.x, y = location.y}
        end
    end

    local function onTouchEnded(touch, event)
        local location = touch:getLocation()
        --cclog("onTouchEnded: %0.2f, %0.2f", location.x, location.y)
        touchBeginPoint = nil
        spriteDog.isPaused = false
    end

    local listener = cc.EventListenerTouchOneByOne:create()
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = layerFarm:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, layerFarm)

    local function onNodeEvent(event)
        if "exit" == event then
            cc.Director:getInstance():getScheduler():unscheduleScriptEntry(self.schedulerID)
        end
    end
    layerFarm:registerScriptHandler(onNodeEvent)

    return layerFarm
end

return Demo1Scene
