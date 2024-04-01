/*
1. 오라클 소프트웨어 다운로드
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (무료설치)

3. Oracle 설치(SYS, SYSTEM 계정의 대한 암호 : 1004)

4.Sqlplus 프로그램 제공(CMD) : GUI 환경 일반개발자 사용 불편

5.별도의 Tool 설치 무료(SqlDeveloper , https://dbeaver.io/)  ,
                 유료(토드 , 오렌지 , SqlGate) 프로젝트시 설치 활용 ^^

6. SqlDeveloper 툴을 통해서 Oracle Server 접속 ....
   >> HR 계정 : 암호 1004 , Unlock 2가지 사용가능 .... (사원관리 실습 테이블)
   >> 새로운 계정 : BITUSER

-- USER SQL
ALTER USER "HR" IDENTIFIED BY 1004 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP"
ACCOUNT UNLOCK ;

-- QUOTAS
ALTER USER "HR" QUOTA UNLIMITED ON USERS;

-- ROLES
ALTER USER "HR" DEFAULT ROLE "RESOURCE","CONNECT";

-- SYSTEM PRIVILEGES


7. 현재 접속 계정 확인 : show user;   >> USER이(가) "BITUSER"입니다.


-- USER SQL
CREATE USER "BITUSER" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "BITUSER" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "BITUSER" WITH ADMIN OPTION;
ALTER USER "BITUSER" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES

-- USER SQL
CREATE USER "KOSA" IDENTIFIED BY "1004"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "CONNECT" TO "KOSA" WITH ADMIN OPTION;
GRANT "RESOURCE" TO "KOSA" WITH ADMIN OPTION;
ALTER USER "KOSA" DEFAULT ROLE "CONNECT","RESOURCE";

-- SYSTEM PRIVILEGES

*/

show user; --ctrl+ enter -- 블럭잡고 명령문 실행

/*
실습코드

CREATE TABLE EMP
(EMPNO number not null,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR number ,
HIREDATE date,
SAL number ,
COMM number ,
DEPTNO number );
--alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,'1980-12-17',800,null,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,'1981-02-22',1250,200,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,'1981-04-02',2975,30,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,300,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,'1981-04-01',2850,null,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,'1981-06-01',2450,null,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,'1982-10-09',3000,null,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',null,'1981-11-17',5000,3500,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,'1981-09-08',1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,'1983-01-12',1100,null,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,'1981-10-03',950,null,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,'1981-10-3',3000,null,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,null,10);

COMMIT;

CREATE TABLE DEPT
(DEPTNO number,
DNAME VARCHAR2(14),
LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

COMMIT;



CREATE TABLE SALGRADE
( GRADE number,
LOSAL number,
HISAL number );

INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);
COMMIT;

*/

/*
DB 분야
1. APP 개발자 (CRUD) : select, insert, update, delete, DDL(create, alter, drop)

2. 관리자(DBA) : 백업과 복원, 네트워크 관리, 자원관리, 하드웨어 관리

3. 튜너 : SQL 튜너(문장튜닝) + 하드웨어(네트워크) 튜너 

4. 모델러 : 설계 (DOMAIN) :요구사항 분석 (ERD)

5. 데이터 분석가 (석사 이상, 박사급, SCI)
*/
show user;
select * from emp;
select * from dept;
select * from salgrade;
/*
오라클 개발자 과정 시작은 오라클 서버 구조 학습이 아니고 쿼리문부터 시작합니다
*/
--사원테이블 모든 데이터를 출력하세요
select * from emp;
select * from dept;

--특정 컬럼 데이터 출력
select empno, ename, sal from emp;

select ename from emp;

--가명칭 사용하기 (별칭 alias)
select empno 사번 , ename 이름
from emp;

select empno "사 번" , ename "이 름"
from emp;
/*
SQL 표준 문법
(ANSI)
>> Oracle, Mssql, mysql 동일한 query 사용가능

ANSI
*/
select empno as "사 번" , ename as "이 름"
from emp;

