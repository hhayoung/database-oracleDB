/* ��¥ ���� �Լ�() */

-- sysdate : ���� �ý����� ��¥
select sysdate from dual;

-- months_between() -- ��¥�� ��¥������ ����
select months_between(sysdate, '2020/01/01') from dual;

-- last_day : ������ ��¥�� �ش� ���� ������ ��¥
select last_day(sysdate) from dual;

-- 50�� �μ��� ������� �ٹ� ���� ���� �ľ�
select first_name, months_between(sysdate, hire_date)
from employees
where department_id = 50;

-- add_months() : ���� �޷� ���� ������ ���� ��¥�� ����.
select add_months(sysdate, 7) from dual; -- 7������ ����.

-- next_day() : next_day('���س�¥','ã������')
-- 1,2,3,4,5,6,7(��, ��, ȭ, ��, ��, ��, ��)
select next_day(sysdate, '�Ͽ���') "���� �Ͽ���" from dual; 
-- ���� ��¥���� ���ƿ��� �Ͽ����� ��¥
select next_day(sysdate, '������') "���� ������" from dual;

-- ���� ������ ��¥�� �������� ���� ���� -8
select next_day(sysdate-8, '�Ͽ���') "���� �Ͽ���" from dual;
select next_day(sysdate-8, '������') "���� ������" from dual;

-- 'ã������' �پ��� ǥ���
select next_day(sysdate, '�Ͽ���') "���� �Ͽ���" from dual;
select next_day(sysdate, '��') "���� �Ͽ���" from dual;
select next_day(sysdate, 1) "���� �Ͽ���" from dual;
-- SUNDAY, SUN�� �ȴٰ�� �Ǿ��ִµ� �� ��.

-- to_char() : ���� ����
select to_char(sysdate, 'yyyy-mm-dd') from dual; --��¥ ���� ����
select to_char(sysdate, 'yy-mm-dd') from dual;

-- nvl() : �ΰ��� �ٸ� �����ͷ� �����ϴ� �Լ�
select * from employees; -- commission_pct ������ null�� 0���� ǥ���غ���
select first_name, nvl(commission_pct, 0) commission from employees;

-- case() : elseif���� ���� ���� �Լ�
select first_name, department_id,
    case when department_id = 20 then '�����ú�'
         when department_id = 60 then '�����'
         when department_id = 90 then '������ȹ��'
         else ''
         end "�μ���"
from employees;
-- case when ���� then ��� else ��� end


