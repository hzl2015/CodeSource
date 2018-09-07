// timer.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"

#include <iostream>
//#include <sys/time.h>
//#include <unistd.h>
//#include <thread>
#include <vector>
#include <map>
#include <memory>
//#include <mutex>
#include <mutex>
#include <stdlib.h>
#include <algorithm>

#include <boost/log/attributes/timer.hpp>  
using boost::shared_ptr;  

using namespace std;

#define THREAD_COUNT 4

typedef struct TimerInfo
{
    int id;
    long expired;     //超时时间戳(ms)
    bool is_working;  //用于判断该定时器是否有效
    bool is_repeat;  // 是否为循环定时器标识
    long interval; //循环定时器循环间隔

} TimerInfo;

// 排序函数
bool comp(const shared_ptr<TimerInfo> &t1, const shared_ptr<TimerInfo> &t2)
{
    if(t1.get()->expired < t2.get()->expired)
        return true;
    else
        return false;
}

typedef struct TimerMng
{
    int id;
    vector<shared_ptr<TimerInfo> > timer_array;   //已序数组
    map<int, shared_ptr<TimerInfo> > timer_map;   //id到定时器的映射 用于根据id取消定时器

    mutex mtx;

    struct timeval now;

    TimerMng()
    {
        id = 0;
    }

} TimerMng;

TimerMng t_mng;

void add_timer(bool is_repeat, long expired, long interval)
{
    TimerInfo *t_info = new TimerInfo();
    t_info->is_repeat = is_repeat;
    t_info->expired = expired;
    t_info->interval = interval;
    t_info->is_working = true;

    shared_ptr<TimerInfo> timer_info(t_info);

    lock_guard<mutex> guard(t_mng.mtx);
    int now_id = t_mng.id++;
    t_info->id = now_id;

    // 二分法寻找合适的插入位置
    vector<shared_ptr<TimerInfo> >::iterator pos = lower_bound(t_mng.timer_array.begin(), t_mng.timer_array.end(), timer_info, comp);

    t_mng.timer_array.insert(pos, timer_info);
    t_mng.timer_map.insert(pair<int, shared_ptr<TimerInfo> >(now_id, timer_info) );

}

void update_time()
{
    gettimeofday(&t_mng.now, NULL);
}

void execute_timer()
{
    long now_usec = t_mng.now.tv_sec * 1000 + t_mng.now.tv_usec / 1000;

    while(true) 
    {
        lock_guard<mutex> guard(t_mng.mtx);

        if (t_mng.timer_array.empty())
            break;

        vector<shared_ptr<TimerInfo> >::iterator iter = t_mng.timer_array.begin();

        if (iter->get()->expired > now_usec )
            break;

        if (iter->get()->is_working)
        {
            // do something here
            cout << "timer execute succ, now: " << now_usec <<  " id: " << iter->get()->id << " " << "expired: " << iter->get()->expired << endl;
        }

        map<int, shared_ptr<TimerInfo> >::iterator map_iter = t_mng.timer_map.find( iter->get()->id);

        // 从map中移除
        t_mng.timer_map.erase(map_iter);

        // 从数组中移除
        t_mng.timer_array.erase(t_mng.timer_array.begin());

    }
}


void timer_thread()
{
    while(1)
    {
        update_time();
        execute_timer();
        // 1ms 1次循环
        usleep(1000);
    }
}

void worker_thread()
{
    srand((unsigned)time(0));
    while(1)
    {
        struct timeval now;
        gettimeofday(&now, NULL);

        int rand_sec = rand() % 5 + 1;
        int rand_usec = rand() % 900000 + 1;

        long expired = (now.tv_sec + rand_sec) * 1000 + ( rand_usec / 1000 );
        add_timer(false, expired, 0);

        sleep(rand() % 2 + 1);    
    }
}


int main()
{
    thread t1(timer_thread);

    vector<thread> v_thread;

    for (int i = 0; i < THREAD_COUNT; ++i)
    {
        v_thread.push_back(thread(worker_thread));
    }

    t1.join();

    for (int i = 0; i < THREAD_COUNT; ++i)
    {
        v_thread[i].join();
    }
}
