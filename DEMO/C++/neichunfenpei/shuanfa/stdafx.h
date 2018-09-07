// stdafx.h : include file for standard system include files,
// or project specific include files that are used frequently, but
// are changed infrequently
//

#pragma once

#include "targetver.h"
#include <iostream>
#include <new>
#include <stdio.h>
#include <tchar.h>
#include <stddef.h>
#include <Windows.h>


template<typename POOLTYPE, typename LOCKTYPE>
class CMTMemoryPool;

class CTest;

#include "MemoryPool.h"
#include "ThreadLock.h"
#include "MTMemoryPool.h"
#include "test.h"





// TODO: reference additional headers your program requires here
