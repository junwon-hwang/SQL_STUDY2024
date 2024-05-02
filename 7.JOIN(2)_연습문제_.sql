-- 1. employees���̺�� departments���̺��� inner join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.

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

-- 2. employees���̺�� departments���̺��� natural join�Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.
SELECT
    E.first_name,
    E.last_name,
    department_id,
    D.department_name
FROM employees E
natural JOIN departments D
ORDER BY e.employee_id
;
-- 3. employees���̺�� departments���̺��� using���� ����Ͽ�
--    ���, first_name, last_name, department_id, department_name�� ��ȸ�ϼ���.

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

-- 4. employees���̺�� departments���̺�� locations ���̺��� 
--     join�Ͽ� employee_id, first_name, department_name, city�� ��ȸ�ϼ���

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

-- 5. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
-- ����� first_name, last_name, job_title�� ��ȸ�ϼ���.

SELECT
    E.first_name,
    E.last_name,
    j.job_title
FROM employees E
INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY e.employee_id
;

--  6. employees ���̺�� departments ���̺��� INNER JOIN�Ͽ� 
-- �μ���� �� �μ��� �ִ� �޿����� ��ȸ�ϼ���.

SELECT
    D.department_name,
    MAX(E.salary)
FROM employees E
INNER JOIN departments D
ON E.department_id = D.department_id
GROUP BY department_name
ORDER BY MAX(E.salary)
;

-- 7. employees ���̺�� jobs ���̺��� INNER JOIN�Ͽ� 
--    ������ ��� �޿��� ���� Ÿ��Ʋ�� ��ȸ�ϼ���.

SELECT
    j.job_title,
    AVG(e.salary)
FROM employees E
INNER JOIN jobs J
ON e.job_id = j.job_id
GROUP BY j.job_title
ORDER BY AVG(e.salary)
;
