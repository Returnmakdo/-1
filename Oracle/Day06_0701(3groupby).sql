-- 주제 행을 그룹화하고 그룹함수 사용 합니다. 사용순서는 아래처럼 합니다.
-- SELECT 문 그룹함수 from 테이블 이름
-- [WHERE]  그룹화 하기 전에 사용할 조건식
-- GROUP BY 그룹화에 사용할 컬럼명
-- [HAVING] 그룹화 결과에 대한 조건식
-- [ORDER BY] 그룹화 결과 정렬할 컬럼명과 방식

SELECT PCODE , count(*) FROM TBL_BUY tb GROUP BY PCODE;
SELECT PCODE , count(*), sum(QUANTITY) 
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY 2;  -- 조회된 컬럼의 위치
	
SELECT PCODE , count(*) cnt , sum(QUANTITY) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
	ORDER BY cnt; -- 그룹함수 결과의 별칭
	
-- 그룹화 후에 수량합계가 3이상만 조회
SELECT PCODE , count(*) cnt , sum(QUANTITY) total
	FROM TBL_BUY tb 
	GROUP BY PCODE 
--  HAVING total >= 3  : HAVING 에는 컬럼 별칭 사용 못함. 테이블 컬럼명은 사용 할 수 있음
	HAVING sum(QUANTITY) >= 3
	ORDER BY cnt;

-- 구매날짜 2022-04-01 이후인것만 그룹화하여 조회
SELECT PCODE , count(*) cnt , sum(QUANTITY) total
	FROM TBL_BUY tb
	WHERE BUY_DATE >= '2022-04-01'
	GROUP BY PCODE 
	ORDER BY cnt;

-- Day2 참고
-- 통계 함수 : count,avg,max,min,sum

SELECT count(*) FROM EMPLOYEES e ;
SELECT max(SALARY) FROM EMPLOYEES e ;
SELECT min(SALARY) FROM EMPLOYEES e ;
SELECT avg(SALARY) FROM EMPLOYEES e ;
SELECT sum(SALARY) FROM EMPLOYEES e ;

