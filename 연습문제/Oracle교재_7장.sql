--7�� �������� 1��
--20�� �μ��� �ٹ��ϴ� ������� �Ŵ����� �Ŵ����� ���� ������� ������ ����ϼ���.
SELECT *
FROM employees
WHERE manager_id IN (SELECT DISTINCT manager_id
                    FROM employees
                    WHERE department_id = 20);

--7�� �������� 2��                    
--���� ���� �޿��� ���� ����� �̸��� ����ϼ���.
SELECT first_name||''||last_name AS Top_Salary
FROM employees
WHERE salary = (SELECT MAX(salary)
                FROM employees);

--7�� �������� 3��
--�޿� ������(��������)3������ 5������ ����ϼ���.(rownum �̿�)
SELECT *
FROM(SELECT first_name, salary, ROWNUM AS rnum
     FROM (SELECT first_name, salary
           FROM employees
           ORDER BY salary DESC))
WHERE rnum BETWEEN 3 AND 5;        


--7�� �������� 4��
--�μ��� �μ��� ����̻� �޿��� �޴� ����� �μ���ȣ, �̸�, �޿�, ��ձ޿��� ����ϼ���.
SELECT department_id, first_name, salary, 
      (SELECT ROUND(AVG(salary))
       FROM employees c
       WHERE c.department_id = a.department_id) AS avg_sal
FROM employees a
WHERE salary >= (SELECT AVG(salary)
                 FROM employees b
                 WHERE b.department_id = a.department_id)
ORDER BY department_id;
