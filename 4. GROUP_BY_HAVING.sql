
SELECT * FROM tb_sal_his;
-- 집계함수 (다중행 함수)
-- 여러 행을 묶어서 한번에 함수를 적용
SELECT
    COUNT (*)  " 지급 횟수",
    SUM(pay_amt) "지급 총액",
    AVG(pay_amt) "지급 평균",
    MAX(pay_amt) "최대 지급액",
    MIN(pay_amt) "최소 지급액"
FROM tb_sal_his
;

SELECT
    SUBSTR(emp_nm, 1,  1)
FROM tb_emp
;

SELECT
    *
FROM tb_emp 
;

SELECT
   COUNT( *)
FROM tb_emp 
;

SELECT
    emp_nm
FROM tb_emp
;

SELECT
    COUNT(emp_nm)
FROM tb_emp
;

SELECT
    emp_nm
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

SELECT
    COUNT(emp_nm)
FROM tb_emp
WHERE emp_nm LIKE '김%'
;

-- null 포함 41행
SELECT
    direct_manager_emp_no
FROM tb_emp
;

-- COUNT 값은 40 , 집계함수는 null을 빼고 집계함
SELECT
    COUNT(direct_manager_emp_no)
FROM tb_emp
;

--     이름       급여
    
--    홍길동     200
--    박영희     300
--    김철수     null
--    고길동     500

--     WHERE 급여 > 200
--     SUM(급여) -  300 + 500 = 800
--     WHERE 급여 > 1000
--     SUM(급여) -  null

--     SUM(급여)   -  200 + 300 + 500 = 1000
--     AVG(급여)   -  (200 + 300 + 500) / 3 = 333.33333 
--     COUNT(이름)  -  4
--     COUNT(급여)  -  3
--     COUNT(*)  -  4

CREATE TABLE quiz_50 (
    col1 NUMBER(10),
    col2 NUMBER(10),
    col3 NUMBER(10)
);

INSERT INTO quiz_50 VALUES (10, 20, null);
INSERT INTO quiz_50 VALUES (15, null, null);
INSERT INTO quiz_50 VALUES (50, 70, 20);

SELECT * FROM quiz_50;


SELECT SUM (col2) FROM quiz_50;
SELECT SUM(col1+col2+col3) FROM quiz_50;
SELECT SUM(col2+col3) FROM quiz_50;
SELECT SUM(col2)+SUM(col3) FROM quiz_50;

SELECT
    COUNT (emp_no) "총 사원수",
    MIN(birth_de) "최연장자 생일",
    MAX(birth_de) "최연소자 생일"
FROM tb_emp
;

-- 부서별로 사원수가 몇명인지 
-- 부서별로 최연장자의 생일은 언제인지

-- GROUP BY : 지정된 컬럼으로 소그룹화 한 후 
-- 각 그룹별로 집계함수를 각각 적용

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT
    dept_cd  "부서코드",
    COUNT (*) "부서별 사원수",
    MIN(birth_de) "부서별 최연장자"
FROM tb_emp
GROUP BY dept_cd
;

SELECT
     emp_no AS "사원번호",
    TO_CHAR(SUM(pay_amt),'L999,999,999') AS "총지급액",
    TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "사원별 평균",
    TO_CHAR(MAX(pay_amt),'L999,999,999') AS "사원별 최고액",
    TO_CHAR(MIN(pay_amt),'L999,999,999') AS "사원별 최소액",
     COUNT(pay_de) AS "수령횟수"
FROM tb_sal_his
-- GROUP BY는 ORDER BY 보다 위에 있어야함
GROUP BY emp_no
ORDER BY emp_no 
;


SELECT 
    emp_no ,
    emp_nm ,
    dept_cd ,
    birth_de
FROM tb_emp
;

SELECT 
 dept_cd, sex_cd , COUNT(*) , MAX(birth_de) 
FROM tb_emp
GROUP BY dept_cd, sex_cd
ORDER BY dept_cd
;




--    지역     지역별매출      매출기준년도
-- ??????????????????

--   서울      300                 2021
--   서울      500                 2021
--   서울      200                 2022
--   부산      200                 2021
--   부산      400                 2022
--   대구      300                 2021
--   대구      200                 2022
--   광주      400                 2022


--  GROUP BY 지역   ->    서울그룹, 부산그룹, 대구그룹, 광주그룹
--  GROUP BY 년도   ->    2021그룹, 2022그룹
--  GROUP BY 지역, 년도   ->    서울+2021그룹, 서울+2022그룹, 부산+2021그룹, …

--   SUM(매출)
--     서울    500
--     부산    600
--     대구    500
--     광주    400

-- 사원별로 2019년에 급여 평균액
-- 최대/최소 지급액

-- WHERE : 집계(통계) 전 필터링 GROUP BY 앞에
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- HAVING : 집계 후 필터링 GROUP BY 뒤에
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "사원별 총급여액",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "사원별 평균급여액",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "사원별 최고급여액",
    COUNT(pay_de) "급여 수령횟수"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4000000
ORDER BY emp_no
;


-- 부서별로 가장 어린사람의 생년월일, 연장자의 생년월일, 부서별 총 사원 수를 조회
-- 그런데 부서별 사원이 1명인 부서의 정보는 조회하고 싶지 않음.

SELECT
    dept_cd,
    MAX (birth_de),
    MIN (birth_de),
    COUNT(*) 
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT (*) >1
ORDER BY dept_cd
;



