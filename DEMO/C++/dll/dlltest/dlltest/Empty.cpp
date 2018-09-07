#include "Empty.h"
#include "stdio.h"

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

void CEmpty::CEmptyprint()
{
	printf("CEmptyprint\n" );
}
