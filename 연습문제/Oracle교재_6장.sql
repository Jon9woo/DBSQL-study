--6�� �������� 1��
-- John ����� �̸��� �μ��̸�, �μ���ġ(city)�� ����ϼ���.
--����Ŭ ����
SELECT first_name, department_name, city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
  AND d.location_id = l.location_id 
  AND e.first_name LIKE 'John';
--�Ƚ� ����
SELECT first_name, department_name, city
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations j
ON d.location_id = j.location_id
WHERE e.first_name LIKE 'John';

--6�� �������� 2��
-- 103�� ����� �����ȣ, �̸�, �޿�, �Ŵ����̸�, �Ŵ��� �μ��̸��� ����ϼ���.(�Ƚ��������� �ۼ��ϼ���)
SELECT e.employee_id, e.first_name, e.salary, m.first_name, d.department_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 103;

--6�� �������� 3��
-- 90���μ� ������� ���, �̸�, �޿�, �Ŵ����̸�, �Ŵ����޿�, �Ŵ����μ��̸��� ����ϼ���.
--����Ŭ ����
SELECT e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
FROM employees e, employees m, departments d
WHERE e.manager_id = m.employee_id(+) AND m.department_id = d.department_id(+) AND e.department_id = 90;
--�Ƚ�����
SELECT e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
FROM employees e
LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
LEFT OUTER JOIN departments d
ON m.department_id = d.department_id
WHERE e.department_id=90;

--6�� �������� 4��
-- 103������� �ٹ��ϴ� ���ô�?(�Ƚ� ���� �������� �ۼ��ϼ���)
SELECT employee_id, city
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE e.employee_id = 103;

--6�� �������� 5��
-- �����ȣ�� 103�λ���� �μ���ġ(city)�� �Ŵ����� �����̸�(job_title)�� ����ϼ���.(�Ƚ� ���� �������� �ۼ��ϼ���)
SELECT l.city, j.job_title
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
JOIN jobs j
ON m.job_id = j.job_id
WHERE e.employee_id = 103;


--6�� �������� 6��
-- ����� ��� ������ ��ȸ�ϴ� �������� �ۼ��ϼ���. 
-- ����� �μ���ȣ�� �μ��̸�����, �������̵�� �����̸�����, �Ŵ������̵�� �Ŵ����̸����� ����ϼ���.
SELECT e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, 
       j.job_title, e.salary, e.commission_pct, m.first_name AS manager_name , d.department_name
FROM employees e, employees m, jobs j, departments d
WHERE e.manager_id = m.employee_id(+) AND  m.job_id = j.job_id(+) AND e.department_id = d.department_id(+);

--7�� �������� 7��
-- ���� �� ������ �ִ� ������?
--1:SELECT	employee_id,
--2:		employees.first_name,  
--3:		e.department_id,
--4:		d.department_id
--5:FROM	employees	e,	departments	d	
--6:WHERE	e.department_id	=	d.department_id;

-- 2��, employees�� �ƴ� e�� ����ؾ���.