-- �ۼ��� ��ġ��
CREATE TABLE std#(
	num char(7) PRIMARY KEY,
	name nvarchar2(16) NOT NULL,
	age number(2),
	addr nvarchar2(16)
);
SELECT * FROM std#;

INSERT INTO std# VALUES (2021001,'����',16,'���ʱ�');
INSERT INTO std# VALUES (2019019,'������',18,'������');



CREATE TABLE scores#(
	num char(7) NOT NULL,
	sub nvarchar2(20) NOT NULL,
	score number(3) NOT NULL,
	teacher nvarchar2(20) NOT NULL,
	semester nvarchar2(20) NOT NULL 
);
SELECT * FROM scores#;

ALTER TABLE scores# ADD CONSTRAINT pk_scores PRIMARY KEY (num,sub);
ALTER TABLE scores# ADD CONSTRAINT fk_scores FOREIGN KEY (num) REFERENCES std#(num);


INSERT INTO scores# VALUES (2021001,'����',89,'�̳���','2022_1');
INSERT INTO scores# VALUES (2021001,'����',78,'��浿','2022_1');
INSERT INTO scores# VALUES (2021001,'����',67,'�ڼ���','2021_2');
INSERT INTO scores# VALUES (2019019,'����',92,'�̳���','2019_2');
INSERT INTO scores# VALUES (2019019,'����',85,'������','2019_2');
INSERT INTO scores# VALUES (2019019,'����',88,'�ڼ���','2020_1');


--������ ���
CREATE TABLE students0(
	stuno char(7) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	age number(3) CHECK (age BETWEEN 10 AND 30),
	address nvarchar2(50)
);

INSERT INTO students0(stuno,name,age,address)
VALUES ('2021001','����',16,'���ʱ�');
INSERT INTO students0(stuno,name,age,address)
VALUES ('2019019','������',18,'������');

SELECT * FROM students0;
SELECT * FROM scores0;

CREATE TABLE scores0(
	stuno char(7) NOT NULL, -- �Ʒ� �⺻Ű �ֱ⶧���� ���� ����
	subject nvarchar2(20) NOT NULL,  -- �Ʒ� �⺻Ű �ֱ⶧���� ���� ����
	jumsu number(3) NOT NULL,	-- ����
	teacher nvarchar2(20) NOT NULL,
	term char(7) NOT NULL,	-- �б�
	PRIMARY KEY (stuno,subject),  -- �⺻Ű ����(not null �׸��� unique)
	FOREIGN KEY (stuno) REFERENCES students0(stuno) 
	                     --�� �ܷ�Ű���� (����: Ű���� �ڿ� �������̺�(�����÷�))
	                     --�� �ܷ�Ű�÷��� FOREIGN KEY Ű���� �ڿ� () �ȿ� �ۼ�.
	-- �˻��غ��� -> �����÷��� ������? �⺻Ű �Ǵ� unique �������� �÷��� �ȴ�.
);

-- �ѹ��� �����Ϸ��� �巡�׿��� ALT + X
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','����',89,'�̳���','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','����',78,'��浿','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','����',67,'�ڼ���','2021_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','����',92,'�̳���','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','����',85,'������','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','����',88,'�ڼ���','2020_1');


