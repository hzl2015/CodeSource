#include "stdafx.h"
#include <iostream>
#include<stdlib.h>
#include <new>
#include <windows.h>
#include <cstring>
#include <vector>
#include <algorithm>
#include<cstring>

//#define  max(a,b) ((a)>(b) ? (a):(b))

#ifdef _DEBUG
	#define HAHA printf("haha\n");
#else
	#define HAHA
#endif 

int _tmain(int argc, _TCHAR* argv[])
{
	BYTE a[3][3]={{1,2,1},{1,2,1},{2,3,2}};
	BYTE b[3][3]={0};
	for (BYTE i=0; i<3;i++)
	{
		for (BYTE j=0; j<3; j++)
		{
			std::cout<<a[i][j]<<std::endl;
		}
	}
	memcpy(b,a,sizeof(a));
	for (BYTE i=0; i<3;i++)
	{
		for (BYTE j=0; j<3; j++)
		{
			std::cout<<b[i][j]<<std::endl;
		}
	}
	system("pause");
	return 0;
}



 