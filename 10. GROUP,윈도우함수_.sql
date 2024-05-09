

-- 트랜잭션

CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1,'김철수',15);
INSERT INTO student VALUES (2,'홍길동',16) ;

SELECT * FROM student;
COMMIT;

INSERT INTO student VALUES (3,'도우너',12) ;

SELECT * FROM student;

ROLLBACK;

-- 계좌 이체 
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '김철수';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '박영희';

COMMIT ; 

SELECT * FROM student;
DELETE FROM student;
ROLLBACK;

-- 오라클은 DDL 수행시 자동 커밋
-- SQL SEVER은 자동 커밋 안됨

-- delete는 롤백하면 살아남
-- truncate는 안살아남

SELECT * FROM student;
TRUNCATE TABLE student;


-- GROUP 함수 
-- ROLLUP(A,B) =>  A로 통계 1번 , A+B통계 1번, 전체 통계 1번
-- GROUPING => null 1이면  아니면 0
-- GROUPING SET (A,B) => A로 1번 , B로 1번 , () => 전체통계
-- CUBE (A,B) => 모든 경우의 수 

-- WINDOW FUNCTION
--RANK : 1,2,2,4,4,4,4,8
-- DENSE_RANK : 1,2,2,3,3,3,3,4
-- ROW_NUMBER : 1,2,3,4,5,6,7,8


-- DCL
-- GRANT TO 권한추가
-- REVOKE FROM 권한삭제
-- CASCADE : 연쇄적 취소
-- WHERE 절 사용하려면 SELECT있어야함

-- DDL
-- ON DELETE CASCADE 예)게시물 지울때 댓글도 같이 지워라


CREATE TABLE 고객_38(
    고객ID NUMBER PRIMARY KEY,
    고객명 VARCHAR2 (100)
);

CREATE TABLE 컨텐츠_38(
    컨텐츠ID NUMBER PRIMARY KEY,
    컨텐츠명 VARCHAR2 (100)
);

CREATE TABLE 추천컨텐츠_38(
    고객ID NUMBER,
    컨텐츠ID NUMBER,
    추천대상일자 DATE
);

CREATE TABLE 비선호컨텐츠_38(
    고객ID NUMBER,
    컨텐츠ID NUMBER,
    등록일자 DATE
);

INSERT INTO 고객_38 VALUES (1,'김철수');
INSERT INTO 고객_38 VALUES (2,'박영희');
COMMIT;

INSERT INTO 컨텐츠_38 VALUES (1,'영화');
INSERT INTO 컨텐츠_38 VALUES (2,'에니메이션');
INSERT INTO 컨텐츠_38 VALUES (3,'다큐멘터리');

INSERT INTO 추천컨텐츠_38 VALUES (1,1,SYSDATE);
INSERT INTO 추천컨텐츠_38 VALUES (1,2,SYSDATE);
INSERT INTO 추천컨텐츠_38 VALUES (2,2,SYSDATE);

INSERT INTO 비선호컨텐츠_38 VALUES (1,2,SYSDATE);
INSERT INTO 비선호컨텐츠_38 VALUES (2,1,SYSDATE);
INSERT INTO 비선호컨텐츠_38 VALUES (2,3,SYSDATE);

SELECT * FROM 고객_38;
SELECT * FROM 컨텐츠_38;
SELECT * FROM 추천컨텐츠_38;
SELECT * FROM 비선호컨텐츠_38;