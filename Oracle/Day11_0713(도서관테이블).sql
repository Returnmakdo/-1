CREATE TABLE book_member(
	mem_idx number(5) PRIMARY KEY,
	name varchar2(20) NOT NULL,
	email varchar2(20) NOT NULL,
	tel varchar2(20),
	password varchar2(10)
);
CREATE TABLE tbl_book(
	bcode char(5) PRIMARY KEY,
	title varchar2(30) NOT NULL,
	writer varchar2(20),
	publisher varchar2(20),
	pdate date
);
CREATE TABLE tbl_bookrent(	--'대여' 관계 저장
	rent_no number(5) PRIMARY KEY, --일렬번호
	mem_idx number(5) NOT NULL,
	bcode char(5) NOT NULL,
	rent_date DATE NOT NULL,		--빌린 날짜
	exp_date DATE NOT NULL,			--반남예정 날짜	
	return_date DATE,				--실제 반납 날짜
	delay_days NUMBER(3),			--연체 일수
	CONSTRAINT fk1 FOREIGN KEY (mem_idx)
		REFERENCES book_member(mem_idx),
	CONSTRAINT fk2 FOREIGN KEY (bcode)
		REFERENCES tbl_book(bcode)	
);
--회원번호 시퀀스
CREATE SEQUENCE memidx_seq START WITH 10001;
-- 대여 일렬번호를 위한 시퀀스
CREATE SEQUENCE bookrent_seq;

INSERT INTO BOOK_MEMBER (mem_idx,name,email,tel,password)
VALUES(memidx_seq.nextval, '이하니','honey@naver.com','010-9889-0567','1222');
INSERT INTO BOOK_MEMBER (mem_idx,name,email,tel,password)
VALUES(memidx_seq.nextval, '이세종','jong@daum.net','010-2354-6773','2345');
INSERT INTO BOOK_MEMBER (mem_idx,name,email,tel,password)
VALUES(memidx_seq.nextval, '최행운','lucky@korea.com','010-5467-8792','9876');
INSERT INTO BOOK_MEMBER (mem_idx,name,email,tel,password)
VALUES(memidx_seq.nextval, '나길동','nadong@kkk.net','010-3456-8765','3456');
INSERT INTO BOOK_MEMBER (mem_idx,name,email,tel,password)
VALUES(memidx_seq.nextval, '강감찬','haha@korea.net','010-3987-9087','1234');

INSERT INTO TBL_BOOK (bcode,title,WRITER,PUBLISHER,PDATE)
VALUES ('A1103','코스모스','칼세이건','사이언스북스',to_date('06/12/01','YY/MM/DD'));
--문자열에서 날짜타입으로 자동캐스팅됩니다. 함수를 사용할 떄에는 to_date() 함수 사용합니다
-- 참고 : 날짜타입을 문자열로 변환시키는 것은? to_char()함수
INSERT INTO TBL_BOOK (bcode,title,WRITER,PUBLISHER,PDATE)
VALUES ('B1101','해커스토익','이해커','해커스랩',to_date('18/07/10','YY/MM/DD'));
INSERT INTO TBL_BOOK (bcode,title,WRITER,PUBLISHER,PDATE)
VALUES ('C1101','푸른사자 와니니','이현','창비',to_date('15/06/20','YY/MM/DD'));
INSERT INTO TBL_BOOK (bcode,title,WRITER,PUBLISHER,PDATE)
VALUES ('A1102','페스트','알베르트 까뮈','민옴사',to_date('11/03/01','YY/MM/DD'));

INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES (bookrent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES (bookrent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES (bookrent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
VALUES (bookrent_seq.nextval,10004,'C1101','2022-06-30','2022-07-14');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE)
VALUES (bookrent_seq.nextval,10001,'A1101','2022-07-04','2022-07-18');
INSERT INTO TBL_BOOKRENT (rent_no,MEM_IDX,BCODE,RENT_DATE,EXP_DATE,RETURN_DATE)
VALUES (bookrent_seq.nextval,10003,'A1102','2021-07-06','2022-07-20','2022-07-13');
SELECT * FROM TBL_BOOKRENT tb ;