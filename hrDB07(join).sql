/* ����(join) : �Ϲ������� '��������' ����� �ǹ� */

select * from employees;

-- department_name �� �ִ��� ���� Ȯ��.
desc departments;

-- �ΰ��� ���̺��� ����
select emp.department_id, first_name, last_name, department_name
from employees emp, departments dep
where emp.department_id = dep.department_id;
-- department_id �տ��� emp�� �ٿ��� ���� : �ٸ� �Ӽ����� ���� ���̺��� ����������
-- department_id�� �� ���̺� �� �����ϱ� ������ ������ ����� �Ѵ�.
-- ��� �Ӽ��տ� ���̺���� �ٿ��ִ°��� �ص��ǰ� ���ص��Ǵµ� 
-- ���̺���� �ٿ��ָ� �� ��Ȯ�ϰ� �� �� �ִ�.

-- 3���� ���̺� ����
-- ������ �̸�, �̸���, �μ����̵�, �μ���� ���޸��� ��ȸ�Ͻÿ�.
select first_name, last_name, email, emp.department_id, department_name, emp.job_id, job_title
from employees emp, departments dep, jobs job
where emp.department_id = dep.department_id 
and emp.job_id = job.job_id;

select * from locations;
-- 4���� ���̺� ���� ( �ٹ� ��ġ �ľ�)
-- ������ �̸�, �̸���, �μ����̵�, �μ���, ���޾��̵�, ���޸�, �ٹ���ġ
select last_name, email, emp.department_id, department_name, emp.job_id, job_title, city, street_address
from employees emp, departments dep, jobs job, locations loc
where emp.department_id = dep.department_id
and emp.job_id = job.job_id
and dep.location_id = loc.location_id;

-- �Ϲ� ���ǰ� ���� : Seattle���� �ٹ��ϴ� �������� �̸�, �̸���, �μ���
-- ��å��,  Seattle�� ����ϵ��� ��ȸ�Ͻÿ�.
select emp.first_name, emp.email, dep.department_name, job.job_title, loc.city
from employees "emp", departments dep, jobs job, locations loc
where emp.department_id = dep.department_id
and emp.job_id = job.job_id
and dep.location_id = loc.location_id
and loc.city='Seattle'; -- �Ϲ� ���� ����

/* ���� ���� : �ڽ��� ���̺��� �ΰ��� ���̺�ó�� ����ϴ� ��(�ʵ尡 ������ 3��ó�� ����ϱ⵵) */
select * from employees;
-- manager_id �� ����� id�ε� �� id�� employee_id
-- manager_id=100���� ����� �̸��� �˰� ���� ��, 
-- ����� id�� �������� �̸��� �����ö��� ���̺��� 2�� �̿��ؾ� ��.
select emp1.employee_id, emp1.first_name, 
       emp1.manager_id "���id", emp2.first_name "����̸�"
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id;

select emp1.employee_id, emp1.first_name, 
       emp2.employee_id "���id", emp2.first_name "����̸�"
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id;


/* �ܺ� ���� */
-- ���� �������� ���� ��
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id; -- 106���� ��

select * from employees; -- ���� 107���� ��

--�ܺ� �������� ���� ��
-- left outer join
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
-- ������ �������� �������� �þ Left outer join
-- departments���� ���� null���� ���µ� �������� ���� �þ ��.
where emp.department_id = dep.department_id(+);

-- right outer join
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
-- �������� �������� ������ �þ Right outer join
where emp.department_id(+) = dep.department_id;


-- [����] ��� ����� ���ID�� firstName, �μ���, �ٹ� ���ø� ����Ͻÿ�.
select emp.employee_id, emp.first_name, dep.department_name, loc.city
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id(+)
and dep.location_id = loc.location_id(+);
/*
emp�� ���� dep�� null�� ���鼭 �߰��Ǳ� ������ dep�� (+)
dep�� �ϳ� �þ�� ���� loc�� ���� �ϳ� �߰��Ǵ� ���̶� loc�� (+)
*/

-- [����] ��� ����� ���ID�� FristName �׸��� ���ID�� ����̸��� ����Ͻÿ�
select emp1.employee_id, emp1.first_name, emp1.manager_id "���ID", emp2.first_name "����̸�"
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id(+);
-- steven�� ȸ���� ������ ��簡 ���� -> manager_id�� null���̶� �ȳ����� ������
-- ��� ������ �Ϸ��� �ܺ������� ����ؾ� �Ѵ�.

select * from employees;
