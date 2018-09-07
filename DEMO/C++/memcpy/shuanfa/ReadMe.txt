========================================================================
    CONSOLE APPLICATION : shuanfa Project Overview
========================================================================

AppWizard has created this shuanfa application for you.

This file contains a summary of what you will find in each of the files that
make up your shuanfa application.


shuanfa.vcproj
    This is the main project file for VC++ projects generated using an Application Wizard.
    It contains information about the version of Visual C++ that generated the file, and
    information about the platforms, configurations, and project features selected with the
    Application Wizard.

shuanfa.cpp
    This is the main application source file.

/////////////////////////////////////////////////////////////////////////////
Other standard files:

StdAfx.h, StdAfx.cpp
    These files are used to build a precompiled header (PCH) file
    named shuanfa.pch and a precompiled types file named StdAfx.obj.

/////////////////////////////////////////////////////////////////////////////
Other notes:

AppWizard uses "TODO:" comments to indicate parts of the source code you
should add to or customize.

/////////////////////////////////////////////////////////////////////////////

1 查找对象的算法

find 和 count 算法在输入范围中查找指定值。find 算法返回引用第一个匹配元素的迭代器，count 算法返回元素在输入序列中出现次数的计数。

find(beg, end, val) 
count(beg, end, val)
在输入范围中查找等于 val 的元素，使用基础类型的相等（==）操作符。find 返回第一个匹配元素的迭代器，如果不存在在匹配元素就返回 end。count 返回 val 出现次数的计数。

find_first_of(beg1, end1, beg2, end2)
find_first_of算法在第一个范围中查找与第二个范围中任意元素相等的第一个（或最后一个）元素。beg1 和 end1 的类型必须完全匹配，beg2 和 end2 的类型也必须完全匹配。

2. 写元素的算法

swap(elem1, elem2)
范围交换，交换的数量要一致
swap_ranges(beg1, end1, beg2)
fill(beg, end, val)

3 排序算法

sort(beg, end) 对给定区间所有元素进行排序(默认升序)
stable_sort(beg, end) 对给定区间所有元素进行稳定排序
sort(beg, end, comp)
stable_sort(beg, end, comp)
unique(beg, end)

升序：sort(begin,end,less<data-type>());
降序：sort(begin,end,greater<data-type>()).


unique函数
unique的作用是从输入序列中删除”所有相邻的重复元素。该算法删除相邻的重复元素，然后重新排列输入范围内的元素，并且返回一个迭代器（容器的长度没变，只是元素顺序改变了），表示无重复的值范围得结束。


4. 最大值和最小值

min(val1, val2)
min(val1, val2, comp)
max(val1, val2)
max(val1, val2, comp)

min_element(beg, end)
min_element(beg, end, comp)
max_element(beg, end)
max_element(beg, end, comp)



