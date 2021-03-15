/* 조인(join) : 일반적으로 '내부조인' 방식을 의미 */

select * from employees;

-- department_name 이 있는지 부터 확인.
desc departments;

-- 두개의 테이블을 조인
select emp.department_id, first_name, last_name, department_name
from employees emp, departments dep
where emp.department_id = dep.department_id;
-- department_id 앞에만 emp를 붙여준 이유 : 다른 속성들은 각각 테이블에만 존재하지만
-- department_id는 두 테이블에 다 존재하기 때문에 구분을 해줘야 한다.
-- 모든 속성앞에 테이블명을 붙여주는것은 해도되고 안해도되는데 
-- 테이블명을 붙여주면 더 명확하게 알 수 있다.

-- 3개의 테이블 조인
-- 직원의 이름, 이메일, 부서아이디, 부서명과 직급명을 조회하시오.
select first_name, last_name, email, emp.department_id, department_name, emp.job_id, job_title
from employees emp, departments dep, jobs job
where emp.department_id = dep.department_id 
and emp.job_id = job.job_id;

select * from locations;
-- 4개의 테이블 조인 ( 근무 위치 파악)
-- 직원의 이름, 이메일, 부서아이디, 부서명, 직급아이디, 직급명, 근무위치
select last_name, email, emp.department_id, department_name, emp.job_id, job_title, city, street_address
from employees emp, departments dep, jobs job, locations loc
where emp.department_id = dep.department_id
and emp.job_id = job.job_id
and dep.location_id = loc.location_id;

-- 일반 조건과 결합 : Seattle에서 근무하는 직원들의 이름, 이메일, 부서명
-- 직책명,  Seattle를 출력하도록 조회하시오.
select emp.first_name, emp.email, dep.department_name, job.job_title, loc.city
from employees "emp", departments dep, jobs job, locations loc
where emp.department_id = dep.department_id
and emp.job_id = job.job_id
and dep.location_id = loc.location_id
and loc.city='Seattle'; -- 일반 조건 포함

/* 셀프 조인 : 자신의 테이블을 두개의 테이블처럼 사용하는 것(필드가 많으면 3개처럼 사용하기도) */
select * from employees;
-- manager_id 가 상사의 id인데 이 id가 employee_id
-- manager_id=100번인 사람의 이름을 알고 싶을 때, 
-- 상사의 id도 가져오고 이름도 가져올때는 테이블을 2번 이용해야 함.
select emp1.employee_id, emp1.first_name, 
       emp1.manager_id "상사id", emp2.first_name "상사이름"
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id;

select emp1.employee_id, emp1.first_name, 
       emp2.employee_id "상사id", emp2.first_name "상사이름"
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id;


/* 외부 조인 */
-- 내부 조인으로 했을 때
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
where emp.department_id = dep.department_id; -- 106개의 행

select * from employees; -- 원래 107개의 행

--외부 조인으로 했을 때
-- left outer join
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
-- 왼쪽을 기준으로 오른쪽이 늘어남 Left outer join
-- departments에는 원래 null값이 없는데 왼쪽으로 인해 늘어난 것.
where emp.department_id = dep.department_id(+);

-- right outer join
select emp.employee_id, emp.first_name, dep.department_name
from employees emp, departments dep
-- 오른쪽을 기준으로 왼쪽이 늘어남 Right outer join
where emp.department_id(+) = dep.department_id;


-- [문제] 모든 사원의 사원ID와 firstName, 부서명, 근무 도시를 출력하시오.
select emp.employee_id, emp.first_name, dep.department_name, loc.city
from employees emp, departments dep, locations loc
where emp.department_id = dep.department_id(+)
and dep.location_id = loc.location_id(+);
/*
emp로 인해 dep에 null이 들어가면서 추가되기 때문에 dep에 (+)
dep가 하나 늘어남에 따라서 loc도 같이 하나 추가되는 것이라서 loc에 (+)
*/

-- [문제] 모든 사원의 사원ID와 FristName 그리고 상사ID와 상사이름을 출력하시오
select emp1.employee_id, emp1.first_name, emp1.manager_id "상사ID", emp2.first_name "상사이름"
from employees emp1, employees emp2
where emp1.manager_id = emp2.employee_id(+);
-- steven은 회사의 보스라서 상사가 없음 -> manager_id가 null값이라서 안나오기 때문에
-- 모두 나오게 하려면 외부조인을 사용해야 한다.

select * from employees;
