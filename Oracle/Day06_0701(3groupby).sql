-- ���� ���� �׷�ȭ�ϰ� �׷��Լ� ��� �մϴ�. �������� �Ʒ�ó�� �մϴ�.
-- SELECT �� �׷��Լ� from ���̺� �̸�
-- [WHERE]  �׷�ȭ �ϱ� ���� ����� ���ǽ�
-- GROUP BY �׷�ȭ�� ����� �÷���
-- [HAVING] �׷�ȭ ����� ���� ���ǽ�
-- [ORDER BY] �׷�ȭ ��� ������ �÷���� ���

SELECT PCODE , count(*) FROM TBL_BUY tb GROUP BY PCODE;
SELECT PCODE , count(*), sum(QUANTITY) 
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY 2;  -- ��ȸ�� �÷��� ��ġ
	
SELECT PCODE , count(*) cnt , sum(QUANTITY) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY cnt; -- �׷��Լ� ����� ��Ī
	
-- �׷�ȭ �Ŀ� �����հ谡 3�̻� ��ȸ
SELECT PCODE , count(*) cnt , sum(QUANTITY) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
--  HAVING total >= 3  : HAVING ���� �÷� ��Ī ��� ����. ���̺� �÷����� ��� �� �� ����
	HAVING sum(QUANTITY) >= 3
	ORDER BY cnt;

-- ���ų�¥ 2022-04-01 �����ΰ͸� �׷�ȭ�Ͽ� ��ȸ
SELECT PCODE , count(*) cnt , sum(QUANTITY) total
	FROM TBL_BUY tb
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE 
	ORDER BY cnt;

-- Day2 ����
-- ��� �Լ� : count,avg,max,min,sum

SELECT count(*) FROM EMPLOYEES e ;
SELECT max(SALARY) FROM EMPLOYEES e ;
SELECT min(SALARY) FROM EMPLOYEES e ;
SELECT avg(SALARY) FROM EMPLOYEES e ;
SELECT sum(SALARY) FROM EMPLOYEES e ;

