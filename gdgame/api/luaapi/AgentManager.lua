
--------------------------------
-- @module AgentManager
-- @parent_module anysdk

--------------------------------
-- @Get Social plugin
-- @function [parent=#AgentManager] getSocialPlugin 
-- @param self
-- @return ProtocolSocial#ProtocolSocial ret (return value: anysdk.ProtocolSocial)
        
--------------------------------
-- @unload the plugins
-- @function [parent=#AgentManager] unloadALLPlugin 
-- @param self
        
--------------------------------
-- @load the plugins
-- @function [parent=#AgentManager] loadALLPlugin 
-- @param self
        
--------------------------------
-- @Get User plugin
-- @function [parent=#AgentManager] getUserPlugin 
-- @param self
-- @return ProtocolUser#ProtocolUser ret (return value: anysdk.ProtocolUser)
        
--------------------------------
-- @the init of AgentManager
-- @function [parent=#AgentManager] init 
-- @param self
-- @param #string appKey, the appKey of plugin-x
-- @param #string appSecret, the appSecret of plugin-x
-- @param #string privateKey, the privateKey of plugin-x
-- @param #string oauthLoginServer, the url of oauthLoginServer
        
--------------------------------
-- @Get Ads plugin
-- @function [parent=#AgentManager] Get Ads plugin 
-- @param self
-- @return ProtocolAds#ProtocolAds ret (return value: anysdk.ProtocolAds)
        
--------------------------------
-- @Get Push plugin
-- @function [parent=#AgentManager] getPushPlugin 
-- @param self
-- @return ProtocolPush#ProtocolPush ret (return value: anysdk.ProtocolPush)
        
--------------------------------
-- @for Get IAP plugin
-- @function [parent=#AgentManager] getIAPPlugin 
-- @param self
-- @return table#table ret (return value: {"key1"=anysdk.ProtocolIAP,..}), if IAP plugin exist ,return value is IAP plugin.else return value is null pointer.

--------------------------------
-- @Get Share plugin
-- @function [parent=#AgentManager] getSharePlugin 
-- @param self
-- @return ProtocolShare#ProtocolShare ret (return value: anysdk.ProtocolShare)
        
--------------------------------
-- @Get Analytics plugin
-- @function [parent=#AgentManager] getAnalyticsPlugin 
-- @param self
-- @return ProtocolAnalytics#ProtocolAnalytics ret (return value: anysdk.ProtocolAnalytics)
        
--------------------------------
-- @Get channel ID
-- @function [parent=#AgentManager] getChannelId 
-- @param self
-- @return string#string ret (return value: string)
        
--------------------------------
-- @for Destory the instance of AgentManager
-- @function [parent=#AgentManager] endManager 
-- @param self
        
--------------------------------
-- @Get singleton of AgentManager
-- @function [parent=#AgentManager] getInstance 
-- @param self
-- @return AgentManager#AgentManager ret (return value: anysdk.AgentManager)
        
return nil
