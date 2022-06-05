--해당 코드들은 SQL Plus(SQL Command Line)를 이용.

--14장 연습문제 1번
--새로운 사용자를 생성하세요.
--조건1) c##foo와 c##bar 총 2명의 사용자를 생성하세요. 비밀번호는 a12345입니다.
CONN / as sysdba;

CREATE USER c##foo IDENTIFIED BY a12345;

CREATE USER c##bar IDENTIFIED BY a12345;

--14장 연습문제 2번
--c##manager 역할(ROLE)을 생성하세요.
--조건1) c##manager 역할에 테이블과 뷰를 생성하기 위한 권한을 부여하세요. 
--조건2) c##manager 역할을 c##foo와 c##bar 사용자에게 부여하세요.
CONN / as sysdba
CREATE ROLE c##manager;
GRANT create table, create view TO c##manager;
GRANT c##manager TO c##foo, c##bar;


--14장 연습문제 3번
--사용자 c##foo를 통해 hr 사용자의 사원(EMPLOYEES) 테이블의 총 데이터 수를 구하세요.
--조건1)사용자 c##foo와 c##bar에게 로그인 권한을 부여하세요.
--조건2)사원 테이블을 질의하기 위해 사용자 c##foo에게 권한을 부여하세요.
--조건3)사용자 c##foo로 접속하여 c##bar에게도 사원 테이블에 대한 SELECT 권한을 부여하고, 사원의 수를 조회하세요.
GRANT create session TO c##foo, c##bar;

CONN hr/hr;
GRANT select ON employees TO c##foo WITH GRANT OPTION;

CONN c##foo/a12345;
SELECT COUNT(*) FROM hr.employees; --c##foo 로 조회

CONN c##bar/a12345;
SELECT COUNT(*)FROM hr.employees; --c##bar 로 조회 --여기도 오류(?)


--14장 연습문제 4번
--사용자 c##foo와 c##bar에게 부여했던 hr 사용자의 권한을 회수하고 c##foo, c##bar 사용자를 삭제하세요.
CONN hr/hr;
REVOKE select ON employees TO c##foo, c##bar; --이거 왜 오류(?)

CONN /as sysdba;
DROP USER c##foo;
DROP USER c##bar;