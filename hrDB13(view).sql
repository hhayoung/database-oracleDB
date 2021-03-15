/*
    ��(view) 
    : ���������� �������� �ʴ� ������ ���̺�
    : �ϳ� �̻��� ���̺��� ��ȸ�ϴ� SELECT���� ������ ��ü
    ���� �뵵
    : ����(SELECT���� �������� �ؼ��ϰ��� �� �� ���)
    : ���ȼ�(���̺��� Ư�� ���� �����ϰ� ���� ���� �� ���)
    ���� ����
    CREATE VIEW ���̸�(�÷�1, �÷�2, ...)
    AS SELECT��
*/

create view v_emp(emp_id, first_name, job_id, hire_date, dept_id)
as 
select employee_id, first_name, job_id, hire_date, department_id 
from employees
where job_id = 'ST_CLERK';

create view v_emp1(emp_id, first_name, job_id, hire_date, dept_id)
as 
select employee_id, first_name, job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';

--�Ϲ������� �� ���� ����ϴ� ���
-- �� ��ü�� �����ؾ� �ϸ� replace ���� �ȴ�. 
-- v_emp2 �䰡 ������ replace ����, ������ create ����
create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select employee_id, first_name, job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';

desc v_emp2;
-- employees ���̺�� ������Ÿ�� ��ġ

update v_emp2 set first_name = 'KIM' where first_name='Kelly';
--�������̺������� ���� �ٲ� -> ���� employees�� ���� �ٲ�����
select * from employees;

create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select nvl(employee_id,null), nvl(first_name,null), job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';

select * from v_emp;
select * from v_emp2;

create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select nvl(employee_id,null), nvl(first_name,null), job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';

desc v_emp2;
-- not null �̴� emp_id�� null�� �ٲ�

desc employees;
-- employees�� employee_id�� �ٲ��� ����. ������ �������� �ʴ´�.

-- �ٵ� view���Ǹ� 
create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select employee_id, first_name, job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';
--> �̷��� �ϰ� �� �ڿ� ���� �ٲٸ�
update v_emp2 set first_name = 'KIM' where first_name='Kelly';
--�������̺������� ���� �ٲ� -> ���� employees�� ���� �ٲ�����
select * from employees;

update employees set first_name='KIM' where last_name='Chung';

-- ���⼭�� employee_id�� ���� not null �ε� null�� �ٲ����ν�
-- ������ ������ �ٲ�� ������ �����̶� �������� �ȴ�.
-- �׷��� ������ ������ �ȵǾ��ֱ� ������ �ٲ��� �ʴ´�. 
create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select nvl(employee_id,null), nvl(first_name,null), job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';
--> �̷��� ���Ǹ� �ϰ� �� �ڿ� ���� �ٲٸ�
update v_emp2 set first_name = 'Kelly' where first_name='KIM';
--> ������ ����� �� ���ٰ� �������. 


select employee_id, first_name, (salary + nvl(commission_pct,0))*12
from employees;
--> �̷��� ��� �����ϰ� �׷��ϱ�
create view v_emp_salary(emp_id, first_name, annual_sal)
as
select employee_id, first_name, (salary + nvl(commission_pct,0))*12
from employees;

-- ������ �� ���� �並 ����ڴٰ� �ϸ� read only ���
create view v_emp_readonly(emp_id, first_name, annual_sal)
as
select employee_id, first_name, (salary + nvl(commission_pct,0))*12
from employees
with read only; -- �̰� �߰������ �Ѵ�.


-- ���̺��� ������ �� �����
-- �����ϸ� sql���� ������ϱ� ������ �̷��� �並 �� ���� ����. 
create view v_join(���, �̸�, �μ���ȣ, �μ���, �Ի���)
as
select emp.employee_id, emp.first_name||' '||emp.last_name, emp.department_id,dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;

select * from v_join;

-- 10�� �� �Ի��ڵ��� ������̵�� ����̸��� ��ȸ�Ͻÿ�.
-- �׸���, ������ 100000�̻�޴� ���, �μ����̵�� 50, ��å ST_CLERK
create or replace view v_sample1(emp_id, first_name, dept_id, hire_date, annual_sal)
as
select employee_id, first_name, department_id, hire_date, (salary + nvl(commission_pct,0))*12
from employees
where (salary + nvl(commission_pct,0))*12 >= 40000
and department_id = 50
and job_id = 'ST_CLERK'
and hire_date < sysdate - (365*10);

select * from v_sample1;

select * from employees;