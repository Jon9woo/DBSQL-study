--3�� �������� 1��
--�̸��Ͽ� lee�� �����ϴ� ����� ��� ������ ����ϼ���.
SELECT *
FROM employees
WHERE lower(email) LIKE '%lee%';

--3�� �������� 2��
--�Ŵ��� ���̵� 103�� ������� �̸��� �޿�, ���� ���̵� ����ϼ���.
SELECT first_name, salary, job_id
FROM employees
WHERE manager_id = '103';

--3�� �������� 3��
--80�� �μ��� �ٹ��ϸ鼭 ������ SA_MAN�� ����� ������ 20�� �μ��� �ٹ��ϸ鼭 �Ŵ��� ���̵� 100�� ����� ������ ����ϼ���.
--������ �ϳ��� ����ؾ��մϴ�.
SELECT *
FROM employees
WHERE (department_id LIKE '80' AND  job_id LIKE 'SA_MAN')
    OR (department_id LIKE '20' AND manager_id = '100');

--3�� �������� 4��
--��� ����� ��ȭ��ȣ�� ###-###-#### �������� ����ϼ���.
SELECT replace(phone_number,'.','-') AS ��ȭ��ȣ
FROM employees; 

--3�� �������� 5��
--������ IT_PROG�� ����� �߿��� �޿��� 5000 �̻��� ������� �̸�(Full Name), �޿� ���޾�, �Ի���(2005-02-15����). �ٹ��� �ϼ��� ����ϼ���.
--�̸� ������ �����ϸ�, �̸��� �ִ� 20�ڸ�, �����ڸ��� *�� ä��� �޿����޾��� �Ҽ��� 2�ڸ��� ������ �ִ� 8�ڸ�, $ǥ��, ���� �ڸ��� 0���� ä�� ����ϼ���.
SELECT 
    RPAD(first_name||' '||last_name, 20, '*') AS Full_name, 
    TO_CHAR(COALESCE(salary+salary*commission_pct, salary), '$099,999.00') AS salary,
    TO_CHAR(hire_date, 'yyyy-mm-dd') AS hire_date,
    round(sysdate - hire_date) AS work_day
FROM employees
WHERE upper(job_id) LIKE 'IT_PROG' AND salary >= 5000
ORDER BY full_name;

--3�� �������� 6��
-- 30�� �μ� ����� �̸�(full name)�� �޿�, �Ի���, ������� �ٹ� ���� ���� ����ϼ���. 
-- �̸��� �ִ� 20�ڷ� ����ϰ� �̸� �����ʿ� ���� ������ *�� ����ϼ���. 
-- �޿��� �󿩱��� �����ϰ� �Ҽ��� 2�ڸ��� ������ �� 8�ڸ��� ����ϰ� ���� �ڸ��� 0���� ä ���  ���ڸ�����  ,(�޸�)  ���б�ȣ��  �����ϰ�, �ݾ�  �տ�  $��  �����ϵ���  ����ϼ���. 
-- �Ի����� 2005��03��15�� �������� ����ϼ���. �ٹ� ���� ���� �Ҽ��� ���ϴ� ������ ����ϼ���. 
-- �޿��� ū ������� ���� ������ ����ϼ���.
SELECT
    RPAD(first_name||' '||last_name, 20,'*') AS full_name,
    TO_CHAR(salary+salary*commission_pct,'$099,999.00') AS salary,
    TO_CHAR(hire_date,'yyyy"��" mm"��" dd"��"') AS hire_date,
    trunc(months_between(sysdate,hire_date)) AS month
FROM employees
WHERE department_id=30
ORDER BY salary DESC;

--3�� �������� 7��
--80��  �μ���  �ٹ��ϸ鼭  salary��  10000���� ū  �������  �̸���  �޿�  ���޾�(salary  + salary * commission_pct)�� ����ϼ���. 
--�̸� �� Full Name���� ����ϸ� 17�ڸ��� ����� ����. ���� �ڸ��� *�� ä�켼��. 
--�޿��� �Ҽ� ��  2�ڸ���  ������  ��7�ڸ���  ����ϸ�,  ���� �ڸ���  0����  ä�켼��.  
--�ݾ�  �տ�  $  ǥ�ø� �ϸ� �޿� ������ �����ϼ���.
SELECT 
    RPAD(first_name||' '||last_name, 17, '*') AS full_name,
    TO_CHAR(COALESCE(salary+salary*commission_pct, salary), '$09,999.00') AS salary
