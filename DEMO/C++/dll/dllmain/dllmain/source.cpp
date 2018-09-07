#include"iostream"
#include "windows.h"
#include "time.h"
using namespace std;

typedef void (*DllFun)();
int main()
{

	HINSTANCE hdll;
	hdll = LoadLibrary("dllcreate.dll");
	if(hdll == NULL)
	{
		FreeLibrary(hdll);
		cout<<"Dll loaded is fail..."<<endl;
		getchar();
		return -1;
	}
	DllFun myFun1;
	myFun1 = (DllFun)GetProcAddress(hdll,"TestDLL");
	if(myFun1 == NULL)
	{
		FreeLibrary(hdll);
		cout<<"DLLaddress loaded is fail..."<<endl;
		getchar();
		return -1;
	}
	myFun1();
	int temp = 0;
	 temp =*(int *) GetProcAddress(hdll, "DLLData");

	std::cout<<temp<<endl;

	std::cin.get();
	FreeLibrary(hdll);
	return 0;
}

//#include"iostream"
//#include "windows.h"
//#include "time.h"
//using namespace std;
//
//typedef void (*DllFun)();
//int main()
//{
//
//	HINSTANCE hdll;
//	hdll = LoadLibrary("dllcreate.dll");
//	if(hdll == NULL)
//	{
//		FreeLibrary(hdll);
//		cout<<"Dll loaded is fail..."<<endl;
//		getchar();
//		return -1;
//	}
//	DllFun myFun1;
//	myFun1 = (DllFun)GetProcAddress(hdll,"myFun");
//	if(myFun1 == NULL)
//	{
//		FreeLibrary(hdll);
//		cout<<"DLLaddress loaded is fail..."<<endl;
//		getchar();
//		return -1;
//	}
//	myFun1();
//	FreeLibrary(hdll);
//	return 0;
//}
