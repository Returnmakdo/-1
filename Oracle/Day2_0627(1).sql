-- 데이터 타입 number 연습 테이블
-- number : 자바에서 정수, 실수타입에 해당
--          number(정밀도,소수점이하 자리수)
CREATE TABLE tbl_number(
	col1 NUMBER,   	  -- 정밀도 지정안하면 최대 38자리
	col2 number(5),   -- 정수로 최대 5자리 (소수점이하 없음)
	col3 number(7,2), -- 전체 최대 7자리, 소수점이하 2자리고정
	col4 NUMBER(2,5)  -- 소수점이하 5자리 고정 , 유효숫자 최대 2자리
);

-- 정상실행값 테스트1
INSERT  INTO tbl_number VALUES (1234567, 12345, 12345.67, 0.00012);

-- DROP TABLE TBL_NUMBER ;  이미있는 테이블 제거 : 꼭 필요할때만 주의해서

-- 오류테스트 1 : col2값 자리수 초과 오류
INSERT INTO TBL_NUMBER 
VALUES (123456789, 123456, 12345.67, 0.00012);

-- 정상테스트 2 : col3값 소수이하 자리수 초과 ? 
INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345.6789, 0.00012);

-- 오류테스트 2 : col3 전체자리수(정밀도) 초과
INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 123456.6789, 0.00012);

-- 정상테스트 3 : col3에 소수점이하 값이 없을때
INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345, 0.00012);

-- 오류테스트 3 : col3필드 전체 자리 수 초과(소수점이하는 .00)
INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 123456, 0.00012);

-- col4 NUMBER (2,5)  -- 소수점이하 5자리고정, 0아닌 유효숫자 최대 2자리
-- 정상테스트 4
INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345.12, 0.00002);

INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345.12, 0.0002); -- 0.0002

INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345.12, 0.000126); -- 0.00013

INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345.12, 0.0012); -- 오류 0.00120 앞의 00은 유효 마지막0은 불필요 

-- 위의 4가지 예시 결론 : number(2,5) 에서 정밀도 < 소수점이하 자리수,
--                    2-5 = 3 소수점이하 유효 0이 3개이상이어야 한다.
INSERT INTO TBL_NUMBER 
VALUES (123456789, 1234, 12345, 0);

-- 조회
SELECT * FROM  TBL_NUMBER;