--Oracle 언어는 대소문자 엄격하게 구분 (A, a)
/*
JAVA : 문자 'A', 문자열 "AAA"
Oracle : 문자와 문자열 구분 하지 않아요 : 문자열 : 'A', 'AAAA', '홍길동'
*/

desc emp; -- 오라클 테이블 정보 (컬럼명, null, 타입)

--ENAME VARCHAR2(10) 가변길이 문자열 (한글 : 5자, 영문자, 특수문자, 공백 : 10자)

select * from emp
where ename = 'KING';

/*
select 절  3
from   절  1     1
where  절  2
*/

-- query 문 (질의어) : 언어
-- 연산자 

/*
JAVA   : + 산술연산 (10 + 10), + 결합연산 ("홍" + "길동")
ORACLE : + 산술연산 (10 + 10), || 결합 연산 ('홍' || '길동')
MS-SQL : + 산술 또는 결합
*/

select '사원의 이름은 ' || ename || ' 입니다' as "사원이름"
from emp;

desc emp;

--자도 형변환>> empno 숫자 타입을 >> 문자열 타입 결합
select empno || ename from emp;

--사장님 .... 우리 회사에 직종이 몇개나 있나요?
-- 중복행 제거 키워드 : distinct
select distinct job from emp;

-- distinct 논리 : grouping > 같은 이름 grouping > 한놈씩 나와

select distinct job, deptno
from emp
order by job;

/*
java +, -, *, /, %
oracle +, -, *, /, % 없음 >> Like '%%' 이미 사용
나머지 구하는 함수 mod() 사용
*/

--사원테이블에서 사원의 급여를 100달러 인상한 결과를 출력하세요
select empno, ename, sal, sal + 100 as "100달러 인상 결과" from emp;


--dual 임시 테이블
select 100 + 100 from dual; --100100
select 100 || 100 from dual; --'100' 숫자형 문자
select '100' + 100 from dual; --'100' 숫자형 문자 200
select 'A100' + 100 from dual; --ORA-01722: invalid number

--비교연산자
-- <, > 등
-- 주의 : java 같다(==) 할당(=), javascript 같다 (==, ===)
-- oracle 같다(=) 같지않다(!=) >> 할당연산자는 없음 >> plsql에는 있음 (:=)

--논리연산자
--AND, OR, NOT

select empno, ename, sal
from emp
where sal >= 2000;

--사번이 7788번이 사원의 사번, 이름, 직종, 입사일 출력하세요
select * from emp;
select empno, ename, job, hiredate
from emp
where empno = 7788;

--사원의 이름이 king 사원의 사번, 이름, 급여를 출력하세요
select empno, ename, sal
from emp
where ename = 'KING';

-- 초과 : 미만
-- 이상 : 이하 (=)
-- 급여가 2000 달라 이상이면서 직종이 manger인 사원의 모든 정보를 출력하세요.
select * 
from emp
where emp.sal >= 2000 and emp.job = 'MANAGER'; --두가지 조건을 모두 만족하는 데이터

-- 급여가 2000 달라 이상이거나 직종이 manger인 사원의 모든 정보를 출력하세요.
select * 
from emp
where emp.sal >= 2000 or emp.job = 'MANAGER'; --둘 중에 하나만 만족해도 되요

--급여가 2000달러 초과이면서 직종이 manager인 사원의 모든 정보를 출력하세요
select * 
from emp
where emp.sal > 2000 and emp.job = 'MANAGER';

--날짜(서버날짜(DB))
--sysdate
select sysdate from dual;

-- 현재 접속 계정에 한해서 formate 변경
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual;

select * from nls_session_parameters; --환경설정
/*
NLS_LANGUAGE	KOREAN
NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
NLS_DATE_LANGUAGE	KOREAN
NLS_TIME_FORMAT	HH24:MI:SSXFF

툴에서 접속 계정에 모든 날짜 설정
도구 > 혼경설정 > 데이터베이스확장 > NLS > 날짜형식 바꾸고 저장
*/

