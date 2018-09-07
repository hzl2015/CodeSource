#include "../../dlltest/dlltest/dll_sample.h"

#pragma comment(lib, "dllcreate.lib") //你也可以在项目属性中设置库的链接
#include "stdio.h"
int main()
{
	TestDLL(123);
	printf("%d ", DLLData);
	CEmpty c;
	c.CEmptyprint();
	DLLClass dc;
	dc.Show();
	return(0);
}