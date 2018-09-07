// signal2.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "MyLog.h"

namespace src = boost::log::sources;  

 

int _tmain(int argc, _TCHAR* argv[])
{
	MyLog::Init("test.log");
	MyLog::Log("hah");
	src::logger lg;  

	 BOOST_LOG_FUNCTION();  
	// And output...  
	BOOST_LOG(lg) << "Hello, World!";   

	LOG_DEBUG << "hello, world!";
	src::severity_logger< severity_level > slg;  
	BOOST_LOG_SEV(slg, normal) << "A normal severity message, will not pass to the file";  
	BOOST_LOG_SEV(slg, warning) << "A warning severity message, will pass to the file";  
	BOOST_LOG_SEV(slg, error) << "An error severity message, will pass to the file";  

	return 0;
}

