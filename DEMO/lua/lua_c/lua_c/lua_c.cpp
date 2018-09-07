// lua_c.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <lua.hpp>  
#include <iostream>  
#include <string>
#include <sstream> 


/*��Lua����Ҫ�Ŀ�*/  
#pragma comment(lib,"lua53.lib")

extern "C"  
{  
#include <lua.h>  
#include <lauxlib.h>
#include <lualib.h>  
}  

std::string stackDump(lua_State *_luaState)
{
	int stackSize = lua_gettop(_luaState);

	std::string allInfo;
	for (int index = 1;index <= stackSize;index++)
	{
		int t = lua_type(_luaState, index);
		std::string strInfo;
		switch (t)
		{
		case LUA_TSTRING: 
			{
				strInfo = lua_tostring(_luaState, index);   
				break;
			}
		case LUA_TBOOLEAN:
			{
				strInfo = lua_toboolean(_luaState, index) ? "true" : "false";
				break;
			}
		case LUA_TNUMBER:
			{
				lua_Number result = lua_tonumber(_luaState, index);
				std::stringstream ss;
				ss << result;
				ss >> strInfo;
				break;
			}
		default:
			{
				strInfo = lua_typename(_luaState, index);
				break;
			}
		};
		allInfo = allInfo + strInfo.c_str() + "\n";
		printf("%s\n",strInfo.c_str());
	}
	return allInfo;
}

int _tmain(int argc, _TCHAR* argv[])  
{  
	lua_State *L=luaL_newstate(); /*����һ�����������*/  
	luaL_openlibs(L);             /*�����е�Lua��*/  

	std::string filepath = "SSSGameLogic.lua";
//	luaL_loadfile(L,"script.lua"); /*����Lua�ű��ļ�*/
	int err = luaL_loadfile(L, filepath.c_str()) || lua_pcall(L, 0, LUA_MULTRET, 0);
	if (err != 0)
	{
		std::string info = stackDump(L);
		//errorHandler(info);
	}

	lua_pcall(L,0,0,0); /*ִ��Lua�ű�*/  
	lua_close(L);       /*�رվ��*/  
	system("pause");  
	return 0;  
} 

