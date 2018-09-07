#include "stdafx.h"
#include "MyLog.h"  

#include <iostream>  
#include <string>  

#include <boost/filesystem.hpp> 
#include <boost/typeof/typeof.hpp>   


#include <boost/log/sources/logger.hpp>  
#include <boost/log/sources/record_ostream.hpp>  
#include <boost/log/sources/global_logger_storage.hpp>  
#include <boost/log/utility/setup/file.hpp>  
#include <boost/log/utility/setup/common_attributes.hpp>  
#include <boost/log/sinks/text_ostream_backend.hpp>  
#include <boost/log/attributes/named_scope.hpp>  
#include <boost/log/expressions.hpp>  
#include <boost/log/support/date_time.hpp>  
#include <boost/log/detail/format.hpp>  
#include <boost/log/detail/thread_id.hpp>  



namespace logging = boost::log;  
namespace src = boost::log::sources;  
namespace keywords = boost::log::keywords;  
namespace sinks = boost::log::sinks;  
namespace expr = boost::log::expressions;  

namespace sinks = boost::log::sinks;  
namespace attrs = boost::log::attributes;  
namespace src = boost::log::sources;     
//线程安全的log
BOOST_LOG_INLINE_GLOBAL_LOGGER_DEFAULT(my_logger, src::logger_mt)  
//boost::log::sources::severity_logger<boost::log::trivial::severity_level > MyLog::s_slg;  
boost::log::sources::severity_logger<severity_level > MyLog::slg ;  

MyLog::MyLog()  
{  

}  

MyLog::~MyLog(void)  
{  

}  

void MyLog::Init(const string & dir)  
{  
	if (boost::filesystem::exists(dir) == false)  
	{  
		boost::filesystem::create_directories(dir);  
	} 
	//输出到控制台
	logging::add_console_log(std::clog, keywords::format = "%TimeStamp%: %Message%");  
	////输出到日字
	BOOST_AUTO  (pSink, logging::add_file_log  
		(  
		keywords::open_mode = std::ios::app,  
		keywords::filter = expr::attr< severity_level >("Severity") >= normal,  //过滤用到
		keywords::file_name = dir + "/%Y%m%d.log",  //文件名
		keywords::rotation_size = 10 * 1024 * 1024,  ////单个文件限制大小
		keywords::time_based_rotation = sinks::file::rotation_at_time_point(0, 0, 0),  //每天重建 
		//keywords::format = "[%TimeStamp% %ThreadID%]: %Message%"  
		keywords::format =  
		(  
		expr::stream  
		<< "[" <<expr::format_date_time< boost::posix_time::ptime >("TimeStamp", "%Y-%m-%d %H:%M:%S.%f")  
		<< " " << expr::attr< boost::log::aux::thread::id >("ThreadID")  
		<< " " << logging::trivial::severity  
		<< "] " << expr::smessage  
		)  
		));  
	// 如果不写这个 它不会实时的把日志写下去, 而是等待缓冲区满了,或者程序正常退出时写下,这样做的好处是减少IO操作.提高效率,  不过我这里不需要它. 因为我的程序可能会异常退出.  
	pSink->locked_backend()->auto_flush(true);//使日志实时更新  

	pSink->locked_backend()->set_file_collector(sinks::file::make_collector(
		keywords::target=dir,        //文件夹名
		keywords::max_size=50*1024*1024,    //文件夹所占最大空间
		keywords::min_free_space=100*1024*1024  //磁盘最小预留空间
		));


	//pSink->imbue(std::locale("zh_CN.UTF-8")); // 本地化   
	logging::add_common_attributes();  
	logging::core::get()->add_thread_attribute("Scope", attrs::named_scope()); 
	
}  


void MyLog::Log(const string & msg )  
{  
 //	src::logger lg; 
	src::logger_mt& lg = my_logger::get();
	BOOST_LOG(lg) << msg;  
}  