/*
    뷰(view) 
    : 물리적으로 존재하지 않는 가상의 테이블
    : 하나 이상의 테이블을 조회하는 SELECT문을 저장한 객체
    뷰의 용도
    : 편리성(SELECT문의 복잡함을 해소하고자 할 때 사용)
    : 보안성(테이블의 특정 열을 노출하고 싶지 않을 때 사용)
    뷰의 형식
    CREATE VIEW 뷰이름(컬럼1, 컬럼2, ...)
    AS SELECT문
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

--일반적으로 더 많이 사용하는 방법
-- 뷰 객체를 수정해야 하면 replace 쓰면 된다. 
-- v_emp2 뷰가 있으면 replace 수행, 없으면 create 수행
create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select employee_id, first_name, job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';

desc v_emp2;
-- employees 테이블과 데이터타입 일치

update v_emp2 set first_name = 'KIM' where first_name='Kelly';
--가상테이블이지만 값이 바뀜 -> 원본 employees의 값도 바뀌어버림
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
-- not null 이던 emp_id가 null로 바뀜

desc employees;
-- employees의 employee_id는 바뀌지 않음. 원본은 수정되지 않는다.

-- 근데 view정의를 
create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select employee_id, first_name, job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';
--> 이렇게 하고 난 뒤에 값을 바꾸면
update v_emp2 set first_name = 'KIM' where first_name='Kelly';
--가상테이블이지만 값이 바뀜 -> 원본 employees의 값도 바뀌어버림
select * from employees;

update employees set first_name='KIM' where last_name='Chung';

-- 여기서는 employee_id가 원래 not null 인데 null로 바꿈으로써
-- 원본의 구조를 바꿨기 때문에 원본이랑 독립적이 된다.
-- 그래서 원본과 연결이 안되어있기 때문에 바뀌지 않는다. 
create or replace view v_emp2(emp_id, first_name, job_id, hire_date, dept_id)
as 
select nvl(employee_id,null), nvl(first_name,null), job_id, hire_date, department_id 
from employees
where job_id = 'SH_CLERK';
--> 이렇게 정의를 하고 난 뒤에 값을 바꾸면
update v_emp2 set first_name = 'Kelly' where first_name='KIM';
--> 가상열은 사용할 수 없다고 에러뜬다. 


select employee_id, first_name, (salary + nvl(commission_pct,0))*12
from employees;
--> 이렇게 찍기 복잡하고 그러니까
create view v_emp_salary(emp_id, first_name, annual_sal)
as
select employee_id, first_name, (salary + nvl(commission_pct,0))*12
from employees;

-- 수정할 수 없게 뷰를 만들겠다고 하면 read only 사용
create view v_emp_readonly(emp_id, first_name, annual_sal)
as
select employee_id, first_name, (salary + nvl(commission_pct,0))*12
from employees
with read only; -- 이거 추가해줘야 한다.


-- 테이블을 조인한 뷰 만들기
-- 조인하면 sql문이 길어지니까 오히려 이럴때 뷰를 더 많이 쓴다. 
create view v_join(사번, 이름, 부서번호, 부서명, 입사일)
as
select emp.employee_id, emp.first_name||' '||emp.last_name, emp.department_id,dept.department_name, emp.hire_date
from employees emp, departments dept
where emp.department_id = dept.department_id;

select * from v_join;

-- 10년 전 입사자들의 사원아이디와 사원이름을 조회하시오.
-- 그리고, 연봉은 100000이상받는 사원, 부서아이디는 50, 직책 ST_CLERK
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