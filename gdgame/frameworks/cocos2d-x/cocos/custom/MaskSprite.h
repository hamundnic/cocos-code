//
//  MaskSprite.h
//  gdgame
//
//  Created by Mr.Star on 14-10-3.
//
//
//
//                       _oo0oo_
//                      o8888888o
//                      88" . "88
//                      (| -_- |)
//                      0\  =  /0
//                    ___/`---'\___
//                  .' \\|     |// '.
//                 / \\|||  :  |||// \
//                / _||||| -:- |||||- \
//               |   | \\\  -  /// |   |
//               | \_|  ''\---/''  |_/ |
//               \  .-\__  '-'  ___/-. /
//             ___'. .'  /--.--\  `. .'___
//          ."" '<  `.___\_<|>_/___.' >' "".
//         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
//         \  \ `_.   \_ __\ /__ _/   .-` /  /
//     =====`-.____`.___ \_____/___.-`___.-'=====
//                       `=---='
//
//
//     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
//               佛祖保佑         永无BUG
//
//
#ifndef __gdgame__MaskSprite__
#define __gdgame__MaskSprite__

#include "cocos2d.h"

namespace custom {

class MaskSprite : public cocos2d::Sprite
{
public:
	CREATE_FUNC(MaskSprite);
	void setMask(const std::string &maskFile,const std::string& vShaderFilename, const std::string& fShaderFilename);
	static MaskSprite* create(const char* fileName);
	static void testBindingIsOK();
};

} //namespace cocos2d
#endif /* defined(__gdgame__MaskSprite__) */
