// exception.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include <exception>
#include <iostream>

int _tmain(int argc, _TCHAR* argv[])
{
	int nTemp1 = 0;
	int nTemp2 = 0;
	int nSum = 0;

		try
		{
			while (std::cin >>nTemp1 >> nTemp2)
			{
				nSum = nTemp2 + nTemp1;
				std::cout<<"nSum = "<<nSum<<std::endl;
			}
		}
		catch (const std::runtime_error &e)
		{
			std::cerr << e.what() << "try again. \n"<<std::endl;
		}
		/*catch (CMemoryException* e)
		{
			std::cout<<"CMemoryException* e"<<std::endl;
		}
		catch (CFileException* e)
		{
			std::cout<<"CFileException* e"<<std::endl;
		}
		catch (CException* e)
		{
			std::cout<<"CException* e"<<std::endl;
		}*/
	system("pause");
 	return 0;
}

