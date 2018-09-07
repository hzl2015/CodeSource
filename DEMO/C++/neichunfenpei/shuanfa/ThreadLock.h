#pragma once
#include "stdafx.h"

class CThreadLock
{
public:
	CThreadLock();
	~CThreadLock();

	void Lock();
	void Unlock();

protected:
	CRITICAL_SECTION m_cs;
};