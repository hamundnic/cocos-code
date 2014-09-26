
require "Cocos2d"

-- cclog
local cclog = function(...)
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
    
    ----------------
    -- run
    local director = cc.Director:getInstance()
    local glView   = director:getOpenGLView()
    if nil == glView then
        glView = cc.GLView:createWithRect("Lua Tests", cc.rect(0,0,900,640))
        director:setOpenGLView(glView)
    end
    
    --turn on display FPS
    director:setDisplayStats(true)
    director:setAnimationInterval(1.0 / 60)
    local screenSize = glView:getFrameSize()
    local designSize = {width = 480, height = 320}
    if screenSize.height > 320 then
        local resourceSize = {width = 960, height = 640}
        cc.Director:getInstance():setContentScaleFactor(resourceSize.height/designSize.height)
    end
    
    cc.FileUtils:getInstance():addSearchPath("src")
    cc.FileUtils:getInstance():addSearchPath("res")
    cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(designSize.width, designSize.height, cc.ResolutionPolicy.FIXED_HEIGHT)
    
    --create scene 
--    local scene = require("mainMenu")
--    local gameScene = scene.create()
--    if cc.Director:getInstance():getRunningScene() then
--        cc.Director:getInstance():replaceScene(gameScene)
--    else
--        cc.Director:getInstance():runWithScene(gameScene)
--    end

    require "src/mainMenu"
    local scene = cc.Scene:create()
    scene:addChild(CreateTestMenu())
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
