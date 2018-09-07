#ifndef EMPTY_FILE
#define EMPTY_FILE

#pragma once

#include "dll_sample.h"
enum
{
};


#pragma pack(push,1)

#pragma pack(pop)

class DLL_SAMPLE_API CEmpty
{
public:
	CEmpty();
	CEmpty(const CEmpty& rhs);

	~CEmpty(void);
	
	CEmpty& operator=(const CEmpty& rhs);

	CEmpty* operator&();
	const CEmpty* operator&() const;

	void CEmptyprint();
private:
		
};

#endif