select * from emp;

-- 날짜 검색 > 문자와 동일한 형식 검새
-- '날짜형식' 검색

--1980년 12월 17일 입사한 사원의 모든 정보를 출력하세요
select * from emp where hiredate='1980-12-17'; --(0)
select * from emp where hiredate='1980/12/17'; --(0)
select * from emp where hiredate='1980.12.17'; --(0)

select * from emp where hiredate='80-12-17'; --세기를 포함하지 않는 것은 현재 안됨

--사원의 급여가 2000달러 이상이고 4000이하인 사원의 모든 정보를 출력하세요.
select *
from emp
where sal between 2000 and 4000; -- (=)을 포함

--사원의 급여가 2000달러 초과 4000미만인 사원의 모든 정보를 출력하세요.
select *
from emp
where sal > 2000 and sal < 4000;

--부서번호가 10번 또는 20번 또는 30번인 사원의 사번, 이름, 급여, 부서번호를 출력하세요
select *
from emp
where deptno = 10 or deptno = 20 or deptno = 30;

--IN 연산자
select *
from emp
where deptno in(10, 20, 30);

-- 부서 번호가 10번 또는 20번이 아닌 사원의 사번,이름,급여,부서번호를 출력하세요
select *
from emp
where deptno != 10 and deptno != 20;

--다음을 풀어쓴 것 중 맞는 것을 찾으시오
select *
from emp
where deptno not in(10, 20); --  not in은 부정의 and

/*
1. deptno != 10 or deptno != 20;
2. deptno != 10 and deptno != 20;
*/

/*
Today Point
null에 대한 이야기
1. 값이 없다
2. 필요악

해결 .... : 함수 nvl() nvl2()
해결 .... : is null, is not null

create table member(
    userid varchar2(20) not null, --필수입력사항
    name varchar2(20) not null,   --필수입력사항
    hobby varchar2(50)            --default null 허용
)
insert into member(userid, name) values('kglim', '길동');
hobyy null이 입력되요
*/

--수당(comm)을 받지 않는 모든 사원의 정보를 출력하세요
--실습데이터 0이라는 수당은 받는 것으로 생각하고 풀기
select *
from emp
where comm is null;

--수당 받는 모든 사원 정보 출력
select *
from emp
where comm is not null;

--사원테이블에서 사번, 이름, 급여, 수당, 총급여(급여 + 수당)을 출력하세요
select empno, ename, sal, comm, sal + comm as "총 급여"
from emp;

select empno, ename, sal, comm, sal + nvl(comm, 0) as "총 급여"
from emp;
/*
null이라는 녀석 ....
1. null과의 모든 연산의 결과는 null ex) null + 100, null * 100 >> null
2. null을 대체할수있는 함수 : nvl()

nvl(컬럼명, 대체값) >> 치환

mysql : null > IFNULL()
ms-sql : null > Convert()

정리 : null
1. 필요악 (not null, null)
2. 비교 is null, is not null
3. 연산 nvl()
*/
select 1000 + null from dual;
select 1000 + nvl(null, 0) from dual;
select comm, nvl(comm, 10000) from emp;
select nvl(null, 'hello world') from dual;

--사원의 급여가 1000달러 이상이고 수당을 받지않는 사원의 사번,이름,직종,수당을 출력하시오
select *
from emp
where sal >= 1000 and comm is null or comm = 0;

/*
select
from
where
group by
having
order by
 
join (inner, outer, self ....)
*/

--문자열 검색
--주소검색 >> 개포 >> 개포 단어가 포함된 모든 주소 ....
--Like 문자열 패턴 검색
--와일드 카드 문자 (%(모든것), _(한문자))

--정규표현식 검색(regexp_like(ename, '[A-C]'))

select *
from emp
where ename like '%A%'; --A 들어있으면 되요

select *
from emp
where ename like 'A%'; --A로 시작되는 이름

