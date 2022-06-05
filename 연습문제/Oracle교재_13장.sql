--13�� �������� 1��
--�Խ����� �Խñ� ��ȣ�� ���� �������� �����ϼ���. 
--����1)������ �̸��� BBS_SEQ���� �մϴ�. 
--����2)�Խñ� ��ȣ�� 1�� �����մϴ�.
--����3)�������� 1���� �����ϸ� �ִ밪�� �������� �ʽ��ϴ�. 
--����4)ĳ�� ������ 20���̸�, ����Ŭ�� ���ġ �ʽ��ϴ�.
CREATE SEQUENCE BBS_SEQ
    INCREMENT BY 1
    START WITH 1
    NOMAXVALUE --�̰� Default ���̱� ��.
    CACHE 20
    NOCYCLE;

--13�� �������� 2��
--����� �޿� ���޾����� �˻��� �ϰ� �ͽ��ϴ�. �޿� ���޾����� �ε����� �����ϼ���. 
--����1)�ε��� �̸��� idx_emp_realsal�Դϴ�. 
--����2)�޿� ���޾� ������ SALARY + SALARY * COMMISSION_PCT�Դϴ�.
CREATE INDEX idx_emp_realsal
ON emps(COALESCE(salary+salary*commission_pct, salary));


-- SEQUENCE ��ȸ
SELECT *
FROM user_sequences;

--INDEX��, ���ϼ�
SELECT *
FROM user_indexes;

--�ε�����, ���̺��, ����
SELECt *
FROM user_ind_columns;