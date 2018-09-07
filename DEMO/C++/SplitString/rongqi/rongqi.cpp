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


//�ַ����ָ��
std::vector<std::string> split(std::string str,std::string pattern)
{
	std::string::size_type pos;
	std::vector<std::string> result;
	str+=pattern;//��չ�ַ����Է������
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

	//�����ʱ�����Ĵ�С
	int i = MultiByteToWideChar(CP_UTF8, 0, str, -1, NULL, 0);
	strSrc = new WCHAR[i+1];
	MultiByteToWideChar(CP_UTF8, 0, str, -1, strSrc, i);

	//�����ʱ�����Ĵ�С
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
	infile.open(file.data());   //���ļ����������ļ��������� 
	assert(infile.is_open());   //��ʧ��,�����������Ϣ,����ֹ�������� 

	std::string s;
	std::string str;
	map<std::string, int> mp;
	map<std::string , int>::iterator it_find;
	std::string stemp = ";";

	//���ж���
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
	infile.close();             //�ر��ļ������� 
	cout<<"**********************************************************"<<endl;
	cout<<"�齫����"<<endl;
	cout<<"�ļ�����"<<file<<endl;
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
	DWORD dwNum = WideCharToMultiByte(CP_OEMCP,NULL,wText,-1,NULL,0,NULL,FALSE);// WideCharToMultiByte������  
	char *psText; // psTextΪchar*����ʱ���飬��Ϊ��ֵ��std::string���м����  
	psText = new char[dwNum];  
	WideCharToMultiByte (CP_OEMCP,NULL,wText,-1,psText,dwNum,NULL,FALSE);// WideCharToMultiByte���ٴ�����  
	szDst = psText;// std::string��ֵ  
	delete []psText;// psText�����  
}  

int _tmain(int argc, _TCHAR* argv[])
{
	assert(argc != 0);   //��ʧ��,�����������Ϣ,����ֹ�������� 
	for(int i=1; i<argc;i++)
	{
		std::string fileName ;
		Wchar_tToString(fileName, argv[i]);
		readTxt(fileName);
	}
	
	system("pause");
	return 0;
}