select *
from emp
where ename like '%A'; --A로 끝나는 이름

select *
from emp
where ename like '%LL%';


select *
from emp
where ename like '%A%A%'; --A가 2개면 다 찾아라

select *
from emp
where ename like '_A%'; -- _순서 두번째 시작글자가 A

--데이터 정렬하기
--order by 컬럼명 : 문자, 숫자, 날짜 가능
--오름차순 : asc : 낮은 순 : default
--내림차순 : desc : 높은 순 : order by sal desc
--비용이 많이 드는 작업 : 정렬(알고리즘) > cost 많이 

select *
from emp
order by sal; --default asc

select *
from emp
order by sal desc;

--입사일이 가장 늦은 순으로 정렬해서 사번, 이름, 급여, 입사일을 출력하세요
--가장 최근에 입사한 순으로
select *
from emp
order by hiredate desc;

/*
select    3
from      1
where     2
order by  4 (select 결과를 저장)
*/

--
select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;
---------------------------------------------------------------------------------------------
show user;
/*
1. Linux : wsl 또는 vm Linux 설치 : jdk, tomcat, index.html, war(jar) 배포, 서버 구동 (우분투) putty
1.1. 명령어 : vim 네트워크, 편집기 명렁어
1.2 문서화 : 조별 문서화

2. bootstrap 사용하기 (디자인 template) > 수정할 수 있다
*/

select sysdate from dual;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate from dual;

select job, deptno
from emp
order by job asc, deptno desc;
--1. job asc group 순으로
--2. group 안에서 다시 deptno 큰 순으로 정렬

--연산자
--합집합, 차집합, 교집합.....

--합집합(union) : 테이블과 테이블의 데이터를 합치는 것 (중복값 배제)
--합집합(union all) : 테이블과 테이블의 데이터를 합치는 것(중복값 포함)

create table uta(name varchar2(20));
desc uta;
insert into uta(name) values('AAA');
insert into uta(name) values('BBB');
insert into uta(name) values('CCC');
insert into uta(name) values('DDD');
commit;
select * from uta;


create table ut(ename varchar2(20));
desc ut;
insert into ut(ename) values('AAA');
insert into ut(ename) values('BBB');
insert into ut(ename) values('CCC');
commit;
select * from ut;

--실습테이블
select * from uta;
select * from ut;

select * from uta
union
select * from ut;
--중복 데이터 제거(uta 집에 ut가 식구들을 데리고 놀러갔어요)

select * from uta
union all
select * from ut;
--중복 데이터를 제거하지 않아요


--union 규칙
--1. 대응되는 컬럼의 타입은 동일

select empno, ename from emp --숫자, 문자열
union
select dname, deptno from dept; --문자열, 숫자

select empno, ename from emp --숫자, 문자열
union
select deptno, dname from dept; --숫자, 문자열

--순서....... 정렬......... 가상 테이블 subquery >> from () 서브쿼리 >> in line view (POINT)
select *
from (
    select empno, ename from emp 
    union
    select deptno, dname from dept
)m
order by m.empno desc;

--2. [대응]되는 [컬럼의 개수] 동일 >> null로 개수 맞춰도 됨
select empno, ename, job, sal from emp 
union
select deptno, dname, loc, null from dept; 
--가상의 데이터로 개수 맞춰도 됨
select empno, ename, job, sal, 100 as "data" from emp
union
select deptno, dname, loc, 0, 200 as "data" from dept;
--초급 개발자 기초--
--단일 테이블 기본적인 조회 작업이 가능
----------------------------------------------------------------

--오라클 함수
--오라클.pdf (48페이지)
/*
단일 행 함수의 종류
1) 문자형 함수 : 문자를 입력 받고 문자와 숫자 값 모두를 RETURN 할 수 있다.
2) 숫자형 함수 : 숫자를 입력 받고 숫자를 RETURN 한다.
3) 날짜형 함수 : 날짜형에 대해 수행하고 숫자를 RETURN 하는 MONTHS_BETWEEN 함수를
                제외하고 모두 날짜 데이터형의 값을 RETURN 한다.
4) 변환형 함수 : 어떤 데이터형의 값을 다른 데이터형으로 변환한다.
5) 일반적인 함수 : NVL, DECODE
*/

