#include "lua_cocos2dx_custom_auto.hpp"
#include "CustomClass.h"
#include "MaskSprite.h"
#include "tolua_fix.h"
#include "LuaBasicConversions.h"



int lua_cocos2dx_custom_CustomClass_init(lua_State* tolua_S)
{
    int argc = 0;
    custom::CustomClass* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"ct.CustomClass",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (custom::CustomClass*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_custom_CustomClass_init'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        bool ret = cobj->init();
        tolua_pushboolean(tolua_S,(bool)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "init",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_CustomClass_init'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_custom_CustomClass_helloMsg(lua_State* tolua_S)
{
    int argc = 0;
    custom::CustomClass* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"ct.CustomClass",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (custom::CustomClass*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_custom_CustomClass_helloMsg'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        std::string ret = cobj->helloMsg();
        tolua_pushcppstring(tolua_S,ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "helloMsg",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_CustomClass_helloMsg'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_custom_CustomClass_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"ct.CustomClass",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
            return 0;
        custom::CustomClass* ret = custom::CustomClass::create();
        object_to_luaval<custom::CustomClass>(tolua_S, "ct.CustomClass",(custom::CustomClass*)ret);
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "create",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_CustomClass_create'.",&tolua_err);
#endif
    return 0;
}
int lua_cocos2dx_custom_CustomClass_constructor(lua_State* tolua_S)
{
    int argc = 0;
    custom::CustomClass* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif



    argc = lua_gettop(tolua_S)-1;
    if (argc == 0) 
    {
        if(!ok)
            return 0;
        cobj = new custom::CustomClass();
        cobj->autorelease();
        int ID =  (int)cobj->_ID ;
        int* luaID =  &cobj->_luaID ;
        toluafix_pushusertype_ccobject(tolua_S, ID, luaID, (void*)cobj,"ct.CustomClass");
        return 1;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "CustomClass",argc, 0);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_CustomClass_constructor'.",&tolua_err);
#endif

    return 0;
}

static int lua_cocos2dx_custom_CustomClass_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (CustomClass)");
    return 0;
}

int lua_register_cocos2dx_custom_CustomClass(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"ct.CustomClass");
    tolua_cclass(tolua_S,"CustomClass","ct.CustomClass","cc.Ref",nullptr);

    tolua_beginmodule(tolua_S,"CustomClass");
        tolua_function(tolua_S,"new",lua_cocos2dx_custom_CustomClass_constructor);
        tolua_function(tolua_S,"init",lua_cocos2dx_custom_CustomClass_init);
        tolua_function(tolua_S,"helloMsg",lua_cocos2dx_custom_CustomClass_helloMsg);
        tolua_function(tolua_S,"create", lua_cocos2dx_custom_CustomClass_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(custom::CustomClass).name();
    g_luaType[typeName] = "ct.CustomClass";
    g_typeCast["CustomClass"] = "ct.CustomClass";
    return 1;
}

int lua_cocos2dx_custom_MaskSprite_setMask(lua_State* tolua_S)
{
    int argc = 0;
    custom::MaskSprite* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"ct.MaskSprite",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (custom::MaskSprite*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_custom_MaskSprite_setMask'", nullptr);
        return 0;
    }
#endif

    argc = lua_gettop(tolua_S)-1;
    if (argc == 3) 
    {
        std::string arg0;
        std::string arg1;
        std::string arg2;

        ok &= luaval_to_std_string(tolua_S, 2,&arg0);

        ok &= luaval_to_std_string(tolua_S, 3,&arg1);

        ok &= luaval_to_std_string(tolua_S, 4,&arg2);
        if(!ok)
            return 0;
        cobj->setMask(arg0, arg1, arg2);
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d \n", "setMask",argc, 3);
    return 0;

#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_MaskSprite_setMask'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_custom_MaskSprite_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"ct.MaskSprite",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 1)
        {
            const char* arg0;
            std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp); arg0 = arg0_tmp.c_str();
            if (!ok) { break; }
            custom::MaskSprite* ret = custom::MaskSprite::create(arg0);
            object_to_luaval<custom::MaskSprite>(tolua_S, "ct.MaskSprite",(custom::MaskSprite*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 0)
        {
            custom::MaskSprite* ret = custom::MaskSprite::create();
            object_to_luaval<custom::MaskSprite>(tolua_S, "ct.MaskSprite",(custom::MaskSprite*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "create",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_MaskSprite_create'.",&tolua_err);
#endif
    return 0;
}
int lua_cocos2dx_custom_MaskSprite_testBindingIsOK(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"ct.MaskSprite",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S) - 1;

    if (argc == 0)
    {
        if(!ok)
            return 0;
        custom::MaskSprite::testBindingIsOK();
        return 0;
    }
    CCLOG("%s has wrong number of arguments: %d, was expecting %d\n ", "testBindingIsOK",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_custom_MaskSprite_testBindingIsOK'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_custom_MaskSprite_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (MaskSprite)");
    return 0;
}

int lua_register_cocos2dx_custom_MaskSprite(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"ct.MaskSprite");
    tolua_cclass(tolua_S,"MaskSprite","ct.MaskSprite","cc.Sprite",nullptr);

    tolua_beginmodule(tolua_S,"MaskSprite");
        tolua_function(tolua_S,"setMask",lua_cocos2dx_custom_MaskSprite_setMask);
        tolua_function(tolua_S,"create", lua_cocos2dx_custom_MaskSprite_create);
        tolua_function(tolua_S,"testBindingIsOK", lua_cocos2dx_custom_MaskSprite_testBindingIsOK);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(custom::MaskSprite).name();
    g_luaType[typeName] = "ct.MaskSprite";
    g_typeCast["MaskSprite"] = "ct.MaskSprite";
    return 1;
}
TOLUA_API int register_all_cocos2dx_custom(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,"ct",0);
	tolua_beginmodule(tolua_S,"ct");

	lua_register_cocos2dx_custom_CustomClass(tolua_S);
	lua_register_cocos2dx_custom_MaskSprite(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

