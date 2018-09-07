// rongqi.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <io.h> 
#include <stdlib.h>
#include <iostream>
#include <fstream>
#include <sstream>
#include <stdio.h>

#include <Windows.h>
#include <string>
#include <ctime>
#include <vector>
//using namespace std;

void Wchar_tToString(std::string& szDst, wchar_t *wchar)  
{  
	wchar_t * wText = wchar;  
	int dwNum = WideCharToMultiByte(CP_OEMCP,NULL,wText,-1,NULL,0,NULL,FALSE);// WideCharToMultiByte的运用  
	char *psText; // psText为char*的临时数组，作为赋值给std::string的中间变量  
	psText = new char[dwNum];  
	WideCharToMultiByte (CP_OEMCP,NULL,wText,-1,psText,dwNum,NULL,FALSE);// WideCharToMultiByte的再次运用  
	szDst = psText;// std::string赋值  
	delete []psText;// psText的清除  
} 

std::string ToUTF8(const wchar_t* buffer, int len)    
{    
	int size = ::WideCharToMultiByte(CP_UTF8, 0, buffer, len, NULL, 0, NULL, NULL);    
	if (size == 0)    
		return "";    
	std::string newbuffer;    
	newbuffer.resize(size);    
	::WideCharToMultiByte(CP_UTF8, 0, buffer, len,    
		const_cast<char*>(newbuffer.c_str()), size, NULL, NULL);    

	return newbuffer;    
}   

std::string ToUTF8(const std::wstring& str)    
{    
	return ToUTF8(str.c_str(), (int) str.size());    
}   
std::string WChar2Ansi(LPCWSTR pwszSrc)  
{  
	int nLen = WideCharToMultiByte(CP_ACP, 0, pwszSrc, -1, NULL, 0, NULL, NULL);  

	if (nLen<= 0) return std::string("");  

	char* pszDst = new char[nLen];  
	if (NULL == pszDst) return std::string("");  

	WideCharToMultiByte(CP_ACP, 0, pwszSrc, -1, pszDst, nLen, NULL, NULL);  
	pszDst[nLen -1] = 0;  

	std::string strTemp(pszDst);  
	delete [] pszDst;  

	return strTemp;  
}  

std::string ws2s(std::wstring& inputws)
{ 
	return WChar2Ansi(inputws.c_str()); 
}  
std::wstring Ansi2WChar(LPCSTR pszSrc, int nLen)  

{  
	int nSize = MultiByteToWideChar(CP_ACP, 0, (LPCSTR)pszSrc, nLen, 0, 0);  
	if(nSize <= 0) return NULL;  

	WCHAR *pwszDst = new WCHAR[nSize+1];  
	if( NULL == pwszDst) return NULL;  

	MultiByteToWideChar(CP_ACP, 0,(LPCSTR)pszSrc, nLen, pwszDst, nSize);  
	pwszDst[nSize] = 0;  

	if( pwszDst[0] == 0xFEFF) // skip Oxfeff  
		for(int i = 0; i < nSize; i ++)   
			pwszDst[i] = pwszDst[i+1];  

	std::wstring wcharString(pwszDst);  
	delete pwszDst;  

	return wcharString;  
}  

std::wstring s2ws(const std::string& s){ return Ansi2WChar(s.c_str(),s.size());}  


#define FILEADD 0  
#define STAREAM 0
#define RENAME 0
#define READ_WRITE 0
#define DIR 0