--1. 문자열 함수
select initcap('the super man') from dual; --The Super Man

select lower('AAA'), upper('aaa') from dual;

select ename, lower(ename) as "소문자" from emp;

select * from emp where lower(ename) = 'king';

select length('abcd') from dual; -- 4개

select length ('홍길동') from dual; -- 3개

select length ('홍길동  .  a') from dual;

select concat('a', 'b', 'c') from dual;

select 'a' || 'b' || 'c' || 'd' from dual;

select concat(ename, job) as "full" from emp;

select ename || ' ' || job as "full" from emp;

-- java : substring
-- oracle : substr

select substr('ABCDE', 2, 3) from dual; --BCD
select substr('ABCDE', 1, 1) from dual; --A
select substr('ABCDE', 3, 1) from dual; --C

select substr('asdfsfsdfsfsdf', 3) from dual;

/*
사원테이블에서 ename 컬럼의 데이터를 첫글자는 소문자로 나머지 글자는 대문자로 출력하되 
하나의 컬럼으로 만들어서 출력하시고 컬럼의 별칭은 fullname으로 하고 첫글자와 나머지 문자 사이에는 공백하나를 넣어서 출력
단) 지금까지 
*/
select lower(substr(ename, 1, 1)) || ' ' || upper(substr(ename, 2)) as "fullname"
from emp;

select lpad('ABC', 10, '*') from dual;

select rpad('ABC', 10, '&') from dual;

--사용자 비번 hong1004 or k1234
--화면 비번번호 앞글자 2자리 ... 나머지는 특수문자
select lpad(substr('hong1004', 1, 2), length('hong1004'), '*') from dual;
select rpad(substr('k1234', 1, 2), length('k1234'), '*') from dual;

--emp 테이블에서 ename 컬럼의 데이터를 출력하는 첫글자만 출력하고 나머지는 *로 출력하세요.
--ex) SMITH > S****
select rpad(substr(ename, 1, 1), length(ename), '*') from emp;


create table member(
    id number,
    jumin varchar2(14)
);

insert into member(id, jumin) values(100, '123456-1234567');
insert into member(id, jumin) values(200, '234567-1234567');
commit;

select * from member;
--출력결과
100 : 123456-*******
200 : 234567-*******
select id || ' : ' || rpad(substr(jumin, 1, 7), length(jumin), '*') 
from member;

--rtrim() 함수 오른쪽 문자를 지워라
select rtrim('MILLER', 'ER') from dual;

--ltrim() 함수 왼쪽 문자를 지워라
select ltrim('MILLLLLER', 'MIL') from dual; --ER 중복값도 지우네요 ^^

--주 사용목적 공백제거
select '>' || rtrim('MILLER             ', ' ') || '<' from dual;

select ename, replace(ename, 'A', '와우') from emp;

---------------------문자열 함수 END -------------------------------
--숫자함수
-- round() (반올림 함수)
-- trunc() (절삭 함수)
-- mod()   나머지 구하는 함수
select round(12.345) as r from dual; 
select round(12.234, 0) as r from dual; --12
select round(12.545, 0) as r from dual; --13

select round(12.345, 1) as r from dual; --12.3
select round(12.355, 1) as r from dual; --12.4
select round(12.567, 1) as r from dual; --12.6

select round(12.567, -1) as r from dual; --10
select round(15.567, -1) as r from dual; --20

select round(15.567, -2) as r from dual; --0

-----------------------------------------------------
select trunc(12.345) as t from dual;  --12
select trunc(12.234, 0) as t from dual; --12
select trunc(12.545, 0) as t from dual; --12

