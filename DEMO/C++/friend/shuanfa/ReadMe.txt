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

1 ���Ҷ�����㷨

find �� count �㷨�����뷶Χ�в���ָ��ֵ��find �㷨�������õ�һ��ƥ��Ԫ�صĵ�������count �㷨����Ԫ�������������г��ִ����ļ�����

find(beg, end, val) 
count(beg, end, val)
�����뷶Χ�в��ҵ��� val ��Ԫ�أ�ʹ�û������͵���ȣ�==����������find ���ص�һ��ƥ��Ԫ�صĵ������������������ƥ��Ԫ�ؾͷ��� end��count ���� val ���ִ����ļ�����

find_first_of(beg1, end1, beg2, end2)
find_first_of�㷨�ڵ�һ����Χ�в�����ڶ�����Χ������Ԫ����ȵĵ�һ���������һ����Ԫ�ء�beg1 �� end1 �����ͱ�����ȫƥ�䣬beg2 �� end2 ������Ҳ������ȫƥ�䡣

2. дԪ�ص��㷨

swap(elem1, elem2)
��Χ����������������Ҫһ��
swap_ranges(beg1, end1, beg2)
fill(beg, end, val)

3 �����㷨

sort(beg, end) �Ը�����������Ԫ�ؽ�������(Ĭ������)
stable_sort(beg, end) �Ը�����������Ԫ�ؽ����ȶ�����
sort(beg, end, comp)
stable_sort(beg, end, comp)
unique(beg, end)

����sort(begin,end,less<data-type>());
����sort(begin,end,greater<data-type>()).


unique����
unique�������Ǵ�����������ɾ�����������ڵ��ظ�Ԫ�ء����㷨ɾ�����ڵ��ظ�Ԫ�أ�Ȼ�������������뷶Χ�ڵ�Ԫ�أ����ҷ���һ���������������ĳ���û�䣬ֻ��Ԫ��˳��ı��ˣ�����ʾ���ظ���ֵ��Χ�ý�����


4. ���ֵ����Сֵ

min(val1, val2)
min(val1, val2, comp)
max(val1, val2)
max(val1, val2, comp)

min_element(beg, end)
min_element(beg, end, comp)
max_element(beg, end)
max_element(beg, end, comp)



