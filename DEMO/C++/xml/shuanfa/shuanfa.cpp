// shuanfa.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <vector>
#include <string>
#include <iostream>  
#include "tinyxml2.h"  

using namespace tinyxml2;  
using namespace std;  

struct tBSState
{
	unsigned short id;
	unsigned short rank;
	unsigned long score1;
	unsigned long score2;

	tBSState()
	{
		id = 0;
		rank = 0;
		score1 = 0;
		score2 = 0;
	}
	
};
struct tBSAward
{
	unsigned short id;
	unsigned short Propid[10];
	unsigned short PropNum[10];

	tBSAward()
	{
		id = 0;
		memset(Propid,0,sizeof(Propid));
		memset(PropNum,0,sizeof(PropNum));
	}
};
vector<tBSState> vTemp;
vector<tBSAward> vTemp2;
int  nIndex = 0;
void read_xml(XMLElement *surface)  
{  
	while (surface)  
	{  
		//节点名字
		cout << "surface = "<<surface->Value() << endl; 
		if (strcmp(surface->Value(),"State") == 0)
		{
			const XMLAttribute *attr = surface->FirstAttribute();//获取第一个属性值  
			tBSState tTemp;
			while(attr)  
			{ 
				string sValue = attr->Value();
				int nTemp = atoi(sValue.c_str());
				if (strcmp(attr->Name(),"id") == 0)
				{
					tTemp.id = nTemp;
				}
				else if (strcmp(attr->Name(),"rank") == 0)
				{
					tTemp.rank = nTemp;
				}
				else if (strcmp(attr->Name(),"score1") == 0)
				{
					tTemp.score1 = nTemp;
				}
				else if (strcmp(attr->Name(),"score2") == 0)
				{
					tTemp.score2 = nTemp;
				}
				attr = attr->Next(); //获取下一个属性值  
			}   
			cout <<"id " <<tTemp.id
				 << "rank "<<tTemp.rank
				 <<"score1 "<<tTemp.score1<<endl; 
			vTemp.push_back(tTemp);
		} 
		else if (strcmp(surface->Value(),"Award") == 0)
		{	
			tBSAward tTemp ;
			const XMLAttribute *attr = surface->FirstAttribute();//获取第一个属性值  
			while(attr)  
			{ 
				string sValue = attr->Value();
				int nTemp = atoi(sValue.c_str());
				if (strcmp(attr->Name(),"id") == 0)
				{ 
					tTemp.id = nTemp;
				}
				attr = attr->Next(); //获取下一个属性值  
			}  
			vTemp2.push_back(tTemp);
		}
		else if (strcmp(surface->Value(),"Prop") == 0)
		{	
			const XMLAttribute *attr = surface->FirstAttribute();//获取第一个属性值
			while(attr)  
			{ 
				string sValue = attr->Value();
				int nTemp = atoi(sValue.c_str());
				if (strcmp(attr->Name(),"gifid") == 0)
				{
					for (int i=0; i<10; i++)
					{
						if (vTemp2[vTemp2.size()-1].Propid[i] == 0)
						{
							vTemp2[vTemp2.size()-1].Propid[i] = nTemp;
							break;
						}
					}
				}else if (strcmp(attr->Name(),"gifnum") == 0)
				{
					for (int i=0; i<10; i++)
					{
						if (vTemp2[vTemp2.size()-1].PropNum[i] == 0)
						{
							vTemp2[vTemp2.size()-1].PropNum[i] = nTemp;
							break;
						}
					}
				}
				attr = attr->Next(); //获取下一个属性值  
			} 
			
		}
		const char* content = surface->GetText(); //获取节点的内容  
		if (content)  
		{  
			cout << "?? " << content << endl;  
		}  
		XMLElement *surface1 = surface->FirstChildElement(); //查看当前对象是否有子节点  
		if(surface1)  
		{  
			read_xml(surface1);//递归调用  
		}  
		surface = surface->NextSiblingElement();//当前对象的下一个节点  
	}  
}  

int main()  
{  
	tinyxml2::XMLDocument mydocument; //声明xml对象  
	mydocument.LoadFile("utf8test.xml"); //载入xml文件  
	XMLElement *rootElement = mydocument.RootElement(); //获取跟节点
	cout <<rootElement->Value()<< endl;  
	XMLElement *surface = rootElement->FirstChildElement();//获取第一个值为value的子节点 默认为空则返回第一个节点  
	read_xml(surface);  
	cin.get();
	system("pause");
	return 0;
}  



 