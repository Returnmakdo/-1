-- DDL : create, alter, drop, TRUNCATE 
-- (����� user, table, sequence, view, �� truncate�� ���̺� ���)
-- DML : insert, update, delete

drop table STUDENTS0; -- ���� : students0 ���̺� ���� �����ϸ�
           -- ���� : �ܷ� Ű�� ���� �����Ǵ� ����/�⺻ Ű�� ���̺� �ֽ��ϴ�
drop table scores0;

-- UPDATE ���̺�� SET Į���� : ��,�÷��� = ��,�÷��� = ��,.... WHERE �����÷� �����
-- DELETE FROM ���̺�� WHERE �����÷������
-- �������� : update �� delete�� WHERE ���� ����ϴ� ���� ������ ����
--          truncate�� ������ ���(rollback)�� �� ���� ������ DDL�� ���Ѵ�.
SELECT * FROM STUDENTS0 s ;
-- UPDATE , DELETE, SELECT ���� where �� �÷��� �⺻Ű �÷��̸�
-- ����Ǵ� ��� �ݿ��Ǵ� ���� ��ϱ��? �ִ�1��
-- �⺻Ű�� ������ ���̺��� ��������� ����(�ĺ�)
UPDATE STUDENTS0 SET age = 17 WHERE STUNO = 2021001;

-- rollback , commit �׽�Ʈ (�����ͺ��̽� �޴����� Ʈ����� ��带 manual�� ����)
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�', age = 16 WHERE STUNO = 2021001;
ROLLBACK; -- ���� UPDATE ������ ���
UPDATE STUDENTS0 SET ADDRESS = '���ϱ�', age = 16 WHERE STUNO = 2021001;
COMMIT; -- �̹� commit�̵� ��ɾ�� ROLLBACK ����
-------------------------------- �������
-- Ʈ����� ������� : ROLLBACK, COMMIT

DELETE FROM SCORES0;
ROLLBACK;
DELETE FROM SCORES0 WHERE STUNO = 2019019;
SELECT * FROM SCORES0;
-- �� ������� Ʈ����� ��������̰� ����â������ SELECT ����� 2019019�� ����.
-- �ٸ�������� �ٸ� Ŭ���̾�Ʈ �̹Ƿ� ���� ����(����Ŀ���� ����)�� �������ϴ�.
ROLLBACK;
SELECT * FROM STUDENTS0;
SELECT * FROM SCORES0;

-------------------------------------------- �������

TRUNCATE TABLE SCORES0; -- ��� �����͸� �����. rollback�� �Ǵ���?
ROLLBACK;               -- �Ұ�
-- ��� �����͸� ������� Ȯ���ϸ� �ٸ��͵�� ������ �ѹ���� �ʰ� Ȯ���ϰ� TRUNCATE �ض�.
---------------------------------------------------------
/*
 * INSERT
 * DELETE
 * COMMIT		(1)
 * UPDATE
 * DELETE
 * ROLLBACK		(2)
 * INSERT
 * INSERT
 * ROLLBACK		(3)
 * INSERT
 * UPDATE
 * COMMIT		(4)
 */