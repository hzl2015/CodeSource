// rongqi.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <iterator>
#include <map>
#include <algorithm>

using namespace std;

#define VECTOR 0
#define MAP  0


class Cbase 
{
public:

	Cbase(void)
	{

	}
	~Cbase(void)
	{

	}
	virtual void  hello()
	{
		cout<<"Cbase:hello"<<endl;
	}

};

class Ctemp: Cbase
{
public:

	Ctemp(void)
	{

	}
	~Ctemp(void)
	{

	}
	void  hello()
	{
		cout<<"Ctemp:hello"<<endl;
	}

};
int _tmain(int argc, _TCHAR* argv[])
{
#if VECTOR
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

	std::find(
		static_cast<int*>(array), //起始迭代器
		static_cast<int*>(array)+5, //迭代器终点
		7 //需要查找的值
		); 
	for (std::vector<int>::iterator iit = a.begin();iit != a.end(); iit++)
	{

			std::cout <<*iit;
			if ((*iit) ==1)
			{
				iit = a.erase(iit);

			}
	}
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

#endif 
	Ctemp *  a = new Ctemp;
	Cbase *  b = (Cbase *)a;
	a->hello();
	b->hello();
	
	system("pause");
	return 0;
}

