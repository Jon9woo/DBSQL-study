-- EQUI JOIN

-- join
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- self join
SELECT e.first_name AS employee_name, m.first_name as manager_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id AND e.employee_id = 103;

-- self join 2
SELECT e.first_name, m.first_name
FROM employees e, employees m
WHERE e.manager_id = m.employee_id AND e.employee_id = 102;

--NON EQUI JOIN

-- ����� �ش� ����� �ӱ��� ���� �� �ִ� ���� ���
SELECT e.first_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY first_name;

-- OUTER JOIN
-- Oracle�� Full outer join ��������

--Left Outer Join
SELECT e.employee_id, e.first_name, e.hire_date,
       j.start_date, j.end_date, j.job_id, j.department_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+) -- (+)�� �������� ���ء�
ORDER BY j.employee_id;

-- ANSI JOIN
--CROSS JOIN 
-- Cartesian Product�� ���� ����� ���

--NATURAL JOIN
--�� table�� ���� �̸� ���� �ڵ� ����(equi)

--USING JOIN
--���ϴ� �÷��� ���ؼ��� ���������� EQUi ����
SELECT first_name, department_name
FROM employees
JOIN departments
USING (department_id);

--ON JOIN
--JOIN ���Ŀ� ������� ���������� ���� �߰����� ���
SELECT department_name, street_address, city, state_province
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

-- 3�� ����
SELECT e.first_name, d.department_name,
    l.street_address ||','|| l.city ||','|| l.state_province AS address
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--WHERE ������ ȥ��
SELECT e.first_name AS name, d.department_name AS department,
        l.street_address||','|| l.city ||','||l.state_province AS address
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE employee_id=103; -- WHERE�� ������ ON ���� AND �������� �߰��ص� ��.

--ANSI OUTER JOIN
SELECT e.employee_id, e.first_name, e.hire_date,
       j.start_date, j.end_date, j.job_id, j.department_id
FROM employees e
LEFT OUTER JOIN job_history j --outer�� ��������
ON e.employee_id = j.employee_id
ORDER BY j.employee_id;