--3장 연습문제 1번
--이메일에 lee를 포함하는 사원의 모든 정보를 출력하세요.
SELECT *
FROM employees
WHERE lower(email) LIKE '%lee%';

--3장 연습문제 2번
--매니저 아이디가 103인 사원들의 이름과 급여, 직무 아이디를 출력하세요.
SELECT first_name, salary, job_id
FROM employees
WHERE manager_id = '103';

--3장 연습문제 3번
--80번 부서에 근무하면서 직무가 SA_MAN인 사원의 정보와 20번 부서에 근무하면서 매니저 아이디가 100인 사원의 정보를 출력하세요.
--쿼리문 하나로 출력해야합니다.
SELECT *
FROM employees
WHERE (department_id LIKE '80' AND  job_id LIKE 'SA_MAN')
    OR (department_id LIKE '20' AND manager_id = '100');

--3장 연습문제 4번
--모든 사원의 전화번호를 ###-###-#### 형식으로 출력하세요.
SELECT replace(phone_number,'.','-') AS 전화번호
FROM employees; 

--3장 연습문제 5번
--직무가 IT_PROG인 사원들 중에서 급여가 5000 이상인 사원들의 이름(Full Name), 급여 지급액, 입사일(2005-02-15형식). 근무한 일수를 출력하세요.
--이름 순으로 정렬하며, 이름은 최대 20자리, 남는자리는 *로 채우고 급여지급액은 소수점 2자리를 포함한 최대 8자리, $표시, 남는 자리는 0으로 채워 출력하세요.
SELECT 
    RPAD(first_name||' '||last_name, 20, '*') AS Full_name, 
    TO_CHAR(COALESCE(salary+salary*commission_pct, salary), '$099,999.00') AS salary,
    TO_CHAR(hire_date, 'yyyy-mm-dd') AS hire_date,
    round(sysdate - hire_date) AS work_day
FROM employees
WHERE upper(job_id) LIKE 'IT_PROG' AND salary >= 5000
ORDER BY full_name;

--3장 연습문제 6번
-- 30번 부서 사원의 이름(full name)과 급여, 입사일, 현재까지 근무 개월 수를 출력하세요. 
-- 이름은 최대 20자로 출력하고 이름 오른쪽에 남는 공백을 *로 출력하세요. 
-- 급여는 상여금을 포함하고 소수점 2자리를 포함한 총 8자리로 출력하고 남은 자리는 0으로 채 우며  세자리마다  ,(콤마)  구분기호를  포함하고, 금액  앞에  $를  포함하도록  출력하세요. 
-- 입사일은 2005년03월15일 형식으로 출력하세요. 근무 개월 수는 소수점 이하는 버리고 출력하세요. 
-- 급여가 큰 사원부터 작은 순서로 출력하세요.
SELECT
    RPAD(first_name||' '||last_name, 20,'*') AS full_name,
    TO_CHAR(salary+salary*commission_pct,'$099,999.00') AS salary,
    TO_CHAR(hire_date,'yyyy"년" mm"월" dd"일"') AS hire_date,
    trunc(months_between(sysdate,hire_date)) AS month
FROM employees
WHERE department_id=30
ORDER BY salary DESC;

--3장 연습문제 7번
--80번  부서에  근무하면서  salary가  10000보다 큰  사원들의  이름과  급여  지급액(salary  + salary * commission_pct)을 출력하세요. 
--이름 은 Full Name으로 출력하며 17자리로 출력하 세요. 남은 자리는 *로 채우세요. 
--급여는 소수 점  2자리를  포함한  총7자리로  출력하며,  남은 자리는  0으로  채우세요.  
--금액  앞에  $  표시를 하며 급여 순으로 정렬하세요.
SELECT 
    RPAD(first_name||' '||last_name, 17, '*') AS full_name,
    TO_CHAR(COALESCE(salary+salary*commission_pct, salary), '$09,999.00') AS salary
FROM employees
WHERE department_id = '80' AND salary > 10000
ORDER BY salary DESC;

--3장 연습문제 8번
--60번부서 사원의 이름과 현재 일자를 기준으로 현재까지 근무한 근무년차를 5년차, 10 년차, 15년차로 표시하세요. 
--5년~ 9년 근무한 사원은 5년차로 표시합니다. 나머지는 기 타로 표시합니다. 근무년차는 근무개월수/12로 계산합니다.
SELECT first_name AS 이름,
    decode(trunc(trunc(months_between(sysdate, hire_date)/12)/5),
        1,'5년차',
        2,'10년차',
        3,'15년차',
        '기타')
    AS 근무년수
FROM employees
WHERE department_id ='60';

--3장 연습문제 9번
--Lex가 입사한지 1000일째 되는 날은? 
SELECT TO_CHAR(hire_date+1000, 'yyyy"년" mm"월" dd"일"')
FROM employees
WHERE first_name = 'Lex';

--3장 연습문제 10번
--5월에 입사한 사원의 이름과 입사일을 출력하세요.
SELECT first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'MM') = '05';

--3장 연습문제 11번
--사원목록 중 이름과 급여를 출력하세요.
--조건1) 입사한 연도를 출력한 열을 만드세요. 이 열의 이름은 ‘year’이고, “(입사년도)년 입사”형식으로 출력하세요.
--조건2) 입사한 요일을 출력한 열을 만드세요. 이 열의 이름은 ‘day’이고, “요일”형식으로 출력하세요.
--조건3) 입사일이 2010년 이후인 사원은 급여를 10%, 2005년 이후인 사원은 급여를 5% 를 인상하세요. 이 열의 이름은 ‘INCREASING_SALARY’입니다. 
--조건4) INCREASING_SALARY 열의 형식은 앞에 ‘$’기호가 붙고, 세 자리마다 콤마(,) 를 넣어주세요.
SELECT first_name, salary,
    TO_CHAR(hire_date, 'YYYY"년 입사"') AS year,
    TO_CHAR(hire_date, 'day') AS day,
    CASE WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 10
              THEN TO_CHAR(salary*1.1, '$999,999')
         WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 5
              THEN TO_CHAR(salary*1.05, '$999,999')
         ELSE TO_CHAR(salary, '$999,999')
    END AS increasing_salary
FROM employees;

--3장 연습문제 12번
--사원의 이름, 급여, 입사년도, 인상된 급여를 출력하세요.
--조건1) 입사한 연도를 출력하세요. 이 열의 이름은 ‘year’이고, “(입사년도)년 입사”형식으 로 출력하세요.
--조건2) 입사일이 2010년인 사원은 급여를 10%, 2005년인 사원은 급여를 5%를 인상하 세요. 이 열의 이름은 ‘INCREASING_SALARY2’입니다.
SELECT 
    first_name, salary, 
    TO_CHAR(hire_date, 'YYYY"년도 입사"') AS year,
    CASE WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 10
              THEN TO_NUMBER(salary*1.1)
         WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 5
              THEN TO_NUMBER(salary*1.05)
         ELSE salary
    END AS incresing_salary
FROM employees;

--3장 연습문제 13번
--위치목록 중 주(state) 열에 값이 null이라면 국가아이디를 출력하세요.
SELECT country_id,
     NVL(state_province, country_id) AS state
FROM locations;