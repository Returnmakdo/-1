-- 테이블 만드는 create table, 데이터형식 테스트

CREATE TABLE tbl_member(
	mno NUMBER,
	name nvarchar2(50),
	email varchar2(100),
	join_date DATE  --날짜 년-월-일, 시간 시:분:초:밀리초
);

-- 1. DML insert 형식 (데이터 행 추가)
-- 모든 컬럼에 데이터를 저장하는 형식 (컬럼명 생략) , 날짜는 date 자동변환
INSERT INTO tbl_member VALUES (1,'김모모','momo@naver.com','2022-03-02');

-- 일부 컬럼에 데이터를 저장하는 형식
INSERT INTO tbl_member(mno, name)      -- 데이터가 저장될 컬럼명 나열
VALUES (2,'이나나');
--------------------------------------------------------
-- 2. DML SELECT 형식 (데이터 행 조회)
-- SELECT 조회할 칼럼 목록 from 테이블이름 [where 조건식]; 모든 컬럼은 *로 대체
SELECT name FROM TBL_MEMBER;
SELECT name,JOIN_DATE  FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER;
SELECT * FROM TBL_MEMBER WHERE name = '최다현'; -- 조건식은 컬럼이름으로 조회할 관계,논리식
SELECT * FROM TBL_MEMBER tm WHERE MNO > 2;
SELECT * FROM TBL_MEMBER tm WHERE JOIN_DATE > '2022-03-03';
-- null값 조회
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NULL;
SELECT * FROM TBL_MEMBER tm WHERE EMAIL IS NOT NULL;
-- 문자열의 부부검색 : like 연산
SELECT * FROM TBL_MEMBER WHERE name LIKE '%다현'; -- %는 don`t care
SELECT * FROM TBL_MEMBER WHERE name LIKE '다현%'; 
SELECT * FROM TBL_MEMBER WHERE name LIKE '%다현%'; 
-- or 연산 : mno값이 1 또는 2 또는 4
SELECT * FROM TBL_MEMBER
WHERE MNO = 1 OR MNO = 2 OR MNO = 4;
-- 오라클의 or 대체 연산자 : IN 
SELECT * FROM TBL_MEMBER WHERE MNO IN (1,2,4);
SELECT * FROM TBL_MEMBER WHERE NAME IN ('김모모','최다현');




-- Date 형식 
-- 오류
INSERT INTO TBL_MEMBER 
VALUES (3, '최다현', 'dahy@naver.com', '2022-03-04 16:47'); -- 오류 : 날짜형식으로 자동변환 못함

-- 오라클의 to_date함수는 문자열을 날짜형식으로 변환(두번째 인자는 패턴)
INSERT INTO TBL_MEMBER 
VALUES (3, '최다현', 'dahy@naver.com', to_date('2022-03-04 16:47', 'YYYY-MM-DD HH24:MI'));

-- to_char 함수 : 날짜형식에서 문자열로 변경한다. 두번째 인자는 패턴 -> 년도 또는 일부 값만 추출에 활용
SELECT to_char(join_date, 'YYYY') FROM TBL_MEMBER;

--현재 시스템의 날짜와 시간 : sysdate 함수
INSERT INTO TBL_MEMBER VALUES (4, '쯔위', 'aaa@gmail.com', sysdate);

SELECT * FROM  tbl_member;

-- 처음만든 테이블 구조 중 mno컬럼을 정밀도 5로 축소변경
-- 축소변경할때는 mno 컬럼에 값이 없어야함
ALTER TABLE "C##IDEV".TBL_MEMBER MODIFY MNO NUMBER(5,0);