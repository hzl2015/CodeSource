#include "stdafx.h"
#include <stdlib.h>

//ÄÚ´æ·ÖÅä
#define  NEICHUNFEIPEI 0
void testFun()
{
	int i;
	const int nLoop = 10;
	const int nCount = 10000;

	for(int j = 0; j<nLoop; ++j)
	{
		typedef CTest* LPTest;
		LPTest arData[nCount];
		for(i=0;i <nCount; ++i)
		{
			arData[i] = new CTest;
		}

		for(i=0;i <nCount; ++i)
		{
			delete arData[i];
		}
	}
}

int _tmain(int argc, _TCHAR* argv[])
{
#if NEICHUNFEIPEI
	{
		unsigned int dwStartTickCount = GetTickCount();

		CTest::NewPool();

		testFun();

		CTest::DeletePool();

		cout << "total cost" << GetTickCount() - dwStartTickCount << endl;
	}
#endif
	

	system("pause");
	return 0;
}



 