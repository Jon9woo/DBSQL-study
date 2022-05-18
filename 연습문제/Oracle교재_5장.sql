--5장 연습문제 1번
--모든 사원의 부서번호, 이름, 급여, 부서별 급여 순위를 출력하세요.  
--중복순위 사원이 있으면 차순위는 없습니다. 이 결과에 이전 순위 사원의 급여를 추가하여 출력하세요.
SELECT department_id, first_name, salary,
    RANK() OVER(ORDER BY salary DESC) sal_rank,
    LAG(salary,1,0) OVER(ORDER BY salary) AS lower_sal
FROM employees
ORDER BY sal_rank;


--5장 연습문제 2번
--170번 사원의 사원번호 직전 사원의 이름을 출력하세요.
SELECT first_name
FROM employees
WHERE employee_id = (SELECT before_id
                     FROM (SELECT employee_id,
                            LAG(employee_id,1) OVER(ORDER BY employee_id)AS before_id
                           FROM employees)
                     WHERE employee_id = 170);
                    
--5장 연습문제 3번
--모든 사원의 급여 정보를 출력 하세요.  
--출력할 때 각 사원이 근무하는 부서의 가장 적은 급여, 그리고 가장 큰 급여, 그리고 부서에서 급여가 가장 많은 사원과의 급여 차이를 출력하세요.
SELECT employee_id, department_id,
    FIRST_VALUE(salary)
        OVER(PARTITION BY department_id
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lower_sal,
    salary AS my_sal,
    LAST_VALUE(salary)
        OVER(PARTITION BY department_id
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS higher_sal,
    LAST_VALUE(salary)
        OVER(PARTITION BY department_id
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) - salary AS diff_sal      
FROM employees;