select trunc(12.345, 1) as t from dual; --12.3
select trunc(12.355, 1) as t from dual; --12.3
select trunc(12.567, 1) as t from dual; --12.5

select trunc(12.567, -1) as t from dual; --10
select trunc(15.567, -1) as t from dual; --10

select trunc(15.567, -2) as t from dual; --0
--------------------------------------------------------

select 12/10 from dual; --1.2

select mod(12, 10) from dual; --2

select mod(0, 0) from dual;

------------------ 숫자 함수 END --------------------------

-- 날짜 함수 (연산)
select sysdate from dual;
--POINT : 연산

/*
1. Date + number >> Date
2. Date - number >> Date
3. Date - Date >> number
*/

select sysdate + 100 from dual;
select sysdate + 1000 from dual;
select sysdate - 1000 from dual;

select hiredate from emp;

--두 날짜 사이에 월수를 계산하는 함수

select months_between('2022-10-01', '2020-09-20') from dual;

select trunc(months_between('2022-10-01', '2020-09-20'), 0) from dual;

select trunc(months_between(sysdate, '2020-11-11'), 0) from dual; --40개월 근무

-- 주의 사항
select '2024-01-01' + 100 from dual; --문자형하고 숫자는 어찌 합하니...
--해결방법 (문자형 날짜 >> to_date())

select to_date('2024-01-01') + 100 from dual; --2024-04-10 00:00:00

--1. 사운엩이블에서 사원들의 입사일에서 현재 날짜까지의 근속 월수를 구하세요
--출력되는 데이터는 사번, 이름, 입사일, 근속월수
--단 근속월수는 정수만 출력
select empno, ename, hiredate, trunc(months_between(sysdate, hiredate), 0) as "근속월수"
from emp;

--2. 한달이 31일이라고 가정하고... 그 기준에서 근속월수 구하세요
-- 함수는 사용하지 마세요(반올림하지 마세요)
select empno, ename, hiredate, trunc((sysdate - hiredate)/31, 0) as "근속월수"
from emp;

----------------------------------------------------------------------------------------
--문자함수, 숫자함수, 날짜함수
----------------------------------------------------------------------------------------

--변환함수(Point)
--오라클 데이터 유형 (문자열, 숫자, 날짜)
--to_char(), to_number(), to_date()
/*
to_char()
1. 숫자 -> 문자열 (형식문자) format(100000 -> $1,000,000 >> 출력형식 정의
2. 날짜 -> 문자열 format('2024-10-10' >> '2024년 10월 10일' >> 출력형식 정의

to_date()
1. 문자열(날짜 형식) -> 날짜(연산) +, -
select to_date('2024-10-01') + 100 from dual;

to_number()
1. 문자열(숫자형 문자) ->  숫자

select '100' + 100 from dual;
select to_number('100') + 100 from dual;
*/

select sysdate, to_char(sysdate, 'YYYY') || '년' as yyyy,
                to_char(sysdate, 'YEAR') as year,
                to_char(sysdate, 'MM') as MM,
                to_char(sysdate, 'DD') as DD,
                to_char(sysdate, 'DAY')
                from dual;
                
--입사일이 12월인 사원의 사번, 이름, 입사일, 입사년도, 입사월을 출력하세요.                

select  to_char(hiredate, 'YYYY') as 입사년도,
        to_char(hiredate, 'MM') as 입사월
from emp
where to_char(hiredate, 'MM') = '12';


--------------------------------------------------------------------------------
show user;

select * from employees;

select employee_id, 
        first_name || ' ' || last_name as full_name, 
        to_char(hire_date, 'YYYY') as yyyy,
        to_char(hire_date, 'MM') as MM,
        to_char(salary * 12, '$999,999,999') as 연봉,
        to_char(salary * 12 * 1.1, '$999,999,999') as 인상연봉
from employees
where to_char(hire_date, 'YYYY') >= '2005'
order by 인상연봉 desc;

select trunc((to_date(sysdate) - to_date(hire_date))/365) as 근속연수
from employees
order by 근속연수 desc;



