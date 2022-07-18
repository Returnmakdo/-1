-- PL/SQL : Procedure(����,����), ������ �ܼ��� SQL�� Ȯ��� ���
-- ����,����� ����Ͽ� ���α׷��� ���� ���� sql������ �帧�� ����

-- ���� : ������ ���ν����� ����� ����̾���.(������� �Ϸ��� sql developer ���)
DECLARE   -- ���������  
	--vname varchar2(20);
	--vage number(3,0);
	vname tbl_custom.name %TYPE; --������ ���̺��� �÷��� ���������� ����
	vage tbl_custom.age %TYPE;

	
BEGIN		--���ν��� ����
-- ���ν��� ���ο��� �ַ� DML ��ɹ����� �ۼ�.(�Բ� �����ؾ��� ���� SQL : Ʈ�����)
	SELECT name,age 
	INTO vname , vage	-- ���ν��� ����: �˻������ ������ ����
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='mina012';		-- 1�� �ุ ��� ��ȸ�Ǵ� ����
	  								-- ������ �� ��ȸ�ɶ��� �ٸ� cursor �ʿ�.
	
-- �������� �ֿܼ� ���(���ν��� ���)
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);   -- ||�� ���ڿ� ���� ����
	DBMS_OUTPUT.PUT_LINE('������ : ' || vage);
	EXCEPTION		-- ����(����)ó��
	WHEN no_data_found THEN   -- ���� �̸��� �پ��մϴ�.   ���� : no_data_found
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');
END;

-- ����Ŭ ��ü ���ν��� �����ϱ� : �˻��� ���� �Ű������� ����

CREATE OR REPLACE PROCEDURE search_custom2( -- ���ν��� �̸� ����
	c_id IN tbl_custom.CUSTOM_ID %TYPE,  -- �Ű����� IN
	c_name OUT tbl_custom.NAME %TYPE   -- ���ϰ� OUT
)
IS   
--�Ϲݺ�������
--	vname tbl_custom.NAME %TYPE ;
-- 	vage tbl_custom.age %TYPE;

BEGIN  -- 
	SELECT name
	INTO c_name	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID = c_id;
	

	DBMS_OUTPUT.PUT_LINE('���̸� : ' || c_name);   
	EXCEPTION		
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('ã�� �����Ͱ� �����ϴ�.');	
		c_name := 'no match'; -- ���Թ� := ��ȣ
END;

-- ���ν��� ����
DECLARE
	vname tbl_custom.name %TYPE;
BEGIN
	search_custom2('twice', vname);   -- vname �� ���ν��� �����Ҷ� out���� ������
--	vname := search_custom('twice'); �� ���� ���� �ƴϴ�.
	DBMS_OUTPUT.PUT_LINE('���̸� : ' || vname);	
END;

-- Begin ~ End ���� �ϳ��� Ʈ������� �����ϴ� DML(insert,update,delete ����) ��ɵ�� ����
-- ������ ����� Exception���� rollback; ������ �������� commit;

-- ���ν������� �����ִ� ��� SQL
-- ������ ������ ���� ���̺� �����
CREATE TABLE tbl_temp
AS
SELECT * FROM TBL_CUSTOM WHERE CUSTOM_ID = '0';

-- SELECT �� ����� insert�ϱ�
INSERT INTO tbl_temp (SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID='wonder');

SELECT * FROM TBL_TEMP tt ;



