--1)������ �߰��մϴ�. 'B1102' , '��Ʈ����ũ ������', '��ö��' ,'KBO' , '2020-11-10'
INSERT INTO tbl_book (bcode,title,writer,PUBLISHER,PDATE)
VALUES('B1102', '��Ʈ����ũ ������', '��ö��' ,'KBO' , '2020-11-10');

--2)�ݳ��� ������ ��ü�ϼ��� ����Ͽ� delay_days �÷����� update �մϴ�.
UPDATE tbl_bookrent SET delay_days = return_date - exp_date
WHERE RETURN_date IS NOT NULL;
SELECT * FROM tbl_bookrent tb;

--3)�������� ������ ��ü�ϼ� ����ؼ� ȸ�� IDX, �����ڵ�, ��ü�ϼ� ��ȸ�ϱ�
SELECT mem_idx, bcode, TO_DATE(TO_CHAR(SYSDATE, 'yyyy-MM-dd')) - exp_date 
FROM tbl_bookrent tb WHERE return_date IS NULL;

--4)���� ��ü ���� ȸ���� �̸�,��ȭ��ȣ�� �˻��մϴ�.
SELECT name,tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND SYSDATE > exp_date AND  return_date IS NULL;

--5)���� �������� ������ �������ڵ�� ������ �˻��մϴ�.
SELECT tb.bcode, title FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND  return_date IS NULL;

--6)���� ������ �뿩���� ȸ���� IDX�� ȸ���̸��� �˻��մϴ�.
SELECT bm.MEM_IDX , NAME FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND return_date IS NULL;

--7) �������� ������ ȸ���̸�, ������, �ݳ����� �˻�
SELECT bm.name, tb.title, tb2.EXP_DATE
FROM BOOK_MEMBER bm , TBL_BOOK tb , TBL_BOOKRENT tb2 
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE = tb2.BCODE 
AND tb2.RETURN_DATE IS NULL;

--8)���� ��ü ���� ������ ȸ��IDX, �����ڵ�, �ݳ������� �˻��մϴ�.
SELECT mem_idx,bcode,exp_date FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE ;

--9)ȸ��  IDX ��10002���� ���� ������ �������� ���ν����� �ۼ��մϴ�.

   -- ��ȸ������ �����ϴ� ���ν���
DECLARE
	vcnt NUMBER;
BEGIN
	SELECT COUNT(*) INTO vcnt 
	FROM TBL_BOOKRENT tb
	WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL; -- rcnt�� 0�϶��� �뿩 ����
	IF (vcnt = 0) THEN
		DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
	ELSE
		DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
	END IF;
END ;

-- ��� ���ν���
CREATE OR REPLACE PROCEDURE check_member(
	arg_mem book_member.MEM_IDX%TYPE,			--���ν��� ������ �� ���� ���� �Ű�����
	isOK OUT varchar2							--�ڹ��� ���ϰ� �ش��ϴ� �κ�.
)
IS 
		vcnt NUMBER;
		vname varchar2(100);
	BEGIN 	
		-- �Է¸Ű������� ����ȸ���ΰ��� Ȯ���ϴ� sql �� exceptionó��. arg_mem���� ȸ�����̺��� name ��ȸ
		-- ������ exception ó��
		SELECT name INTO vname
			FROM BOOK_MEMBER bm WHERE MEM_IDX = arg_mem;
		
		SELECT COUNT(*) INTO vcnt 
		FROM TBL_BOOKRENT tb
		WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;  -- rent�� 0�϶��� �뿩����
		if(vcnt = 0) THEN
			DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
			isOK := '����';
		ELSE
			DBMS_OUTPUT.put_line('�뿩 ���� å�� �ݳ��ؾ� �����մϴ�.');
			isOK := '�Ұ���';
		END IF;
		EXCEPTION		-- ����(����)ó��
		WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�.   ���� : no_data_found
		DBMS_OUTPUT.PUT_LINE('ȸ���� �ƴմϴ�.');
		isOK := 'no match';
		
	END;

-- ���ν��� �����ϱ�
DECLARE 
	vresult varchar2(20);
BEGIN
	CHECK_member(10002,vresult);
	DBMS_OUTPUT.put_line('��� : ' || vresult);
END;


--10)������ ���佺Ʈ�� ��� ������ ������ �������� ���ν����� �ۼ��մϴ�. ���ν����̸��� check_book����..

-- check_book ���ν���
CREATE OR REPLACE PROCEDURE CHECK_BOOK(
				arg_book IN tbl_book.title%TYPE,		--���ν��� ������ �� ���� �޴� �Ű�����
				isOK OUT varchar2						--�ڹ��� ���ϰ��� �ش��ϴ� �κ�
	)
	IS 
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT bcode INTO v_bcode		--v_bcode�� 'A1102'
		FROM TBL_BOOK tb WHERE title = arg_book;
	SELECT count(*) INTO v_cnt			--v_cnt���� 1�̸� v_bcode å�� ������
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL;
if(v_cnt = 1 ) THEN
	DBMS_OUTPUT.put_line('�뿩 ���� å�Դϴ�.');
	isOK := 'FALSE';
ELSE
	DBMS_OUTPUT.put_line('å �뿩 �����մϴ�.');
	isOK := 'TRUE';
END IF;
EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�.   ���� : no_data_found
		DBMS_OUTPUT.PUT_LINE('ã�� å�� �����ϴ�.');
		isOK := 'no match';
   -- ����å�� isOK := 'no match';

END;

DECLARE
	vresult varchar2(100);
BEGIN
	check_book('Ǫ������',vresult);
	DBMS_OUTPUT.put_line('��� : ' || vresult);
END;

--11)9�� 10�� �̿��ؼ� insert �� �ϴ� ���ν����� �ۼ��մϴ�.