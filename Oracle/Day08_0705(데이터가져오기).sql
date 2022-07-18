-- 데이터 가져오기
-- 제공되는 csv 형식의 파일을 테이블로 변환할 수 있는 기능
-- 주의사항 : 자동으로 생성되는 테이블 컬럼의 크기가 데이터보다 작지않게 또는 적정한 타입으로 설정해야함

-- ANIMAL_INS  테이블 행이 80187개정도 되면 sql 쿼리의 실행속도 차이를 확인할 수 있다.
SELECT * FROM ANIMAL_INS ai ORDER BY ANIMAL_ID ;
SELECT * FROM ANIMAL_OUTS ao ORDER BY ANIMAL_ID ;

-- 데이터 내보내기
--   현재 데이터베이스의 테이블 구조와 행들을 파일로 내보낸다.
--   DDL 테이블, 시퀀스 생성 명령문과 INSERT 명령들을 만들어서  .sql파일을 만들수 있다.

-- 프로그래머스 문제에서 필요한 오라클함수 : nvl(null value) 널값을 대체하는 문자열 지정
--                        decode 컬럼값에 따라 출력문자열을 지정