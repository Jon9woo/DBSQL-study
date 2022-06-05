--�ش� �ڵ���� SQL Plus(SQL Command Line)�� �̿�.

--14�� �������� 1��
--���ο� ����ڸ� �����ϼ���.
--����1) c##foo�� c##bar �� 2���� ����ڸ� �����ϼ���. ��й�ȣ�� a12345�Դϴ�.
CONN / as sysdba;

CREATE USER c##foo IDENTIFIED BY a12345;

CREATE USER c##bar IDENTIFIED BY a12345;

--14�� �������� 2��
--c##manager ����(ROLE)�� �����ϼ���.
--����1) c##manager ���ҿ� ���̺�� �並 �����ϱ� ���� ������ �ο��ϼ���. 
--����2) c##manager ������ c##foo�� c##bar ����ڿ��� �ο��ϼ���.
CONN / as sysdba
CREATE ROLE c##manager;
GRANT create table, create view TO c##manager;
GRANT c##manager TO c##foo, c##bar;


--14�� �������� 3��
--����� c##foo�� ���� hr ������� ���(EMPLOYEES) ���̺��� �� ������ ���� ���ϼ���.
--����1)����� c##foo�� c##bar���� �α��� ������ �ο��ϼ���.
--����2)��� ���̺��� �����ϱ� ���� ����� c##foo���� ������ �ο��ϼ���.
--����3)����� c##foo�� �����Ͽ� c##bar���Ե� ��� ���̺� ���� SELECT ������ �ο��ϰ�, ����� ���� ��ȸ�ϼ���.
GRANT create session TO c##foo, c##bar;

CONN hr/hr;
GRANT select ON employees TO c##foo WITH GRANT OPTION;

CONN c##foo/a12345;
SELECT COUNT(*) FROM hr.employees; --c##foo �� ��ȸ

CONN c##bar/a12345;
SELECT COUNT(*)FROM hr.employees; --c##bar �� ��ȸ --���⵵ ����(?)


--14�� �������� 4��
--����� c##foo�� c##bar���� �ο��ߴ� hr ������� ������ ȸ���ϰ� c##foo, c##bar ����ڸ� �����ϼ���.
CONN hr/hr;
REVOKE select ON employees TO c##foo, c##bar; --�̰� �� ����(?)

CONN /as sysdba;
DROP USER c##foo;
DROP USER c##bar;