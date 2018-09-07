#include "StdAfx.h"
#include "Empty.h"

CEmpty::CEmpty()
{
}
CEmpty::CEmpty(const CEmpty& rhs)
{
	
}

CEmpty::~CEmpty(void)
{

}

CEmpty& CEmpty::operator=(const CEmpty& rhs)
{
	return *this;
}


CEmpty* CEmpty::operator &()
{
	return this;
}


const CEmpty* CEmpty::operator &() const
{
	return this;
}

