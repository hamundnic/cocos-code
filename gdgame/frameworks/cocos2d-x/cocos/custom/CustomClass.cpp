// CustomClass.cpp
#include "CustomClass.h"

USING_NS_CC;
using namespace custom;

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