--create Class
local BattleScene = class("BattleScene", function ()
    return cc.Scene:create()
end)
-- end create Class

-- overwrite
function BattleScene:init(content)
    
    cclog("content:" .. content)

    -- do samething my init()
    local ttfConfig = {}
    ttfConfig.fontFilePath = gd.ttfConfig.fontFilePath
    ttfConfig.fontSize = gd.ttfConfig.fontSize
    
    local contentLabel = cc.Label:createWithTTF(ttfConfig,content, cc.VERTICAL_TEXT_ALIGNMENT_CENTER, self._winSize.width)
    contentLabel:setPosition(500,320)
    self:addChild(contentLabel,1)
    
    local labelGet  = cc.Label:createWithTTF("Test Label", gd.ttfConfig.fontFilePath, 22)
    labelGet:setPosition(500,220)
    self:addChild(labelGet,1)
    
    local nextItem = cc.MenuItemLabel:create(cc.Label:createWithTTF(ttfConfig,"next", cc.VERTICAL_TEXT_ALIGNMENT_CENTER, self._winSize.width))
    nextItem:setPosition(100,100)
    
    local backItem = cc.MenuItemLabel:create(cc.Label:createWithTTF(ttfConfig,"back", cc.VERTICAL_TEXT_ALIGNMENT_CENTER, self._winSize.width))
    backItem:setPosition(100,500)
    
    local menu = cc.Menu:create(nextItem,backItem)
    menu:setPosition(0,0)
    self:addChild(menu,1)

    local nextItemHandle = function ()
        local BagScene = require("BagScene")
        local scene = BagScene:create()
        cc.Director:getInstance():pushScene(scene)
    end
    local backItemHandle = function ()
        cc.Director:getInstance():popScene()
    end 
    ScriptHandlerMgr:getInstance():registerScriptHandler(nextItem,nextItemHandle,cc.Handler.MENU_CLICKED)
    ScriptHandlerMgr:getInstance():registerScriptHandler(backItem,backItemHandle,cc.Handler.MENU_CLICKED)
    
    self:addChild(self:addSpineAnimation(),2)
    return true
end

--static create object
function BattleScene:create(content)
    local scene = BattleScene.new()
    if nil ~= scene then
        scene:init(content)
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
        goblins_ffd = sp.SkeletonAnimation:create('skeletons/goblins-ffd.json','skeletons/goblins-ffd.atlas',0.6)
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

function BattleScene:setBackground(name)
    local background = cc.Sprite:create(name)
    background:setPosition(self._centerPoint.x,self._centerPoint.y)
    self:addChild(background,0)
end

return BattleScene