int _tmain(int argc, _TCHAR* argv[])
{
#if FILEADD
	int a = 99;
//0000000000000000000000000000000000000000000000000000000000
	//char
	char pId[1024] = {0};
	std::string  stempId;
	sprintf_s(pId,"a = %d",a);
	stempId.append(pId);
	std::cout<<stempId<<std::endl;

	//wchar
	wchar_t pId2[1024] = {0};
	std::string  stempId2;
	swprintf_s(pId2,_T("a = %d"),a);
	Wchar_tToString(stempId2, pId2);
	std::cout<<stempId2<<std::endl;

//111111111111111111111111111111111111111111111111111111111111111
	
	time_t now_time;  //时间戳：秒
	now_time = time(NULL); 

	tm tmlocaltime; //转为本地时间  
	localtime_s(&tmlocaltime,&now_time); 

	char cTemp[128] = {0};//格式化
	strftime(cTemp, 64, "%Y-%m-%d_%H-%M-%S", &tmlocaltime);

	std::string sTime;//名字扩展
	sTime = cTemp;
	sTime += ".txt";


	std::fstream location_out;
	location_out.open(sTime.c_str(), std::ios::out |std::ios::app);  //以写入和在文件末尾添加的方式打开.txt文件，没有的话就创建该文件。


	//输入 char* 
	char * cpData = "haha"; 
	if (location_out.is_open())
	{
		location_out<<cpData<<std::endl;
	}

	//输入 wchar_t* 
	//宽字节输入会错误
	wchar_t * wcpData = _T("測試"); 
	std::string sTemp1;
	Wchar_tToString(sTemp1, wcpData);
	if (location_out.is_open())
	{
		location_out<<wcpData<<std::endl;
		location_out<<sTemp1<<std::endl;
	}

	//输入 string
	std::string sData= "測試 haha"; 
	if (location_out.is_open())
	{
		location_out<<sData<<std::endl;
	}


	if (location_out.is_open())
	{
		location_out.close();
	}
//22222222222222222222222222222222222222222222222222222222
//文本中部分数据位utf8，保存的文本数据就是utf8

	std::ofstream test_file;    
	test_file.open("test.txt", std::ios::out | std::ios::binary);    

 

	std::string a1 = "ssdf";
	test_file << a1; 

	std::wstring text =    
		L"中文字符";    
	std::string outtext = ToUTF8(text); 
	test_file << outtext;    
	   
	test_file.close();  

#endif

#if STAREAM
	std::stringstream sTemp;

	sTemp << "haha1\n";
	sTemp << "xx\n";

	std::cout<< sTemp.str() <<std::endl;
	std::cout<< sTemp.tellp() <<std::endl;
	sTemp.clear();
	std::cout<< sTemp.tellp() <<std::endl;
	


	std::ofstream test_file;
	std::string sFileName = "./test.txt";

	test_file.open(sFileName.c_str(), std::ios::out);    

	if (test_file.is_open())
	{
		std::string sTemp2 = sTemp.str();
		sTemp.str("");
		sTemp.clear();
		test_file << sTemp2; 
		test_file.close();
	}
	  
#endif

#if DIR

	time_t currentTime = time(0);  
	struct tm *p;  
	p = localtime(&currentTime);  
	std::cout << p->tm_hour << std::endl;  
	std::cout << p->tm_min << std::endl;  
	std::cout << p->tm_sec << std::endl;  


	//文件夹
	time_t now_time;  //时间戳：秒
	now_time = time(NULL); 

	tm tmlocaltime; //转为本地时间  
	localtime_s(&tmlocaltime,&now_time); 

	char cTemp[128] = {0};//格式化
	strftime(cTemp, 64, "%Y_%m_%d_%H-%M-%S", &tmlocaltime);


	std::string sTime;//名字扩展
	sTime = cTemp;

	std::wstring sDirName = s2ws(sTime);
	if(_access(sTime.c_str(),0)==-1)
	{
		std::cout<<"no exit"<<std::endl;
		CreateDirectory(sDirName.c_str(),NULL);
	}
	else
	{
		std::cout<<"exit"<<std::endl;
	}
	
	
	std::stringstream sTemp;

	sTemp << "haha1\n";
	sTemp << "xx\n";

	std::cout<< sTemp.str() <<std::endl;


	std::ofstream test_file;
	std::string sFileName  = "/";
	sFileName = sFileName + "test3.txt";
	sFileName = sTime + sFileName;

	test_file.open(sFileName.c_str(), std::ios::out);    

	std::string sTemp2 = sTemp.str();
	test_file << sTemp2; 
	sTemp.str("");
	//test_file << sTemp.str() ;


	test_file.close();  
#endif

#if RENAME
	std::stringstream sTemp;

	sTemp << "haha\n";
	sTemp << "xx\n";

	std::cout<< sTemp.str() <<std::endl;


	std::ofstream test_file; 
	std::string sFileName = "test.txt";
	std::string sFileName2 = "test1.txt";
	test_file.open("test.txt", std::ios::out);    

	if (test_file.is_open())
	{
		test_file << sTemp.str() ; 
		test_file.close(); 
		if (!rename(sFileName.c_str(), sFileName2.c_str()))  
		{  
			std::cout << "rename success "<< std::endl;  
		}  
		else  
		{  
			std::cout << "rename error "<< std::endl;  
		}  

	}
	
#endif

#if READ_WRITE
	std::stringstream sTemp;

	sTemp << "haha\n";
	sTemp << "xx\n";

	std::cout<< sTemp.str() <<std::endl;


	std::ofstream test_file; 
   
	test_file.open("test.txt", std::ios::out);    

	if (test_file.is_open())
	{
		test_file << sTemp.str() ;
		test_file<<std::flush;
		test_file.seekp(0,std::ios::beg);
		//test_file << "return{";
		test_file.close(); 
	}

#endif
	
	return 0;
}

