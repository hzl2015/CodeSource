// rongqi.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <iterator>
#include <map>
#include <algorithm>
#include <string>
#include<ctime> 
#include<stdio.h>

using namespace std;

#define VECTOR 1
#define MAP  0
#define SPLIT  0
#define STD  0
//附子结构体
struct FuZi
{
	unsigned char 										a;			//扑克数,用于特殊杠牌，其它未定义
	unsigned char 										b;
};

typedef		std::vector<FuZi>					FuZiVector;
typedef		FuZiVector::iterator				FuZiVectorIterator;



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
int  temp (int a);
int  temp (int a = 1);

int  temp (int a)
{
	return a;
}
int _tmain(int argc, _TCHAR* argv[])
{


#if STD
	std::vector<int> a;
	std::vector<int> b ;
	a.push_back(3);
	a.push_back(0);
	a.push_back(3);
	a.push_back(0);
	a.push_back(3);
	a.push_back(3);
	std::remove(a.begin(),a.end(),3);

	if(std::count(b.begin(),b.end(),3) >=std::count(a.begin(),a.end(),3))
	{
			cout<<"a"<<endl;
	}
	else
	{
		cout<<"b"<<endl;
	}

	for (int i=0; i<a.size(); i++)
	{
		cout<<a[i]<<endl;
	}
	cout<<"a"<<endl;
	for (int i=0; i<b.size(); i++)
	{
		cout<<b[i]<<endl;
	}
#endif
#if SPLIT
	std::string str ="150#1200#1500";
	std::string temp = "#";
	std::vector<std::string>  vString = split(str,temp);
	for (int i=0; i<vString.size(); i++)
	{
		string a = vString[i];

		cout<<atoi(a.c_str())<<endl;
	}
#endif

#if 1
	//定义方式
	//第一种定义方法
	vector<int> v;
	if (v.empty())
	{
		cout<<"aaa1"<<endl;
	}
	for (int i = 0; i < 10; i++){
		v.push_back(i);
	}
	if (v.empty())
	{
		cout<<"aaa2"<<endl;
	}
	//第二种定义方法(v和v1纯在不同的空间)
	vector<int> v1(v);
	//第三种定义方法
	vector<int> v2(10, 1);
	//第四种定义方法
	vector<int> v3(10);

	printf("first: ");
	for (vector<int>::size_type ix = 0; ix != v.size(); ix ++){
		printf("%d\t", v[ix]);
	}
	printf("\n");
	printf("second: ");
	for (vector<int>::size_type ix1 = 0; ix1 != v1.size(); ix1 ++){
		printf("%d\t", v1[ix1]);
	}
	printf("\n");
	printf("third: ");
	for (vector<int>::size_type ix2 = 0; ix2 != v2.size(); ix2 ++){
		printf("%d\t", v2[ix2]);
	}
	printf("\n");
	printf("forth: ");
	for (vector<int>::size_type ix3 = 0; ix3 != v3.size(); ix3 ++){
		printf("%d\t", v3[ix3]);
	}
	printf("\n");
	std::vector<int> a;
	a.push_back(9);
	a.push_back(4);
	a.push_back(3);
	a.push_back(9);
	a.push_back(4);
	a.push_back(3);
	

	std::sort(a.begin()+1,a.end());
	//std::erase(a.begin(),a.end(),3);

	for (int i=0; i<a.size(); i++)
	{
		std::cout <<a[i];
	}
	std::cout<<std::endl;
	for (std::vector<int>::iterator iit = a.begin();iit != a.end(); )
	{
		std::cout <<*iit;
		if ((*iit) ==1)
		{
			iit = a.erase(iit);
			
		}
		else
		{
			iit++;
		}
	}
	std::cout<<std::endl;
	for (std::vector<int>::iterator iit = a.begin();iit != a.end(); iit++)
	{
		std::cout <<*iit;
	}
	std::vector<int>::iterator it = std::find(a.begin(),a.end(),4);
	a.erase(it);
	std::cout<<std::endl;
	std::vector<int> b;
	b = a;

 
	for (std::vector<int>::iterator iit = a.begin();iit != a.end(); iit++)
	{

			std::cout <<*iit;
			if ((*iit) ==1)
			{
				iit = a.erase(iit);

			}
	}
	std::vector<int> d;
	d.clear();
	d.push_back(1);

	if (d.empty())
	{
		std::cout<<"kong"<<std::endl;
	}
	else
	{
		std::cout<<"ha"<<std::endl;
	}
	a.push_back(3);
	a.assign(4,3);
	for (std::vector<int>::iterator iit = a.begin();iit != a.end(); iit++)
	{
		std::cout <<*iit;
	}

	FuZiVector vTemp;
	vTemp.clear();
	FuZi a1 ={1,1};
	FuZi a2 ={1,2};
	FuZi a3 ={1,3};

	vTemp.push_back(a1);
	vTemp.push_back(a2);
	vTemp.push_back(a3);

	FuZiVector vTemp2 = vTemp;

	for (FuZiVectorIterator it =  vTemp.begin(); it != vTemp.end(); )
	{
		if (it->b == 2)
		{
			it = vTemp.erase(it);
			
		}
		else
		{
			it++;
		}
	}

	/////////erase/////////////////
	std::vector<int> testerease;
	testerease.push_back(1);
	testerease.push_back(1);
	testerease.push_back(2);
	testerease.push_back(2);
	testerease.push_back(3);
	for (std::vector<int>::iterator iit = testerease.begin();iit != testerease.end(); iit++)
	{
		std::cout <<*iit<<endl;
	}
	std::vector<int>::iterator ittesterease;
	ittesterease = std::find(testerease.begin(),testerease.end(),1);
	if (ittesterease != testerease.end())
	{
		ittesterease = testerease.erase(ittesterease);
	}
	for (std::vector<int>::iterator iit = testerease.begin();iit != testerease.end(); iit++)
	{
		std::cout <<*iit<<endl;
	}
		/////////erase/////////////////
	//for (int i= 0; i < vTemp.size(); i++)
	//{
	//	
	//	std::cout <<vTemp[i].b;
	//}

	std::vector<int>::iterator it3 = std::find(a.begin(),a.end(),4);


	bool			m_bWall[34];	//!< 牌墙数组  0
	int ntemp = sizeof(m_bWall);

	std::cout <<endl;
	std::cout <<ntemp;
#endif

#if MAP
	map<int, int> mp;
	//添加值
	for (int i = 0; i < 10; i ++){
		//会有性能的问题（查找i,i的值为空，先插入后，再将值转换成i）
		mp[i] = i;
	}
	for (int i = 10; i < 20; i++){
		mp.insert(make_pair(i, i));
	}

	map<int, int>::iterator it;
	for (it = mp.begin(); it != mp.end(); it++){
		printf("%d-->%d\n", it->first, it->second);
	}
	//搜索值：返回次数
	if (mp.count(21)){
		printf("yes!\n");
	}else{
		printf("no!\n");
	}

	map<int, int>::iterator it_find;
	it_find = mp.find(0);
	//搜索值：返回指针
	if (it_find != mp.end()){
		it_find->second = 20;
	}else{
		printf("no!\n");
	}

	for (it = mp.begin(); it != mp.end(); it++){
		printf("%d->%d\n", it->first, it->second);
	}

	//删除值
	mp.erase(0);

	mp.erase(mp.begin());

	for (it = mp.begin(); it != mp.end(); it++){
		printf("%d->%d\n", it->first, it->second);
	}

	map<std::string, int> mp2;
	vector<std::string> vstr ;
	vstr.push_back("22_22");
	vstr.push_back("33");

	for (size_t i = 0; i < vstr.size(); i++){
		mp2.insert(make_pair(vstr[i], i));
	}
	std::string sTemp = "22_22";
	mp2["22_22"] = mp2["22_22"] + 2;
	mp2["22_23"] = mp2["22_23"] + 2;
	mp2[sTemp] = mp2[sTemp] + 2;
	map<string, int>::iterator it2;
	for (it2 = mp2.begin(); it2 != mp2.end(); it2++){
		std::cout<<it2->first<<it2->second<<endl;
	}

	map<std::string, int>::iterator it_find2;
	it_find2 = mp2.find(sTemp);
	//搜索值：返回指针
	if (it_find2 != mp2.end()){
		mp2.erase(it_find2);
	}
	for (it2 = mp2.begin(); it2 != mp2.end(); it2++){
		std::cout<<it2->first<<it2->second<<endl;
	}

#endif 
	system("pause");
	return 0;
}

