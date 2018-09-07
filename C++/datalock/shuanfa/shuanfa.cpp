#include "stdafx.h"
#include <iostream>
#include<stdlib.h>
#include <new>
#include <cstring>
#include <vector>
#include <algorithm>
 #include <time.h> 
#include "WHDataLocker.h"

int _tmain(int argc, _TCHAR* argv[])
{
	CCriticalSection				m_CriticalLocker;					
	CWHDataLocker ThreadLock(m_CriticalLocker);
	system("pause");
	return 0;
}



 