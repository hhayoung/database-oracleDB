/*
    �Լ�
*/
-- ���� �Լ�(aggregate)
-- : ������ �Ǵ� ���̺� ��ü������ ���� �ϳ��� ���������� ��ȯ��.
-- count, max, min, avg, sum

-- sum() �Լ�
select sum(salary) from employees;

-- count() �Լ�
select count(*) from employees;  --���ڵ�(Ʃ��) ��ü��

select * from employees;

select count(employee_id) from employees; -- employee_id�� �ߺ����� �����ϱ�

select count(first_name) from employees; -- 107
select count(distinct first_name) from employees; -- 91
select count(first_name), count(distinct first_name) from employees;

-- avg() �Լ�
-- ������ ��ü ��� �޿��� ��ȸ
select avg(salary) from employees;

-- �μ� ���̵� 80�� �������� ��� �޿��� ��ȸ�Ͻÿ�.
select avg(salary) from employees where department_id = 80;

-- max() �Լ�
-- �ִ� �޿� ���
select first_name, last_name, max(salary) from employees; 
-- �̰� ������. 

-- ���� �ֱٿ� �Ի��� ���Ի�� ��ȸ
select * from employees;
select max(hire_date) "�ֱ� ���Ի�� ��¥" from employees;

-- ���� �Լ��� where������ ���Ұ�
select emplyee_id, first_name from employees where salary = max(salary);
-- ���� �߻�.

-- min() �Լ�
select min(salary) from employees;

-- �ְ��� ����� �Ի� ��¥
select min(hire_date) "�ְ��� ��� �Ի糯¥" from employees;

--number function
-- abs() ���밪
select abs(-23) from dual; -- dual�� ����Ŭ���� �����ϴ� dummy ���̺�
-- ���̺� ���̵� ��� Ȯ���غ� �� ����.

-- round() �ݿø�
select round(0.123), round(0.543) from dual;

-- �Ҽ��� �� 6��° �ڸ����� �ݿø�
select round(0.12345678, 6), round(2.3435235 ,4) from dual;

-- trunc(n1, n2) truncate �߶󳻴�, �Ҽ��� �ڸ��� ����
select trunc(1234.121212) from dual; 
-- �Ҽ��� 2��° �ڸ����� �߶�
select trunc(1234.121212 , 2) from dual; 

-- ceil(), floor()
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

select floor(32.8) floor from dual;
select floor(32.3) floor from dual;

-- power() ��
select power(4,3) power from dual;

-- mod()
select mod(7,4) mod from dual;

-- sqrt() ������
select sqrt(2) sqrt, sqrt(3) sqrt2 from dual;
