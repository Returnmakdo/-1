-- �����ͺ��̽� Ʈ���� : insert, update, delete �Ҷ� �����ϴ� ���ν���
--   Ư�� ���̺� �����ִ� ��ü

CREATE OR REPLACE TRIGGER secure_custom
BEFORE UPDATE OR DELETE ON tbl_custom  -- Ʈ���Ű� �����ϴ� SQL����
BEGIN
	IF to_char(SYSDATE, 'HH24:MI') BETWEEN '13:00' AND '15:00' THEN
		raise_application_error(-20000, '���� ���� 1��~3�ô� �۾��� �� ���� �ð��Դϴ�.');
	END IF;
END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM TBL_CUSTOM tc WHERE CUSTOM_ID ='twice';

-- Ʈ���� ��Ȱ��ȭ
ALTER TRIGGER secure_custom disable;

-- Ʈ���ſ��ʿ��� ���̺� ������ ����.
CREATE TABLE tbl_temp
AS
SELECT * FROM TBL_BUY tb WHERE CUSTOM_ID = '0';

CREATE OR REPLACE TRIGGER cancel_buy
AFTER DELETE ON tbl_buy
FOR EACH ROW    -- ����(����)�ϴ� ���� �������϶� : OLD UPDATE �Ǵ� delete�ϱ� �� �� : NEW�� INSERT �� ��
BEGIN 
	-- �������(tbl_buy���̺��� ����)�� ������ tbl_temp �ӽ����̺� INSERT �ϱ� : �����࿡���� �۾�(�� Ʈ����)
	INSERT INTO tbl_temp
	VALUES 
	(:OLD.custom_id,:OLD.pcode,:OLD.quantity,:OLD.buy_date,:OLD.buyno);
END;
-- Ʈ���� ���� �׽�Ʈ
DELETE FROM TBL_BUY tb WHERE CUSTOM_ID ='wonder';
SELECT * FROM TBL_TEMP tt;

-- view �߰� ���� ����
--   grant create view to c##idev  -> �� �������� ���� ���� ����� �߰� ���� �ο�
CREATE VIEW v_buy
AS

SELECT tb.CUSTOM_ID, tb.PCODE, tc.EMAIL, tb.QUANTITY
FROM TBL_BUY tb , TBL_CUSTOM tc
WHERE tb.CUSTOM_ID = tc.CUSTOM_ID;

