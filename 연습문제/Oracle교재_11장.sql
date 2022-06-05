--�������� 11�� 1��
--ȸ�� ������ �����ϴ� ���̺�(member)�� �����ϼ���. ȸ�� ������ ����� ���̵�(15), �̸�(20), ��й�ȣ(20), ��ȭ��ȣ(15), �̸���(100)�� �����ؾ� �մϴ�. ��ȣ ���� ���� �� ũ���Դϴ�. ȸ�� ������ �����ϴ� ���̺��� ����� ���̵� PK�� �����ϴ�.
CREATE TABLE member(
    user_id VARCHAR2(15)    CONSTRAINT member_user_id_pk PRIMARY KEY, --������ �������� (���û���)
    name VARCHAR2(20)       NOT NULL,
    password VARCHAR2(20)   NOT NULL,
    phonenumber VARCHAR2(15),
    email VARCHAR2(100));
    
--�������� 11�� 2��
--���� ���̺� ������ �����ؼ� ���������� �߰��ϼ���.
--DEPT ���̺��� DEPTNO ���� ��Ű(primary key) ���̾�� �մϴ�. ���������� �̸��� pk_dept�� �ϼ���.
--EMP ���̺��� EMPNO ���� ��Ű(primary key) ���̾�� �մϴ�. ���������� �̸��� pk_emp�� �ϼ���.
--EMP ���̺��� DEPTNO ���� DEPT ���̺��� DEPTNO ���� �����ϴ� �ܷ�Ű(foreign key)���� �մϴ�. ���������� �̸��� fk_deptno�� �ϼ���.

--(1) ���̺� ���� �� ����
CREATE TABLE dept(
    deptno NUMBER(2),
    dname  VARCHAR(14),
    loc    VARCHAR(13)
    );
CREATE TABLE emp(
    empno   NUMBER(4,0),
    ename   VARCHAR2(10),
    job     VARCHAR2(9),
    mgr     NUMBER(4,0),
    hiredate date,
    sal     NUMBER(7,2),
    comm    NUMBER(7,2),
    deptno  NUMBER(2,0)
    );

ALTER TABLE dept
ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);

ALTER TABLE emp
ADD CONSTRAINT pk_emp PRIMARY KEY (empno);

ALTER TABLE emp
ADD CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno);


--(2) ���̺� ������ ���ÿ� �������� ����
CREATE TABLE dept(
    deptno  NUMBER(2),
    dname   VARCHAR2(14),
    loc     VARCHAR2(13)
    CONSTRAINT PK_dept PRIMARY KEY(deptno)
    );

CREATE TABLE emp(
    empno   NUMBER(4,0),
    ename   VARCHAR2(10),
    job     VARCHAR2(9),
    mgr     NUMBER(4,0),
    hiredate date,
    sal     NUMBER(7,2),
    comm    NUMBER(7,2),
    deptno  NUMBER(2,0)
    CONSTRAINT pk_emp PRIMARY KEY(empno)
    CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES dept(deptno)
    );


--�������� ��ȸ
SELECT *
FROM user_constraints;