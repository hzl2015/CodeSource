// dllsharecreate.h : dllsharecreate DLL ����ͷ�ļ�
//

#pragma once

#ifndef __AFXWIN_H__
	#error "�ڰ������ļ�֮ǰ������stdafx.h�������� PCH �ļ�"
#endif

#include "resource.h"		// ������


// CdllsharecreateApp
// �йش���ʵ�ֵ���Ϣ������� dllsharecreate.cpp
//

class CdllsharecreateApp : public CWinApp
{
public:
	CdllsharecreateApp();

// ��д
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};
