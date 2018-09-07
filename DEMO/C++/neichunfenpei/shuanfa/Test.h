#pragma once
#include "stdafx.h"
#include "MemoryPool.h"

class CTest
{
public:
	int m_n;
	int m_n1;

	void* operator new(size_t size)
	{
		void* p = s_pool->Alloc(size);
		return p;
	}

	void operator delete(void* p, size_t size)
	{
		s_pool->Free(p);
	}

	static void NewPool();
	static void DeletePool();

	//static CMemoryPool<CTest>* s_pool;
	static CMTMemoryPool<CMemoryPool<CTest>, CThreadLock>* s_pool;

};
