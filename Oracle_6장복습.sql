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

-- 사람별 해당 사람의 임금이 속할 수 있는 직무 출력
SELECT e.first_name, e.salary, j.job_title
FROM employees e, jobs j
WHERE e.salary BETWEEN j.min_salary AND j.max_salary
ORDER BY first_name;

-- OUTER JOIN
-- Oracle은 Full outer join 지원안함

--Left Outer Join
SELECT e.employee_id, e.first_name, e.hire_date,
       j.start_date, j.end_date, j.job_id, j.department_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+) -- (+)가 없는쪽이 기준★
ORDER BY j.employee_id;

-- ANSI JOIN
--CROSS JOIN 
-- Cartesian Product와 같은 결과를 출력

--NATURAL JOIN
--두 table의 같은 이름 열로 자동 조인(equi)

--USING JOIN
--원하는 컬럼에 대해서만 선택적으로 EQUi 조인
SELECT first_name, department_name
FROM employees
JOIN departments
USING (department_id);

--ON JOIN
--JOIN 이후에 논리연산과 서브쿼리와 같은 추가서술 기능
SELECT department_name, street_address, city, state_province
FROM departments d
JOIN locations l ON d.location_id = l.location_id;

-- 3중 조인
SELECT e.first_name, d.department_name,
    l.street_address ||','|| l.city ||','|| l.state_province AS address
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id;

--WHERE 절과의 혼용
SELECT e.first_name AS name, d.department_name AS department,
        l.street_address||','|| l.city ||','||l.state_province AS address
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE employee_id=103; -- WHERE절 조건은 ON 절에 AND 형식으로 추가해도 됨.

--ANSI OUTER JOIN
SELECT e.employee_id, e.first_name, e.hire_date,
       j.start_date, j.end_date, j.job_id, j.department_id
FROM employees e
LEFT OUTER JOIN job_history j --outer는 생략가능
ON e.employee_id = j.employee_id
ORDER BY j.employee_id;