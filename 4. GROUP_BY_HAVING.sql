
SELECT * FROM tb_sal_his;
-- �����Լ� (������ �Լ�)
-- ���� ���� ��� �ѹ��� �Լ��� ����
SELECT
    COUNT (*)  " ���� Ƚ��",
    SUM(pay_amt) "���� �Ѿ�",
    AVG(pay_amt) "���� ���",
    MAX(pay_amt) "�ִ� ���޾�",
    MIN(pay_amt) "�ּ� ���޾�"
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
WHERE emp_nm LIKE '��%'
;

SELECT
    COUNT(emp_nm)
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

-- null ���� 41��
SELECT
    direct_manager_emp_no
FROM tb_emp
;

-- COUNT ���� 40 , �����Լ��� null�� ���� ������
SELECT
    COUNT(direct_manager_emp_no)
FROM tb_emp
;

--     �̸�       �޿�
    
--    ȫ�浿     200
--    �ڿ���     300
--    ��ö��     null
--    ��浿     500

--     WHERE �޿� > 200
--     SUM(�޿�) -  300 + 500 = 800
--     WHERE �޿� > 1000
--     SUM(�޿�) -  null

--     SUM(�޿�)   -  200 + 300 + 500 = 1000
--     AVG(�޿�)   -  (200 + 300 + 500) / 3 = 333.33333 
--     COUNT(�̸�)  -  4
--     COUNT(�޿�)  -  3
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
    COUNT (emp_no) "�� �����",
    MIN(birth_de) "�ֿ����� ����",
    MAX(birth_de) "�ֿ����� ����"
FROM tb_emp
;

-- �μ����� ������� ������� 
-- �μ����� �ֿ������� ������ ��������

-- GROUP BY : ������ �÷����� �ұ׷�ȭ �� �� 
-- �� �׷캰�� �����Լ��� ���� ����

SELECT
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT
    dept_cd  "�μ��ڵ�",
    COUNT (*) "�μ��� �����",
    MIN(birth_de) "�μ��� �ֿ�����"
FROM tb_emp
GROUP BY dept_cd
;

SELECT
     emp_no AS "�����ȣ",
    TO_CHAR(SUM(pay_amt),'L999,999,999') AS "�����޾�",
    TO_CHAR(ROUND(AVG(pay_amt),2),'L999,999,999') AS "����� ���",
    TO_CHAR(MAX(pay_amt),'L999,999,999') AS "����� �ְ��",
    TO_CHAR(MIN(pay_amt),'L999,999,999') AS "����� �ּҾ�",
     COUNT(pay_de) AS "����Ƚ��"
FROM tb_sal_his
-- GROUP BY�� ORDER BY ���� ���� �־����
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




--    ����     ����������      ������س⵵
-- ??????????????????

--   ����      300                 2021
--   ����      500                 2021
--   ����      200                 2022
--   �λ�      200                 2021
--   �λ�      400                 2022
--   �뱸      300                 2021
--   �뱸      200                 2022
--   ����      400                 2022


--  GROUP BY ����   ->    ����׷�, �λ�׷�, �뱸�׷�, ���ֱ׷�
--  GROUP BY �⵵   ->    2021�׷�, 2022�׷�
--  GROUP BY ����, �⵵   ->    ����+2021�׷�, ����+2022�׷�, �λ�+2021�׷�, ��

--   SUM(����)
--     ����    500
--     �λ�    600
--     �뱸    500
--     ����    400

-- ������� 2019�⿡ �޿� ��վ�
-- �ִ�/�ּ� ���޾�

-- WHERE : ����(���) �� ���͸� GROUP BY �տ�
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� ��ձ޿���",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ�޿���",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- HAVING : ���� �� ���͸� GROUP BY �ڿ�
SELECT 
    emp_no, 
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� ��ձ޿���",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "����� �ְ�޿���",
    COUNT(pay_de) "�޿� ����Ƚ��"
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4000000
ORDER BY emp_no
;


-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����.

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



