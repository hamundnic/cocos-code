
--------------------------------
-- @module ProtocolAds
-- @extend PluginProtocol
-- @parent_module anysdk

--------------------------------
-- @show adsview
-- @function [parent=#ProtocolAds] showAds 
-- @param self
-- @param #anysdk.AdsType adstype
        
--------------------------------
-- @hide adsview
-- @function [parent=#ProtocolAds] hideAds 
-- @param self
-- @param #anysdk.AdsType adstype
        
--------------------------------
-- @Query the points of player
-- @function [parent=#ProtocolAds] queryPoints 
-- @param self
-- @return float#float ret (return value: float)
        
--------------------------------
-- @Spend the points. Use this method to notify server spend points.
-- @function [parent=#ProtocolAds] spendPoints 
-- @param self
-- @param #int points, points Need spend number of points
        
--------------------------------
-- @get pListener The callback object for Ads result
-- @function [parent=#ProtocolAds] getAdsListener 
-- @param self
-- @return AdsListener#AdsListener ret (return value: anysdk.AdsListener)
        
--------------------------------
-- @Check function the plugin support or not
-- @function [parent=#ProtocolAds] isSupportFunction 
-- @param self
-- @param #string name, the name of function
-- @return bool#bool ret (return value: bool)

--------------------------------
-- @set the Ads listener
-- @for set the Ads listener callback
-- @function [parent=#ProtocolAds] setAdsListener 
-- @param self
-- @param #function function of listener callback
        
return nil
