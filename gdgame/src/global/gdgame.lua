require "Cocos2d"
gd = gd or {}
gd.loadObject = cc.Sprite:create("res/UI/alpha/VGA/logo.jpg")
gd.loadObject:setPosition(300,300)

function getJsonstring(url)
    local jsonstring = "{\"k2\":\"v2\"}"
    return jsonstring
end

--function gd.load()
--    print("load")
--    cc.Director:getInstance():getRunningScene():addChild(gd.loadObject)
--    cc.Director:getInstance():getRunningScene():setEnabled(false)
--end
--
--function gd.unload()
--    print("unload")
--    gd.loadObject:removeFromParentAndCleanup()
--    cc.Director:getInstance():getRunningScene():setEnabled(true)
--end


