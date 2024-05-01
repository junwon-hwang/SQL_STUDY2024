-- ORDER BY : 정렬
-- ASC : 오름차 정렬 (기본값), DESC : 내림차 정렬
-- 항상 SELECT절의 맨 마지막에 위치

SELECT 
      emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

SELECT 
      emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm ASC
;

SELECT 
      emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
-- 정렬 조건이 2개 
-- 1차 부서코드 오름차순 (없으면 기본값이 오름차순)
-- 2차 이름별로 내림차순
ORDER BY dept_cd, emp_nm DESC
;

-- 별칭으로 정렬가능
SELECT 
      emp_no AS 사번
    , emp_nm AS 이름
    , addr AS 주소
FROM tb_emp
ORDER BY 이름 DESC
;


SELECT 
      emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
-- 컬럼순서별로 dept_cd 오름차 정렬 후 emp_no 내림차순 정렬
ORDER BY 3 ASC, 1 DESC
;


-- 섞어서도 가능
SELECT 
      emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS 사번, emp_nm AS 이름, addr AS 주소
FROM tb_emp
ORDER BY 이름, 1 DESC
;

SELECT 
      emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY emp_no
;


SELECT 
	EMP_NM ,
	DIRECT_MANAGER_EMP_NO 
FROM TB_EMP
ORDER BY DIRECT_MANAGER_EMP_NO DESC
;


-- 사원별로 2019년 월평균 수령액이 450만원 이상인 사원의 사원번호와 2019년 연봉 조회
SELECT 
      emp_no
    , SUM(pay_amt) 연봉
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC
;



-- 프로그램에 따라 null값이 다를수 있다.
SELECT
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no ASC
;
