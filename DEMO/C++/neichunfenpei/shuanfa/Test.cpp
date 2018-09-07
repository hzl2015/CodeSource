#include "StdAfx.h"
#include "MemoryPool.h"
#include "test.h"
template<typename T>
class CMemoryPool;

//CMemoryPool<CTest>* CTest::s_pool = NULL;
CMTMemoryPool<CMemoryPool<CTest>, CThreadLock>* CTest::s_pool = NULL;

void CTest::NewPool()
{
	//s_pool = new CMemoryPool<CTest>;
	s_pool = new CMTMemoryPool<CMemoryPool<CTest>, CThreadLock>;
}

void CTest::DeletePool()
{
	delete s_pool;
	s_pool = NULL;
}
