/*
    group by ��
*/

select department_id from employees;

-- �μ����� �׷���� �̱�
select distinct department_id from employees;

select department_id 
from employees 
group by department_id;

-- �μ��� �޿� �հ�
select department_id, sum(salary) 
from employees 
group by department_id;

select * from employees;
-- �μ��� ������� �μ��� �޿�, �μ��� ��� �޿��� ��ȸ�Ͻÿ�.
select department_id, count(*) "�����", sum(salary) "�޿�", avg(salary) "��ձ޿�" 
from employees
group by department_id;

-- �μ��� ���޺� ������� ��� �޿��� ��ȸ�Ͻÿ�.
select department_id, job_id, count(employee_id) "�����", avg(salary) "��ձ޿�"
from employees
group by department_id, job_id
order by department_id, job_id;

-- ���� ���� ������.
select department_id, job_id, 
to_char(sum(salary),'999,999') "�ѱ޿�", 
to_char(avg(salary),'999,999') "��ձ޿�"
from employees
group by department_id, job_id
order by department_id, job_id;

-- ��ü �μ� ���� 80�� �μ��� �μ���,���޺�,�ѱ޿�,��ձ޿� ��ȸ.
select department_id, job_id, 
to_char(sum(salary),'999,999') "�ѱ޿�", 
to_char(avg(salary),'999,999') "��ձ޿�"
from employees
where department_id = 80
group by department_id, job_id
order by department_id, job_id;

-- ���� select -> from -> where -> group by -> order by

/*  having �� : ���ǿ� �´� �׷� ���� */

-- ���� �μ��� ����� ��ȸ�ϱ�
select department_id, count(*) "�����"
from employees
group by department_id;

-- null���� �μ��� �����ϰ� �μ��� ����� ��ȸ�ϱ�
select department_id, count(*) "�����"
from employees
where department_id is not null
group by department_id;

-- ���� �������� ������� 10�� �̻��� �μ��� ��ȸ�ϱ�
-- �����Լ��� count()�� where������ ��� �Ұ�
select department_id, count(*) "�����"
from employees
where department_id is not null
group by department_id
having count(*) >= 10;  -- �׷��� ������ ������ �� ����ϴ� ��(claus

-- select, from, where, group by, having, order by �� �� ���ٰ� �� ��,
--    5      1     2        3        4        6     ������ ����


/*
    select ���� ���� ����
    1. from ��
    2. where ��
    3. group by ��
    4. having ��
    5. select ��
    6. order by ��
*/












