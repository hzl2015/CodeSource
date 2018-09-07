// server.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include <stdio.h>  
//#include "AuthenHandle.h"  
//#include "configure.h"  
//#include "NetSocketCommand.h"  
	
#ifdef WIN32 //for windows nt/2000/xp  


//#include "gelsserver.h"  
#pragma comment(lib,"Ws2_32.lib")  
#else         //for unix  


#include <sys/socket.h>  
//    #include <sys/types.h>  

//    #include <sys/signal.h>  

//    #include <sys/time.h>  

#include <netinet/in.h>     //socket  

//    #include <netdb.h>  

#include <unistd.h>            //gethostname  

// #include <fcntl.h>  

#include <arpa/inet.h>  

#include <string.h>            //memset  

typedef int SOCKET;  
typedef struct sockaddr_in SOCKADDR_IN;  
typedef struct sockaddr SOCKADDR;  
#ifdef M_I386  
typedef int socklen_t;  
#endif  

#define BOOL             int  
#define INVALID_SOCKET    -1  
#define SOCKET_ERROR     -1  
#define TRUE             1  
#define FALSE             0  
#endif        //end #ifdef WIN32  

static int count111 = 0;  
static time_t oldtime = 0, nowtime = 0;  


const int server_port = 6768;            //服务器启动的端口;  
const int server_thread_pool_num = 4;    //服务器启动线程池的线程数;  

using namespace std;  
using boost::asio::ip::tcp;  
CRITICAL_SECTION  listLock;  
char szBuff[256] = {0} ;  

int   nConnectCount = 0 ;  

map<int, int> g_mapThreadId;  //线程ID 映射;  

bool InsertMapThreadId(int nThreadId)  
{  
	map<int, int>::iterator mapThreadIdIt = g_mapThreadId.find(nThreadId);  
	if (mapThreadIdIt == g_mapThreadId.end())  
	{  
		//没有找到插入并返回true；  
		g_mapThreadId.insert( std::make_pair(nThreadId, g_mapThreadId.size()+1) );  
		return true;  
	}  
	else  
	{  
		//已经存在不插入返回false  
		return false;  
	}  
}  



boost::mutex cout_mtx;  
int packet_size = 0;  


class session  
{  
public:  
	session(boost::asio::io_service& io_service)  
		: socket_(io_service)  
		, recv_times(0)  
	{  

		bDeleteFlag = FALSE ;  
		memset(data_,0x00,sizeof(data_));  

	}  

	virtual ~session()  
	{  
		boost::mutex::scoped_lock lock(cout_mtx);  
		socket_.close() ;  
		nConnectCount -- ;
		printf("~sessionn ConnectCount = %d\n",nConnectCount);
	}  

	tcp::socket& socket()  
	{  
		return socket_;  
	}  

	//暂时不需要这个函数  
	inline void requestRead()  
	{  
		socket_.async_read_some(boost::asio::buffer(data_,MAX_PACKET_LEN ),//  
			boost::bind(&session::handle_read, this,  
			boost::asio::placeholders::error,  
			boost::asio::placeholders::bytes_transferred));  
	}  


	void handle_read(const boost::system::error_code& error, size_t bytes_transferred)  
	{  
		if (!error)  
		{  
			if(bytes_transferred > 0)  
			{  
				printf("receive data %s\n",data_);
				sendData(data_,bytes_transferred);  

			}  

			requestRead() ;  
		}  
		else  
		{  
			bDeleteFlag = TRUE;  
			//socket_.close() ;  
			nConnectCount -- ; 
			printf("handle_read nConnectCount = %d\n",nConnectCount);
		}  
	}  

