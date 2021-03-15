/* 날짜 관련 함수() */

-- sysdate : 현재 시스템의 날짜
select sysdate from dual;

-- months_between() -- 날짜와 날짜사이의 차이
select months_between(sysdate, '2020/01/01') from dual;

-- last_day : 지정한 날짜의 해당 월의 마지막 날짜
select last_day(sysdate) from dual;

-- 50번 부서의 사원들의 근무 개월 수를 파악
select first_name, months_between(sysdate, hire_date)
from employees
where department_id = 50;

-- add_months() : 현재 달로 부터 지정한 달의 날짜를 구함.
select add_months(sysdate, 7) from dual; -- 7개월을 더함.

-- next_day() : next_day('기준날짜','찾을요일')
-- 1,2,3,4,5,6,7(일, 월, 화, 수, 목, 금, 토)
select next_day(sysdate, '일요일') "다음 일요일" from dual; 
-- 현재 날짜에서 돌아오는 일요일의 날짜
select next_day(sysdate, '월요일') "다음 월요일" from dual;

-- 이전 요일의 날짜를 가져오고 싶을 때는 -8
select next_day(sysdate-8, '일요일') "이전 일요일" from dual;
select next_day(sysdate-8, '월요일') "이전 월요일" from dual;

-- '찾을요일' 다양한 표기법
select next_day(sysdate, '일요일') "다음 일요일" from dual;
select next_day(sysdate, '일') "다음 일요일" from dual;
select next_day(sysdate, 1) "다음 일요일" from dual;
-- SUNDAY, SUN도 된다고는 되어있는데 안 됨.

-- to_char() : 형식 지정
select to_char(sysdate, 'yyyy-mm-dd') from dual; --날짜 형식 지정
select to_char(sysdate, 'yy-mm-dd') from dual;

-- nvl() : 널값을 다른 데이터로 변경하는 함수
select * from employees; -- commission_pct 값에서 null을 0으로 표현해보기
select first_name, nvl(commission_pct, 0) commission from employees;

-- case() : elseif문과 같은 역할 함수
select first_name, department_id,
    case when department_id = 20 then '마케팅부'
         when department_id = 60 then '전산실'
         when department_id = 90 then '전략기획실'
         else ''
         end "부서명"
from employees;
-- case when 조건 then 결과 else 결과 end


