--연습문제 11장 1번
--회원 정보를 저장하는 테이블(member)을 생성하세요. 회원 정보는 사용자 아이디(15), 이름(20), 비밀번호(20), 전화번호(15), 이메일(100)을 포함해야 합니다. 괄호 안의 숫자 는 크기입니다. 회원 정보를 저장하는 테이블은 사용자 아이디를 PK로 갖습니다.
CREATE TABLE member(
    user_id VARCHAR2(15)    CONSTRAINT member_user_id_pk PRIMARY KEY, --열레벨 제약조건 (동시생성)
    name VARCHAR2(20)       NOT NULL,
    password VARCHAR2(20)   NOT NULL,
    phonenumber VARCHAR2(15),
    email VARCHAR2(100));
    
--연습문제 11장 2번
--다음 테이블 구문을 수정해서 제약조건을 추가하세요.
--DEPT 테이블의 DEPTNO 열은 주키(primary key) 열이어야 합니다. 제약조건의 이름은 pk_dept로 하세요.
--EMP 테이블의 EMPNO 열은 주키(primary key) 열이어야 합니다. 제약조건의 이름은 pk_emp로 하세요.
--EMP 테이블의 DEPTNO 열은 DEPT 테이블의 DEPTNO 열을 참조하는 외래키(foreign key)여야 합니다. 제약조건의 이름은 fk_deptno로 하세요.

--(1) 테이블 생성 후 수정
CREATE TABLE dept(
    deptno NUMBER(2),
    dname  VARCHAR(14),
    loc    VARCHAR(13)
    );
CREATE TABLE emp(
    empno   NUMBER(4,0),
    ename   VARCHAR2(10),
    job     VARCHAR2(9),
    mgr     NUMBER(4,0),
    hiredate date,
    sal     NUMBER(7,2),
    comm    NUMBER(7,2),
    deptno  NUMBER(2,0)
    );

ALTER TABLE dept
ADD CONSTRAINT pk_dept PRIMARY KEY (deptno);

ALTER TABLE emp
ADD CONSTRAINT pk_emp PRIMARY KEY (empno);

ALTER TABLE emp
ADD CONSTRAINT fk_deptno FOREIGN KEY (deptno) REFERENCES dept(deptno);


--(2) 테이블 생성과 동시에 제약조건 생성
CREATE TABLE dept(
    deptno  NUMBER(2),
    dname   VARCHAR2(14),
    loc     VARCHAR2(13)
    CONSTRAINT PK_dept PRIMARY KEY(deptno)
    );

CREATE TABLE emp(
    empno   NUMBER(4,0),
    ename   VARCHAR2(10),
    job     VARCHAR2(9),
    mgr     NUMBER(4,0),
    hiredate date,
    sal     NUMBER(7,2),
    comm    NUMBER(7,2),
    deptno  NUMBER(2,0)
    CONSTRAINT pk_emp PRIMARY KEY(empno)
    CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES dept(deptno)
    );


--제약조건 조회
SELECT *
FROM user_constraints;