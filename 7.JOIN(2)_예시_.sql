-- 사원의 first_name, employee_id, department_id, dept_name

SELECT
    E.employee_id,
    E.first_name,
    E.department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
ORDER BY e.employee_id
;

-- using절로 변경
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
USING (department_id)
ORDER BY e.employee_id
;


-- natural join 과 inner join 의 값은 항상 같지 않음
-- 공통컬럼이 2개 조인조건 2개 
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    D.department_name
FROM employees E
NATURAL JOIN departments D
ORDER BY e.employee_id
;

SELECT
    E.employee_id,
    E.first_name,
    E.department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
    AND E.manager_id = d.manager_id
ORDER BY e.employee_id
;

-- using
SELECT
    E.employee_id,
    E.first_name,
    department_id,
    D.department_name
FROM employees E
INNER JOIN departments D
USING (department_id, manager_id)
ORDER BY e.employee_id
;

