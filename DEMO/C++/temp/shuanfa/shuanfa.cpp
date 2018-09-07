#include "stdafx.h"
#include <iostream>
#include<stdlib.h>
#include <new>
#include <afx.h>
#include <windows.h>
#include <cstring>
#include <vector>
#include <algorithm>
 #include <time.h> 
#include<string>

//#define  max(a,b) ((a)>(b) ? (a):(b))

#ifdef _DEBUG
	#define HAHA printf("haha\n");
#else
	#define HAHA
#endif 

void funtemp(BYTE byTemp[3][3])
{
	byTemp[0][0] =1;
	byTemp[2][0] =1;
}

int fuc(int y)
{
	if (y == 0)
	{
		while (1)
		{
			throw y;
		}
	}
	return y;
}

void noMoreMemory()
{
	std::cerr<<"Unable to satisfy requset for memory\n";
	abort();
}
typedef unsigned char       BYTE;
struct CMD_S_TING_DATA
{
	int	cbOutCardCount;
	int	cbOutCardData[4];
};
bool compare_decrease(LONG a,LONG b)
{
	return a>b;   //从大到小的排列
}

struct NULLtest
{
	int	cbOutCardCount;
	int	cbOutCardData;
};
int _tmain(int argc, _TCHAR* argv[])
{
	std::vector<int> vDate;
	vDate.push_back(6);
	vDate.push_back(0);
	vDate.push_back(1);
	vDate.insert(vDate.begin(),5);

	std::sort(vDate.begin(),vDate.end());
	for (int i=0; i<vDate.size(); i++)
	{
		std::cout<< vDate[i]<<std::endl;
	}

	CStringA sPath, sKey, sMsg, sTime, sDate;
	char buffer[MAX_PATH];

	// 得到初始化文件的全路径
	GetModuleFileNameA(NULL, buffer, MAX_PATH);
	sPath = CString(buffer);
	sPath = sPath.Left(sPath.ReverseFind('\\'));
	sPath += "\\Fzmj.ini";

	int cbCtrlCard = 0;
	char strCard[4] = {};
	GetPrivateProfileStringA("CardControl", "SendCard", "0", strCard, MAX_PATH, sPath);
	sscanf(strCard,"%02x", &cbCtrlCard);

	//WritePrivateProfileString("Device", "Name", "PC", "e:\\test2.ini");

	//
	std::vector<int> vRand_shuffle;
	vRand_shuffle.push_back(6);
	vRand_shuffle.push_back(0);
	vRand_shuffle.push_back(1);
	vRand_shuffle.push_back(2);
	vRand_shuffle.push_back(3);
	vRand_shuffle.push_back(4);
	vRand_shuffle.push_back(5);
	vRand_shuffle.push_back(6);
	vRand_shuffle.push_back(7);

	//std::random_shuffle(vRand_shuffle.begin(),vRand_shuffle.end());
	std::sort(vRand_shuffle.begin(),vRand_shuffle.end());
	for (int i=0; i<vRand_shuffle.size(); i++)
	{
		std::cout<< vRand_shuffle[i]<<std::endl;
	}
	std::cout<< "************"<<std::endl;
	std::random_shuffle(vRand_shuffle.begin(),vRand_shuffle.end());
	for (int i=0; i<vRand_shuffle.size(); i++)
	{
		std::cout<< vRand_shuffle[i]<<std::endl;
	}
	std::cout<< "************"<<std::endl;
	//1
	NULLtest *p;
	p = (NULLtest*)malloc(sizeof(NULLtest) * 128);
	ZeroMemory(p,sizeof(NULLtest) * 128);
	NULLtest *temp = p;
	NULLtest tTemp ={1,1};
	*temp++ = tTemp;
	tTemp.cbOutCardCount =2;
	*temp++ = tTemp;
	tTemp.cbOutCardCount =3;
	*temp++ = tTemp;
	tTemp.cbOutCardCount =4;
	*temp++ = tTemp;


	for (int i=0; i<4; i++)
	{
		std::cout<< (*(p +i)).cbOutCardCount<<std::endl;
	}

	NULLtest *pDelete;
	for (int i=0; i<4; i++)
	{
		if (2 == (*(p +i)).cbOutCardCount)
		{
			pDelete = p+i;
			break;
		}
	}


	*pDelete =*(p+3);
	//2
	ZeroMemory(p+3,sizeof(int));
	for (int i=0; i<4; i++)
	{
		if ((p+i)!=NULL)
		{
			std::cout<< (*(p +i)).cbOutCardCount<<std::endl;
		}
	}

	std::cout<< "************"<<std::endl;
	//1
	//BYTE byTemp[3][3]={0};
	//funtemp(byTemp);
	//for(BYTE i=0; i<3;i++)
	//{
	//	for (BYTE j=0; j<3;j++)
	//	{
	//		std::cout<<byTemp[i][j]<<std::endl;
	//	}
	//}
	//2
	std::vector<int> vTemp1;
	std::vector<int> vTemp2;
	vTemp1.push_back(3);
	vTemp2.push_back(1);
	vTemp2.push_back(2);
	vTemp1.insert(vTemp1.end(),vTemp2.begin(),vTemp2.end());//插入
	//vTemp1.assign(vTemp2.begin(),vTemp2.end());//重置
	for(BYTE i=0; i<vTemp1.size();i++)
	{
		std::cout<<vTemp1[i]<<std::endl;
	}
	//3
	vTemp1.pop_back();
	vTemp1.pop_back();
	for(BYTE i=0; i<vTemp1.size();i++)
	{
		std::cout<<vTemp1[i]<<std::endl;
	}
	srand( (unsigned)time( NULL ) ); //时间参数作为种子
	for(int i=0;i<4;i++) 
	{ 
		std::cout<<rand()<<std::endl; 
	} 
	//4
	std::cout<<"35/5="<<35/5<<std::endl;
	std::cout<<"35%5="<<35%5<<std::endl;
	


	int a =5, b=0;
	std::cout<<a<<std::endl;
	max(++a,b);
	std::cout<<a<<std::endl;
	max(++a,b+10);
	std::cout<<a<<std::endl;
	//HAHA

	//try
	//{
	//	std::cout<<1<<std::endl;
	//	fuc(3);
	//	std::cout<<2<<std::endl;
	//	fuc(0);
	//}
	//catch (double)
	//{
	//	std::cerr<<"error of dividing zero.\n"; 
	//}
	if(!0)
	{
			std::cout<<0<<std::endl;
	}
	if(!1)
	{
			std::cout<<1<<std::endl;
	}
	if(!2)
	{
			std::cout<<2<<std::endl;
	}


	CMD_S_TING_DATA tTing[4];
	ZeroMemory(tTing,sizeof(tTing));
	tTing[0].cbOutCardCount = 1;
	tTing[1].cbOutCardCount = 1;
	tTing[2].cbOutCardCount = 1;
	tTing[3].cbOutCardCount = 1;
	tTing[0].cbOutCardData[0] = 1;
	tTing[1].cbOutCardData[0] = 1;
	tTing[2].cbOutCardData[0] = 1;
	tTing[3].cbOutCardData[0] = 1;
	for (BYTE i=0; i<4; i++)
	{
		std::cout<<tTing[i].cbOutCardCount<< tTing[i].cbOutCardData[0]<<std::endl;
	}
	std::cout<<std::endl;
	ZeroMemory(&tTing[2],sizeof(tTing[2]));
	//memset(&(tTing[2]),0,sizeof(tTing[2]));
	for (BYTE i=0; i<4; i++)
	{
		std::cout<<tTing[i].cbOutCardCount<< tTing[i].cbOutCardData[0]<<std::endl;
	}
	std::vector<int> v08;
	v08.push_back(3);
	v08.push_back(2);
	v08.push_back(4);
	std::sort(v08.begin(),v08.end(),compare_decrease);
	for (BYTE i=0; i<v08.size(); i++)
	{
		std::cout<<v08[i]<<std::endl;
	}

	system("pause");
	return 0;
}



 