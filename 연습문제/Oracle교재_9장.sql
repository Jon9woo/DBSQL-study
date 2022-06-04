--9장 연습문제 1번
--실습을 위해 EMPLOYEES 테이블의 사본 테이블을 생성하세요. 사본 테이블의 이름은  EMP_TEMP입니다.
CREATE TABLE emp_temp AS select * from employees;

SELECT *
FROM emp_temp;

--9장 연습문제 2번
--EMP_TEMP 테이블에서 20번 부서사원의 정보를 삭제하고 롤백지점을 생성하세요. 
--롤백지점의 이름은 SVPNT_DEL_20여야 합니다.
DELETE emp_temp
WHERE department_id = 20;

SAVEPOINT SVPNT_DEL_20;

--9장 연습문제 3번
--50번부서의 사원의 정보를 삭제하고 롤백지점을 생성하세요. 롤백지점의 이름은 SVPNT_DEL_50여야 합니다.
DELETE emp_temp
WHERE department_id = 50;

SAVEPOINT SVPNT_DEL_50;

--9장 연습문제 4번
--60번 부서의 사원 정보를 삭제하세요.
DELETE emp_temp
WHERE department_id = 60;

--9장 연습문제 5번
--앞의 60번 부서의 사원 정보를 삭제했던 작업을 취소하세요. 그 이전 작업은 취소하면 안됩니다.
ROLLBACK TO SVPNT_DEL_50;