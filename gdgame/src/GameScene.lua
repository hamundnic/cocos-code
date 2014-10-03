require "Cocos2d"
require "Cocos2dConstants"
local GameScene = class("GameScene",function()
    return cc.Scene:create()
end)

function GameScene.create()
    local scene = GameScene.new()
    scene:addChild(scene:createLayer())
    scene:addChild(scene:addSpineAnimation())
    return scene
end

function GameScene:ctor()
    self.visibleSize = cc.Director:getInstance():getVisibleSize()
    self.origin = cc.Director:getInstance():getVisibleOrigin()
    self.winSize = cc.Director:getInstance():getWinSize()
end

function GameScene:playBgMusic()
    local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("background.mp3") 
    cc.SimpleAudioEngine:getInstance():playMusic(bgMusicPath, true)
    local effectPath = cc.FileUtils:getInstance():fullPathForFilename("effect1.wav")
    cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath)
end

-- create farm
function GameScene:createLayer()
    local layer = cc.Layer:create()
    local bg = cc.Sprite:create("bg_main_169.png")
    bg:setPosition(self.origin.x + self.visibleSize.width * 0.5, self.origin.y + self.visibleSize.height * 0.5)
    layer:addChild(bg)
    
    local btn = cc.Sprite:create("logo.jpg")
    btn:setAnchorPoint(0,0)
--    btn:setPosition(self.origin.x, self.origin.y) 
    btn:setPosition(0,0)
    layer:addChild(btn) 
    
    cclog(self.origin.x ..":".. self.origin.y   ..":".. self.visibleSize.width ..":".. self.visibleSize.height)
    
--    local btnItem = cc.MenuItemImage:create("main_head_name_bg_gold.pvr.ccz","main_head_name_bg_silver.pvr.ccz","main_head_name_bg_silver.pvr.ccz")
--    btnItem:setPosition(self.winSize.width / 2, self.winSize.height / 2)
    
--    local menu = cc.Menu:create(btnItem)
--    menu:setPosition(0,0)
--    layer:addChild(menu)

    local maskSprite = MaskSprite:create("main_bg_grass_left.jpg")
    maskSprite:setMask("main_bg_grass_left_alpha_mask","shader/mask.vsh","shader/mask.fsh")
    maskSprite:setAnchorPoint(0,0)
    maskSprite:setPosition(0,0)
    layer:addChild(maskSprite)
    
    return layer
end

function GameScene:addSpineAnimation()
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

return GameScene