	BOOL sendData(char* szData,int nLength)  
	{  
		boost::asio::ip::tcp::endpoint  endpoint1 = socket_.remote_endpoint();  
		int nThreadID = ::GetCurrentThreadId();  
		InsertMapThreadId(nThreadID);  
		printf("in    socket:%d  remoteip:%s threadId:%lld 0x:%x theadIdnum:%d ", socket_.remote_endpoint().port(), socket_.remote_endpoint().address().to_string().c_str() , nThreadID, nThreadID) ;  
		printf("threadNum:%d \r\n", g_mapThreadId.size());  

		if(bDeleteFlag || szData == NULL || nLength <= 0 )  
			return FALSE ;  

		boost::asio::async_write(socket_, boost::asio::buffer(szData, nLength),  
			boost::bind(&session::handle_write, this, boost::asio::placeholders::error));  

		return TRUE ;  
	}  

	void handle_write(const boost::system::error_code& error)  
	{  
		int nThreadID = ::GetCurrentThreadId();  
		InsertMapThreadId(nThreadID);  
		printf("write socket:%d  remoteip:%s threadId:%lld 0x:%x  ", socket_.remote_endpoint().port(), socket_.remote_endpoint().address().to_string().c_str() , nThreadID, nThreadID) ;  
		printf("threadNum:%d \r\n", g_mapThreadId.size());  
		if (!error)  
		{//写入正确  

		}  
		else  
		{  
			bDeleteFlag = TRUE;  
			//socket_.close() ;  
			nConnectCount -- ;
			printf("handle_write nConnectCount = %d\n",nConnectCount);
		}  
	}  

public:  
	BOOL            bDeleteFlag ;  

private:  
	tcp::socket     socket_;  
	char            data_[MAX_PACKET_LEN];  
	int             recv_times;  
};  

typedef list<session* >  SessionList ;  
SessionList              sessionList ;  
class server  
{  
public:  
	server(short port, int thread_cnt)  
		: io_service_pool_(thread_cnt)  
		, acceptor_(io_service_pool_.get_io_service(), tcp::endpoint(tcp::v4(), port))  
	{  
		session* new_session = new session(io_service_pool_.get_io_service());  
		acceptor_.async_accept(new_session->socket(),  
			boost::bind(&server::handle_accept, this, new_session, boost::asio::placeholders::error));  


		EnterCriticalSection(&listLock);  
		sessionList.push_back(new_session) ;  
		LeaveCriticalSection(&listLock);     
	}  

	void handle_accept(session* new_session, const boost::system::error_code& error)  
	{  
		if (!error)  
		{  
			//new_session->readRequest(Packet_Is_Head,sizeof(PacketHead)); //先请求包头  
			new_session->requestRead() ;  
			nConnectCount ++ ;  
			printf("handle_accept nConnectCount = %d\n",nConnectCount);
		}  
		else  
		{  
			new_session->bDeleteFlag = TRUE ;  
		}  

		new_session = new session(io_service_pool_.get_io_service());  
		acceptor_.async_accept(new_session->socket(),  
			boost::bind(&server::handle_accept, this, new_session, boost::asio::placeholders::error));  
		EnterCriticalSection(&listLock);  
		sessionList.push_back(new_session) ;  
		LeaveCriticalSection(&listLock);     

		int nThreadID = ::GetCurrentThreadId();  
		printf("链接数量 %d  threadId:%lld 0x:%x \r\n",nConnectCount,  nThreadID, nThreadID) ;  

	}  

	void run()  
	{  
		io_service_pool_.start();  
		io_service_pool_.join();  
	}  

private:  

	io_service_pool io_service_pool_;  
	tcp::acceptor acceptor_;  
};  

int main()  
{  
	//boost  

	InitializeCriticalSection(&listLock) ;  

	printf("server run! server port :%d thread_poo_num:%d \n", server_port, server_thread_pool_num);  

	//创建线程数量，要先检测CPU线程数量，然后再创建相应的线程数  
	server svr(server_port, server_thread_pool_num);  
	svr.run();  


	while(true)  
	{  
		Sleep(1000);  
	} 

	DeleteCriticalSection(&listLock);  

	printf("server end\n ");  


	return 0;  
}  

