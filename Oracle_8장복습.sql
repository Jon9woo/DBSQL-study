--CTAS
CREATE TABLE AS emp2 AS SELECT * FROM employees;

SELECT COUNT(*) 
FROM emp2;

DESC employees;

--ALTER
ALTER TABLE emps
ADD (CONSTRAINT emps_emp_id_pk PRIMARY KEY (employee_id),
     CONSTRAINT emps_manager_fk FOREIGN KEY (manager_id)
                REFERENCES emps(employee_id)
                );

SELECT employee_id, first_name, salary
FROM emps
WHERE employee_id = 103;

--UPDATE
UPDATE emps
SET salary=salary*1.1
WHERE employee_id=103;

UPDATE emps
SET (job_id, salary, manager_id) = 
    (SELECT job_id, salary, manager_id
     FROM emps
     WHERE employee_id = 108)
WHERE employee_id = 109;

SELECT job_id, salary, manager_id
FROM emps
WHERE employee_id = 108;
     
     
DELETE 
FROM emps
WHERE employee_id = 104;

SELECT job_id, salary, manager_id
FROM emps
WHERE employee_id = 105;

drop table emps_it;

SELECT *
FROM emps_it;

CREATE TABLE emps_it AS SELECT * FROM employees WHERE 1=2;

--INSERT
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (105,'David','Kim','DAVIDKIM','06/03/04','IT_PROG');

--MERGE
MERGE INTO emps_it a
    USING (SELECT * FROM employees WHERE job_id='IT_PROG') b
    ON (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.job_id = b.job_id,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name, b.email,
    b.phone_number, b.hire_Date, b.job_id, b.salary,
    b.commission_pct, b.manager_id, b.department_id);

SELECT * FROM emps_it;

--CONDITIONAL INSERT ALL
CREATE TABLE emp_10 AS SELECT * FROM employees WHERE 1=2;
CREATE TABLE emp_20 AS SELECT * FROM employees WHERE 1=2;

INSERT ALL
    WHEN department_id = 10 THEN
        INTO emp_10 VALUES
            ( employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id,
              department_id)
    WHEN department_id = 20 THEN
        INTO emp_20 VALUES
            ( employee_id, first_name, last_name, email, phone_number,
              hire_date, job_id, salary, commission_pct, manager_id,
              department_id)
    SELECT * FROM employees;

select * from emp_20;
