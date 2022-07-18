-- ���̺� ����� create table, ���������� �׽�Ʈ

CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE  --��¥ ��-��-��, �ð� ��:��:��:�и���
);

-- 1. DML insert ���� (������ �� �߰�)
-- ��� �÷��� �����͸� �����ϴ� ���� (�÷��� ����) , ��¥�� date �ڵ���ȯ
INSERT INTO tbl_member VALUES (1,'����','momo@naver.com','2022-03-02');

-- �Ϻ� �÷��� �����͸� �����ϴ� ����
INSERT INTO tbl_member(mno, name)      -- �����Ͱ� ����� �÷��� ����
VALUES (2,'�̳���');
--------------------------------------------------------
-- 2. DML SELECT ���� (������ �� ��ȸ)
-- SELECT ��ȸ�� Į�� ��� from ���̺��̸� [where ���ǽ�]; ��� �÷��� *�� ��ü
SELECT name FROM TBL_MEMBER;
SELECT name,JOIN_DATE  FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER WHERE name = '�ִ���'; -- ���ǽ��� �÷��̸����� ��ȸ�� ����,����
SELECT * FROM TBL_MEMBER tm WHERE MNO > 2;
SELECT * FROM TBL_MEMBER tm WHERE JOIN_DATE > '2022-03-03';
-- null�� ��ȸ
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL;
-- ���ڿ��� �κΰ˻� : like ����
SELECT * FROM TBL_MEMBER WHERE name LIKE '%����'; -- %�� don`t care
SELECT * FROM TBL_MEMBER WHERE name LIKE '����%'; 
SELECT * FROM TBL_MEMBER WHERE name LIKE '%����%'; 
-- or ���� : mno���� 1 �Ǵ� 2 �Ǵ� 4
SELECT * FROM TBL_MEMBER
WHERE MNO = 1 OR MNO = 2 OR MNO = 4;
-- ����Ŭ�� or ��ü ������ : IN 
SELECT * FROM TBL_MEMBER WHERE MNO IN (1,2,4);
SELECT * FROM TBL_MEMBER WHERE NAME IN ('����','�ִ���');




-- Date ���� 
-- ����
INSERT INTO TBL_MEMBER 
VALUES (3, '�ִ���', 'dahy@naver.com', '2022-03-04 16:47'); -- ���� : ��¥�������� �ڵ���ȯ ����

-- ����Ŭ�� to_date�Լ��� ���ڿ��� ��¥�������� ��ȯ(�ι�° ���ڴ� ����)
INSERT INTO TBL_MEMBER 
VALUES (3, '�ִ���', 'dahy@naver.com', to_date('2022-03-04 16:47', 'YYYY-MM-DD HH24:MI'));

-- to_char �Լ� : ��¥���Ŀ��� ���ڿ��� �����Ѵ�. �ι�° ���ڴ� ���� -> �⵵ �Ǵ� �Ϻ� ���� ���⿡ Ȱ��
SELECT to_char(join_date, 'YYYY') FROM TBL_MEMBER;

--���� �ý����� ��¥�� �ð� : sysdate �Լ�
INSERT INTO TBL_MEMBER VALUES (4, '����', 'aaa@gmail.com', sysdate);

SELECT * FROM  tbl_member;

-- ó������ ���̺� ���� �� mno�÷��� ���е� 5�� ��Һ���
-- ��Һ����Ҷ��� mno �÷��� ���� �������
ALTER TABLE "C##IDEV".TBL_MEMBER MODIFY MNO NUMBER(5,0);