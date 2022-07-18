-- PL/SQL : Procedure(절차,순서), 기존의 단순한 SQL이 확장된 언어
-- 변수,제어문을 사용하여 프로그래밍 언어와 같이 sql실행의 흐름을 제어

-- 주의 : 디비버는 프로시저의 디버깅 기능이없다.(디버깅을 하려면 sql developer 사용)
DECLARE   -- 변수선언부  
	--vname varchar2(20);
	--vage number(3,0);
	vname tbl_custom.name %TYPE; --지정된 테이블의 컬럼과 동일형식의 변수
	vage tbl_custom.age %TYPE;

	
BEGIN		--프로시저 시작
-- 프로시저 내부에는 주로 DML 명령문들을 작성.(함께 실행해야할 여러 SQL : 트랜잭션)
	SELECT name,age 
	INTO vname , vage	-- 프로시저 구문: 검색결과를 변수에 저장
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID ='mina012';		-- 1개 행만 결과 조회되는 조건
	  								-- 여러개 행 조회될때는 다른 cursor 필요.
	
-- 변수값을 콘솔에 출력(프로시저 명령)
	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || vname);   -- ||는 문자열 연결 연산
	DBMS_OUTPUT.PUT_LINE('고객나이 : ' || vage);
	EXCEPTION		-- 예외(오류)처리
	WHEN no_data_found THEN   -- 예외 이름은 다양합니다.   예시 : no_data_found
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');
END;

-- 오라클 객체 프로시저 생성하기 : 검색할 값을 매개변수로 전달

CREATE OR REPLACE PROCEDURE search_custom2( -- 프로시저 이름 설정
	c_id IN tbl_custom.CUSTOM_ID %TYPE,  -- 매개변수 IN
	c_name OUT tbl_custom.NAME %TYPE   -- 리턴값 OUT
)
IS   
--일반변수선언
--	vname tbl_custom.NAME %TYPE ;
-- 	vage tbl_custom.age %TYPE;

BEGIN  -- 
	SELECT name
	INTO c_name	
	FROM "TBL_CUSTOM" tc 
	WHERE CUSTOM_ID = c_id;
	

	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || c_name);   
	EXCEPTION		
	WHEN no_data_found THEN 
		DBMS_OUTPUT.PUT_LINE('찾는 데이터가 없습니다.');	
		c_name := 'no match'; -- 대입문 := 기호
END;

-- 프로시저 실행
DECLARE
	vname tbl_custom.name %TYPE;
BEGIN
	search_custom2('twice', vname);   -- vname 은 프로시저 정의할때 out으로 정의함
--	vname := search_custom('twice'); 와 같은 형식 아니다.
	DBMS_OUTPUT.PUT_LINE('고객이름 : ' || vname);	
END;

-- Begin ~ End 에는 하나의 트랜잭션을 구성하는 DML(insert,update,delete 위주) 명령들로 구성
-- 오류가 생기면 Exception에서 rollback; 오류가 없을때만 commit;

-- 프로시저에서 쓸수있는 몇가지 SQL
-- 동일한 구조를 갖는 테이블 만들기
CREATE TABLE tbl_temp
AS
SELECT * FROM TBL_CUSTOM WHERE CUSTOM_ID = '0';

-- SELECT 한 결과를 insert하기
INSERT INTO tbl_temp (SELECT * FROM TBL_CUSTOM tc WHERE CUSTOM_ID='wonder');

SELECT * FROM TBL_TEMP tt ;



