--5�� �������� 1��
--��� ����� �μ���ȣ, �̸�, �޿�, �μ��� �޿� ������ ����ϼ���.  
--�ߺ����� ����� ������ �������� �����ϴ�. �� ����� ���� ���� ����� �޿��� �߰��Ͽ� ����ϼ���.
SELECT department_id, first_name, salary,
    RANK() OVER(ORDER BY salary DESC) sal_rank,
    LAG(salary,1,0) OVER(ORDER BY salary) AS lower_sal
FROM employees
ORDER BY sal_rank;


--5�� �������� 2��
--170�� ����� �����ȣ ���� ����� �̸��� ����ϼ���.
SELECT first_name
FROM employees
WHERE employee_id = (SELECT before_id
                     FROM (SELECT employee_id,
                            LAG(employee_id,1) OVER(ORDER BY employee_id)AS before_id
                           FROM employees)
                     WHERE employee_id = 170);
                    
--5�� �������� 3��
--��� ����� �޿� ������ ��� �ϼ���.  
--����� �� �� ����� �ٹ��ϴ� �μ��� ���� ���� �޿�, �׸��� ���� ū �޿�, �׸��� �μ����� �޿��� ���� ���� ������� �޿� ���̸� ����ϼ���.
SELECT employee_id, department_id,
    FIRST_VALUE(salary)
        OVER(PARTITION BY department_id
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lower_sal,
    salary AS my_sal,
    LAST_VALUE(salary)
        OVER(PARTITION BY department_id
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS higher_sal,
    LAST_VALUE(salary)
        OVER(PARTITION BY department_id
             ORDER BY salary
             ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) - salary AS diff_sal      
FROM employees;