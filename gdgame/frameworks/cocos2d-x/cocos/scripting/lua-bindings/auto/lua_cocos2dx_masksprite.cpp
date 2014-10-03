#include "lua_cocos2dx_masksprite.hpp"
#include "MaskSprite.h"
#include "tolua_fix.h"
#include "LuaBasicConversions.h"



int lua_cocos2dx_masksprite_MaskSprite_setMask(lua_State* tolua_S)
{
    int argc = 0;
    MaskSprite* cobj = nullptr;
    bool ok  = true;

#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif


#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertype(tolua_S,1,"MaskSprite",0,&tolua_err)) goto tolua_lerror;
#endif

    cobj = (MaskSprite*)tolua_tousertype(tolua_S,1,0);

#if COCOS2D_DEBUG >= 1
    if (!cobj) 
    {
        tolua_error(tolua_S,"invalid 'cobj' in function 'lua_cocos2dx_masksprite_MaskSprite_setMask'", nullptr);
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
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_masksprite_MaskSprite_setMask'.",&tolua_err);
#endif

    return 0;
}
int lua_cocos2dx_masksprite_MaskSprite_create(lua_State* tolua_S)
{
    int argc = 0;
    bool ok  = true;
#if COCOS2D_DEBUG >= 1
    tolua_Error tolua_err;
#endif

#if COCOS2D_DEBUG >= 1
    if (!tolua_isusertable(tolua_S,1,"MaskSprite",0,&tolua_err)) goto tolua_lerror;
#endif

    argc = lua_gettop(tolua_S)-1;

    do 
    {
        if (argc == 1)
        {
            const char* arg0;
            std::string arg0_tmp; ok &= luaval_to_std_string(tolua_S, 2, &arg0_tmp); arg0 = arg0_tmp.c_str();
            if (!ok) { break; }
            MaskSprite* ret = MaskSprite::create(arg0);
            object_to_luaval<MaskSprite>(tolua_S, "MaskSprite",(MaskSprite*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    do 
    {
        if (argc == 0)
        {
            MaskSprite* ret = MaskSprite::create();
            object_to_luaval<MaskSprite>(tolua_S, "MaskSprite",(MaskSprite*)ret);
            return 1;
        }
    } while (0);
    ok  = true;
    CCLOG("%s has wrong number of arguments: %d, was expecting %d", "create",argc, 0);
    return 0;
#if COCOS2D_DEBUG >= 1
    tolua_lerror:
    tolua_error(tolua_S,"#ferror in function 'lua_cocos2dx_masksprite_MaskSprite_create'.",&tolua_err);
#endif
    return 0;
}
static int lua_cocos2dx_masksprite_MaskSprite_finalize(lua_State* tolua_S)
{
    printf("luabindings: finalizing LUA object (MaskSprite)");
    return 0;
}

int lua_register_cocos2dx_masksprite_MaskSprite(lua_State* tolua_S)
{
    tolua_usertype(tolua_S,"MaskSprite");
    tolua_cclass(tolua_S,"MaskSprite","MaskSprite","cc.Sprite",nullptr);

    tolua_beginmodule(tolua_S,"MaskSprite");
        tolua_function(tolua_S,"setMask",lua_cocos2dx_masksprite_MaskSprite_setMask);
        tolua_function(tolua_S,"create", lua_cocos2dx_masksprite_MaskSprite_create);
    tolua_endmodule(tolua_S);
    std::string typeName = typeid(MaskSprite).name();
    g_luaType[typeName] = "MaskSprite";
    g_typeCast["MaskSprite"] = "MaskSprite";
    return 1;
}
TOLUA_API int register_all_cocos2dx_masksprite(lua_State* tolua_S)
{
	tolua_open(tolua_S);
	
	tolua_module(tolua_S,nullptr,0);
	tolua_beginmodule(tolua_S,nullptr);

	lua_register_cocos2dx_masksprite_MaskSprite(tolua_S);

	tolua_endmodule(tolua_S);
	return 1;
}

