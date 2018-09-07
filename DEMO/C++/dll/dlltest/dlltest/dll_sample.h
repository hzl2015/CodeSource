#ifndef _DLL_SAMPLE_H
#define _DLL_SAMPLE_H

// 如果定义了C++编译器，那么声明为C链接方式
#ifdef __cplusplus
extern "C" {
#endif

	// 通过宏来控制是导入还是导出
#ifdef _DLL_SAMPLE
#define DLL_SAMPLE_API __declspec(dllexport)
#else
#define DLL_SAMPLE_API __declspec(dllimport)
#endif


// 导出/导入函数声明
DLL_SAMPLE_API void TestDLL(int);

// 导出/导入变量声明
DLL_SAMPLE_API extern int DLLData;

// 导出/导入变量声明
class DLL_SAMPLE_API  DLLClass
{
public:
	void Show();
};


#ifndef  DLLTEST
	#include "Empty.h"
#endif // ! DLLTEST	


//#undef DLL_SAMPLE_API

#ifdef __cplusplus
}
#endif

#endif