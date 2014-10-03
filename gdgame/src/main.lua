require "Cocos2d"
require "src/global/gdgame"
--require("src/gdgame")
-- cclog
--local cclog = function(...)
--    print(string.format(...))
--end

function cclog(...)
    print(string.format(...))
end

-- for CCLuaEngine traceback
function __G__TRACKBACK__(msg)
    cclog("----------------------------------------")
    cclog("LUA ERROR: " .. tostring(msg) .. "\n")
    cclog(debug.traceback())
    cclog("----------------------------------------")
    return msg
end

local function main()
    collectgarbage("collect")
    -- avoid memory leak
    collectgarbage("setpause", 100)
    collectgarbage("setstepmul", 5000)
    
    -- run
    local director = cc.Director:getInstance()
    local glView   = director:getOpenGLView()
    if nil == glView then
        glView = cc.GLView:createWithRect("Lua Tests", cc.rect(0,0,900,640))
        director:setOpenGLView(glView)
    end
    
    --turn on display FPS
    director:setDisplayStats(true)
    director:setAnimationInterval(1.0 / 30)
    local screenSize = glView:getFrameSize()
    local designSize = {width = 1136, height = 640}
    local resourceSize = {width = 1136, height = 640}
    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(designSize.width, designSize.height, cc.ResolutionPolicy.FIXED_HEIGHT)
    
    cc.FileUtils:getInstance():addSearchPath("src")
    cc.FileUtils:getInstance():addSearchPath("res")
    cc.FileUtils:getInstance():addSearchPath("res/UI/alpha/VGA")
    cc.FileUtils:getInstance():addSearchPath("res/sound") 
    
    --create scene 
--    local GameScene = require("GameScene")
--    local scene = GameScene.create()

    local LoginScene = require("LoginScene")
    local scene = LoginScene.create()
    
--    gameScene:playBgMusic()
    if cc.Director:getInstance():getRunningScene() then
        cc.Director:getInstance():replaceScene(scene)
    else
        cc.Director:getInstance():runWithScene(scene)
    end
end


local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    error(msg)
end
