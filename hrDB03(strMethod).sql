/* 문자열 함수 */
 -- 문자열 관련 함수는 중요함. 많이 쓰이기 때문에
 
 -- concat(str1, str2) 문자열 합치기
 select concat('Hello','bye'), concat('good','night') from dual;
-- ||(vertical var 2개로도 표현할 수 있다)
 select concat('Hello','bye'), 'good' || 'night' from dual;
 
 -- initcap(str) 첫글자를 대문자로 바꿔주는 함수
 select initcap('good morning') from dual;
 -- 공백이 들어가면 구분자로 생각하고 첫글자를 대문자로 표현함
 select initcap('good\morning hello') from dual;
 -- /도 구분자로 생각함(\, |)
 
 -- lower(), upper() : 소문자로, 대문자로 변환
 select lower('GOOD'), upper('good') from dual;
 
 -- LPAD(), RPAD() : padding 값을 왼쪽, 오른쪽에 줌
 select lpad('good',6,'+') from dual;
 -- 총 6자리를 지정하고 good을 넣고 남은 곳에 공백을 주겠다. 여기서는 공백자리에 +
 select lpad('good',6) "lpad1", 
 lpad('good',7,'#') "lpad2", 
 lpad('good',8,'L') "lpad3" 
 from dual;
 -- 영어는 1바이트로 계산
 
 select lpad('홍길동',8,'#') from dual;
 -- 한글은 2바이트로 계산
 
 -- rpad()
 select rpad('good',6) "rpad1", 
 rpad('good',7,'#') "rpad2", 
 rpad('good',8,'L') "rpad3" 
 from dual;
 
 -- ltrim(), rtrim()
 select ltrim('goodbye','g'), ltrim('goodbye','o'),
 ltrim('goodbye','go') 
 from dual;
 -- 중간에 있는 경우는 지울 수 없음.
 -- go를 지울 경우 o가 있는 만큼 지움. o 하나만 지우는게 아니라
 
 select rtrim('goodbye','e'), rtrim('goodbye','o'),
 rtrim('goodbye','bye') 
 from dual;
 
 -- substr() 문자열 잘라내는 함수 substr(문자열, 자릿수, 잘라낼값)
 -- 8번째 문자에서 4글자를 잘라옴
 select substr('good morning john',8,4) from dual;
 -- 8번째 문자에서부터 끝까지
 select substr('good morning john',8) from dual;
 -- 뒤에서부터 4글자 반환
 select substr('good morning john',-4) from dual;
 -- 뒤에서 4글자부터 2글자를 잘라옴
 select substr('good morning john',-4,2) from dual;
 select substr('good morning john',-4,0) from dual;

 -- replace() 문자열 교체
 select replace('good morning tom', 'morning', 'evening') from dual;
 
 -- trim() : 공백 제거
 select length('       good     ') from dual;  -- 16
 select length(trim('       good     ')) from dual;  -- 4 좌우 공백이 삭제
 select length(trim(both from '       good     ')) from dual;
 -- 좌측 공백 없애기
 select length(trim(leading from '       good     ')) from dual;
 -- 우측 공백 없애기
 select length(trim(trailing from '       good     ')) from dual;
 
 -- instr() 문자열의 위치값을 찾는 함수
 -- instr(문자열, 찾을문자, 시작위치, 몇번째를 찾는지)
 select instr('good morning john','o',1) from dual;
 -- 문자열에서 'o'가 1번째로 나오는 위치가 어디인지.
 -- 세번째 'o'의 위치값
 select instr('good morning john','o',4) from dual;
 -- 네번째 'o'의 위치값
 select instr('good morning john','o',8) from dual;
 -- 7번째에 o가 있기 때문에 8번째에서 시작해야 그 다음 'o'를 찾을 수 있다.
 
 -- 번거롭지 않은 방법.
 -- 1번자리에서부터 시작해서 4번째에 있는 'o'를 찾겠다.
 select instr('good morning john','o',1,4) from dual;
 
 -- 세번째 n의 위치
 select instr('good morning john','n',1,3) from dual;
 
 /*
    instr('good morning john','o',1) 의 의미
    
    저 문자열에서 'o'를 찾을 건데,
    1번째자리에서 즉, 'g'에서부터 'o'를 찾아나갈거다.
    근데 2번째자리에 'o'가 있기 때문에 바로 2를 검색해 오는 것.
    
    옵션에 1이 아니라 4였다면,
    4 즉, 'd'에서부터 'o'를 찾아 나가는 것.
    그래서 'd' 뒤에 있는 'morning'에 'o'가 있기 때문에 
    그 'o'의 자리값을 검색해온다. =7
    이 때, 검색시작위치가 4번째인것 뿐이지, 문자열의 위치값은 'd'에서부터 시작하는게 X
    
    그래서 4번째 'o'가 있는 'john'에 있는 'o'를 찾아오고 싶은거면
    세번째 'o'자리 = 7이니까 8 이상을 옵션값으로 넣어줘야 4번째 'o'를 찾을 수 있다.
    
    근데 이렇게하면 너무 힘드니까 
    instr('good morning john','o',1,4) 이것을 이용
    문자열에서 'o'를 찾을 건데, 1번째='g'에서 검색을 시작해서 4번째 'o'가 있는
    위치값을 바로 반환해준다.
    
    instr(문자열, 찾을문자, 시작위치, 몇번째를 찾는지)
    
*/
 