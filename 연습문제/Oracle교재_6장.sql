--6장 연습문제 1번
-- John 사원의 이름과 부서이름, 부서위치(city)를 출력하세요.
--오라클 조인
SELECT first_name, department_name, city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id 
  AND d.location_id = l.location_id 
  AND e.first_name LIKE 'John';
--안시 조인
SELECT first_name, department_name, city
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations j
ON d.location_id = j.location_id
WHERE e.first_name LIKE 'John';

--6장 연습문제 2번
-- 103번 사원의 사원번호, 이름, 급여, 매니저이름, 매니저 부서이름을 출력하세요.(안시조인으로 작성하세요)
SELECT e.employee_id, e.first_name, e.salary, m.first_name, d.department_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 103;

--6장 연습문제 3번
-- 90번부서 사원들의 사번, 이름, 급여, 매니저이름, 매니저급여, 매니저부서이름을 출력하세요.
--오라클 조인
SELECT e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
FROM employees e, employees m, departments d
WHERE e.manager_id = m.employee_id(+) AND m.department_id = d.department_id(+) AND e.department_id = 90;
--안시조인
SELECT e.employee_id, e.first_name, e.salary, m.first_name, m.salary, d.department_name
FROM employees e
LEFT OUTER JOIN employees m
ON e.manager_id = m.employee_id
LEFT OUTER JOIN departments d
ON m.department_id = d.department_id
WHERE e.department_id=90;

--6장 연습문제 4번
-- 103번사원이 근무하는 도시는?(안시 조인 구문으로 작성하세요)
SELECT employee_id, city
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
WHERE e.employee_id = 103;

--6장 연습문제 5번
-- 사원번호가 103인사원의 부서위치(city)와 매니저의 직무이름(job_title)을 출력하세요.(안시 조인 구문으로 작성하세요)
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


--6장 연습문제 6번
-- 사원의 모든 정보를 조회하는 쿼리문을 작성하세요. 
-- 사원의 부서번호는 부서이름으로, 직무아이디는 직무이름으로, 매니저아이디는 매니저이름으로 출력하세요.
SELECT e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, 
       j.job_title, e.salary, e.commission_pct, m.first_name AS manager_name , d.department_name
FROM employees e, employees m, jobs j, departments d
WHERE e.manager_id = m.employee_id(+) AND  m.job_id = j.job_id(+) AND e.department_id = d.department_id(+);

--7장 연습문제 7번
-- 다음 중 오류가 있는 라인은?
--1:SELECT	employee_id,
--2:		employees.first_name,  
--3:		e.department_id,
--4:		d.department_id
--5:FROM	employees	e,	departments	d	
--6:WHERE	e.department_id	=	d.department_id;

-- 2번, employees가 아닌 e를 사용해야함.