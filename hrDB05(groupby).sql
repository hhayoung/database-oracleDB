/*
    group by 절
*/

select department_id from employees;

-- 부서별로 그룹지어서 뽑기
select distinct department_id from employees;

select department_id 
from employees 
group by department_id;

-- 부서별 급여 합계
select department_id, sum(salary) 
from employees 
group by department_id;

select * from employees;
-- 부서별 사원수와 부서별 급여, 부서별 평균 급여를 조회하시오.
select department_id, count(*) "사원수", sum(salary) "급여", avg(salary) "평균급여" 
from employees
group by department_id;

-- 부서별 직급별 사원수와 평균 급여를 조회하시오.
select department_id, job_id, count(employee_id) "사원수", avg(salary) "평균급여"
from employees
group by department_id, job_id
order by department_id, job_id;

-- 숫자 보기 안좋음.
select department_id, job_id, 
to_char(sum(salary),'999,999') "총급여", 
to_char(avg(salary),'999,999') "평균급여"
from employees
group by department_id, job_id
order by department_id, job_id;

-- 전체 부서 말고 80번 부서의 부서별,직급별,총급여,평균급여 조회.
select department_id, job_id, 
to_char(sum(salary),'999,999') "총급여", 
to_char(avg(salary),'999,999') "평균급여"
from employees
where department_id = 80
group by department_id, job_id
order by department_id, job_id;

-- 순서 select -> from -> where -> group by -> order by

/*  having 절 : 조건에 맞는 그룹 선택 */

-- 현재 부서별 사원수 조회하기
select department_id, count(*) "사원수"
from employees
group by department_id;

-- null값인 부서는 제외하고 부서별 사원수 조회하기
select department_id, count(*) "사원수"
from employees
where department_id is not null
group by department_id;

-- 위의 문제에서 사원수가 10명 이상인 부서만 조회하기
-- 집계함수인 count()는 where절에서 사용 불가
select department_id, count(*) "사원수"
from employees
where department_id is not null
group by department_id
having count(*) >= 10;  -- 그룹의 조건을 적용할 때 사용하는 절(claus

-- select, from, where, group by, having, order by 를 다 쓴다고 할 때,
--    5      1     2        3        4        6     순으로 수행


/*
    select 절의 실행 순서
    1. from 절
    2. where 절
    3. group by 절
    4. having 절
    5. select 절
    6. order by 절
*/












