// client.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include <iostream>  
#include <stdio.h>  
#include <time.h>  
#include <boost/asio.hpp>  
#include <boost/bind.hpp>  
#include <boost/thread/thread.hpp>  
#include <string>  
//#include <unistd.h>  

#define  uchar unsigned char  
#define  uint unsigned int  

using namespace std ;  
using boost::asio::ip::udp;  
using boost::asio::ip::tcp;  
using namespace boost::asio;  

class Async_Client_c  
{  
public:  
	Async_Client_c(boost::asio::io_service& io_service,ip::tcp::endpoint endpoint)  
		:iosev(io_service),  
		socket(iosev),  
		ep(endpoint)  
	{  
		socket.connect(ep,ec);  
		if(ec)  
		{  
			std::cout << boost::system::system_error(ec).what() << std::endl;  
		}  
		else  
		{  
			cout<<" Connection Success! "<<endl;  
		}  
		 
		char a[]="haha";
		client_async_write(a,sizeof(a));  
		client_async_read(); 

	}  
	void client_async_write(char *buf,int len)  
	{  
		boost::asio::async_write(socket,  
			boost::asio::buffer(buf, len),  
			boost::bind(&Async_Client_c::handle_write, this,  
			boost::asio::placeholders::error));  
	}  
	void client_async_read()  
	{  
		socket.async_read_some(boost::asio::buffer(data_, max_length),  
			boost::bind(&Async_Client_c::handle_read, this,  
			boost::asio::placeholders::error,  
			boost::asio::placeholders::bytes_transferred));  
	}  

private:  
	void handle_read(const boost::system::error_code& error,  
		size_t bytes_transferred)  
	{  
		if (!error)  
		{  
			printf("Received data Len:%d\n",bytes_transferred);  
			printf("Received data Len:%s\n",data_);  
			socket.async_read_some(boost::asio::buffer(data_, max_length),  
				boost::bind(&Async_Client_c::handle_read, this,  
				boost::asio::placeholders::error,  
				boost::asio::placeholders::bytes_transferred));  
		}  
		else  
		{  
			delete this;  
		}  
	}  

	void handle_write(const boost::system::error_code& error)  
	{  
		if (!error)  
		{  

		}  
		else  
		{  
			delete this;  
		}  
	}  
	io_service &iosev;  
	ip::tcp::socket socket ;  
	ip::tcp::endpoint ep ;  
	boost::system::error_code ec;  
	enum { max_length = 1024 };  
	char data_[max_length];  
};  



int main()  
{  

	io_service iosev;  

	ip::tcp::endpoint ep(ip::address_v4::from_string("127.0.0.1"),8888);  
	Async_Client_c tcp_client(iosev,ep) ;  

	iosev.run();  

	return 1 ;  
}  