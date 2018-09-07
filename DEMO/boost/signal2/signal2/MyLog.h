#pragma once  

#include <string>  
#include <boost/log/common.hpp>  
#include <boost/log/expressions.hpp>  


#include <boost/log/utility/setup/file.hpp>  
#include <boost/log/utility/setup/console.hpp>  
#include <boost/log/utility/setup/common_attributes.hpp>  


#include <boost/log/attributes/timer.hpp>  
#include <boost/log/attributes/named_scope.hpp>  


#include <boost/log/sources/logger.hpp>  
#include <boost/log/support/date_time.hpp>  

using std::string;  

enum severity_level  
{  
	normal,  
	notification,  
	warning,  
	error,  
	critical  
};

template< typename CharT, typename TraitsT >  
inline std::basic_ostream< CharT, TraitsT >& operator<< (  
	std::basic_ostream< CharT, TraitsT >& strm, severity_level lvl)  
{  
	static const char* const str[] =  
	{  
		"normal",  
		"notification",  
		"warning",  
		"error",  
		"critical"  
	};  
	if (static_cast< std::size_t >(lvl) < (sizeof(str) / sizeof(*str)))  
		strm << str[lvl];  
	else  
		strm << static_cast< int >(lvl);  
	return strm;  
} 



#define LOG_DEBUG  BOOST_LOG_SEV((MyLog::slg),(normal))  
#define LOG_INFO BOOST_LOG_SEV((MyLog::slg),(notification))  
#define LOG_ERROR  BOOST_LOG_SEV((MyLog::slg),(error))  
#define LOG_WARNING  BOOST_LOG_SEV((MyLog::slg),(warning))  

// 在使用之前必须先调用 init  
// 使用方式  LOG_DEBUG<<"test string";  
// 也可以用boost 中的宏  BOOST_LOG_TRIVIAL(info)<<"test msg";  
class MyLog  
{  
	// Here we define our application severity levels.  
	

public:  
	MyLog();  
	~MyLog(void);  

	// 在使用之前必须先调用此函数  
	static void Init(const string & dir);  
	static void Log(const string & msg );  
#if 0 
	static boost::log::sources::severity_logger<boost::log::trivial::severity_level > s_slg; 	
#endif
	static boost::log::sources::severity_logger< severity_level> slg;

protected:  
private:  

};  