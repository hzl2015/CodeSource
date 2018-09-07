#include "stdafx.h"


#define _UNICODE

void sqlselect(MYSQL *, const char *);     //���Բ�ѯ���� 

MYSQL *mysql = NULL;

int main()
{
	//��ʼ��MySQL���Ӿ��
	mysql = mysql_init((MYSQL *)0);

	mysql_real_connect
	(
		mysql,
		"localhost", //���ݿ��ַ
		"root", //���ݿ��û���
		"******", //���ݿ�����
		"jxgl", //���ݿ�����
		0, //���ݿ�˿ڣ�0��ʾĬ�϶˿ڣ���3306��
		NULL, //���unix_socket����NULL���ַ���ָ���׽��ֻ�Ӧ�ñ�ʹ�õ������ܵ���ע��host�����������ӵ�����
		0 //ͨ����0
	);

	if (!mysql) //����ʧ��
	{
		printf("Connection error:%d, %s\n", mysql_errno(mysql), mysql_error(mysql));
	}

	const char *command = "select * from course"; //��ѯָ��

												  // �ı�����ʽ
	mysql_set_character_set(mysql, "GB2312");

	sqlselect(mysql, command); //��ѯ����  

	mysql_close(mysql); //�ر�����  

	system("pause");
	return 0;
}

void sqlselect(MYSQL *mysql, const char *command)
{

	int flag = mysql_real_query(mysql, command, strlen(command));

	if (flag)
	{
		printf("Select error:%d, %s\n", mysql_errno(mysql), mysql_error(mysql));
		return;
	}

	MYSQL_RES *res = mysql_store_result(mysql); //��ȡ����ѯ���   
	MYSQL_FIELD *field = mysql_fetch_fields(res); //��ȡ��������
	int field_count = mysql_field_count(mysql); //��ȡ����

												//�����������
	for (int i = 0; i < field_count; i++)
	{

		printf("%s\t", field[i].name);
	}

	printf("\n");

	//�������ÿһ������  
	MYSQL_ROW row;
	while (row = mysql_fetch_row(res))
	{
		for (int i = 0; i < field_count; i++)
		{
			printf("%s\t", row[i]);
		}
		printf("\n");
	}
}
