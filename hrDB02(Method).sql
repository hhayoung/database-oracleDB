/*
    함수
*/
-- 집계 함수(aggregate)
-- : 여러행 또는 테이블 전체행으로 부터 하나의 집계결과값을 반환함.
-- count, max, min, avg, sum

-- sum() 함수
select sum(salary) from employees;

-- count() 함수
select count(*) from employees;  --레코드(튜플) 전체수

select * from employees;

select count(employee_id) from employees; -- employee_id는 중복되지 않으니까

select count(first_name) from employees; -- 107
select count(distinct first_name) from employees; -- 91
select count(first_name), count(distinct first_name) from employees;

-- avg() 함수
-- 직원의 전체 평균 급여를 조회
select avg(salary) from employees;

-- 부서 아이디가 80인 직원들의 평균 급여를 조회하시오.
select avg(salary) from employees where department_id = 80;

-- max() 함수
-- 최대 급여 사원
select first_name, last_name, max(salary) from employees; 
-- 이건 에러남. 

-- 가장 최근에 입사한 신입사원 조회
select * from employees;
select max(hire_date) "최근 신입사원 날짜" from employees;

-- 집계 함수는 where절에서 사용불가
select emplyee_id, first_name from employees where salary = max(salary);
-- 에러 발생.

-- min() 함수
select min(salary) from employees;

-- 최고참 사원의 입사 날짜
select min(hire_date) "최고참 사원 입사날짜" from employees;

--number function
-- abs() 절대값
select abs(-23) from dual; -- dual은 오라클에서 제공하는 dummy 테이블
-- 테이블 없이도 결과 확인해볼 수 있음.

-- round() 반올림
select round(0.123), round(0.543) from dual;

-- 소수점 뒤 6번째 자리수가 반올림
select round(0.12345678, 6), round(2.3435235 ,4) from dual;

-- trunc(n1, n2) truncate 잘라내다, 소수점 자리를 제거
select trunc(1234.121212) from dual; 
-- 소수점 2번째 자리부터 잘라냄
select trunc(1234.121212 , 2) from dual; 

-- ceil(), floor()
select ceil(32.8) ceil from dual;
select ceil(32.3) ceil from dual;

select floor(32.8) floor from dual;
select floor(32.3) floor from dual;

-- power() 승
select power(4,3) power from dual;

-- mod()
select mod(7,4) mod from dual;

-- sqrt() 제곱근
select sqrt(2) sqrt, sqrt(3) sqrt2 from dual;
