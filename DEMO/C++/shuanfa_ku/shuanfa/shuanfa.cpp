// shuanfa.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <map>
#include <vector>
#include <algorithm>
#include <iterator>
#include <stdio.h>
#include <iostream>
#include <string>


int _tmain(int argc, _TCHAR* argv[])
{
#if SHUANFA_CHAZHAO
	std::vector<int> a;
	a.push_back(1);
	a.push_back(4);
	a.push_back(3);

	std::vector<int>::iterator it = std::find(a.begin(),a.end(),9);

	if(it != a.end())
	{
		std::cout<<*it<<std::endl;
	}
	
	int num = std::count(a.begin(),a.end(),4);
	std::cout<<num<<std::endl;
#endif
	std::vector<std::string>  sList;
	sList.push_back("123456");
	sList.push_back("123456");
	sList.push_back("123456");
	find_first_of()


	system("pause");
	return 0;

}



 