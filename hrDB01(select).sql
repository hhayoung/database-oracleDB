desc employees;

desc employees;
describe employees;

-- * : 모든 열(속성)을 의미
select * from employees;

-- last_name 이 'Smith'인 직원의 모든 정보를 조회하시오.
select * from employees where last_name='Smith';

-- 부서(departments)의 정보를 확인하시오.
desc departments;
select * from departments;

-- last_name 이 'Ernst' 직원의 아이디와 급여를 조회하시오.
select employee_id, salary from employees where last_name='Ernst';
select first_name, employee_id, salary from employees where last_name='Ernst';

-- as는 별칭을 의미함.
select employee_id 사원ID from employees;

-- 사원 ID, 월급으로 필드명을 지정하여 조회하시오.
select employee_id as "사원 ID", salary as "월급" from employees;
-- as 생략 가능
select employee_id "사원 ID", salary "월급" from employees;

-- 중복 제거하기 distinct
select distinct job_id from employees;

-- 연산자(산술(사칙연산), 비교, 논리, 기타(like...))
select employee_id, first_name, salary*12 from employees;
select employee_id "사원ID", first_name "이름", salary*12 "연봉" from employees;

select employee_id, first_name, salary+100 from employees;

-- 비교 연산자 ( >, <, >=, <=, !=(같지않다 <>, ^=),
-- 급여가 5000이상인 직원의 이름과 급여를 조회하시오.
select first_name, salary from employees where salary>=5000;

-- 입사 날짜가 2004년 이후 입사한 직원의 이름과 봉급, 입사날짜를 조회하시오.
select first_name, last_name, salary, hire_date 
from employees 
where hire_date>='04/01/01';

-- 논리 연산자(and, or, not)
-- 부서 번호가 50 이면서 job_id가 sh_clerk인 직원의 이름과 job_id, 부서_id를 조회하시오.
select first_name, last_name, job_id, department_id from employees where department_id=50 and job_id='SH_CLERK';

-- 부서 아이디가 50이거나 매니저 ID가 100인 직원의 이름과 부서 아이디를 조회하시오.
select first_name, last_name, department_id from employees where department_id=50 or manager_id=100;

-- 부서 ID가 50이 아닌 직원의 이름과 부서 ID를 조회하시오.
--(3가지 방법으로...)
select first_name, last_name, department_id from employees where department_id != 50;
select first_name, last_name, department_id from employees where department_id <> 50;
select first_name, last_name, department_id from employees where department_id ^= 50;

-- 급여가 4000 ~ 8000 사이의 직원의 이름과 급여를 조회하시오.
select first_name, last_name, salary from employees where salary >=4000 and salary <=8000;
select first_name, last_name, salary from employees where salary between 4000 and 8000;

-- 급여가 6500, 7700, 13000 의 직원의 이름과 급여를 조회하시오.
select first_name, last_name, salary from employees where salary=6500 or salary=7700 or salary=13000;
select first_name, last_name, salary from employees where salary in(6500, 7700, 13000);

-- like 연산자
-- first name이 D로 시작하는 사원을 조회
select first_name, last_name from employees where first_name like 'D%';
-- first name이 D로 끝나는 사원 조회
select first_name, last_name from employees where first_name like '%d';

-- first_name 앞에서 세번째 글자가 a로 시작하는 사원을 조회하시오.
-- _(언더바) 이용
select first_name, last_name from employees where first_name like '__a%';

select * from employees;
-- 보너스가 없는 사원 조회(null 은 아무값도 없다)
select first_name, last_name, commission_pct from employees where commission_pct is null;

-- 보너스를 받는 사원 조회
select first_name, last_name, commission_pct from employees where commission_pct is not null;

/* 이 주석방법도 있다.
    오름차순 정렬(ascending sort)
*/
select employee_id, first_name from employees order by employee_id asc;  -- asc 생략 가능

-- 내림 차순 정렬(descending sort)
select employee_id, first_name from employees order by employee_id desc;
-- 전체 데이터 정렬은 잘 하지 않는다. (정렬할 공간을 따로 만들어야 되서 자원 소모가 크다.)
-- 특정 데이터를 뽑아올 때만 정렬하는게 좋다.