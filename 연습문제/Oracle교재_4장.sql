--4�� �������� 1��
--������ �޿������ ����ϼ���.
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id;

--4�� �������� 2��
--�μ��� ����� ���� ����ϼ���.
SELECT department_id, count(*)
FROM employees
GROUP BY department_id;

--4�� �������� 3��
--�μ���, ������ ����� ���� ���� ����ϼ���.
SELECT department_id, job_id, count(*)
FROM employees
GROUP BY department_id, job_id;

--4�� �������� 4��
--�μ��� �޿� ǥ�������� ����ϼ���.
SELECT department_id, ROUND(STDDEV(salary), 2)
FROM employees
GROUP BY department_id;

--4�� �������� 5��
--����� ���� 4�� �̻��� �μ��� ���̵�� ����� ���� ����ϼ���.
SELECT job_id, count(*)
FROM employees
GROUP BY job_id
HAVING count(*) >=4;

--4�� �������� 6��
--50�� �μ��� ������ ����� ���� ����ϼ���.
SELECT job_id, count(*)
FROM employees
WHERE department_id = 50
GROUP BY job_id;

--4�� �������� 7��
--50�� �μ����� ������ ����� ���� 10�� ������ �������̵�� ����� ���� ����ϼ���.
SELECT job_id, count(*)
FROM employees
WHERE department_id = 50
GROUP BY job_id
HAVING count(*) <= 10;

--4�� �������� 8��
--������ �� �Ի�⵵ ���� ������� �޿� ��հ� ������� ����ϼ���.
--����1) �Ի�⵵�� ���� ������ �����ϼ���.
SELECT 
    TO_CHAR(hire_date, 'YYYY') AS �Ի�⵵,
    AVG(salary) AS �޿����,
    COUNT(*) AS �����
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;

--4�� �������� 9��
--������ �� �Ի�⵵�� �Ի�� ���� ������� �޿� ��հ� ������� ����ϼ���.
--����1) �Ի�⵵�� ���� ������ ������ ����, �Ի�⵵�� ���ٸ� �Ի���� �������� �����ϼ���.
--����2) �Ի�⵵�� �������� �޿���հ� ������� ���հ踦 ���ϼ���.
SELECT
    TO_CHAR(hire_date, 'YYYY') AS �Ի�⵵,
    TO_CHAR(hire_date, 'MM') AS �Ի��,
    ROUND(AVG(salary),2) AS �޿����,
    COUNT(*)
FROM employees
GROUP BY 
    ROLLUP(TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM'))
ORDER BY 1,2;

--4�� �������� 10��
--������ �� �Ի�⵵�� �Ի�� ���� ������� �޿� ��հ� ������� ����ϼ���.
--����1) �Ի�⵵�� ���� ������ ������ ����, �Ի�⵵�� ���ٸ� �Ի���� �������� �����ϼ���.
--����2) �Ի�⵵�� �Ի���� �������� �޿���հ� ������� ���հ踦 ���ϼ���. ��, �Ի�⵵�� �հ�� '�հ�', �Ի���� �հ�� '�Ұ�', �Ի���� ��ü �հ�� '�հ�'�� ����ϼ���.
SELECT
    DECODE(GROUPING(TO_CHAR(hire_date, 'YYYY')),
        1, '�հ�',
        TO_CHAR(hire_date, 'YYYY')) AS �Ի�⵵,
    DECODE(GROUPING_ID(TO_CHAR(hire_date, 'YYYY'),
                       TO_CHAR(hire_date, 'MM')),
        1, '�Ұ�',
        3, '�հ�',
        TO_CHAR(hire_date,'MM')) AS �Ի��,
    ROUND(AVG(salary),2) AS �޿����,
    COUNT(*) AS �����
FROM employees
GROUP BY 
    ROLLUP(TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM'))
ORDER BY 1,2;

--4�� �������� 11��
--������ �� �Ի�⵵�� �Ի�� ���� ������� �޿� ��հ� ������� ����ϼ���.
--����1)�Ի�⵵�� ���� ������ ������ ����,  �Ի�⵵��  ���ٸ�  �Ի���� �������� �����ϼ���.
--����2)�Ի�⵵��  �Ի����  ��������  �޿���հ� ������� �� �հ踦 ���� ����.  
--��,  �Ի�⵵��  �հ��  ���� �衯,  �Ի����  �հ��  ���հ衯��  �� ���ϼ���.
--����3) 2��  �̻���  ����  ����  ���踦  Ȯ ���ϰ�  �ϴ�  GROUPING_ID�� ����ϼ���. 
--�� ���� �̸��� ��GID�� �Դϴ�.
SELECT
    NVL(TO_CHAR(hire_date, 'YYYY'),
        DECODE(GROUPING(TO_CHAR(hire_date,'YYYY')),1,'�հ�')) AS �Ի�⵵,
    NVL(TO_CHAR(hire_date,'MM'),
        DECODE(GROUPING(TO_CHAR(hire_Date,'MM')),1,'�Ұ�')) AS �Ի��,
    GROUPING_ID(TO_CHAR(hire_date,'YYYY'), TO_CHAR(hire_date, 'MM')) AS GID,
    ROUND(AVG(salary), 0) AS �޿����,
    COUNT(*) AS �����
FROM employees
GROUP BY
    CUBE(TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM'))
ORDER BY �Ի�⵵, �Ի��;