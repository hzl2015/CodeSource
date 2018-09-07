// shuanfa.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <map>
#include <vector>
#include <algorithm>
#include <iterator>
#include <stdio.h>
#include <iostream>

class CA
{
	friend class CB;
public:
     

	 void Printf_Name2()
	 {
		 CB::Printf_Name();
	 }

	/* void  Printf_Name()
	 {
		 std::cout<<"CA"<<std::endl;
	 }*/
};

class CB
{
	friend class CA;
public:
	static	void  Printf_Name()
	{
		std::cout<<"CB"<<std::endl;
	}
};
int _tmain(int argc, _TCHAR* argv[])
{
	
	CA cA;
	cA.Printf_Name2();

	system("pause");
	return 0;

}



 