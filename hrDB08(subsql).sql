/* 서브 쿼리 : 실무에서 많이 사용하는 쿼리 방법 */

select * from employees;
-- 평균 급여보다 적은 급여를 받는 사원을 조회하시오.
select round(avg(salary)) from employees;

select first_name, last_name, salary
from employees
where salary < 6462;
-- where절에는 집계함수를 사용할 수 없기 때문에 번거로워진다.

-- 서브쿼리를 적용해서 조회하기
select first_name, last_name, salary
from employees
where salary < (select round(avg(salary)) from employees);
-- 서브쿼리를 너무 많이 사용하면 과부하가 걸릴 수 있다.


select * from locations;

-- state_province가 null인 것만 조회하기
select location_id, state_province from locations where state_province is null;

select * from departments;

select * from departments
where location_id in (
select location_id from locations where state_province is null
);

-- 결과값이 여러 개로 나오는 경우
select location_id from locations where country_id = 'US';

-- in 연산자를 사용하는 예
select * from departments where location_id in (select location_id from locations where country_id = 'US');

--위의 코드를 다음과 같이 바꿔서 표현
select * from departments 
where location_id in (1400, 1500, 1600, 1700);  -- in 안의 값들은 OR 조건

-- [문제1] 월급이 가장 적은 사원의 이름과 직책명을 조회하시오.
select emp.first_name, job.job_title 
from employees emp, jobs job
where emp.salary = (select min(salary) from employees) -- 가장 많은 사람은 max
and emp.job_id = job.job_id;


-- [문제2] : 평균 급여보다 많이 받는 사원들의 명단과 직책을 조회하시오.
select emp.first_name, job.job_title
from employees emp, jobs job
where emp.salary > (select avg(salary) from employees)
and emp.job_id = job.job_id;
