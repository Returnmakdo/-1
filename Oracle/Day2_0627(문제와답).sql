/*
1. hire_date가 2006년 1월 1일 이전인 직원의 이름,성,이메일

2. lastname이 'Jones' 인 직원의 모든 컬럼

3. salary 가 5000 이상인 직원의 이름,성,JOB_ID 조회

4. JOB_ID 에 ACCOUNT 가 들어가는 직원의 이름,성,salary 조회

5. 부서_ID 가 50 ,60, 80,90 인 직원의 직원_ID, 이름,성 조회
*/
-- 작성자 : 안치영
--1
SELECT FIRST_NAME, LAST_NAME, EMAIL FROM EMPLOYEES e WHERE HIRE_DATE < '2006-01-01';

--2
SELECT * FROM EMPLOYEES e WHERE LAST_NAME = 'Jones';

--3
SELECT FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES e WHERE SALARY >= 5000;

--4
SELECT FIRST_NAME, LAST_NAME, SALARY FROM EMPLOYEES e WHERE JOB_ID LIKE '%ACCOUNT%';

--5
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM EMPLOYEES e WHERE DEPARTMENT_ID IN (50,60,80,90);

-- 통계함수 : count, avg, max, min 그룹함수 라고도 한다.
--          해당 함수 결과값을 구하기 위해 특정 컬럼을 사용해서 여러 데이터를 그룹화 한 후 실행
SELECT COUNT(*) FROM EMPLOYEES e ;  -- 테이블전체 데이터 갯수
SELECT MAX(salary) FROM EMPLOYEES e ;
SELECT MIN(salary) FROM EMPLOYEES e ;
SELECT AVG(salary) FROM EMPLOYEES e ; 
SELECT SUM(salary) FROM EMPLOYEES e ;

-- 위 5개 통계함수를 JOB_ID = 'IT_PROG' 값을 조건식으로 똑같이 실행해보기
SELECT COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT MAX(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT MIN(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';
SELECT AVG(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; 
SELECT SUM(salary) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG';

-- 통계함수 결과는 다른 컬럼값과 같이 조회 못한다. (그룹함수이기 때문)
SELECT JOB_ID, COUNT(*) FROM EMPLOYEES e WHERE JOB_ID = 'IT_PROG'; -- 오류 : 단일그룹의 그룹함수가 아님

-- 오늘의 요약 : CREATE table, intert into, select ~ WHERE ~ 기본 형식

-- 참고 : 별칭(alias) 컬럼 또는 테이블 이름이 길 때 짧게 줄여서 쓰는 이름
SELECT * FROM EMPLOYEES e ;
SELECT * FROM DEPARTMENTS d ;
-- 위에서는 굳이 별칭이 필요없다. 그러나 언젠간 쓸날이 온답니다.