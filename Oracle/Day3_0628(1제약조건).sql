-- �������� ������ create table, alter table ���� �մϴ�

-- ���� ���� 1: not null : col2�÷��� �ݵ�� ���� �����ؾ� �Ѵ�.
CREATE TABLE tbl# (
	col1 varchar2(10),
	col2 number(3) NOT NULL
);

INSERT INTO tbl#(col2) VALUES (98);
INSERT INTO tbl#(col1) VALUES ('korean'); -- ���� : col2�÷��� NOT NULL �������� ����
INSERT INTO tbl# VALUES ('korean', 78);
INSERT INTO tbl# VALUES ('korean', 88);

-- Ȯ��
SELECT * FROM tbl#;

-- ���ο� ���������� 2) unique�� ���� col3
ALTER TABLE tbl# ADD col3 varchar2(10) UNIQUE; -- ������ ���̾�� �� (����ũĮ������ null ���)

-- ���� insert�� ������� �����Ҷ� ������ �߻��ϴ� ����?
INSERT INTO tbl#(col1) VALUES ('english'); -- ����
INSERT INTO tbl#(col2) VALUES (77);
INSERT INTO tbl#(col3) VALUES ('english'); -- ����
INSERT INTO tbl#(col1,col2) VALUES ('english',88);
INSERT INTO tbl#(col2,col3) VALUES (88,'science');
INSERT INTO tbl#(col1,col3) VALUES ('science',88); -- ���� (col2�� ����)
INSERT INTO tbl#(col1,col2,col3) VALUES ('english',89,'science'); -- ���� : science�� �������ѹ� �־���� ������(unique)
INSERT INTO tbl#(col1,col2,col3) VALUES ('english',89,'math');

-- �������� 3) �⺻Ű (primary key)�� not null �� unique ��������
CREATE TABLE tbl2# (
	tno number(3) PRIMARY KEY,
	tid number(3) UNIQUE 
);
SELECT * FROM "TBL2#";
INSERT INTO tbl2#(tno) VALUES (123);
INSERT INTO tbl2#(tno) VALUES (123); -- ���Ἲ ���� ����(pk �⺻Ű �÷�)�� ����˴ϴ�(unique)
INSERT INTO tbl2#(tid) VALUES (123); -- NOT NULL 

-- �������� 4) check : �÷����� ������ ���� -> age �÷����� 16~80  null ���
ALTER TABLE TBL2# ADD age number(3) CHECK (age BETWEEN 16 AND 80);
INSERT INTO TBL2#(tno,tid,age) VALUES (222,123,20);
INSERT INTO TBL2#(tno,tid,age) VALUES (222,123,90); -- ���� CHECK���� ����
-- ���� gender �÷� �߰�
ALTER TABLE "TBL2#" ADD gender char(1) CHECK (gender IN ('M','F'));
INSERT INTO TBL2#(tno,gender) VALUES (224,'F');
INSERT INTO TBL2#(tno,gender) VALUES (225,'M');
INSERT INTO TBL2#(tno,gender) VALUES (226,'m'); -- üũ �������� ����

-- ���� gender �÷��� �������� ������ ����(drop) �� �߰�(add)�ؾ� �Ѵ�.
ALTER TABLE "TBL2#" DROP CONSTRAINTS tbl2__chk_gender;
ALTER TABLE "TBL2#" ADD CONSTRAINTS tbl2__chk_gender2
CHECK (gender IN ('M','F','m','f'));
-- ���� gender �÷��� �������Ǹ� �����ϴ� ���� �ٸ���ɾ�� �ؾ��Ѵ�.
-- alter table ~ drop constraints �� ���� ���������� �����ؾ��մϴ�.
INSERT INTO "TBL2#" (tno,gender) VALUES (226,'m');
INSERT INTO "TBL2#" (tno,gender) VALUES (227,'f');



