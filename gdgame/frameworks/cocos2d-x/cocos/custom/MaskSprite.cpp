//
//  MaskSprite.cpp
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
#include "MaskSprite.h"

USING_NS_CC;
using namespace custom;

void MaskSprite::setMask(const std::string &maskFile,const std::string& vShaderFilename, const std::string& fShaderFilename)
{
	auto glProgram = GLProgram::createWithFilenames(vShaderFilename, fShaderFilename);
	auto glProgramState = GLProgramState::getOrCreateWithGLProgram(glProgram);
	this->setGLProgramState(glProgramState);
	glProgramState->setUniformTexture("u_texture1", this->getTexture());
	auto texture = Director::getInstance()->getTextureCache()->addImage(maskFile);
	glProgramState->setUniformTexture("u_texture2", texture);
}

MaskSprite* MaskSprite::create(const char* fileName)
{
	MaskSprite* maskSprite = new MaskSprite();
	if(maskSprite && maskSprite->initWithFile(fileName))
	{
		maskSprite->autorelease();
		return maskSprite;
	}
	CC_SAFE_DELETE(maskSprite);
	return nullptr;
}

void MaskSprite::testBindingIsOK()
{
	CCLOG("this class is binded");
}