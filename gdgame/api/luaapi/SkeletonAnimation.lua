
--------------------------------
-- @module SkeletonAnimation
-- @extend SkeletonRenderer
-- @parent_module sp

--------------------------------
-- @function [parent=#SkeletonAnimation] create 
-- @param self
-- @param #string dataFile
-- @param #string atlasFile
-- @param #float scale
-- @return SkeletonAnimation#SkeletonAnimation ret (return value: sp.SkeletonAnimation)

--------------------------------
-- @function [parent=#SkeletonAnimation] setMix 
-- @param self
-- @param #string str
-- @param #string str
-- @param #float float
        
--------------------------------
-- @function [parent=#SkeletonAnimation] clearTracks 
-- @param self
        
--------------------------------
-- @function [parent=#SkeletonAnimation] clearTrack 
-- @param self
        
--------------------------------
-- @function [parent=#SkeletonAnimation] setAnimation 
-- @param self
-- @param #int trackIndex
-- @param #string name
-- @param #bool loop
        
--------------------------------
-- @function [parent=#SkeletonAnimation] addAnimation 
-- @param self
-- @param #int trackIndex
-- @param #string name
-- @param #bool loop
-- @param #float delay (default = 0)
        
--------------------------------
-- @function [parent=#SkeletonAnimation] registerSpineEventHandler 
-- @param self
-- @param #function eventFunction
        
return nil
