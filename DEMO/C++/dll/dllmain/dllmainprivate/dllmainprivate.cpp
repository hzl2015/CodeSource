#include "../../dlltest/dlltest/dll_sample.h"

#pragma comment(lib, "dllcreate.lib") //��Ҳ��������Ŀ���������ÿ������
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