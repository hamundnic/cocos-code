--create Class
local MainScene = class("MainScene", function ()
    return cc.Scene:create()
end)

local LoginService = require("service/LoginService")
local loginService = LoginService:create()
-- end create Class

-- overwrite
function MainScene:init()
    -- do samething my init()
    local bg1 = cc.Sprite:create("ui/main_bg_sky_left.jpg")
    bg1:setScale(2.689)
    bg1:setAnchorPoint(self._zeroPoint)
    bg1:setPosition(0,0)
    
    local bg2 = cc.Sprite:create("ui/main_bg_mountain.png")
    bg2:setScale(2.689)
    bg2:setAnchorPoint(self._zeroPoint)
    bg2:setPosition(0,0)
    
    local bg3 = MaskSprite:create("ui/main_bg_grass_left.jpg")
    bg3:setMask("ui/main_bg_grass_left_alpha_mask","shaders/mask.vsh","shaders/mask.fsh")
    bg3:setAnchorPoint(self._zeroPoint)
    bg3:setPosition(0,0)
    
    
    local  voidNode = cc.ParallaxNode:create()
    voidNode:setPosition(cc.p(0,0))
    voidNode:addChild(bg1, -1, cc.p(0.4,0), cc.p(0,0))
    voidNode:addChild(bg2, 1, cc.p(2.2,0), cc.p(0,0))
    voidNode:addChild(bg3, 2, cc.p(3,0), cc.p(0,0))
    self:addChild(voidNode)
    
    --add menu
    local item1 = cc.MenuItemImage:create("ui/main_menu_todolist_1.jpg","ui/main_menu_todolist_2.jpg")
    item1:setPosition(100,100)
    local menu = cc.Menu:create(item1)
    menu:setPosition(0,0)
    bg3:addChild(menu)
    table.insert(self._widgets,menu)
    local item1Handle = function ()
        local loginCallback = function (entity)
            --update ui
            cclog("origin：" .. entity.origin)
            local Scene = require("BattleScene")
            local scene = Scene:create(entity.origin)
            cc.Director:getInstance():pushScene(scene)
        end
        local loginEntity = loginService:login(loginCallback, 100)
    end
    ScriptHandlerMgr:getInstance():registerScriptHandler(item1,item1Handle,cc.Handler.MENU_CLICKED)
    
    
    --layer touch handle
    local function onTouchBegan(touch, event)
        cclog("sprite onTouchBegan..")
        return true
    end

    local function onTouchMoved(touch, event)
        cclog("sprite onTouchMoved..")
        local target = event:getCurrentTarget()
        local posX,posY = target:getPosition()
        local delta = touch:getDelta()
        if (posX + delta.x < 0) then
            target:setPosition(cc.p(posX + delta.x, posY + delta.y))
        end
    end

    local function onTouchEnded(touch, event)
        cclog("sprite onTouchesEnded..")
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
    
    --touch enabled
    self:setEnabled(true)
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
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end
-- end static create object

function MainScene:setEnabled(enabled)
    for _, widget in pairs(self._widgets) do
    	widget:setEnabled(enabled)
    end
end

return MainScene