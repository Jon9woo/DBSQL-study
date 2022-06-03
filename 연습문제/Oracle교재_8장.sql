--8�� �������� 1��
--EMPLOYEES  ���̺�  �ִ�  �����͸�  ��  ������  ����  �����ϰ�  �ͽ��ϴ�.
--�����ȣ, ����̸�,  �޿�,  ���ʽ�����  �����ϱ�  ����  ������  �����͸�  ����  ���̺��� EMP_SALARY_INFO�̶�� �̸����� �����ϼ���. 
--�׸��� �����ȣ, ����̸�, �Ի���, �μ���ȣ�� �����ϱ�  ���� ������ �����͸� ���� ���̺��� EMP_HIREDATE_INFO�� �� �̸����� �����ϼ���.
CREATE TABLE emp_salary_info AS 
    SELECT employee_id, first_name, salary, commission_pct 
    FROM employees;
CREATE TABLE emp_hiredate_info AS 
    SELECT employee_id, first_name, hire_date, department_id 
    FROM employees;

--8�� �������� 2��
--EMPLOYEES ���̺� ���� �����͸� �߰��ϼ���
INSERT INTO employees
    (employees_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
    (1030, 'KilDong', 'HONG', 'HONGKD', '010-1234-5678' , '18/03/20', 'IT_PROG', 6000, 0.2, 103, 60);
    
--8�� �������� 3��
--1030�� ����� �޿��� 10% �λ��Ű����.
UPDATE employees
SET salary=salary*1.1
WHERE employee_id=1030;

--8�� �������� 4��
--1030�� ����� ������ �����ϼ���.
DELETE employees
WHERE employee_id=1030;

--8�� �������� 5��
--������̺��� �̿��Ͽ�, 2001����� 2003������� ������ �ٹ��� ������� ������̵�, �̸�, �Ի���, ������ ����ϼ���.
--����1)�� ������ �ش��ϴ� ���̺��� �����ϼ���. �Ӽ��� ������̵�, �̸�, �Ի���, ���� �Դϴ�. ������ ������ ũ�⸦ �����ϼ���. ���̺��̸��� ��emp_yr_������ �������� �����ϼ���.
--����2)���� ���� �Ի��Ͽ��� ������ ����ϼ���. �� �̸��� ��yr���̰�, 4�ڸ� ���ڷ� ǥ�� �ϼ���.
--����3)INSERT ALL �������� �ۼ��ϼ���.
CREATE TABLE emp_yr_2001 ( 
    employee_id NUMBER(6,0),
    first_name  VARCHAR2(20),
    hire_date   DATE,
    yr          VARCHAR2(20));

    
CREATE TABLE emp_yr_2002 ( 
    employee_id NUMBER(6,0),
    first_name  VARCHAR2(20),
    hire_date   DATE,
    yr          VARCHAR2(20));

CREATE TABLE emp_yr_2003 ( 
    employee_id NUMBER(6,0),
    first_name  VARCHAR2(20),
    hire_date   DATE,
    yr          VARCHAR2(20));
    
INSERT ALL
    WHEN TO_CHAR(hire_date,'RRRR') = '2001' THEN
        INTO emp_yr_2001 VALUES (employee_id, first_name, hire_date, yr)
    WHEN TO_CHAR(hire_date,'RRRR') = '2002' THEN
        INTO emp_yr_2002 VALUES (employee_id, first_name, hire_date, yr)
    WHEN TO_CHAR(hire_date,'RRRR') = '2003' THEN
        INTO emp_yr_2003 VALUES (employee_id, first_name, hire_date, yr)
    SELECT employee_id, first_name, hire_date, TO_CHAR(hire_date, 'RRRR') as yr
    FROM employees;
        
--8�� �������� 6��
--���� 5���� ����3�� �񱳿����ڸ� ����Ͽ�, INSERT FIRST �������� �ۼ��ϼ���.
INSERT FIRST --insert first ���� ù ���� when ������ ������ ������ ��� ������ when ���� �������� �ʴ´�.��
    WHEN hire_date <= '01/12/31' THEN
        INTO emp_yr_2001 VALUES (employee_id, first_name, hire_date, yr)
    WHEN hire_date <= '02/12/31' THEN
        INTO emp_yr_2002 VALUES (employee_id, first_name, hire_date, yr)
    WHEN hire_date <= '03/12/31' THEN
        INTO emp_yr_2003 VALUES (employee_id, first_name, hire_date, yr)
    SELECT employee_id, first_name, hire_date, TO_CHAR(hire_date, 'RRRR') as yr
    FROM employees;


--8�� �������� 7��
--Employees ���̺��� ����� ������ �Ʒ��� �� ���̺� ���� �����ϼ���.
--����1) emp_personal_info ���̺��� employee_id, first_name, last_name, email, phone_number�� ����ǵ��� �ϼ���.
--����2) emp_office_info ���̺��� employee_id, hire_date, salary, commission_pct, manager_id, department_id�� ����ǵ��� �ϼ���.
CREATE TABLE emp_personal_info AS
    SELECT employee_id, first_name, last_name, email, phone_number
    FROM employees
    WHERE 1=2;

CREATE TABLE emp_office_info AS
    SELECT employee_id, hire_date, salary, commission_pct, manager_id, department_id
    FROM employees
    WHERE 1=2;
--(UNCONDITIONAL INSERT ALL)
INSERT ALL
    INTO emp_personal_info VALUES
        (employee_id, first_name, last_name, email, phone_number)
    INTO emp_office_info VALUES
        (employee_id, hire_date, salary, commission_pct,manager_id, department_id)
    SELECT * FROM employees;


--8�� �������� 8��
--Employees ���̺��� ����� ������ �Ʒ��� �� ���̺� ���� �����ϼ���. 
--����1) ���ʽ��� �ִ� ������� ������ emp_comm ���̺� �����ϼ���. 
--����2) ���ʽ��� ���� ������� ������ emp_nocomm ���̺� �����ϼ���.
CREATE TABLE emp_comm AS SELECT * FROM employees WHERE 1=2;
CREATE TABLE emp_nocomm AS SELECT * FROM employees WHERE 1=2;
--(CONDITIONAL INSERT ALL)
INSERT ALL
    WHEN commission_pct IS NOT NULL THEN
    INTO emp_comm VALUES
        (employee_id, first_name, last_name, email, phont_number, hire_date, job_id, salary,
         commission_pct, manager_id, department_id)
    WHEN commission_pct IS NULL THEN
    INTO emp_nocomm VALUES
        (employee_id, first_name, last_name, email, phont_number, hire_date, job_id, salary,
         commission_pct, manager_id, department_id)
    SELECT * FROM employees;