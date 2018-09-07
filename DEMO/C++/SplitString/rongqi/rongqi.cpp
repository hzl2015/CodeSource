// rongqi.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <iterator>
#include <map>
#include <algorithm>

#include <fstream>
#include <cassert>
#include <string>

#include <Windows.h>


using namespace std;


//字符串分割函数
std::vector<std::string> split(std::string str,std::string pattern)
{
	std::string::size_type pos;
	std::vector<std::string> result;
	str+=pattern;//扩展字符串以方便操作
	int size=str.size();

	for(int i=0; i<size; i++)
	{
		pos=str.find(pattern,i);
		if(pos<size)
		{
			std::string s=str.substr(i,pos-i);
			result.push_back(s);
			i=pos+pattern.size()-1;
		}
	}
	return result;
}

string UTF8ToGB(const char* str)
{
	string result;
	WCHAR *strSrc;
	LPSTR szRes;

	//获得临时变量的大小
	int i = MultiByteToWideChar(CP_UTF8, 0, str, -1, NULL, 0);
	strSrc = new WCHAR[i+1];
	MultiByteToWideChar(CP_UTF8, 0, str, -1, strSrc, i);

	//获得临时变量的大小
	i = WideCharToMultiByte(CP_ACP, 0, strSrc, -1, NULL, 0, NULL, NULL);
	szRes = new CHAR[i+1];
	WideCharToMultiByte(CP_ACP, 0, strSrc, -1, szRes, i, NULL, NULL);

	result = szRes;
	delete []strSrc;
	delete []szRes;

	return result;
}


void readTxt(string file)
{
	ifstream infile; 
	infile.open(file.data());   //将文件流对象与文件连接起来 
	assert(infile.is_open());   //若失败,则输出错误消息,并终止程序运行 

	std::string s;
	std::string str;
	map<std::string, int> mp;
	map<std::string , int>::iterator it_find;
	std::string stemp = ";";

	//逐行读入
	while(getline(infile,s))
	{
		str=UTF8ToGB(s.c_str());
		std::vector<std::string>  vString = split(str,stemp);
		for (int i=0; i<vString.size(); i++)
		{
			it_find = mp.find(vString[i]);
			if (it_find != mp.end()){
				it_find->second += 1;
			}else{
				mp.insert(make_pair(vString[i], 1));
			}
		}
		
	}
	infile.close();             //关闭文件输入流 
	cout<<"**********************************************************"<<endl;
	cout<<"麻将名："<<endl;
	cout<<"文件名："<<file<<endl;
	map<std::string, int>::iterator it;
	for (it = mp.begin(); it != mp.end(); it++){
		cout<<it->first<<","<< it->second<<endl;
	}
	cout<<"**********************************************************"<<endl;
	cout<<endl;
	cout<<endl;
}

// wchar_t to string  
void Wchar_tToString(std::string& szDst, wchar_t *wchar)  
{  
	wchar_t * wText = wchar;  
	DWORD dwNum = WideCharToMultiByte(CP_OEMCP,NULL,wText,-1,NULL,0,NULL,FALSE);// WideCharToMultiByte的运用  
	char *psText; // psText为char*的临时数组，作为赋值给std::string的中间变量  
	psText = new char[dwNum];  
	WideCharToMultiByte (CP_OEMCP,NULL,wText,-1,psText,dwNum,NULL,FALSE);// WideCharToMultiByte的再次运用  
	szDst = psText;// std::string赋值  
	delete []psText;// psText的清除  
}  

int _tmain(int argc, _TCHAR* argv[])
{
	assert(argc != 0);   //若失败,则输出错误消息,并终止程序运行 
	for(int i=1; i<argc;i++)
	{
		std::string fileName ;
		Wchar_tToString(fileName, argv[i]);
		readTxt(fileName);
	}
	
	system("pause");
	return 0;
}

