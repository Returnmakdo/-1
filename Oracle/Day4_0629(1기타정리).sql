-- DDL : create, alter, drop, TRUNCATE 
-- (대상은 user, table, sequence, view, 단 truncate는 테이블만 사용)
-- DML : insert, update, delete

drop table STUDENTS0; -- 오류 : students0 테이블 먼저 삭제하면
           -- 원인 : 외래 키에 의해 참조되는 고유/기본 키가 테이블에 있습니다
drop table scores0;

-- UPDATE 테이블명 SET 칼럼명 : 값,컬럼명 = 값,컬럼명 = 값,.... WHERE 조건컬럼 관계식
-- DELETE FROM 테이블명 WHERE 조건컬럼관계식
-- 주의할점 : update 와 delete는 WHERE 없이 사용하는 것은 위험한 동작
--          truncate는 실행을 취소(rollback)할 수 없기 때문에 DDL에 속한다.
SELECT * FROM STUDENTS0 s ;
-- UPDATE , DELETE, SELECT 에서 where 의 컬럼이 기본키 컬럼이면
-- 실행되는 결과 반영되는 행은 몇개일까요? 최대1개
-- 기본키의 목적은 테이블의 여러행들을 구분(식별)
UPDATE STUDENTS0 SET age = 17 WHERE STUNO = 2021001;

-- rollback , commit 테스트 (데이터베이스 메뉴에서 트랜잭션 모드를 manual로 변경)
UPDATE STUDENTS0 SET ADDRESS = '성북구', age = 16 WHERE STUNO = 2021001;
ROLLBACK; -- 위의 UPDATE 실행을 취소
UPDATE STUDENTS0 SET ADDRESS = '성북구', age = 16 WHERE STUNO = 2021001;
COMMIT; -- 이미 commit이된 명령어는 ROLLBACK 못함
-------------------------------- 여기까지
-- 트랜잭션 관리명령 : ROLLBACK, COMMIT

DELETE FROM SCORES0;
ROLLBACK;
DELETE FROM SCORES0 WHERE STUNO = 2019019;
SELECT * FROM SCORES0;
-- 이 편집기는 트랜잭션 수동모드이고 같은창에서는 SELECT 결과가 2019019가 없다.
-- 다른편집기는 다른 클라이언트 이므로 이전 상태(최종커밋한 상태)로 보여집니다.
ROLLBACK;
SELECT * FROM STUDENTS0;
SELECT * FROM SCORES0;

-------------------------------------------- 여기까지

TRUNCATE TABLE SCORES0; -- 모든 데이터를 지운다. rollback이 되는지?
ROLLBACK;               -- 불가
-- 모든 데이터를 지울것이 확실하면 다른것들과 섞여서 롤백되지 않게 확실하게 TRUNCATE 해라.
---------------------------------------------------------
/*
 * INSERT
 * DELETE
 * COMMIT		(1)
 * UPDATE
 * DELETE
 * ROLLBACK		(2)
 * INSERT
 * INSERT
 * ROLLBACK		(3)
 * INSERT
 * UPDATE
 * COMMIT		(4)
 */