--10�� �������� 1��
--ȸ�� ������ �����ϴ� ���̺�(member)�� �����ϼ���.
--ȸ�������� ����ھ��̵�(15), �̸�(20), ��й�ȣ(20), ��ȭ��ȣ(15), �̸���(100)�� �����ؾ� �մϴ�.(��ȣ���� ���ڴ� ũ���Դϴ�.)
CREATE TABLE member(
        user_id VARCHAR(15)     NOT NULL,
        full_name VARCHAR(20)   NOT NULL,
        pass_word VARCHAR(20)   NOT NULL,
        phone_number VARCHAR(15),
        email VARCHAR(100));

--10�� �������� 2��
--����ھ��̵�, �̸�, ��й�ȣ, ��ȭ��ȣ, �̸����� �����ϴ� ������ �ۼ��ϼ���. 
--user123, �����, a1234567890, 011-234-5678, user@user.com
INSERT INTO member
    (user_id, full_name, pass_word, phone_number, email)
VALUES
    ('user123', '�����','a1234567890','011-234-5678','user@user.com');

--10�� �������� 3��
--����ھ��̵� user123�� ������� ��� ������ ��ȸ�ϼ���.
SELECT *
FROM member
WHERE user_id = 'user123';

--10�� �������� 4��
--����ھ��̵� user123�� ������� �̸�, ��й�ȣ, ��ȭ��ȣ, �̸����� �����ϼ���. 
-- ȫ�浿, a1234, 011-222-3333, user@user.co.kr
UPDATE member
SET full_name = 'ȫ�浿',
    pass_word = 'a1234',
    phone_number = '011-222-3333',
    email = 'user@user.co.kr'
WHERE user_id = 'user123';

--10�� �������� 5��
--����ھ��̵� user123�̰� ��й�ȣ�� a1234�� ȸ���� ������ �����ϼ���.
DELETE member
WHERE user_id='user123' AND pass_word = 'a1234';

--10�� �������� 6��
--ȸ�� ������ �����ϴ� ���̺�(member)�� ��� ���� �����ϼ���. TRUNCATE ������ �̿��ϼ���.
TRUNCATE TABLE member;

--10�� �������� 7��
--ȸ�� ������ �����ϴ� ���̺�(member)�� �����ϼ���.
DROP TABLE member;