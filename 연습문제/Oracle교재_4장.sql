--4장 연습문제 1번
--직무별 급여평균을 출력하세요.
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id;

--4장 연습문제 2번
--부서별 사원의 수를 출력하세요.
SELECT department_id, count(*)
FROM employees
GROUP BY department_id;

--4장 연습문제 3번
--부서별, 직무별 사원의 수를 각각 출력하세요.
SELECT department_id, job_id, count(*)
FROM employees
GROUP BY department_id, job_id;

--4장 연습문제 4번
--부서별 급여 표준편차를 출력하세요.
SELECT department_id, ROUND(STDDEV(salary), 2)
FROM employees
GROUP BY department_id;

--4장 연습문제 5번
--사원의 수가 4명 이상인 부서의 아이디와 사원의 수를 출력하세요.
SELECT job_id, count(*)
FROM employees
GROUP BY job_id
HAVING count(*) >=4;

--4장 연습문제 6번
--50번 부서의 직무별 사원의 수를 출력하세요.
SELECT job_id, count(*)
FROM employees
WHERE department_id = 50
GROUP BY job_id;

--4장 연습문제 7번
--50번 부서에서 직무별 사원의 수가 10명 이하인 직무아이디와 사원의 수를 출력하세요.
SELECT job_id, count(*)
FROM employees
WHERE department_id = 50
GROUP BY job_id
HAVING count(*) <= 10;

--4장 연습문제 8번
--사원목록 중 입사년도 별로 사원들의 급여 평균과 사원수를 출력하세요.
--조건1) 입사년도가 빠른 순으로 정렬하세요.
SELECT 
    TO_CHAR(hire_date, 'YYYY') AS 입사년도,
    AVG(salary) AS 급여평균,
    COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

--4장 연습문제 9번
--사원목록 중 입사년도와 입사월 별로 사원들의 급여 평균과 사원수를 출력하세요.
--조건1) 입사년도가 빠른 순으로 정렬한 이후, 입사년도가 같다면 입사월을 기준으로 정렬하세요.
--조건2) 입사년도를 기준으로 급여평균과 사원수의 총합계를 구하세요.
SELECT
    TO_CHAR(hire_date, 'YYYY') AS 입사년도,
    TO_CHAR(hire_date, 'MM') AS 입사월,
    ROUND(AVG(salary),2) AS 급여평균,
    COUNT(*)
FROM employees
GROUP BY 
    ROLLUP(TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM'))
ORDER BY 1,2;

--4장 연습문제 10번
--사원목록 중 입사년도와 입사월 별로 사원들의 급여 평균과 사원수를 출력하세요.
--조건1) 입사년도가 빠른 순으로 정렬한 이후, 입사년도가 같다면 입사월을 기준으로 정렬하세요.
--조건2) 입사년도와 입사월을 기준으로 급여평균과 사원수의 총합계를 구하세요. 단, 입사년도의 합계는 '합계', 입사월의 합계는 '소계', 입사월의 전체 합계는 '합계'로 출력하세요.
SELECT
    DECODE(GROUPING(TO_CHAR(hire_date, 'YYYY')),
        1, '합계',
        TO_CHAR(hire_date, 'YYYY')) AS 입사년도,
    DECODE(GROUPING_ID(TO_CHAR(hire_date, 'YYYY'),
                       TO_CHAR(hire_date, 'MM')),
        1, '소계',
        3, '합계',
        TO_CHAR(hire_date,'MM')) AS 입사월,
    ROUND(AVG(salary),2) AS 급여평균,
    COUNT(*) AS 사원수
FROM employees
GROUP BY 
    ROLLUP(TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM'))
ORDER BY 1,2;

--4장 연습문제 11번
--사원목록 중 입사년도와 입사월 별로 사원들의 급여 평균과 사원수를 출력하세요.
--조건1)입사년도가 빠른 순으로 정렬한 이후,  입사년도가  같다면  입사월을 기준으로 정렬하세요.
--조건2)입사년도와  입사월을  기준으로  급여평균과 사원수의 총 합계를 구하 세요.  
--단,  입사년도의  합계는  ‘소 계’,  입사월의  합계는  ‘합계’로  출 력하세요.
--조건3) 2개  이상의  열에  대한  집계를  확 인하게  하는  GROUPING_ID를 출력하세요. 
--이 열의 이름은 ‘GID’ 입니다.
SELECT
    NVL(TO_CHAR(hire_date, 'YYYY'),
        DECODE(GROUPING(TO_CHAR(hire_date,'YYYY')),1,'합계')) AS 입사년도,
    NVL(TO_CHAR(hire_date,'MM'),
        DECODE(GROUPING(TO_CHAR(hire_Date,'MM')),1,'소계')) AS 입사월,
    GROUPING_ID(TO_CHAR(hire_date,'YYYY'), TO_CHAR(hire_date, 'MM')) AS GID,
    ROUND(AVG(salary), 0) AS 급여평균,
    COUNT(*) AS 사원수
FROM employees
GROUP BY
    CUBE(TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM'))
ORDER BY 입사년도, 입사월;