FROM employees
WHERE department_id = '80' AND salary > 10000
ORDER BY salary DESC;

--3�� �������� 8��
--60���μ� ����� �̸��� ���� ���ڸ� �������� ������� �ٹ��� �ٹ������� 5����, 10 ����, 15������ ǥ���ϼ���. 
--5��~ 9�� �ٹ��� ����� 5������ ǥ���մϴ�. �������� �� Ÿ�� ǥ���մϴ�. �ٹ������� �ٹ�������/12�� ����մϴ�.
SELECT first_name AS �̸�,
    decode(trunc(trunc(months_between(sysdate, hire_date)/12)/5),
        1,'5����',
        2,'10����',
        3,'15����',
        '��Ÿ')
    AS �ٹ����
FROM employees
WHERE department_id ='60';

--3�� �������� 9��
--Lex�� �Ի����� 1000��° �Ǵ� ����? 
SELECT TO_CHAR(hire_date+1000, 'yyyy"��" mm"��" dd"��"')
FROM employees
WHERE first_name = 'Lex';

--3�� �������� 10��
--5���� �Ի��� ����� �̸��� �Ի����� ����ϼ���.
SELECT first_name, hire_date
FROM employees
WHERE TO_CHAR(hire_date, 'MM') = '05';

--3�� �������� 11��
--������ �� �̸��� �޿��� ����ϼ���.
--����1) �Ի��� ������ ����� ���� ���弼��. �� ���� �̸��� ��year���̰�, ��(�Ի�⵵)�� �Ի硱�������� ����ϼ���.
--����2) �Ի��� ������ ����� ���� ���弼��. �� ���� �̸��� ��day���̰�, �����ϡ��������� ����ϼ���.
--����3) �Ի����� 2010�� ������ ����� �޿��� 10%, 2005�� ������ ����� �޿��� 5% �� �λ��ϼ���. �� ���� �̸��� ��INCREASING_SALARY���Դϴ�. 
--����4) INCREASING_SALARY ���� ������ �տ� ��$����ȣ�� �ٰ�, �� �ڸ����� �޸�(,) �� �־��ּ���.
SELECT first_name, salary,
    TO_CHAR(hire_date, 'YYYY"�� �Ի�"') AS year,
    TO_CHAR(hire_date, 'day') AS day,
    CASE WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 10
              THEN TO_CHAR(salary*1.1, '$999,999')
         WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 5
              THEN TO_CHAR(salary*1.05, '$999,999')
         ELSE TO_CHAR(salary, '$999,999')
    END AS increasing_salary
FROM employees;

--3�� �������� 12��
--����� �̸�, �޿�, �Ի�⵵, �λ�� �޿��� ����ϼ���.
--����1) �Ի��� ������ ����ϼ���. �� ���� �̸��� ��year���̰�, ��(�Ի�⵵)�� �Ի硱������ �� ����ϼ���.
--����2) �Ի����� 2010���� ����� �޿��� 10%, 2005���� ����� �޿��� 5%�� �λ��� ����. �� ���� �̸��� ��INCREASING_SALARY2���Դϴ�.
SELECT 
    first_name, salary, 
    TO_CHAR(hire_date, 'YYYY"�⵵ �Ի�"') AS year,
    CASE WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 10
              THEN TO_NUMBER(salary*1.1)
         WHEN TO_NUMBER(TO_CHAR(hire_date,'YY')) >= 5
              THEN TO_NUMBER(salary*1.05)
         ELSE salary
    END AS incresing_salary
FROM employees;

--3�� �������� 13��
--��ġ��� �� ��(state) ���� ���� null�̶�� �������̵� ����ϼ���.
SELECT country_id,
     NVL(state_province, country_id) AS state
FROM locations;