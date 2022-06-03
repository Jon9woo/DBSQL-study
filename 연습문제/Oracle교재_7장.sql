--7장 연습문제 1번
--20번 부서에 근무하는 사원들의 매니저와 매니저가 같은 사원들의 정보를 출력하세요.
SELECT *
FROM employees
WHERE manager_id IN (SELECT DISTINCT manager_id
                    FROM employees
                    WHERE department_id = 20);

--7장 연습문제 2번                    
--가장 많은 급여를 받은 사람의 이름을 출력하세요.
SELECT first_name||''||last_name AS Top_Salary
FROM employees
WHERE salary = (SELECT MAX(salary)
                FROM employees);

--7장 연습문제 3번
--급여 순으로(내림차순)3위부터 5위까지 출력하세요.(rownum 이용)
SELECT *
FROM(SELECT first_name, salary, ROWNUM AS rnum
     FROM (SELECT first_name, salary
           FROM employees
           ORDER BY salary DESC))
WHERE rnum BETWEEN 3 AND 5;        


--7장 연습문제 4번
--부서별 부서의 평균이상 급여를 받는 사원의 부서번호, 이름, 급여, 평균급여를 출력하세요.
SELECT department_id, first_name, salary, 
      (SELECT ROUND(AVG(salary))
       FROM employees c
       WHERE c.department_id = a.department_id) AS avg_sal
FROM employees a
WHERE salary >= (SELECT AVG(salary)
                 FROM employees b
                 WHERE b.department_id = a.department_id)
ORDER BY department_id;
