-- 1. employees테이블과 departments테이블을 inner join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.

SELECT
    E.first_name,
    E.last_name,
    E.department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
ORDER BY e.employee_id
;

SELECT
    E.first_name,
    E.last_name,
    E.department_id,
    D.department_name
FROM employees E , departments D
WHERE e.department_id = d.department_id
ORDER BY e.employee_id
;

-- 2. employees테이블과 departments테이블을 natural join하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.
SELECT
    E.first_name,
    E.last_name,
    department_id,
    D.department_name
FROM employees E
natural JOIN departments D
ORDER BY e.employee_id
;
-- 3. employees테이블과 departments테이블을 using절을 사용하여
--    사번, first_name, last_name, department_id, department_name을 조회하세요.

SELECT
    E.first_name,
    E.last_name,
    department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
USING (department_id)
ORDER BY e.employee_id
;

-- 4. employees테이블과 departments테이블과 locations 테이블을 
--     join하여 employee_id, first_name, department_name, city를 조회하세요

SELECT
    E.first_name,
    E.employee_id,
    D.department_name,
    L.city
FROM employees E
INNER JOIN departments D
ON e.department_id = d.department_id
INNER JOIN locations L
ON d.location_id = l.location_id
ORDER BY e.employee_id
;

-- 5. employees 테이블과 jobs 테이블을 INNER JOIN하여 
-- 사원의 first_name, last_name, job_title을 조회하세요.

SELECT
    E.first_name,
    E.last_name,
    j.job_title
FROM employees E
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.employee_id
;

--  6. employees 테이블과 departments 테이블을 INNER JOIN하여 
-- 부서명과 각 부서의 최대 급여값을 조회하세요.

SELECT
    D.department_name,
    MAX(E.salary)
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
GROUP BY department_name
ORDER BY MAX(E.salary)
;

-- 7. employees 테이블과 jobs 테이블을 INNER JOIN하여 
--    직무별 평균 급여와 직무 타이틀을 조회하세요.

SELECT
    j.job_title,
    AVG(e.salary)
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY AVG(e.salary)
;
