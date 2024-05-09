

-- Ʈ�����

CREATE TABLE student (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    age NUMBER
);

INSERT INTO student VALUES (1,'��ö��',15);
INSERT INTO student VALUES (2,'ȫ�浿',16) ;

SELECT * FROM student;
COMMIT;

INSERT INTO student VALUES (3,'�����',12) ;

SELECT * FROM student;

ROLLBACK;

-- ���� ��ü 
UPDATE tb_account
SET balance = balance + 5000
WHERE name = '��ö��';

UPDATE tb_account
SET balance = balance - 5000
WHERE name = '�ڿ���';

COMMIT ; 

SELECT * FROM student;
DELETE FROM student;
ROLLBACK;

-- ����Ŭ�� DDL ����� �ڵ� Ŀ��
-- SQL SEVER�� �ڵ� Ŀ�� �ȵ�

-- delete�� �ѹ��ϸ� ��Ƴ�
-- truncate�� �Ȼ�Ƴ�

SELECT * FROM student;
TRUNCATE TABLE student;


-- GROUP �Լ� 
-- ROLLUP(A,B) =>  A�� ��� 1�� , A+B��� 1��, ��ü ��� 1��
-- GROUPING => null 1�̸�  �ƴϸ� 0
-- GROUPING SET (A,B) => A�� 1�� , B�� 1�� , () => ��ü���
-- CUBE (A,B) => ��� ����� �� 

-- WINDOW FUNCTION
--RANK : 1,2,2,4,4,4,4,8
-- DENSE_RANK : 1,2,2,3,3,3,3,4
-- ROW_NUMBER : 1,2,3,4,5,6,7,8


-- DCL
-- GRANT TO �����߰�
-- REVOKE FROM ���ѻ���
-- CASCADE : ������ ���
-- WHERE �� ����Ϸ��� SELECT�־����

-- DDL
-- ON DELETE CASCADE ��)�Խù� ���ﶧ ��۵� ���� ������


CREATE TABLE ��_38(
    ��ID NUMBER PRIMARY KEY,
    ���� VARCHAR2 (100)
);

CREATE TABLE ������_38(
    ������ID NUMBER PRIMARY KEY,
    �������� VARCHAR2 (100)
);

CREATE TABLE ��õ������_38(
    ��ID NUMBER,
    ������ID NUMBER,
    ��õ������� DATE
);

CREATE TABLE ��ȣ������_38(
    ��ID NUMBER,
    ������ID NUMBER,
    ������� DATE
);

INSERT INTO ��_38 VALUES (1,'��ö��');
INSERT INTO ��_38 VALUES (2,'�ڿ���');
COMMIT;

INSERT INTO ������_38 VALUES (1,'��ȭ');
INSERT INTO ������_38 VALUES (2,'���ϸ��̼�');
INSERT INTO ������_38 VALUES (3,'��ť���͸�');

INSERT INTO ��õ������_38 VALUES (1,1,SYSDATE);
INSERT INTO ��õ������_38 VALUES (1,2,SYSDATE);
INSERT INTO ��õ������_38 VALUES (2,2,SYSDATE);

INSERT INTO ��ȣ������_38 VALUES (1,2,SYSDATE);
INSERT INTO ��ȣ������_38 VALUES (2,1,SYSDATE);
INSERT INTO ��ȣ������_38 VALUES (2,3,SYSDATE);

SELECT * FROM ��_38;
SELECT * FROM ������_38;
SELECT * FROM ��õ������_38;
SELECT * FROM ��ȣ������_38;