select rpad(replace(PHONE_NUMBER, '.', '-'), 18, 0) as 전화번호, 
        nvl(COMMISSION_PCT, 0) as 커미션, 
        trunc((to_date(sysdate) - to_date(hire_date))/365) as "근무기간(연)", 
        concat(EMPLOYEE_ID || FIRST_NAME, '@.com') as 이메일,
        LAST_NAME as 성, 
        FIRST_NAME as 이름
from employees
where length(PHONE_NUMBER) = 12
order by LAST_NAME, FIRST_NAME desc;

show user;

create table t_emp
(
    id number(6), --정수 6자리
    job nvarchar2(20) --20자(20*2 > 40byte)
);

insert into t_emp(id, job) values(100, 'IT');
insert into t_emp(id, job) values(200, 'SALES');
insert into t_emp(id, job) values(300, 'MANAGER');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500, 'MANAGER');
commit;

select * from t_emp;

select id, decode(id, 100, '아이티', 
                      200, '영업팀', 
                      300, '관리팀', 
                      '기타부서') as "부서이름"
from t_emp;

--------------------------------------------------------------------------------
create table t_emp2(
  id number(2),
  jumin char(7) --고정길이 문자열
);

desc t_emp2;

insert into t_emp2(id,jumin) values(1,'1234567');
insert into t_emp2(id,jumin) values(2,'2234567');
insert into t_emp2(id,jumin) values(3,'3234567');
insert into t_emp2(id,jumin) values(4,'4234567');
insert into t_emp2(id,jumin) values(5,'5234567');
commit;

select * from t_emp2;
/*
t_emp2 테이블에서 id, jumin  데이터를 출력하는데 jumin  컬럼의 앞자리가 1이면 남성 , 2이면 여성, 3이면 중성 그외는 기타 라고 
출력하는 구문을 만드세요 (컬럼명은 성별로 하세요)
*/

select id ,  decode(substr(jumin,1,1),1,'남성',
                                      2,'여성',
                                      3,'중성',
                                      '기타'  ) as 성별
from t_emp2;

/*
if(){
  if(){
     if(){
      }
   }
}
원칙은 if 안에 if가능 (decode(decode()) ....

*/
/*
응용문제 : hint) if문 안에 if문
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이라면 HELLO 문자 출력하고
부서번호가 20번인 사원중에서 SMITH 라는 이름을 가진 사원이 아니라면 WORLD 문자 출력하고
부서번호가 20번인 사원이 아니라면 ETC 라는 문자를 출력하세요
EMP 테이블에서요 ....
*/

select empno , ename , deptno , decode(deptno,20,
                                                decode(ename,'SMITH','HELLO','WORLD'),
                                                'ETC')
from emp;

--CASE 문 문법
/*
CASE 조건식 WHEN 결과1 THEN 출력1
           WHEN 결과2 THEN 출력2
           WHEN 결과3 THEN 출력3
           WHEN 결과4 THEN 출력4
           ELSE 출력5
END "컬러명"           
*/
create table t_zip(
    zipcode number(10)
);

desc t_zip;
insert into t_zip(zipcode) values(2);
insert into t_zip(zipcode) values(31);
insert into t_zip(zipcode) values(32);
insert into t_zip(zipcode) values(41);
commit;

select * from t_zip;


select '0' || to_char(zipcode) , case zipcode when 2  then '서울'
                                              when 31 then '경기'
                                              when 41 then '제주'
                                              else '기타지역'
                                 end 지역이름              
from t_zip;

/*
사원 테이블에서 사원 급여가 1000달러 이하면 4급
1001달러 2000달러 이하면 3급
2001달러 3000달러 이하면 2급
3001달러 4000달러 이하면 1급
4001달러 이상이면 특급
*/

select case when sal <= 1000 then '4급'
            when sal between 1001 and 2000 then '3급'
            when sal between 2001 and 3000 then '2급'
            when sal between 3001 and 4000 then '1급'
            else '특급'
        end "급수"    
            ,empno
            ,ename
