--create Class
local BattleScene = class("BattleScene", function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function BattleScene:init()
    -- do samething my init()
    
    local item1 = cc.MenuItemImage:create("login_btn0.png","login_btn0_select.png")
    item1:setPosition(100,100)
    local item2 = cc.MenuItemImage:create("login_btn1.png","login_btn1_select.png")
    item2:setPosition(100,500)
    
    local menu = cc.Menu:create(item1,item2)
    menu:setPosition(0,0)
    self:addChild(menu)

    local item1Handle = function ()
        local BagScene = require("BagScene")
        local scene = BagScene:create()
        cc.Director:getInstance():pushScene(scene)
    end
    local item2Handle = function ()
        cc.Director:getInstance():popScene()
    end 
    ScriptHandlerMgr:getInstance():registerScriptHandler(item1,item1Handle,cc.Handler.MENU_CLICKED)
    ScriptHandlerMgr:getInstance():registerScriptHandler(item2,item2Handle,cc.Handler.MENU_CLICKED)
    
    self:addChild(self:addSpineAnimation())
    return true
end

--static create object
function BattleScene:create()
    local scene = BattleScene.new()
    if nil ~= scene then
        scene:init()
    end
    return scene
end
-- end static create object

function BattleScene:ctor()
    self._widgets = {}
    self._visibleOrigin = cc.Director:getInstance():getVisibleOrigin()
    self._visibleSize = cc.Director:getInstance():getVisibleSize()
    self._winSize = cc.Director:getInstance():getWinSize() 
    self._centerPoint = cc.p(self._visibleOrigin.x + self._visibleSize.width * 0.5, self._visibleOrigin.y + self._visibleSize.height * 0.5)
    self._zeroPoint = cc.p(0,0)
end


--logic
function BattleScene:addSpineAnimation()
    local goblin = cc.Layer:create()
    local s = cc.Director:getInstance():getWinSize()

    local goblins_ffd
    local addGoblins = function()
        --please use sp.SkeletonAnimation:create,not sp.SkeletonAnimation:createWithFile
        goblins_ffd = sp.SkeletonAnimation:create('goblins-ffd.json','goblins-ffd.atlas',0.6)
        goblin:addChild(goblins_ffd)
        goblins_ffd:setSkin("goblin")
        goblins_ffd:setPosition(cc.p(s.width/2, 20))
        goblins_ffd:setDebugBones(true)
        goblins_ffd:setAnimation(0,"walk",true)
        goblins_ffd:registerSpineEventHandler(function(event)
            if event.type == 'start' then
                print(string.format("[spine] %d start: %s", 
                    event.trackIndex,
                    event.animation))
            elseif event.type == 'end' then
                print(string.format("[spine] %d end: %s", 
                    event.trackIndex,
                    event.animation))
            elseif event.type == 'complete' then
                print(string.format("[spine] %d complete: %s, %d", 
                    event.trackIndex,
                    event.animation, 
                    event.loopCount))
            elseif event.type == 'event' then
                print(string.format("[spine] %d event: %s, %s: %d, %f, %s", 
                    event.trackIndex,
                    event.animation,
                    event.eventData.name,
                    event.eventData.intValue,
                    event.eventData.floatValue,
                    event.eventData.stringValue))
            end
        end)
    end

    local function onNodeEvent(event)
        if event == "enter" then
            cclog("SpineTestLayer1#onEnter")
            addGoblins()
        elseif event == "enterTransitionFinish" then
            cclog("SceneTestLayer1#onEnterTransitionDidFinish")
        end
    end

    goblin:registerScriptHandler(onNodeEvent)

    return goblin
end

return BattleScene