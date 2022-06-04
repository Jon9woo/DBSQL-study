--9�� �������� 1��
--�ǽ��� ���� EMPLOYEES ���̺��� �纻 ���̺��� �����ϼ���. �纻 ���̺��� �̸���  EMP_TEMP�Դϴ�.
CREATE TABLE emp_temp AS select * from employees;

SELECT *
FROM emp_temp;

--9�� �������� 2��
--EMP_TEMP ���̺��� 20�� �μ������ ������ �����ϰ� �ѹ������� �����ϼ���. 
--�ѹ������� �̸��� SVPNT_DEL_20���� �մϴ�.
DELETE emp_temp
WHERE department_id = 20;

SAVEPOINT SVPNT_DEL_20;

--9�� �������� 3��
--50���μ��� ����� ������ �����ϰ� �ѹ������� �����ϼ���. �ѹ������� �̸��� SVPNT_DEL_50���� �մϴ�.
DELETE emp_temp
WHERE department_id = 50;

SAVEPOINT SVPNT_DEL_50;

--9�� �������� 4��
--60�� �μ��� ��� ������ �����ϼ���.
DELETE emp_temp
WHERE department_id = 60;

--9�� �������� 5��
--���� 60�� �μ��� ��� ������ �����ߴ� �۾��� ����ϼ���. �� ���� �۾��� ����ϸ� �ȵ˴ϴ�.
ROLLBACK TO SVPNT_DEL_50;