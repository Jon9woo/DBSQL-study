--12장 연습문제 1번
--직무별 급여 평균과 사원의 급여 차이를 구하는 뷰를 생성하세요.
--조건1) 뷰 이름은 SAL_GAP_VIEW_BY_JOB 로 하세요.
--조건2) 뷰의 열은 사원이름과 직무아이디, 직무별 급여 평균과 사원급여의 차이입니다.
--조건3) 직무별 급여 평균은 직무테이블의 최대 급여와 최소 급여의 평균을 의미합니다.
CREATE VIEW SAL_GAP_VIEW_BY_JOB
AS SELECT e.first_name, e.job_id, (j.avg_salary-e.salary) AS job_sal_gap
   FROM employees e, (SELECT job_id, (max_salary+min_salary)/2 AS avg_salary
                      FROM jobs) j
   WHERE e.job_id = j.job_id;       

--12장 연습문제 2번
--모든 사원의 아이디와 이름 그리고 부서 이름과 직무 이름을 출력할 수 있는 뷰를 생성하세요.
CREATE OR REPLACE VIEW emp_view    --기존에 해당 이름으로 view가 있어도 덮어쓰기 생성.
AS SELECT e.employee_id, e.first_name, d.department_name, j.job_title
   FROM employees e, departments d, jobs j
   WHERE e.department_id = d.department_id(+) AND --department가 없는 employee가 있으므로 left join 필요.
         e.job_id = j.job_id;
         
--뷰에 관한 정보 확인
SELECT *
FROM USER_VIEWS;

--사용자에게 주어진 롤(ROLE) 출력
SELECT *
FROM USER_ROLE_PRIVS;

--현재 사용자에게 주어진 권한 출력
SELECT *
FROM USER_SYS_PRIVS;