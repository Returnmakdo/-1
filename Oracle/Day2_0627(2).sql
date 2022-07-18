-- ���ڿ� Ÿ��
-- CHAR(����) : �������� , ������ ����Ʈ 
-- VARCHAR(����) : ����Ŭ���� ���������� ������� �ʴ� �����ڷ���.
-- VARCHAR2(����) : ���������� ���� ����Ʈ, ���̴� �ִ�����̰� ������ �޸𸮴� ������ũ�⸸ŭ ����մϴ�.
--				�ִ� 2000����Ʈ�Դϴ�. UTF-8 ���ڵ����� �ѱ��� 3����Ʈ, ����/����/��ȣ�� 1����Ʈ

CREATE TABLE tbl_string (
 	acol char(10),      -- 10 ����Ʈ ��������
 	bcol varchar2(10),  -- 10 ����Ʈ ��������
 	ccol nchar(10),     -- 10�� ���� ��������
 	dcol nvarchar2(10)  -- 10�� ���� ��������
);

-- char Ÿ�� 
INSERT  INTO tbl_string(acol) VALUES ('abcdefghij');
INSERT  INTO tbl_string(acol) VALUES ('abcdef'); -- acol�� �������� Ÿ�� : �����߰�
INSERT  INTO tbl_string(acol) VALUES ('abcdefghijklm'); -- ����: �����ʰ�
-- INSERT Ȯ��
SELECT  * FROM  TBL_STRING;

-- �ѱ� Ȯ��
INSERT  INTO TBL_STRING(acol) VALUES ('������');
INSERT  INTO TBL_STRING(acol) VALUES ('�����ٶ�'); -- ���� : �ִ밪10�ε� �ѱ��� �ϳ���3�̹Ƿ�
INSERT  INTO TBL_STRING(acol) VALUES ('����');

-- varchar2 Ÿ�� : bcol�� �������� 10����Ʈ
INSERT  INTO tbl_string(bcol) VALUES ('abcdefghij');
INSERT  INTO tbl_string(bcol) VALUES ('abcdef'); -- bcol�� �������� Ÿ�� : �����߰�����
INSERT  INTO tbl_string(bcol) VALUES ('abcdefghijklm'); -- ����: �����ʰ�

-- INSERT Ȯ��
SELECT  * FROM  TBL_STRING;

-- �ѱ� Ȯ��
INSERT  INTO TBL_STRING(bcol) VALUES ('������');  -- �����߰� ����.
INSERT  INTO TBL_STRING(bcol) VALUES ('�����ٶ�'); -- ���� : �ִ밪10�ε� �ѱ��� �ϳ���3�̹Ƿ�
INSERT  INTO TBL_STRING(bcol) VALUES ('����');

-- char�� varchar2�� ����Ʈ����. nchar�� nvarchar2�� ���ڰ��� ����
-- nchar Ÿ��
INSERT  INTO TBL_STRING(ccol) VALUES ('������');    -- ���� 7���߰�	
INSERT  INTO TBL_STRING(ccol) VALUES ('�����ٶ�');  -- ���� 6���߰�
INSERT  INTO TBL_STRING(ccol) VALUES ('����');     -- ���� 8���߰�

-- nvarchar2 Ÿ��
INSERT  INTO TBL_STRING(dcol) VALUES ('������');   -- �������
INSERT  INTO TBL_STRING(dcol) VALUES ('�����ٶ�'); 
INSERT  INTO TBL_STRING(dcol) VALUES ('����');

