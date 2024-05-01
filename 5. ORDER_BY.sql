-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

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
-- ���� ������ 2�� 
-- 1�� �μ��ڵ� �������� (������ �⺻���� ��������)
-- 2�� �̸����� ��������
ORDER BY dept_cd, emp_nm DESC
;

-- ��Ī���� ���İ���
SELECT 
      emp_no AS ���
    , emp_nm AS �̸�
    , addr AS �ּ�
FROM tb_emp
ORDER BY �̸� DESC
;


SELECT 
      emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
-- �÷��������� dept_cd ������ ���� �� emp_no �������� ����
ORDER BY 3 ASC, 1 DESC
;


-- ����� ����
SELECT 
      emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
ORDER BY 3 ASC, emp_no DESC
;

SELECT emp_no AS ���, emp_nm AS �̸�, addr AS �ּ�
FROM tb_emp
ORDER BY �̸�, 1 DESC
;

SELECT 
      emp_no
    , SUM(pay_amt) ����
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


-- ������� 2019�� ����� ���ɾ��� 450���� �̻��� ����� �����ȣ�� 2019�� ���� ��ȸ
SELECT 
      emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
ORDER BY SUM(pay_amt) DESC
;



-- ���α׷��� ���� null���� �ٸ��� �ִ�.
SELECT
    emp_nm,
    direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no ASC
;
