--12�� �������� 1��
--������ �޿� ��հ� ����� �޿� ���̸� ���ϴ� �並 �����ϼ���.
--����1) �� �̸��� SAL_GAP_VIEW_BY_JOB �� �ϼ���.
--����2) ���� ���� ����̸��� �������̵�, ������ �޿� ��հ� ����޿��� �����Դϴ�.
--����3) ������ �޿� ����� �������̺��� �ִ� �޿��� �ּ� �޿��� ����� �ǹ��մϴ�.
CREATE VIEW SAL_GAP_VIEW_BY_JOB
AS SELECT e.first_name, e.job_id, (j.avg_salary-e.salary) AS job_sal_gap
   FROM employees e, (SELECT job_id, (max_salary+min_salary)/2 AS avg_salary
                      FROM jobs) j
   WHERE e.job_id = j.job_id;       

--12�� �������� 2��
--��� ����� ���̵�� �̸� �׸��� �μ� �̸��� ���� �̸��� ����� �� �ִ� �並 �����ϼ���.
CREATE OR REPLACE VIEW emp_view    --������ �ش� �̸����� view�� �־ ����� ����.
AS SELECT e.employee_id, e.first_name, d.department_name, j.job_title
   FROM employees e, departments d, jobs j
   WHERE e.department_id = d.department_id(+) AND --department�� ���� employee�� �����Ƿ� left join �ʿ�.
         e.job_id = j.job_id;
         
--�信 ���� ���� Ȯ��
SELECT *
FROM USER_VIEWS;

--����ڿ��� �־��� ��(ROLE) ���
SELECT *
FROM USER_ROLE_PRIVS;

--���� ����ڿ��� �־��� ���� ���
SELECT *
FROM USER_SYS_PRIVS;