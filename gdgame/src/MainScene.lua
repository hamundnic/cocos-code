--create Class
local MainScene = class("MainScene", function ()
    return cc.Scene:create()
end)

local loginService = require("service/LoginService"):create()
local bagService = require("service/BagService"):create()
local duplicationService = require("service/DuplicationService"):create()
local bodyService = require("service/BodyService"):create()
-- end create Class

-- overwrite
function MainScene:init()
    
    -- do samething my init()
    local skyLeft = cc.Sprite:create("ui/main_bg_sky_left.jpg")
    skyLeft:setScale(self._winSize.height / skyLeft:getContentSize().height)
    skyLeft:setAnchorPoint(self._zeroPoint)
    skyLeft:setPosition(0,0)
    
    local skyRight = cc.Sprite:create("ui/main_bg_sky_right.jpg")
    skyRight:setScale(self._winSize.height / skyRight:getContentSize().height)
    skyRight:setAnchorPoint(self._zeroPoint)
    skyRight:setPosition(0,0)
    
    local bg2 = cc.Sprite:create("ui/main_bg_mountain.png")
    local bg2 = gd.MaskSprite:create("ui/main_bg_mountain.jpg")
    bg2:setMask("ui/main_bg_mountain_alpha_mask",gd.maskVSH,gd.maskFSH)
    bg2:setScale(self._winSize.height / bg2:getContentSize().height)
    bg2:setAnchorPoint(self._zeroPoint)
    bg2:setPosition(self._zeroPoint)
    
    
--    MaskSprite:create():testBindingIsOK()
--    gd.CustomClass:create():helloMsg()
    
    local bg3 = gd.MaskSprite:create("ui/main_bg_grass_left.jpg")
    bg3:setMask("ui/main_bg_grass_left_alpha_mask",gd.maskVSH,gd.maskFSH)
    bg3:setAnchorPoint(self._zeroPoint)
    bg3:setPosition(self._zeroPoint)
    
    local bg4 = gd.MaskSprite:create("ui/main_bg_grass_right.jpg")
    bg4:setMask("ui/main_bg_grass_right_alpha_mask",gd.maskVSH,gd.maskFSH)
    bg4:setAnchorPoint(self._zeroPoint)
    bg4:setPosition(bg3:getContentSize().width,0)
    
    local  voidNode = cc.ParallaxNode:create()
    voidNode:setPosition(cc.p(0,0))
    voidNode:addChild(skyLeft, -1, cc.p(0.2,0), cc.p(0,0))
    voidNode:addChild(skyRight, -1, cc.p(0.2,0), cc.p(skyLeft:getContentSize().width,0))
    voidNode:addChild(bg2, 1, cc.p(0.8,0), cc.p(0,0))
    voidNode:addChild(bg3, 2, cc.p(1,0), cc.p(0,0))
    voidNode:addChild(bg4, 2, cc.p(1,0), cc.p(bg3:getContentSize().width,0))
    self:addChild(voidNode)
    
    --add menu
--    local item1Sprite = gd.MaskSprite:create("ui/main_menu_todolist_1.jpg")
--    item1Sprite:setMask("ui/main_menu_todolist_1_alpha_mask",gd.maskVSH,gd.maskFSH)
--    local item1SpriteSelect = gd.MaskSprite:create("ui/main_menu_todolist_2.jpg")
--    item1SpriteSelect:setMask("ui/main_menu_todolist_2_alpha_mask",gd.maskVSH,gd.maskFSH)
    
    local item1 = cc.MenuItemLabel:create(cc.Label:createWithTTF("duplication","fonts/Marker Felt.ttf",32))
    item1:setPosition(100,100)
    local item2 = cc.MenuItemLabel:create(cc.Label:createWithTTF("body","fonts/Marker Felt.ttf",32))
    item2:setPosition(100,200)
    local item3 = cc.MenuItemLabel:create(cc.Label:createWithTTF("bag","fonts/Marker Felt.ttf",32))
    item3:setPosition(100,300)
    local menu = cc.Menu:create(item1,item2,item3)
    menu:setPosition(0,0)
    bg3:addChild(menu)
    local item1Handle = function ()
        local callback = function (entity)
            --update ui
            cclog("origin：" .. entity.origin)
            local scene = require("DuplicationScene"):create(entity.origin)
            cc.Director:getInstance():pushScene(scene)
        end
        duplicationService:acceptDuplicationData(callback, 100)
    end
    local item2Handle = function ()
        local callback = function (entity)
            --update ui
            cclog("origin：" .. entity.origin)
            local scene = require("BodyScene"):create(entity.origin)
            cc.Director:getInstance():pushScene(scene)
        end
        bodyService:acceptBodyData(callback, 100)
    end
    local item3Handle = function ()
        local callback = function (entity)
            --update ui
            cclog("origin：" .. entity.origin)
            local scene = require("BagScene"):create(entity.origin)
            cc.Director:getInstance():pushScene(scene)
        end
        bagService:acceptBagData(callback, 100)
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(item1,item1Handle,cc.Handler.MENU_CLICKED)
    ScriptHandlerMgr:getInstance():registerScriptHandler(item2,item2Handle,cc.Handler.MENU_CLICKED)
    ScriptHandlerMgr:getInstance():registerScriptHandler(item3,item3Handle,cc.Handler.MENU_CLICKED)
    
    
    --layer touch handle
    local function onTouchBegan(touch, event)
--        cclog("sprite onTouchBegan..")
        return true
    end

    local function onTouchMoved(touch, event)
--        cclog("sprite onTouchMoved..")
        local target = event:getCurrentTarget()
        local posX,posY = target:getPosition()
        local delta = touch:getDelta()
--        (bg3:getContentSize().width + bg4:getContentSize().width)
        if (posX + delta.x < 0 and posX + delta.x > -800) then
            target:setPosition(cc.p(posX + delta.x, posY + delta.y))
        end
    end

    local function onTouchEnded(touch, event)
--        cclog("sprite onTouchesEnded..")
        local target = event:getCurrentTarget()
        local posX,posY = target:getPosition()
        if (posX > 0) then 
            target:setPosition(0,0)
        end 
    end
    local listener1 = cc.EventListenerTouchOneByOne:create()
    listener1:setSwallowTouches(true)
    listener1:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )
    listener1:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    listener1:registerScriptHandler(onTouchEnded,cc.Handler.EVENT_TOUCH_ENDED )
    local eventDispatcher = self:getEventDispatcher()
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener1, voidNode)
    gd.addMenuLayer(self)
    
    --touch enabled
    return true
end

--static create object
function MainScene:create()
    local scene = MainScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end

function MainScene:ctor()
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object

return MainScene