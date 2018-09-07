// shuanfa.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <map>
#include <vector>
#include <algorithm>
#include <iterator>
#include <stdio.h>
#include <iostream>

#define SHUANFA_CHAZHAO 0
#define SHUANFA_XIE 0
#define SHUANFA_PAIXU 0


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


#if SHUANFA_XIE
	std::vector<int> first (5,10);        //  first: 10 10 10 10 10  
	std::vector<int> second (5,33);       // second: 33 33 33 33 33  
	std::vector<int> a;
	a.push_back(1);
	a.push_back(4);
	a.push_back(3);
	std::vector<int>::iterator it;  
	//交换范围内的数据
	std::swap_ranges(first.begin()+1, first.end()-2, a.begin());  

	// print out results of swap:  
	std::cout << " first contains:";  
	for (it=first.begin(); it!=first.end(); ++it)  
		std::cout << " " << *it;  

	std::cout << "\nsecond contains:";  
	for (it=second.begin(); it!=second.end(); ++it)  
		std::cout << " " << *it;  
	//充满
	std::fill(a.begin(),a.end(),1);
	for (it=a.begin(); it!=a.end(); ++it)  
		std::cout << " " << *it;  

	std::cout << std::endl;  

#endif

#if SHUANFA_PAIXU
	std::vector<int> a;
	a.push_back(1);
	a.push_back(4);
	a.push_back(3);
	a.push_back(3);
	a.push_back(4);
	a.push_back(4);

	std::sort(a.begin(),a.end());

	for (int i=0; i<a.size(); i++)
	{
		std::cout <<a[i];
	}
	std::cout<<std::endl;
	//删除相邻的变成最后
	std::vector<int>::iterator it =  std::unique(a.begin(),a.end());
	std::cout<<*it<<std::endl;
	for (int i=0; i<a.size(); i++)
	{
		std::cout <<a[i];
	}

#endif
	system("pause");
	return 0;

}



 