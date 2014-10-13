//
//  CustomClass.cpp
//  cocos2d_libs
//
//  Created by hulefei on 14-10-13.
//
//

#include "CustomClass.h"

USING_NS_CC;

CustomClass::CustomClass(){
    
}

CustomClass::~CustomClass(){
    
}

bool CustomClass::init(){
    return true;
}

std::string CustomClass::helloMsg() {
    return "Hello from CustomClass::sayHello";
}