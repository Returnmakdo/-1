-- 작성자 안치영
CREATE TABLE std#(
	num char(7) PRIMARY KEY,
	name nvarchar2(16) NOT NULL,
	age number(2),
	addr nvarchar2(16)
);
SELECT * FROM std#;

INSERT INTO std# VALUES (2021001,'김모모',16,'서초구');
INSERT INTO std# VALUES (2019019,'강다현',18,'강남구');



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


INSERT INTO scores# VALUES (2021001,'국어',89,'이나연','2022_1');
INSERT INTO scores# VALUES (2021001,'영어',78,'김길동','2022_1');
INSERT INTO scores# VALUES (2021001,'과학',67,'박세리','2021_2');
INSERT INTO scores# VALUES (2019019,'국어',92,'이나연','2019_2');
INSERT INTO scores# VALUES (2019019,'영어',85,'박지성','2019_2');
INSERT INTO scores# VALUES (2019019,'과학',88,'박세리','2020_1');


--선생님 답안
CREATE TABLE students0(
	stuno char(7) PRIMARY KEY,
	name nvarchar2(20) NOT NULL,
	age number(3) CHECK (age BETWEEN 10 AND 30),
	address nvarchar2(50)
);

INSERT INTO students0(stuno,name,age,address)
VALUES ('2021001','김모모',16,'서초구');
INSERT INTO students0(stuno,name,age,address)
VALUES ('2019019','강다현',18,'강남구');

SELECT * FROM students0;
SELECT * FROM scores0;

CREATE TABLE scores0(
	stuno char(7) NOT NULL, -- 아래 기본키 있기때문에 생략 가능
	subject nvarchar2(20) NOT NULL,  -- 아래 기본키 있기때문에 생략 가능
	jumsu number(3) NOT NULL,	-- 점수
	teacher nvarchar2(20) NOT NULL,
	term char(7) NOT NULL,	-- 학기
	PRIMARY KEY (stuno,subject),  -- 기본키 설정(not null 그리고 unique)
	FOREIGN KEY (stuno) REFERENCES students0(stuno) 
	                     --ㄴ 외래키설정 (참조: 키워드 뒤에 참조테이블(참조컬럼))
	                     --ㄴ 외래키컬럼은 FOREIGN KEY 키워드 뒤에 () 안에 작성.
	-- 검색해보기 -> 참조컬럼의 조건은? 기본키 또는 unique 제약조건 컬럼만 된다.
);

-- 한번에 실행하려면 드래그에서 ALT + X
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','국어',89,'이나연','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','영어',78,'김길동','2022_1');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2021001','과학',67,'박세리','2021_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','국어',92,'이나연','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','영어',85,'박지성','2019_2');
INSERT INTO scores0(stuno,subject,jumsu,teacher,term)
VALUES ('2019019','과학',88,'박세리','2020_1');


