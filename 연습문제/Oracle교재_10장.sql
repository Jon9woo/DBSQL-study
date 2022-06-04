--10장 연습문제 1번
--회원 정보를 저장하는 테이블(member)을 생성하세요.
--회원정보는 사용자아이디(15), 이름(20), 비밀번호(20), 전화번호(15), 이메일(100)을 포함해야 합니다.(괄호안의 숫자는 크기입니다.)
CREATE TABLE member(
        user_id VARCHAR(15)     NOT NULL,
        full_name VARCHAR(20)   NOT NULL,
        pass_word VARCHAR(20)   NOT NULL,
        phone_number VARCHAR(15),
        email VARCHAR(100));

--10장 연습문제 2번
--사용자아이디, 이름, 비밀번호, 전화번호, 이메일을 저장하는 쿼리를 작성하세요. 
--user123, 사용자, a1234567890, 011-234-5678, user@user.com
INSERT INTO member
    (user_id, full_name, pass_word, phone_number, email)
VALUES
    ('user123', '사용자','a1234567890','011-234-5678','user@user.com');

--10장 연습문제 3번
--사용자아이디가 user123인 사용자의 모든 정보를 조회하세요.
SELECT *
FROM member
WHERE user_id = 'user123';

--10장 연습문제 4번
--사용자아이디가 user123인 사용자의 이름, 비밀번호, 전화번호, 이메일을 수정하세요. 
-- 홍길동, a1234, 011-222-3333, user@user.co.kr
UPDATE member
SET full_name = '홍길동',
    pass_word = 'a1234',
    phone_number = '011-222-3333',
    email = 'user@user.co.kr'
WHERE user_id = 'user123';

--10장 연습문제 5번
--사용자아이디가 user123이고 비밀번호가 a1234인 회원의 정보를 삭제하세요.
DELETE member
WHERE user_id='user123' AND pass_word = 'a1234';

--10장 연습문제 6번
--회원 정보를 저장하는 테이블(member)의 모든 행을 삭제하세요. TRUNCATE 구문을 이용하세요.
TRUNCATE TABLE member;

--10장 연습문제 7번
--회원 정보를 저장하는 테이블(member)을 삭제하세요.
DROP TABLE member;