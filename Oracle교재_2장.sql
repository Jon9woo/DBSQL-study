[2��]
--2�� �������� 1��
--��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT employee_id, first_name, hire_date, salary
FROM employees;

--2�� �������� 2��
--��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT first_name ||' '||last_name AS name
FROM employees;

--2�� �������� 3��
--50�� �μ� ����� ��� ������ ����ϼ���.
SELECT *
FROM employees
WHERE department_id = 50;

--2�� �������� 4��
--50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id = 50;

--2�� �������� 5��
--��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT first_name, salary, salary+300
FROM employees;

--2�� �������� 6��
--�޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.
SELECT first_name, salary
FROM employees
WHERE salary > 10000;

--2�� �������� 7��
--���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���.
SELECT first_name, job_id, commission_pct
FROM employees
WHERE commission_pct is not null;

--2�� �������� 8��
--2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)
SELECT first_name, hire_date, salary
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

--2�� �������� 9��
--2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���)
SELECT first_name, hire_date, salary
FROM employees
WHERE hire_date LIKE '03%';

--2�� �������� 10��
--��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��� ������ ����ϼ���.
SELECT first_name, salary
FROM employees
ORDER BY salary DESC;

--2�� �������� 11��
--60�� �μ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��� ������ ����ϼ���.
SELECT first_name, salary
FROM employees
WHERE department_id = 60
ORDER BY salary DESC;

--2�� �������� 12��
--���� ���̵� IT_PROG�̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���.
SELECT first_name, job_id
FROM employees
WHERE job_id = 'IT_PROG' or job_id = 'SA_MAN';

SELECT first_name, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'SA_MAN');

--2�� �������� 13��
--��Ƽ��ŷ ����� ������ '��Ƽ��ŷ ����� �޿��� 24000�޷��Դϴ�' �������� ����ϼ���.
SELECT first_name ||' '|| last_name||'����� �޿���'|| salary ||'�Դϴ�.'
FROM employees
WHERE first_name ='Steven' AND last_name='King';

--2�� �������� 14��
--�Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���.
SELECT first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN%';

--2�� �������� 15��
-- �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
SELECT first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN%'
ORDER BY job_id;