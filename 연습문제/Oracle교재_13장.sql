--13장 연습문제 1번
--게시판의 게시글 번호를 위한 시퀀스를 생성하세요. 
--조건1)시퀀스 이름은 BBS_SEQ여야 합니다. 
--조건2)게시글 번호는 1씩 증가합니다.
--조건3)시퀀스는 1부터 시작하며 최대값을 설정하지 않습니다. 
--조건4)캐쉬 개수는 20개이며, 사이클은 허용치 않습니다.
CREATE SEQUENCE BBS_SEQ
    INCREMENT BY 1
    START WITH 1
    NOMAXVALUE --이건 Default 값이긴 함.
    CACHE 20
    NOCYCLE;

--13장 연습문제 2번
--사원의 급여 지급액으로 검색을 하고 싶습니다. 급여 지급액으로 인덱스를 생성하세요. 
--조건1)인덱스 이름은 idx_emp_realsal입니다. 
--조건2)급여 지급액 계산식은 SALARY + SALARY * COMMISSION_PCT입니다.
CREATE INDEX idx_emp_realsal
ON emps(COALESCE(salary+salary*commission_pct, salary));


-- SEQUENCE 조회
SELECT *
FROM user_sequences;

--INDEX명, 유일성
SELECT *
FROM user_indexes;

--인덱스명, 테이블명, 열명
SELECt *
FROM user_ind_columns;