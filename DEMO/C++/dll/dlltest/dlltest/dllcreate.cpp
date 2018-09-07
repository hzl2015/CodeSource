#define _DLL_SAMPLE

#ifndef _DLL_SAMPLE_H
#include "dll_sample.h"
#endif

#include "stdio.h"
#include <windows.h>
#include<stdlib.h>


// 变量
int DLLData;


//APIENTRY声明DLL函数入口点
BOOL APIENTRY DllMain(HANDLE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		{
			DLLData = 123;
			break;
		}
	case DLL_THREAD_ATTACH:
		{
			break;
		}
	case DLL_THREAD_DETACH:
		{
			break;
		}
	case DLL_PROCESS_DETACH:
		{
			break;
		}
	default:
		break;
	}
	//没return true会打开失败
	return true;
}



void TestDLL(int arg)
{
	printf("DLL output arg %d\n", arg);
}

void DLLClass::Show()
{
	printf("DLLClass show!");
}

//extern "C" _declspec(dllexport) void myFun();
//
//#include "iostream"
//using namespace std;
//void myFun()
//{
//	cout<<"Hello world"<<endl;
//}
//int main()
//{
//	myFun();
//	return 0;
//}