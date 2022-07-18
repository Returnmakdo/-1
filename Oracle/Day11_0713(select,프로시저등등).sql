--1)도서를 추가합니다. 'B1102' , '스트라이크 던지기', '박철순' ,'KBO' , '2020-11-10'
INSERT INTO tbl_book (bcode,title,writer,PUBLISHER,PDATE)
VALUES('B1102', '스트라이크 던지기', '박철순' ,'KBO' , '2020-11-10');

--2)반납된 도서의 연체일수를 계산하여 delay_days 컬럼값을 update 합니다.
UPDATE tbl_bookrent SET delay_days = return_date - exp_date
WHERE RETURN_date IS NOT NULL;
SELECT * FROM tbl_bookrent tb;

--3)대출중인 도서의 연체일수 계산해서 회원 IDX, 도서코드, 연체일수 조회하기
SELECT mem_idx, bcode, TO_DATE(TO_CHAR(SYSDATE, 'yyyy-MM-dd')) - exp_date 
FROM tbl_bookrent tb WHERE return_date IS NULL;

--4)현재 연체 중인 회원의 이름,전화번호를 검색합니다.
SELECT name,tel FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND SYSDATE > exp_date AND  return_date IS NULL;

--5)현재 대출중인 도서의 도서명코드와 도서명 검색합니다.
SELECT tb.bcode, title FROM TBL_BOOK tb JOIN TBL_BOOKRENT tb2 
ON tb.BCODE = tb2.BCODE AND  return_date IS NULL;

--6)현재 도서를 대여중인 회원의 IDX와 회원이름을 검색합니다.
SELECT bm.MEM_IDX , NAME FROM BOOK_MEMBER bm JOIN TBL_BOOKRENT tb 
ON bm.MEM_IDX = tb.MEM_IDX AND return_date IS NULL;

--7) 대출중인 도서의 회원이름, 도서명, 반납기한 검색
SELECT bm.name, tb.title, tb2.EXP_DATE
FROM BOOK_MEMBER bm , TBL_BOOK tb , TBL_BOOKRENT tb2 
WHERE bm.MEM_IDX = tb2.MEM_IDX AND tb.BCODE = tb2.BCODE 
AND tb2.RETURN_DATE IS NULL;

--8)현재 연체 중인 도서의 회원IDX, 도서코드, 반납기한을 검색합니다.
SELECT mem_idx,bcode,exp_date FROM TBL_BOOKRENT tb 
WHERE SYSDATE > EXP_DATE ;

--9)회원  IDX ‘10002’는 도서 대출이 가능한지 프로시저를 작성합니다.

   -- 일회용으로 실행하는 프로시저
DECLARE
	vcnt NUMBER;
BEGIN
	SELECT COUNT(*) INTO vcnt 
	FROM TBL_BOOKRENT tb
	WHERE MEM_IDX = 10001 AND RETURN_DATE IS NULL; -- rcnt가 0일때만 대여 가능
	IF (vcnt = 0) THEN
		DBMS_OUTPUT.put_line('책 대여 가능합니다.');
	ELSE
		DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
	END IF;
END ;

-- 멤버 프로시저
CREATE OR REPLACE PROCEDURE check_member(
	arg_mem book_member.MEM_IDX%TYPE,			--프로시저 실행할 때 값을 받을 매개변수
	isOK OUT varchar2							--자바의 리턴값 해당하는 부분.
)
IS 
		vcnt NUMBER;
		vname varchar2(100);
	BEGIN 	
		-- 입력매개변수가 없는회원인가를 확인하는 sql 과 exception처리. arg_mem으로 회원테이블에서 name 조회
		-- 없으면 exception 처리
		SELECT name INTO vname
			FROM BOOK_MEMBER bm WHERE MEM_IDX = arg_mem;
		
		SELECT COUNT(*) INTO vcnt 
		FROM TBL_BOOKRENT tb
		WHERE MEM_IDX = arg_mem AND RETURN_DATE IS NULL;  -- rent가 0일때만 대여가능
		if(vcnt = 0) THEN
			DBMS_OUTPUT.put_line('책 대여 가능합니다.');
			isOK := '가능';
		ELSE
			DBMS_OUTPUT.put_line('대여 중인 책을 반납해야 가능합니다.');
			isOK := '불가능';
		END IF;
		EXCEPTION		-- 예외(오류)처리
		WHEN no_data_found THEN   -- 예외 이름은 다양합니다.   예시 : no_data_found
		DBMS_OUTPUT.PUT_LINE('회원이 아닙니다.');
		isOK := 'no match';
		
	END;

-- 프로시저 실행하기
DECLARE 
	vresult varchar2(20);
BEGIN
	CHECK_member(10002,vresult);
	DBMS_OUTPUT.put_line('결과 : ' || vresult);
END;


--10)도서명에 ‘페스트’ 라는 도서가 대출이 가능한지 프로시저를 작성합니다. 프로시저이름은 check_book으로..

-- check_book 프로시저
CREATE OR REPLACE PROCEDURE CHECK_BOOK(
				arg_book IN tbl_book.title%TYPE,		--프로시저 실행할 때 값을 받는 매개변수
				isOK OUT varchar2						--자바의 리턴값에 해당하는 부분
	)
	IS 
	v_bcode varchar2(100);
	v_cnt NUMBER;
BEGIN
	SELECT bcode INTO v_bcode		--v_bcode는 'A1102'
		FROM TBL_BOOK tb WHERE title = arg_book;
	SELECT count(*) INTO v_cnt			--v_cnt값이 1이면 v_bcode 책은 대출중
		FROM TBL_BOOKRENT tb2 WHERE BCODE = v_bcode AND return_date IS NULL;
if(v_cnt = 1 ) THEN
	DBMS_OUTPUT.put_line('대여 중인 책입니다.');
	isOK := 'FALSE';
ELSE
	DBMS_OUTPUT.put_line('책 대여 가능합니다.');
	isOK := 'TRUE';
END IF;
EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   -- 예외 이름은 다양합니다.   예시 : no_data_found
		DBMS_OUTPUT.PUT_LINE('찾는 책이 없습니다.');
		isOK := 'no match';
   -- 없는책은 isOK := 'no match';

END;

DECLARE
	vresult varchar2(100);
BEGIN
	check_book('푸른사자',vresult);
	DBMS_OUTPUT.put_line('결과 : ' || vresult);
END;

--11)9과 10을 이용해서 insert 를 하는 프로시저를 작성합니다.