
-- WHERE 조건절
-- 조회 행을 제한 
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd 
FROM tb_emp
WHERE sex_cd = 2
;

-- PK로 필터링을 하면 무조건 1건 이하가 조회됨
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd 
FROM tb_emp
WHERE emp_no = 1000000003
;

-- 비교 연산자 
SELECT
    emp_no,
    emp_nm,
    addr,
    sex_cd 
FROM tb_emp
WHERE sex_cd != 2
;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE birth_de >= '19800101'
        AND birth_de <= '19891231' ;

SELECT
    emp_no,
    emp_nm,
    addr,
    birth_de
FROM tb_emp
WHERE NOT birth_de >= '19800101'
;

-- BETWWEN 연산자 
SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de BETWEEN '19900101' AND '19992131'
;

SELECT
    emp_no, emp_nm, birth_de
FROM tb_emp
WHERE birth_de NOT BETWEEN '19900101' AND '19992131'
;

-- IN 연산자 :  OR 연산자
SELECT 
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd  = 100002 
        OR dept_cd = 100007
;

SELECT 
    emp_no, emp_nm, dept_cd
FROM tb_emp
WHERE dept_cd NOT IN (10002,10007,10008)
;

--LIKE 
--검색에서 사용
--와일드카드 매핑( %: 0글자 이상,  _: 딱 1글자 )

-- 용인 거주자
SELECT 
    emp_no , emp_nm, addr
FROM tb_emp
WHERE addr LIKE '%용인%'
;

--  성이 "이" 인 사람
 
-- 이 _ _ 는 이름이 반드시 3글자이어야함 , 이 _ 이름이 외자여야함 
SELECT 
    emp_no , emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '이__'
;

-- 이% 는 뒤에 이름 글자수 상관없음
SELECT 
    emp_no , emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '이%'
;

-- 이름이 심으로 끝나는 사람 
SELECT 
    emp_no , emp_nm, addr
FROM tb_emp
WHERE emp_nm LIKE '%심'
;

-- 두번째 글자 A 뒤에 나머지 글자에 @가 포함
SELECT 
    email
FROM user
WHERE email LIKE '_A%@%'
;




SELECT
    -- 세로로 쓰면 주석 처리가 하기 쉬움 
    emp_no, 
    emp_nm, 
    birth_de,
    dept_cd
FROM tb_emp
WHERE  1=1 -- 주석처리 하기 쉽게 1=1 붙이고 나머지 AND 
        AND emp_nm LIKE '김%'  -- 성씨가 김씨이면서
        AND dept_cd IN (100003,100004) -- 부서가 100003, 100004 중에 하나
        AND birth_de BETWEEN '19900101' AND '19991231'
        -- 90년대생인 사원의 사번, 이름, 생일, 부서코드를 조회
;

-- NULL 값 조회
-- 반드시 IS NULL로 조회할 것!
SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NULL
;

SELECT 
    emp_no,
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
WHERE direct_manager_emp_no IS NOT NULL
;

-- 연산자 우선 순위
-- NOT > AND > OR
SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE 1=1
	AND EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' OR ADDR LIKE '%일산%')
;

SELECT 
	EMP_NO ,
	EMP_NM ,
	ADDR 
FROM TB_EMP
WHERE EMP_NM LIKE '김%'
	AND (ADDR LIKE '%수원%' 
    OR ADDR LIKE '%일산%')
;
-- (1 AND 2) OR 3





