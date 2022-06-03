--8장 연습문제 1번
--EMPLOYEES  테이블에  있는  데이터를  열  단위로  나눠  저장하고  싶습니다.
--사원번호, 사원이름,  급여,  보너스율을  저장하기  위한  구조와  데이터를  갖는  테이블을 EMP_SALARY_INFO이라는 이름으로 생성하세요. 
--그리고 사원번호, 사원이름, 입사일, 부서번호를 저장하기  위한 구조와 데이터를 갖는 테이블을 EMP_HIREDATE_INFO라 는 이름으로 생성하세요.
CREATE TABLE emp_salary_info AS 
    SELECT employee_id, first_name, salary, commission_pct 
    FROM employees;
CREATE TABLE emp_hiredate_info AS 
    SELECT employee_id, first_name, hire_date, department_id 
    FROM employees;

--8장 연습문제 2번
--EMPLOYEES 테이블에 다음 데이터를 추가하세요
INSERT INTO employees
    (employees_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES
    (1030, 'KilDong', 'HONG', 'HONGKD', '010-1234-5678' , '18/03/20', 'IT_PROG', 6000, 0.2, 103, 60);
    
--8장 연습문제 3번
--1030번 사원의 급여를 10% 인상시키세요.
UPDATE employees
SET salary=salary*1.1
WHERE employee_id=1030;

--8장 연습문제 4번
--1030번 사원의 정보를 삭제하세요.
DELETE employees
WHERE employee_id=1030;

--8장 연습문제 5번
--사원테이블을 이용하여, 2001년부터 2003년까지의 연도에 근무한 사원들의 사원아이디, 이름, 입사일, 연도를 출력하세요.
--조건1)각 연도에 해당하는 테이블을 생성하세요. 속성은 사원아이디, 이름, 입사일, 연도 입니다. 적절한 데이터 크기를 지정하세요. 테이블이름은 ‘emp_yr_연도’ 형식으로 생성하세요.
--조건2)연도 열은 입사일에서 연도만 출력하세요. 열 이름은 ‘yr’이고, 4자리 문자로 표현 하세요.
--조건3)INSERT ALL 구문으로 작성하세요.
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
        
--8장 연습문제 6번
--문제 5의의 조건3을 비교연산자를 사용하여, INSERT FIRST 구문으로 작성하세요.
INSERT FIRST --insert first 문은 첫 번쨰 when 절에서 조건을 만족할 경우 다음의 when 절은 수행하지 않는다.★
    WHEN hire_date <= '01/12/31' THEN
        INTO emp_yr_2001 VALUES (employee_id, first_name, hire_date, yr)
    WHEN hire_date <= '02/12/31' THEN
        INTO emp_yr_2002 VALUES (employee_id, first_name, hire_date, yr)
    WHEN hire_date <= '03/12/31' THEN
        INTO emp_yr_2003 VALUES (employee_id, first_name, hire_date, yr)
    SELECT employee_id, first_name, hire_date, TO_CHAR(hire_date, 'RRRR') as yr
    FROM employees;


--8장 연습문제 7번
--Employees 테이블의 사원들 정보를 아래의 두 테이블에 나눠 저장하세요.
--조건1) emp_personal_info 테이블에는 employee_id, first_name, last_name, email, phone_number가 저장되도록 하세요.
--조건2) emp_office_info 테이블에는 employee_id, hire_date, salary, commission_pct, manager_id, department_id가 저장되도록 하세요.
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


--8장 연습문제 8번
--Employees 테이블의 사원들 정보를 아래의 두 테이블에 나눠 저장하세요. 
--조건1) 보너스가 있는 사원들의 정보는 emp_comm 테이블에 저장하세요. 
--조건2) 보너스가 없는 사원들의 정보는 emp_nocomm 테이블에 저장하세요.
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