select sysdate from dual;

select to_char(sysdate, 'yyy-mm-dd') from dual;
-- ����� �Լ� ����.

/* to_date */
select to_date('20200814','yyyy-mm-dd') from dual;
-- ��¥���������� Ÿ���� ���ڿ��ε� �̰��� ��¥Ÿ������ �ٲ� �� ���
select to_date('2020/08/14','yyyy-mm-dd') from dual;
-- ����Ŭ�� �̹� ��¥ ������ ������ �־ ���ϴ� ���·� �� �ٲ�.

-- ����Ŭ�� ȯ�溯�� ��ȸ�ϱ�
select * from v$nls_parameters;
-- ��¥������ �����س��� ������ ������ �ٲ��� ���� ��.

-- �ٲٴ� ��� ������ ����.
-- ���������� �ٲ���� ���� �ְ�, ����� ���¿����� �ٲ� ���� ����.

-- ��¥ ���� �����ϱ�
alter session set nls_date_format = 'YYYY-MM-DD';

-- ��¥ ���� ����Ȱ� Ȯ���ϱ�
select * from employees;  -- here_date ��¥ ���°� �ٲ�.

select to_date('20201111','yyyy/mm/dd') from dual;
-- ���� ������ ���·θ� �ٲ�� ������ ���ϴ� ���·δ� �ȹٲ�.
-- �� �� �ٲ���� �𸣰� to_date ������ �� ��� ���� �ִµ�, �̷� ���� �����ΰŰ�
-- �ٸ� �������δ� ���� ���ó�� �ٲ��ָ� �ȴ�.

select to_char(sysdate,'hh24:mi;ss') from dual;