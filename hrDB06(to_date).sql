select sysdate from dual;

select to_char(sysdate, 'yyy-mm-dd') from dual;
-- 비슷한 함수 있음.

/* to_date */
select to_date('20200814','yyyy-mm-dd') from dual;
-- 날짜형식이지만 타입은 문자열인데 이것을 날짜타입으로 바꿀 때 사용
select to_date('2020/08/14','yyyy-mm-dd') from dual;
-- 오라클에 이미 날짜 형식이 정해져 있어서 원하는 형태로 못 바꿈.

-- 오라클의 환경변수 조회하기
select * from v$nls_parameters;
-- 날짜형식을 지정해놨기 때문에 형식을 바꾸지 못한 것.

-- 바꾸는 방법 여러개 있음.
-- 영구적으로 바꿔버릴 수도 있고, 연결된 상태에서만 바꿀 수도 있음.

-- 날짜 형식 변경하기
alter session set nls_date_format = 'YYYY-MM-DD';

-- 날짜 형식 변경된거 확인하기
select * from employees;  -- here_date 날짜 형태가 바뀜.

select to_date('20201111','yyyy/mm/dd') from dual;
-- 위에 설정된 형태로만 바뀌기 때문에 원하는 형태로는 안바뀜.
-- 왜 안 바뀌는지 모르고 to_date 공부할 때 헤맬 수도 있는데, 이런 이유 때문인거고
-- 다른 형식으로는 위의 방법처럼 바꿔주면 된다.

select to_char(sysdate,'hh24:mi;ss') from dual;