/*
1. hire_date�� 2006�� 1�� 1�� ������ ������ �̸�,��,�̸���

2. lastname�� 'Jones' �� ������ ��� �÷�

3. salary �� 5000 �̻��� ������ �̸�,��,JOB_ID ��ȸ

4. JOB_ID �� ACCOUNT �� ���� ������ �̸�,��,salary ��ȸ

5. �μ�_ID �� 50 ,60, 80,90 �� ������ ����_ID, �̸�,�� ��ȸ
*/
-- �ۼ��� : ��ġ��
--1
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM EMPLOYEES e WHERE HIRE_DATE < '2006-01-01';

--2
SELECT * FROM EMPLOYEES e WHERE LAST_NAME = 'Jones';

--3
SELECT FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES e WHERE SALARY >= 5000;

--4
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';

--5
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES e WHERE DEPARTMENT_ID IN (50,60,80,90);

-- ����Լ� : count, avg, max, min �׷��Լ� ��� �Ѵ�.
--          �ش� �Լ� ������� ���ϱ� ���� Ư�� �÷��� ����ؼ� ���� �����͸� �׷�ȭ �� �� ����
SELECT COUNT(*) FROM EMPLOYEES e ;  -- ���̺���ü ������ ����
SELECT MAX(salary) FROM EMPLOYEES e ;
SELECT MIN(salary) FROM EMPLOYEES e ;
SELECT AVG(salary) FROM EMPLOYEES e ; 
SELECT SUM(salary) FROM EMPLOYEES e ;

-- �� 5�� ����Լ��� JOB_ID = 'IT_PROG' ���� ���ǽ����� �Ȱ��� �����غ���
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT MAX(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT AVG(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; 
SELECT SUM(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';

-- ����Լ� ����� �ٸ� �÷����� ���� ��ȸ ���Ѵ�. (�׷��Լ��̱� ����)
SELECT JOB_ID, COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- ���� : ���ϱ׷��� �׷��Լ��� �ƴ�

-- ������ ��� : CREATE table, intert into, select ~ WHERE ~ �⺻ ����

-- ���� : ��Ī(alias) �÷� �Ǵ� ���̺� �̸��� �� �� ª�� �ٿ��� ���� �̸�
SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;
-- �������� ���� ��Ī�� �ʿ����. �׷��� ������ ������ �´�ϴ�.