from emp;           
---------------------------------------------------------------------------
--문자함수, 숫자함수, 날짜함수, 변환함수(to_char..), 일반함수(nvl, decode, case)
--여기까지 기본함수 END -----------------------------------------------------

--집계함수(오라클.pdf 75page)
/*
1. count(컬럼명) > 데이터건수, count(*) > row 수
2. sum()
3. avg()
4. max()
5. min()
기타 .........

1. 집계함수는 group by 절과 같이 사용
2. 모든 집계함수는 null 값 무시
3. 문법) select 절에 집계함수 이외에 다른 컬럼이 오면 반드시 그 컬럼은 group by 절에 명시되어야 한다.
*/

select count(*) from emp; --14건 row

select count(empno) from emp; --데이터 건수 14건

select count(comm) from emp; --null 무시 6건

select count(nvl(comm, 0)) from emp; --14건

--급여의 합
select sum(sal) as sumsal from emp; --29025
select trunc(avg(sal)) as avgsal from emp;

--사장님 총 수당 얼마인지 좀 보자....
select sum(comm) from emp; --4330
--총 수당의 평균
select trunc(avg(nvl(comm, 0))) from emp;

select deptno, avg(sal) --3
from emp                --1 
group by deptno;        --2

--직종별 평균 금여를 구하세요
select job, avg(sal)
from emp               
group by job;        

--부서별, 직종별 급여의 합을 구하세요
select deptno, job, sum(sal), count(sal)
from emp
group by deptno, job;

/*
select      5
from        1
where       2
group by    3
having      4
order by    6
*/

select * from emp;

--직종별 평균금여가 3000달러 이상인 사원의 직종과 평균급여를 출력하세요
select job, avg(sal)
from emp
group by job
having avg(sal) >= 3000;

------------------------------------------------
select job, sum(sal)
from emp
where comm is not null
group by job
having sum(sal) >= 5000
order by sum(sal) asc;
-------------------------------------------------
select deptno, count(deptno), sum(sal)
from emp
group by deptno
having count(empno) > 4;
-------------------------------------------------
select job, sum(sal)
from emp
where job != 'SALESMAN'
group by job
order by sum(sal) desc;
--------------------------------------------------
-- HR 계정으로 이동
show user;

-- 2005년 이후에 입사한 사원 중에 부서 번호가 있고, 급여가 5000~10000사이인 사원 검색
-- 2005년 1월 1일 이후 입사한 사원
-- 부서 번호가 NULL이 아닌 사원
-- 급여가 5000보다 크거나 같고, 10000보다 작거나 같은 사원
-- 위의 조건을 모두 만족하는 행을 검색
-- 정렬 : DEPARTMENT_ID 오름차순, SALARY 내림차순
select employee_id, last_name, hire_date, job_id, salary, department_id
from employees
where hire_date > '05/01/01' and department_id is not null and salary between 5000 and 10000
order by department_id, salary desc;

/*
2. EMPLOYEES 테이블을 이용하여 다음 조건에 만족하는 행을 검색하세요. 
부서번호가 있고, 부서별 근무 인원수가 2명 이상인 행을 검색하여 부서별 최대 급여와 최소 급여를 계산하
고 그 차이를 검색합니다. 
가) 테이블 : employees 
나) 검색 : department_id, MAX(salary), MIN(salary), difference 
        - MAX(salary) 와 MIN(salary)의 차이를 DIFFERENCE로 검색 
다) 조건
    ① 부서번호가 NULL이 아닌 사원 
    ② 부서별 근무 인원수가 2명 이상인 집합 j
라) 그룹 : 부서번호가 같은 행
마) 정렬 : department_id 
*/
select department_id, max(salary), min(salary), max(salary) - min(salary) as DIFFERENCE
from employees
where department_id is not null
group by department_id
having count(*) >= 2
order by department_id;






