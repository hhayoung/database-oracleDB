/* ���ڿ� �Լ� */
 -- ���ڿ� ���� �Լ��� �߿���. ���� ���̱� ������
 
 -- concat(str1, str2) ���ڿ� ��ġ��
 select concat('Hello','bye'), concat('good','night') from dual;
-- ||(vertical var 2���ε� ǥ���� �� �ִ�)
 select concat('Hello','bye'), 'good' || 'night' from dual;
 
 -- initcap(str) ù���ڸ� �빮�ڷ� �ٲ��ִ� �Լ�
 select initcap('good morning') from dual;
 -- ������ ���� �����ڷ� �����ϰ� ù���ڸ� �빮�ڷ� ǥ����
 select initcap('good\morning hello') from dual;
 -- /�� �����ڷ� ������(\, |)
 
 -- lower(), upper() : �ҹ��ڷ�, �빮�ڷ� ��ȯ
 select lower('GOOD'), upper('good') from dual;
 
 -- LPAD(), RPAD() : padding ���� ����, �����ʿ� ��
 select lpad('good',6,'+') from dual;
 -- �� 6�ڸ��� �����ϰ� good�� �ְ� ���� ���� ������ �ְڴ�. ���⼭�� �����ڸ��� +
 select lpad('good',6) "lpad1", 
 lpad('good',7,'#') "lpad2", 
 lpad('good',8,'L') "lpad3" 
 from dual;
 -- ����� 1����Ʈ�� ���
 
 select lpad('ȫ�浿',8,'#') from dual;
 -- �ѱ��� 2����Ʈ�� ���
 
 -- rpad()
 select rpad('good',6) "rpad1", 
 rpad('good',7,'#') "rpad2", 
 rpad('good',8,'L') "rpad3" 
 from dual;
 
 -- ltrim(), rtrim()
 select ltrim('goodbye','g'), ltrim('goodbye','o'),
 ltrim('goodbye','go') 
 from dual;
 -- �߰��� �ִ� ���� ���� �� ����.
 -- go�� ���� ��� o�� �ִ� ��ŭ ����. o �ϳ��� ����°� �ƴ϶�
 
 select rtrim('goodbye','e'), rtrim('goodbye','o'),
 rtrim('goodbye','bye') 
 from dual;
 
 -- substr() ���ڿ� �߶󳻴� �Լ� substr(���ڿ�, �ڸ���, �߶󳾰�)
 -- 8��° ���ڿ��� 4���ڸ� �߶��
 select substr('good morning john',8,4) from dual;
 -- 8��° ���ڿ������� ������
 select substr('good morning john',8) from dual;
 -- �ڿ������� 4���� ��ȯ
 select substr('good morning john',-4) from dual;
 -- �ڿ��� 4���ں��� 2���ڸ� �߶��
 select substr('good morning john',-4,2) from dual;
 select substr('good morning john',-4,0) from dual;

 -- replace() ���ڿ� ��ü
 select replace('good morning tom', 'morning', 'evening') from dual;
 
 -- trim() : ���� ����
 select length('       good     ') from dual;  -- 16
 select length(trim('       good     ')) from dual;  -- 4 �¿� ������ ����
 select length(trim(both from '       good     ')) from dual;
 -- ���� ���� ���ֱ�
 select length(trim(leading from '       good     ')) from dual;
 -- ���� ���� ���ֱ�
 select length(trim(trailing from '       good     ')) from dual;
 
 -- instr() ���ڿ��� ��ġ���� ã�� �Լ�
 -- instr(���ڿ�, ã������, ������ġ, ���°�� ã����)
 select instr('good morning john','o',1) from dual;
 -- ���ڿ����� 'o'�� 1��°�� ������ ��ġ�� �������.
 -- ����° 'o'�� ��ġ��
 select instr('good morning john','o',4) from dual;
 -- �׹�° 'o'�� ��ġ��
 select instr('good morning john','o',8) from dual;
 -- 7��°�� o�� �ֱ� ������ 8��°���� �����ؾ� �� ���� 'o'�� ã�� �� �ִ�.
 
 -- ���ŷ��� ���� ���.
 -- 1���ڸ��������� �����ؼ� 4��°�� �ִ� 'o'�� ã�ڴ�.
 select instr('good morning john','o',1,4) from dual;
 
 -- ����° n�� ��ġ
 select instr('good morning john','n',1,3) from dual;
 
 /*
    instr('good morning john','o',1) �� �ǹ�
    
    �� ���ڿ����� 'o'�� ã�� �ǵ�,
    1��°�ڸ����� ��, 'g'�������� 'o'�� ã�Ƴ����Ŵ�.
    �ٵ� 2��°�ڸ��� 'o'�� �ֱ� ������ �ٷ� 2�� �˻��� ���� ��.
    
    �ɼǿ� 1�� �ƴ϶� 4���ٸ�,
    4 ��, 'd'�������� 'o'�� ã�� ������ ��.
    �׷��� 'd' �ڿ� �ִ� 'morning'�� 'o'�� �ֱ� ������ 
    �� 'o'�� �ڸ����� �˻��ؿ´�. =7
    �� ��, �˻�������ġ�� 4��°�ΰ� ������, ���ڿ��� ��ġ���� 'd'�������� �����ϴ°� X
    
    �׷��� 4��° 'o'�� �ִ� 'john'�� �ִ� 'o'�� ã�ƿ��� �����Ÿ�
    ����° 'o'�ڸ� = 7�̴ϱ� 8 �̻��� �ɼǰ����� �־���� 4��° 'o'�� ã�� �� �ִ�.
    
    �ٵ� �̷����ϸ� �ʹ� ����ϱ� 
    instr('good morning john','o',1,4) �̰��� �̿�
    ���ڿ����� 'o'�� ã�� �ǵ�, 1��°='g'���� �˻��� �����ؼ� 4��° 'o'�� �ִ�
    ��ġ���� �ٷ� ��ȯ���ش�.
    
    instr(���ڿ�, ã������, ������ġ, ���°�� ã����)
    
*/
 