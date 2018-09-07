#include "StdAfx.h"
#include "MTMemoryPool.h"

//template<typename POOLTYPE, typename LOCKTYPE>
//void* CMTMemoryPool<POOLTYPE,LOCKTYPE>::Alloc(unsigned int size)
// {
//	 void* p = NULL;
//	 m_lock.Lock();
//	 p = m_pool.Alloc(size);
//	 m_lock.Unlock();
//
//	 return p;
// }
//
//template<typename POOLTYPE, typename LOCKTYPE>
//void CMTMemoryPool<POOLTYPE,LOCKTYPE>::Free(void* p)
// {
//	 m_lock.Lock();
//	 m_pool.Free(p);
//	 m_lock.Unlock();    
// }
