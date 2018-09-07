#include "StdAfx.h"
#include "ThreadLock.h"

CThreadLock::CThreadLock()
{
	InitializeCriticalSection(&m_cs);
}

CThreadLock::~CThreadLock()
{
	DeleteCriticalSection(&m_cs);
}

void CThreadLock::Lock()
{
	EnterCriticalSection(&m_cs); 
}

void CThreadLock::Unlock()
{
	LeaveCriticalSection(&m_cs);
}
