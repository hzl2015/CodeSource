#include "stdafx.h"
#include <iostream>
#include<stdlib.h>
#include <new>

#define  max(a,b) ((a)>(b) ? (a):(b))

#ifdef _DEBUG
	#define HAHA printf("haha\n");
#else
	#define HAHA
#endif 

int fuc(int y)
{
	if (y == 0)
	{
		while (1)
		{
			throw y;
		}
	}
	return y;
}

void noMoreMemory()
{
	std::cerr<<"Unable to satisfy requset for memory\n";
	abort();
}

int _tmain(int argc, _TCHAR* argv[])
{
	int a =5, b=0;
	std::cout<<a<<std::endl;
	max(++a,b);
	std::cout<<a<<std::endl;
	max(++a,b+10);
	std::cout<<a<<std::endl;
	//HAHA

	
	system("pause");
	return 0;
}



 