-- 문자열 타입
-- CHAR(길이) : 고정길이 , 단위는 바이트 
-- VARCHAR(길이) : 오라클에서 존재하지만 사용하지 않는 예비자료형.
-- VARCHAR2(길이) : 가변형길이 단위 바이트, 길이는 최대길이이고 실제로 메모리는 데이터크기만큼 사용합니다.
--				최대 2000바이트입니다. UTF-8 인코딩에서 한글은 3바이트, 영문/숫자/기호는 1바이트

CREATE TABLE tbl_string (
 	acol char(10),      -- 10 바이트 고정길이
 	bcol varchar2(10),  -- 10 바이트 가변길이
 	ccol nchar(10),     -- 10개 문자 고정길이
 	dcol nvarchar2(10)  -- 10개 문자 가변길이
);

-- char 타입 
INSERT  INTO tbl_string(acol) VALUES ('abcdefghij');
INSERT  INTO tbl_string(acol) VALUES ('abcdef'); -- acol은 고정길이 타입 : 공백추가
INSERT  INTO tbl_string(acol) VALUES ('abcdefghijklm'); -- 오류: 길이초과
-- INSERT 확인
SELECT  * FROM  TBL_STRING;

-- 한글 확인
INSERT  INTO TBL_STRING(acol) VALUES ('가나다');
INSERT  INTO TBL_STRING(acol) VALUES ('가나다라'); -- 오류 : 최대값10인데 한글은 하나당3이므로
INSERT  INTO TBL_STRING(acol) VALUES ('가나');

-- varchar2 타입 : bcol은 가변길이 10바이트
INSERT  INTO tbl_string(bcol) VALUES ('abcdefghij');
INSERT  INTO tbl_string(bcol) VALUES ('abcdef'); -- bcol은 고정길이 타입 : 공백추가없음
INSERT  INTO tbl_string(bcol) VALUES ('abcdefghijklm'); -- 오류: 길이초과

-- INSERT 확인
SELECT  * FROM  TBL_STRING;

-- 한글 확인
INSERT  INTO TBL_STRING(bcol) VALUES ('가나다');  -- 공백추가 없음.
INSERT  INTO TBL_STRING(bcol) VALUES ('가나다라'); -- 오류 : 최대값10인데 한글은 하나당3이므로
INSERT  INTO TBL_STRING(bcol) VALUES ('가나');

-- char과 varchar2는 바이트단위. nchar과 nvarchar2는 문자개수 단위
-- nchar 타입
INSERT  INTO TBL_STRING(ccol) VALUES ('가나다');    -- 공백 7개추가	
INSERT  INTO TBL_STRING(ccol) VALUES ('가나다라');  -- 공백 6개추가
INSERT  INTO TBL_STRING(ccol) VALUES ('가나');     -- 공백 8개추가

-- nvarchar2 타입
INSERT  INTO TBL_STRING(dcol) VALUES ('가나다');   -- 공백없음
INSERT  INTO TBL_STRING(dcol) VALUES ('가나다라'); 
INSERT  INTO TBL_STRING(dcol) VALUES ('가나');

