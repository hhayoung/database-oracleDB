desc employees;

desc employees;
describe employees;

-- * : ��� ��(�Ӽ�)�� �ǹ�
select * from employees;

-- last_name �� 'Smith'�� ������ ��� ������ ��ȸ�Ͻÿ�.
select * from employees where last_name='Smith';

-- �μ�(departments)�� ������ Ȯ���Ͻÿ�.
desc departments;
select * from departments;

-- last_name �� 'Ernst' ������ ���̵�� �޿��� ��ȸ�Ͻÿ�.
select employee_id, salary from employees where last_name='Ernst';
select first_name, employee_id, salary from employees where last_name='Ernst';

-- as�� ��Ī�� �ǹ���.
select employee_id ���ID from employees;

-- ��� ID, �������� �ʵ���� �����Ͽ� ��ȸ�Ͻÿ�.
select employee_id as "��� ID", salary as "����" from employees;
-- as ���� ����
select employee_id "��� ID", salary "����" from employees;

-- �ߺ� �����ϱ� distinct
select distinct job_id from employees;

-- ������(���(��Ģ����), ��, ��, ��Ÿ(like...))
select employee_id, first_name, salary*12 from employees;
select employee_id "���ID", first_name "�̸�", salary*12 "����" from employees;

select employee_id, first_name, salary+100 from employees;

-- �� ������ ( >, <, >=, <=, !=(�����ʴ� <>, ^=),
-- �޿��� 5000�̻��� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
select first_name, salary from employees where salary>=5000;

-- �Ի� ��¥�� 2004�� ���� �Ի��� ������ �̸��� ����, �Ի糯¥�� ��ȸ�Ͻÿ�.
select first_name, last_name, salary, hire_date 
from employees 
where hire_date>='04/01/01';

-- �� ������(and, or, not)
-- �μ� ��ȣ�� 50 �̸鼭 job_id�� sh_clerk�� ������ �̸��� job_id, �μ�_id�� ��ȸ�Ͻÿ�.
select first_name, last_name, job_id, department_id from employees where department_id=50 and job_id='SH_CLERK';

-- �μ� ���̵� 50�̰ų� �Ŵ��� ID�� 100�� ������ �̸��� �μ� ���̵� ��ȸ�Ͻÿ�.
select first_name, last_name, department_id from employees where department_id=50 or manager_id=100;

-- �μ� ID�� 50�� �ƴ� ������ �̸��� �μ� ID�� ��ȸ�Ͻÿ�.
--(3���� �������...)
select first_name, last_name, department_id from employees where department_id != 50;
select first_name, last_name, department_id from employees where department_id <> 50;
select first_name, last_name, department_id from employees where department_id ^= 50;

-- �޿��� 4000 ~ 8000 ������ ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
select first_name, last_name, salary from employees where salary >=4000 and salary <=8000;
select first_name, last_name, salary from employees where salary between 4000 and 8000;

-- �޿��� 6500, 7700, 13000 �� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
select first_name, last_name, salary from employees where salary=6500 or salary=7700 or salary=13000;
select first_name, last_name, salary from employees where salary in(6500, 7700, 13000);

-- like ������
-- first name�� D�� �����ϴ� ����� ��ȸ
select first_name, last_name from employees where first_name like 'D%';
-- first name�� D�� ������ ��� ��ȸ
select first_name, last_name from employees where first_name like '%d';

-- first_name �տ��� ����° ���ڰ� a�� �����ϴ� ����� ��ȸ�Ͻÿ�.
-- _(�����) �̿�
select first_name, last_name from employees where first_name like '__a%';

select * from employees;
-- ���ʽ��� ���� ��� ��ȸ(null �� �ƹ����� ����)
select first_name, last_name, commission_pct from employees where commission_pct is null;

-- ���ʽ��� �޴� ��� ��ȸ
select first_name, last_name, commission_pct from employees where commission_pct is not null;

/* �� �ּ������ �ִ�.
    �������� ����(ascending sort)
*/
select employee_id, first_name from employees order by employee_id asc;  -- asc ���� ����

-- ���� ���� ����(descending sort)
select employee_id, first_name from employees order by employee_id desc;
-- ��ü ������ ������ �� ���� �ʴ´�. (������ ������ ���� ������ �Ǽ� �ڿ� �Ҹ� ũ��.)
-- Ư�� �����͸� �̾ƿ� ���� �����ϴ°� ����.