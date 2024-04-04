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

--------------------------------------------------------------------------------
show user;
select sysdate from dual;
--------------------------------------------------------------------------------

---조인 초급 개발 필수 사항 ---
select * from emp;
select * from dept;

/*
create table M (M1 char(6) , M2 char(10));
create table S (S1 char(6) , S2 char(10));
create table X (X1 char(6) , X2 char(10));

insert into M values('A','1');
insert into M values('B','1');
insert into M values('C','3');
insert into M values(null,'3');
commit;

insert into S values('A','X');
insert into S values('B','Y');
insert into S values(null,'Z');
commit;

insert into X values('A','DATA');
commit;
*/
select * from m;
select * from s;
select * from x;

--등가조인 (equi join)
--원테이블과 대응되는 테이블에 있는 컬럼의 데이터를 1:1 매핑
--sql join (오라클) 간단
--ANSI 문법 권장 >> inner join ~ on

select *
from m, s
where m.m1 = s.s1;

--ansi
select *
from m inner join s
on m.m1 = s.s1;

select *
from emp join dept
on emp.deptno = dept.deptno;

select *
from emp e join dept d
on e.deptno = d.deptno;

select *
from s join x
on s.s1 = x.x1;
--------------------------------------------------------------------------------
--여러개 테이블 조인
select *
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;

select m.m1, m.m2, s.s2, x.x2
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;

--ansi 권장
select *
from m join s on m.m1 = s.s1
       join x on s.s1 = x.x1;
--------------------------------------------------------------------------------
--HR
show user;

select * from employees;
select * from departments;
select * from locations;

select e.employee_id, d.department_id, l.location_id
from employees e join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id;
                 
select * 
from employees
where department_id is null;
--178	Kimberely	Grant 부서가 없음
--같이 출력하고 싶어요

select e.employee_id, 
       e.last_name, 
       d.department_id, 
       d.department_name, 
       l.location_id, 
       l.city
from employees e left join departments d on e.department_id = d.department_id
                 join locations l on d.location_id = l.location_id;
                 
--------------------------------------------------------------------------------
--KOSA
show user;

--비등가 (non-equi)
--하나의 컬럼으로 매핑이 안되요 (컬럼을 2개 이상 사용)
--문법(등가 문법 동일)
select * from emp;
select * from salgrade;


select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

--------------------------------------------------------------------------------
--outer join (equi join 선행되고 남아있는 데이터를 가져오는 방법)
/*
1. 주종관계 (주인이 되는 쪽에 남아있는 데이터 가져오는 방법)
2. left outer join
3. right outer join
4. full outer join (left, right union)

*/

select *
from m left outer join s
on m.m1 = s.s1;

select *
from m right outer join s
on m.m1 = s.s1;

select *
from m full outer join s
on m.m1 = s.s1;

--------------------------------------------------------------------------------
--self join (자기참조 : 하나의 테이블에서 특정컬럼이 다른 컬럼을 참조하는 경우)
--문법(x) > 등가조인 > 의미만 존재

select * from emp;

select e.empno, e.ename, m.empno, m.ename
from emp e left outer join emp m on e.mgr = m.empno;

--------------------------------------------------------------------------------
select * from emp;
select * from dept;
select * from salgrade;

-- 1. 사원들의 이름, 부서번호, 부서이름을 출력하라.
select e.ename, e.deptno, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno;

-- 2. DALLAS에서 근무하는 사원의 이름, 직위, 부서번호, 부서이름을
-- 출력하라.
select e.ename, e.job, e.deptno, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';

-- 3. 이름에 'A'가 들어가는 사원들의 이름과 부서이름을 출력하라.
select e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where e.ename like '%A%';

-- 4. 사원이름과 그 사원이 속한 부서의 부서명, 그리고 월급을
--출력하는데 월급이 3000이상인 사원을 출력하라.
select e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where e.sal >= 3000;

-- 5. 직위(직종)가 'SALESMAN'인 사원들의 직위와 그 사원이름, 그리고
-- 그 사원이 속한 부서 이름을 출력하라.
select e.job, e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. 커미션이 책정된 사원들의 사원번호, 이름, 연봉, 연봉+커미션,
-- 급여등급을 출력하되, 각각의 컬럼명을 '사원번호', '사원이름',
-- '연봉','실급여', '급여등급'으로 하여 출력하라.
--(비등가 ) 1 : 1 매핑 대는 컬럼이 없다
select e.empno as 사원번호, 
       e.ename as 이름,
       e.sal as 연봉,
       e.sal + nvl(e.comm, 0) 실급여,
       s.grade 급여등급
from emp e left outer join salgrade s
on e.sal between s.losal and s.hisal;

-- 7. 부서번호가 10번인 사원들의 부서번호, 부서이름, 사원이름,
-- 월급, 급여등급을 출력하라.
select e.deptno, 
       d.dname,
       e.ename,
       e.sal,
       s.grade
from emp e left outer join dept d on e.deptno = d.deptno 
           left outer join salgrade s on e.sal between s.losal and s.hisal;

-- 8. 부서번호가 10번, 20번인 사원들의 부서번호, 부서이름,
-- 사원이름, 월급, 급여등급을 출력하라. 그리고 그 출력된
-- 결과물을 부서번호가 낮은 순으로, 월급이 높은 순으로
-- 정렬하라.
select e.deptno, 
       d.dname,
       e.ename,
       e.sal,
       s.grade
from emp e left outer join dept d on e.deptno = d.deptno 
           left outer join salgrade s on e.sal between s.losal and s.hisal
where e.deptno in(10, 20)
order by e.deptno, e.sal desc;

-- 9. 사원번호와 사원이름, 그리고 그 사원을 관리하는 관리자의
-- 사원번호와 사원이름을 출력하되 각각의 컬럼명을 '사원번호',
-- '사원이름', '관리자번호', '관리자이름'으로 하여 출력하라.
--SELF JOIN (자기 자신테이블의 컬럼을 참조 하는 경우)
select e.empno as 사원번호, 
       e.ename as 사원이름, 
       m.empno as 관리자번호,
       m.ename as 관리자이름
from emp e left outer join emp m on e.mgr = m.empno;

--사원 테이블에서 사원들의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 급여를 출력하세요

select *
from emp
where sal > (select avg(sal) from emp);

/*
1. single row subquery : 서브쿼리의 실행결과가 단일컬럼에 단일 로우인 경우 (한 개의 값)
ex) select sum(sal) from emp; ..max(), min()
연산자 : =, !=, >, <
2. mutli row subquery : 서브쿼리의 실행결과가 단일컬럼에 여러 개의 로우인 경우 (다중값)
ex) select sal from emp

문법적인 조건
1. 괄호 안에 있어야 한다
2. 단일 컬럼으로 구성
3. 서브 쿼리가 단독으로 실행 가능

서브쿼리와 메인 쿼리 관계
1. 서브 쿼리 선행 실행되고 그 결과를 가지고 메인 쿼리가 실행된다.
*/

--사원테이블에서 jones의 급여보다 더 많은 급여를 받는 사원의 사번, 이름, 급여를 출력하세요.
select sal from emp where ename = 'JONES';

select empno, ename, sal
from emp
where sal > (select sal 
             from emp 
             where ename='JONES');

--부서 번호가 30번인 사원과 같은 급여를 받는 모든 사원 정보를 출력하세요
select * from emp
where sal in (select sal from emp where deptno = 30);

--부서 번호가 30번인 사원과 다른 급여를 받는 모든 사원의 정보를 출력하세요.
select * from emp
where sal not in (select sal from emp where deptno = 30);

--부하직원이 있는 사원의사번과 이름을 출력하세요.
select * from emp
where empno in (select mgr from emp);

select * from emp
where empno not in (select nvl(mgr, 0) from emp);

--king에게 보고하는 즉 직속 상관이 king인 사원의 사번 이름 직종 관리자 사번을 출력하세요
select * from emp
where mgr = (select empno from emp where ename = 'KING');

--20번 부서의 사원중에서 가장 많은 급열르 받는 사원보다 더 많은 급여를 받는 사원의 사번, 이름 ,급여, 부서번호를 출력하세요
select *
from emp
where sal > (select max(sal) from emp where deptno = 20);

--실무에서 가장 많이 쓰이는 쿼리
--자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번, 이름, 부서번호, 부서별 평균월급을 출력하세요
select e.empno, e.ename, e.deptno, deptavgsal.avgsal
from emp e join (select deptno, trunc(avg(sal)) as avgsal from emp group by deptno) deptavgsal on e.deptno = deptavgsal.deptno
where sal > deptavgsal.avgsal;


--1. 'SMITH'보다 월급을 많이 받는 사원들의 이름과 월급을 출력하라.
select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');
?
--2. 10번 부서의 사원들과 같은 월급을 받는 사원들의 이름, 월급,
-- 부서번호를 출력하라.
select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);

--3. 'BLAKE'와 같은 부서에 있는 사원들의 이름과 고용일을 뽑는데
-- 'BLAKE'는 빼고 출력하라.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') and ename != 'BLAKE';

--4. 평균급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을
-- 출력하되, 월급이 높은 사람 순으로 출력하라.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;

--5. 이름에 'T'를 포함하고 있는 사원들과 같은 부서에서 근무하고
-- 있는 사원의 사원번호와 이름을 출력하라.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30

--6. 30번 부서에 있는 사원들 중에서 가장 많은 월급을 받는 사원보다
-- 많은 월급을 받는 사원들의 이름, 부서번호, 월급을 출력하라.
--(단, ALL(and) 또는 ANY(or) 연산자를 사용할 것)
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > (SELECT MAX(SAL)
             FROM EMP
             WHERE DEPTNO=30);
 
SELECT ENAME, DEPTNO, SAL
FROM EMP
WHERE SAL > ALL(SELECT SAL
                FROM EMP
                WHERE DEPTNO=30)
 
--where sal > 1600 and sal > 1250 and sal > 2850 and sal > 1500 and sal > 950

--7. 'DALLAS'에서 근무하고 있는 사원과 같은 부서에서 일하는 사원의
-- 이름, 부서번호, 직업을 출력하라.
select ename, deptno, job
from emp
where 

--8. SALES 부서에서 일하는 사원들의 부서번호, 이름, 직업을 출력하라.
select e.deptno, e.ename, e.job
from emp e join dept d on e.deptno = d.deptno
where d.dname = 'SALES';

--9. 'KING'에게 보고하는 모든 사원의 이름과 급여를 출력하라
--king 이 사수인 사람 (mgr 데이터가 king 사번)
select ename, sal
from emp
where mgr = (select empno from emp where ename = 'KING');

--10. 자신의 급여가 평균 급여보다 많고, 이름에 'S'가 들어가는
-- 사원과 동일한 부서에서 근무하는 모든 사원의 사원번호, 이름,
-- 급여를 출력하라.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp) and
      deptno in (select deptno from emp where ename like '%S%');

--11. 커미션을 받는 사원과 부서번호, 월급이 같은 사원의
-- 이름, 월급, 부서번호를 출력하라.
select ename, sal, deptno
from emp
where deptno in(select deptno from emp where comm is not null) and
      sal in(select sal from emp where comm is not null);

--12. 30번 부서 사원들과 월급과 커미션이 같지 않은
--사원들의 이름, 월급, 커미션을 출력하라.
select ename, sal, comm
from emp
where sal not in(select sal from emp where deptno = 30) and
      comm not in(select comm from emp where deptno = 30);
      

--------------------------------------------------------------------------------
/*
기본적인 SQL 용어

DDL (데이터 정의어) : create, alter, drop, truncate ... rename, modify
DML (데이터 조작어) : insert, update, delete (트랜잭션 : transaction)
* 트랜잭션 : 논리적인 작업 단위(결과 : 성공 아니면 실패)
* 은행 : A 계좌에서 1000원을 출금해서 B라는 계좌에 이체

begin tran
    update ....
    update ....
    insert ....
end tran

실무)
작업 ..... 회사 DB select 잘 됨 ...... insert, update, delete 안되요
1. 오라클 ... insert, update, delete (기본적으로 trans ~ 

*/
-- DML (오라클.pdf 168page)

--------------------------------------------------------------------------------
--자바 제어문 .... (무조건 암기)
--1. insert

create table temp(
    id number primary key, --not null, unique (주민번호....)
    name varchar2(20)
);

desc temp;
select * from tab where tname = 'TEMP';

--1. 일반적인 insert
insert into temp(id, name) values(100, '홍길동');

select * from temp;

commit; -- 실제 반영

select * from temp;

--2. 생략
insert into temp values(200, '김유신'); -- 주의 ...
commit;

insert into temp values(200);

--3. insert 중복 데이터
insert into temp(id, name) values(100, '김수한무');

--------------------------------------------------------------------------------
-- SQL 프로그래밍적인 요소 (x)
-- PL-SQL 변수, 제어문

create table temp2 (id varchar2(50));

--pl-sql
--BEGIN
--    FOR i IN 1..100 LOOP
--        insert into temp2(id) values('A' || to_char(i));
--    END LOOP;
--END;

select * from temp2;

create table temp3(
    memberid number(3), --3자리 정수
    name varchar2(10), --default null 허용'
    regdate date default sysdate --데이터 기본값 설정 (insert 하지 않으면 날짜 자동)
);

desc temp3;

--1. 정상
insert into temp3(memberid, name, regdate)
values(100, '홍길동', '2024-04-03');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200, '김유신');
commit;

insert into temp3(memberid)
values(300);

--------------------------------------------------------------------------------
-- 대량 데이터 삽입하기
create table temp4(id number);
create table temp5(num number);

insert into temp4(id) values(1);
insert into temp4(id) values(2);
insert into temp4(id) values(3);
insert into temp4(id) values(4);
insert into temp4(id) values(5);
insert into temp4(id) values(6);
insert into temp4(id) values(7);
insert into temp4(id) values(8);
insert into temp4(id) values(9);
insert into temp4(id) values(10);
commit;

select * from temp4;
select * from temp5;

--temp4에 있는 대량의 데이터를 temp5에 넣고 싶어요
insert into temp5(num) 
select id from temp4;

select * from temp5;

--2. 대량 데이터 삽입하기
--데이터를 담을 테이블이 없고 .... >> 테이블 구조(복제):스키마

create table copyemp
as
  select * from emp;
  
select * from copyemp;

create table copyemp2
as
  select empno, ename from emp
  where deptno = 20;
  
select * from copyemp2;

--테이블의 구조 복제 (데이터 필요 없음)

create table copyemp3
as
  select * from emp where 1=2;
  
select * from copyemp3;

commit;
--------------------------------------------------------------------------------
--insert end--

--update

/*
update 테이블명
set 컬럼명 = 값, 컬럼명 = 값 ......
where 조건절
*/

select * from copyemp;

update copyemp
set sal = 0;

select * from copyemp;

rollback;

select * from copyemp;

update copyemp
set sal = 5555
where deptno = 20;

select * from copyemp;
commit;

update copyemp
set sal = (select sum(sal) from emp);

select * from copyemp;

commit;

update copyemp
set ename = 'AAA', job = 'BBB', hiredate = sysdate, sal=(select max(sal) from emp)
where empno = 7788;

select * from copyemp;

commit;
--------------------------------------------------------------------------------
--update end--

--delete
delete from copyemp;

select * from copyemp;

rollback;

delete from copyemp
where deptno = 10;

select * from copyemp;

commit;
--------------------------------------------------------------------------------
-----DELETE END-----------------------------------------------------------------
--------------------------------------------------------------------------------

--오라클 pdf (138page)
--테이블 생성하기

--KOSA 계정 볼 수 있는 ...
select * from tab;
select * from tab where lower(tname) = 'emp';

create table board (
    boardid number, 
    title varchar2(50), --50byte
    content nvarchar2(2000), --2000자 (4000byte)
    regdate date
);

desc board;

--Tip)
select * from user_tables where table_name = 'EMP';
select * from col where lower(tname) = 'emp';
-- 제약 확인
select * from user_constraints where table_name = 'EMP';

/*
number
char(10) 고정길이
varchar2(10) 가변길이
nvarchar 2byte (한글 영문자 고민하지않고 개수)
*/

--oracle 11g 가상컬럼(조합컬럼)
--학생 성적 테이블
--이름, 국어, 영어, 수학 (원칙)
--총점, 평균 (추가한다 .. 조회 매번 한다)
--관리 : 만약 어떤 학생 수학 변경 > 총점 평균도 변경해야함

create table vtable(
    no1 number,
    no2 number,
    no3 number GENERATED ALWAYS as (no1 + no2) VIRTUAL
);

select * from col where lower(tname) = 'vtable';

insert into vtable(no1, no2) values(100, 200);

select * from vtable;

update vtable
set no1 = 500;

select * from vtable;

commit;



--실무에서 활용되는 코드
-- 제품정보 (입고) : 분기별 데이터 추출(4분기)
create table vtable2(
   no number, --순번
   p_code char(4), --제품코드 (A001 , B003)
   p_date char(8), --입고일 (20230101)
   p_qty number, --수량
   p_bungi number(1) GENERATED ALWAYS as (
                                            case when substr(p_date,5,2) in ('01','02','03') then 1
                                                 when substr(p_date,5,2) in ('04','05','06') then 2
                                                 when substr(p_date,5,2) in ('07','08','09') then 3
                                                 else 4
                                            end 
                                         ) VIRTUAL
);
select * from col where lower(tname)= 'vtable2';

insert into vtable2(p_date) values('20220101');
insert into vtable2(p_date) values('20220522');
insert into vtable2(p_date) values('20220601');
insert into vtable2(p_date) values('20221111');
insert into vtable2(p_date) values('20221201');
commit;

select * from vtable2 where p_bungi = 2;

select * from vtable2;
--------------------------------------------------------------------------------
--테이블 만들고 수정 삭제
--1. 테이블 생성하기
create table temp6(id number);
desc temp6;

--2. 테이블 생성 후에 컬럼 추가하기
alter table temp6
add ename varchar2(20);

desc temp6;

--3. 기존 테이블에 있는 컬럼이름 잘못 표기 (ename -> username)
alter table temp6
rename column ename to username;

desc temp6;

--4. 기존 테이블에 있는 기존 컬럼의 타입 크기 수정(modify)
alter table temp6
modify (username varchar2(2000));

desc temp6;

--5. 기존 테이블에 있는 기존 컬럼의 삭제
alter table temp6
drop column username;

desc temp6;

--6. 테이블 전체가 필요 없어요
--6.1 delete from emp >> 데이터만 삭제
/*
테이블 처음 만들면 크기  설정 >> 데이터 넣으면 >> 데이터 크기만큼 테이블 크기 증가
처응 1M >> 10만건 >> 100M >> delete 10만건 삭제 >> 테이블 크기 >> 100M

테이블 데이터 삭제 ..공간의 크기도 처음으로..
truncate (where절 사용 못해요)
처음 1M >> 10만건 >> 100M >> truncate >> 테이블의 크기 >> 1M
DBA truncate table emp;
*/

--6
drop table temp6;

desc temp6; --ORA-04043: temp6 객체가 존재하지 않습니다.
--------------------------------------------------------------------------------

/*
데이터 무결성 제약 조건의 종류 
제 약 조 건 
설     명 
PRIMARY KEY(PK) 유일하게 테이블의 각행을 식별(NOT NULL과 UNIQUE조건을 만족) 
FOREIGN KEY(FK) 열과 참조된 열 사이의 외래키 관계를 적용하고 설정합니다. 
UNIQUE key(UK) 
테이블의 모든 행을 유일하게 하는 값을 가진 열(NULL을 허용) 
NOT NULL(NN) 
열은 NULL값을 포함할 수 없습니다. 
CHECK(CK) 
참이어야 하는 조건을 지정함(대부분 업무 규칙을 설정)
index(성능) 검색 ...... 관리 필요 ..
*/

--제약 만드는 시점
--1. create table 생성시
--2. create table 생성후에 ..... 필요에 추가 (alter table add constraint

select * from user_constraints where table_name = 'EMP';

create table temp7(
    --id number primary key 권장하지 않아요 (제약이름 오라클 서버 임의의 ...) 약식
    id number constraint pk_temp7_id primary key, 
    name varchar2(20) not null,
    addr varchar2(50)
);

select * from user_constraints where table_name = 'TEMP7';

insert into temp7(id, name, addr) values(1, '홍길동', '강남구');

insert into temp7(id, name, addr) values(1, '중복이', '강남구'); --ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated

insert into temp7(name, addr) values('중복이', '강남구'); --ORA-01400: cannot insert NULL into ("KOSA"."TEMP7"."ID")

select * from temp7;
commit;

--------------------------------------------------------------------------------
--UNIQUE key (UK)
--테이블에 컬럼 수만큼 제약걸 수 있어요
--null 허용

create table temp8 (
    id number constraint pk_temp8_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique,
    addr varchar2(50)
);

--------------------------------------------------------------------------------
--테이블 생성 후에 제약 걸기(추천)
create table temp9(id number);

--기존 테이블에 제약 추가하기
alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where table_name = 'TEMP9';

--복합키 ....
create table temp10 (id number, num number);

alter table temp10
add constraint pk_temp10_id_num primary key(id, num);

select * from user_constraints where table_name = 'TEMP10';
--유일한 한개의 row : where id = 10 and num = 1

desc temp9;

alter table temp9
add ename varchar2(50);

--ename 컬럼은 not null
alter table temp9
modify(ename not null);

desc temp9;

--------------------------------------------------------------------------------
--check 제약(업무 룰 : where 조건을 제약처럼)
--where gender in('남','여') 규칙을 만들어서 적용 (제약)


create table temp11(
    id number constraint pk_temp11_id primary key,
    name varchar2(20) not null,
    jumin char(6) not null constraint uk_temp11_jumin unique,
    addr varchar2(30),
    age number constraint ck_temp11_age check(age >= 19)
);

select * from user_constraints where lower(table_name) = 'temp11';

insert into temp11(id, name, jumin, addr, age)
values(100, '야무지개', '123456', '서울시 강남구', 18);
--ORA-02290: check constraint (KOSA.CK_TEMP11_AGE) violated

insert into temp11(id, name, jumin, addr, age)
values(100, '야무지개', '123456', '서울시 강남구', 20);

select * from temp11;

commit;
--------------------------------------------------------------------------------
--FOREIGN KEY (FK)
--참조제약 (테이블과 테이블 사이의 관계 설정)
select * from emp;
select * from dept;
--------------------------------------------------------------------------------
create table c_emp
as
  select empno, ename, deptno from emp where 1=2;
  
desc c_emp;

create table c_dept
as
  select deptno, dname from dept where 1 = 2;
  
desc c_dept;

select * from c_emp;
select * from c_dept;

--c_dept > deptno(pk)
alter table c_dept
add constraint pk_c_dept_deptno primary key(deptno);

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno);

select * from user_constraints where table_name = 'C_DEPT';
select * from user_constraints where table_name = 'C_EMP';

--부서
insert into c_dept(deptno, dname) values(100, '인사팀');
insert into c_dept(deptno, dname) values(200, '관사팀');
insert into c_dept(deptno, dname) values(300, '회계팀');

commit;

insert into c_emp(empno, ename, deptno)
values(9999, '신입이', 10);

insert into c_emp(empno, ename, deptno)
values(9999, '신입이', 100);

commit;
select * from c_emp;
--------------------------------------------------------------------------------

select * from c_emp;
select * from c_dept;

--제약 삭제하기
alter table c_emp
drop constraint fk_c_emp_deptno;

alter table c_emp
add constraint fk_c_emp_deptno foreign key(deptno) references c_dept(deptno)
on delete cascade;

select * from user_constraints where table_name = 'C_EMP';

delete from c_dept where deptno = 100;

select * from c_emp;

commit;
--------------------------------------------------------------------------------
--초중급 과정 END-------------------------------------------------------------------

--영문테이블 , 영문 컬럼명
--[학생 성적 테이블]
--학번의 데이터는 중복되거나 NULL 값을 허용하면 안된다
--이름 NULL 값을 허용하지 않는다
--국어
--영어
--수학 점수 컬럼은 숫자 타입이고 NULL 값을 허용
--값을 입력하지 않으면 default로 0값을 갖는다
--총점 ,평균 컬럼은 가상컬럼으로(조합컬럼) 생성한다
--학과코드는 학과 테이블에 학과코드를 참조한다
--학번 , 이름 , 국어 , 영어 , 수학 , 총점 , 평균 , 학과코드
create table students(
    s_no number,
    s_name varchar(20) not null,
    kor_p number default 0,
    eng_p number default 0,
    math_p number default 0,
    sum_p number GENERATED ALWAYS as (kor_p + eng_p + math_p) VIRTUAL,
    avg_p number GENERATED ALWAYS as (trunc((kor_p + eng_p + math_p)/3)) VIRTUAL,
    d_no number not null
);

alter table students
add constraint pk_students_s_no primary key(s_no);
?
--학과 테이블
--학과코드 데이터는 중복되거나 NULL 값을 허용하면 안된다,
--학과명 은 null값을 허락하지 않는다
--학과코드 , 학과명
create table departments(
    d_no number,
    d_name varchar(20) not null
);

alter table departments
add constraint pk_departments_d_no primary key(d_no);

alter table students
add constraint fk_students_d_no foreign key(d_no) references departments(d_no);

--샘플 데이터 insert ..
insert into departments(d_no, d_name)
values(1, '경제');
insert into departments(d_no, d_name)
values(2, '경영');
insert into departments(d_no, d_name)
values(3, '컴퓨터');
insert into departments(d_no, d_name)
values(4, '기계');

insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(1, '홍길동', 50, 60, 70, 1);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(2, '김길동', 10, 20, 30, 1);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(3, '최길동', 90, 80, 70, 2);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(4, '공길동', 50, 60, 70, 2);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(5, '곽길동', 20, 40, 60, 3);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(6, '양길동', 10, 30, 50, 3);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(7, '조길동', 50, 60, 70, 4);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(8, '이길동', 40, 60, 80, 4);

--그리고 select 결과는
--학번 , 이름 , 총점, 평균 , 학과코드 , 학과명 을 출력하세요
select s_no as 학번, s_name as 이름, sum_p as 총점, avg_p as 평균, s.d_no as 학과코드, d.d_name as 학과명
from students s join departments d on s.d_no = d.d_no;


----------------------------정규식 과제-------------------------------------------
create table client(
    password varchar2(20) not null
);

insert into client(password) values ('ghdrlfehd');
insert into client(password) values ('dkendlsh!');
insert into client(password) values ('roffjrtl123');
insert into client(password) values ('dkdlvhs123!');
insert into client(password) values ('Gytjd123!');
insert into client(password) values ('!321Xhdlr');
insert into client(password) values ('!2a');

commit;

select * from client;

-- 알파벳, 숫자, 특수문자 모두 포함하는 6자리 이상의 비밀번호 출력
select password
from client
where regexp_like(password, '[a-zA-Z]') --알파벳 포함하는지 검사
  and regexp_like(password, '[0-9]') --숫자 포함하는지 검사
  and regexp_like(password, '[^a-zA-Z0-9]') --특수문자 포함하는지 검사
  and length(password) >= 6; --6자리 이상인지 검사

--아래처럼 정규식 한번에 몰아넣으면 인식이 안되서 위처럼 분리함
--select password
--from client
--where regexp_like(password, '^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,}$');

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--View 
--오라클.pdf  (192page)
--가상 테이블 (subquery -> from () -> in line view -> join -> 필요할때마다 만들어서 ...)
--필요한 가상테이블을 객체형태로 만들어서 사용하자 (영속적으로)
--view sql문장을 가지고 있는 객체 
--view 사용하는 데 편하게 >> 테이블 처럼 ...사용 
--혹자는  view sql 문장 덩어리 ....


/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY]

OR REPLACE                 이미 존재한다면 다시 생성한다.
FORCE                      Base Table  유무에 관계없이 VIEW 을 만든다.
NOFORCE                    기본 테이블이 존재할 경우에만 VIEW 를 생성한다.
view_name VIEW 의 이름
Alias Subquery 를 통해 선택된 값에 대한 Column 명이 된다.
Subquery                    SELECT 문장을 기술한다.
WITH CHECK OPTION           VIEW    에 의해 액세스 될 수 있는 행만이 입력,갱신될 수 있다. 
Constraint CHECK OPTON 제약 조건에 대해 지정된 이름이다.
WITH READ ONLY 이 VIEW 에서 DML 이 수행될 수 없게 한다.

*/

create view view001
as
  select * from emp;

-- SYSTEM PRIVILEGES
--GRANT CREATE ANY VIEW TO "KOSA" WITH ADMIN OPTION;

--view001 는 테이블과 똑같은 방법으로 사용가능

select * from view001;
--사실은 view001 가지고 있는 문장이 실행 (결과)

select * from view001 where empno=7788;

/*
view 가상 테이블 
사용법: 일반 테이블과 동일 (뷰을 통해서 ....select , insert , update , delete  ...실 테이블 데이터)
단 view 볼수 있는 데이터만 가능 

view 통해서 DML 작업 가능 (실제로는 하지 마세요) 

조회 (편하게).....

view 목적
1. 개발자의 편리성 : join 처리시 테이블이 없다면 .. subquery(in line view) .... view 객체를 만들어 두고 ...재사용
2. 쿼리 단순화 :view 를 통해서 가상 테이블 .... join 시 view 사용
3. DBA  보안 : 원본 테이블 노출하지 않고 view 만들어서 특정 컬럼의 데이터만 노출 ...
*/

create or replace view v_001
as
  select empno , ename from emp;
  
  
select * from v_001;

create or replace view v_002
as
  select empno , ename , job , hiredate from emp;
  
select * from v_002;  

--select sal from v_002;  --sal  컬럼은  view 볼 수 없어요

--편리성 (자주 사용 쿼리)
create or replace view v_002
as
  select e.empno , e.ename , e.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;
  
 
select * from v_002 where empno=7788;

select * from v_002;
------------------------------------------------------------------------------------
--실무에서 가장 많이 쓰이는 쿼리( 중급 )
 --1. hint) join
 --2. hint) 부서의 평균을 담고 있는 테이블 있다면 .... (가상테이블)
 
 --자기 부서의 평균 월급보다 더 많은 월급을 받는 사원의 사번 , 이름 , 부서번호 , 부서별 평균월급을 출력하세요
 
  select *
  from emp e join (select deptno , trunc(avg(sal)) as avgsal from emp group by deptno) s
  on e.deptno = s.deptno
  where e.sal > s.avgsal;
 -------------------------------------------------------------------------------------------- 

--직종별 평균 급여를 담고 있는 view 
create view v_003
as
  select deptno , trunc(avg(sal)) as avgsal 
  from emp 
  group by deptno;
  

  select *
  from emp e join v_003 s
  on e.deptno = s.deptno   --편하구나 ... 
  where e.sal > s.avgsal;
  
  /*
  view  나도 나름 테이블이다 .... from ....
  view 를 통해서 view 가 볼수있는 데이터 .....
  DML  가능 하다 (insert , update , delete)
  */
  
 select * from copyemp; 
  
 create or replace view v_emp
 as
   select empno , ename , job , hiredate , sal from copyemp;
   

update v_emp
set sal=0;

select * from copyemp;
select * from v_emp;

rollback;

update v_emp
set comm = 0; --view 가 볼수 없는 데이터 


-- 30번 부서 사원들의  직종, 이름, 월급을 담는 VIEW를 만드는데,
-- 각각의 컬럼명을 직종, 사원이름, 월급으로 ALIAS를 주고 월급이
-- 300보다 많은 사원들만 추출하도록 하라.  view101
create or replace view view101
as
  select job , ename, sal
  from emp
  where deptno=30 and sal > 300;

--view 통해서 DML 작업 ...... 단일 테이블 view .....

--부서별 평균월급을 담는 VIEW를 만들되, 평균월급이 2000 이상인
--부서만 출력하도록 하라.  view102
create view view102
as
    select deptno , avg(sal) as avgsal
    from emp
    group by deptno
    having avg(sal) >= 2000;
    
select * from view102;
--------------------------------------------------------------------------------
--개발자 관점에서 바라보는  SQL----------------------------------------------------
--제11장 SEQUENCE  (오라클.pdf ... 185page )
/*
CREATE  SEQUENCE  sequence_name 
[INCREMENT  BY  n] 
[START  WITH  n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}]; 

sequence_name           SEQUENCE 의 이름입니다.
INCREMENT BY            n 정수 값인 n 으로 SEQUENCE 번호 사이의 간격을 지정.
                        이 절이 생략되면 SEQUENCE 는 1 씩 증가.
START WITH             n 생성하기 위해 첫번째 SEQUENCE 를 지정.
                        이 절이 생략되면 SEQUENCE 는 1 로 시작.
MAXVALUE n SEQUENCE 를 생성할 수 있는 최대 값을 지정.
NOMAXVALUE 오름차순용 10^27 최대값과 내림차순용-1 의 최소값을 지정.
MINVALUE n 최소 SEQUENCE 값을 지정.
NOMINVALUE 오름차순용 1 과 내림차순용-(10^26)의 최소값을 지정.
CYCLE | NOCYCLE 최대 또는 최소값에 도달한 후에 계속 값을 생성할 지의 여부를
지정. NOCYCLE 이 디폴트.
CACHE | NOCACHE 얼마나 많은 값이 메모리에 오라클 서버가 미리 할당하고 유지
하는가를 지정. 디폴트로 오라클 서버는 20 을 CACHE

*/
desc board;
drop table board;

create table board(
    boardid number constraint pk_board_boardid primary key, --not null , unique , index 설정
    title nvarchar2(50)
);

select * from user_constraints where table_name ='BOARD';

insert into board(boardid, title) values(1,'1번글');
insert into board(boardid, title) values(2,'2번글');

select * from board;
rollback;
--규칙 : 글번호 처음글이면 1 ..... 다음 글이면 2 ....3 ....4
select * from board;

--1. 
select count(*) + 1 from board;

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'1번글');

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'2번글');

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'3번글');

select * from board;

--글 삭제
delete from board where boardid=1;

insert into board(boardid, title) 
values((select count(*) + 1 from board),'4번글');

--기존 글번와 충돌 (boardid pk)
rollback;
---------------------------------------------------------------------------------
--순번을 만드는데 데이터가 삭제되어도 순번을 유지하고 싶어요
--1. 1번 ... 다음글  1+1 , 2+1 ....

select nvl(max(boardid),0) + 1 from board; --값이 없으면 null 반환

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '1번글');

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '2번글');

select * from board;

delete from board where boardid=1;

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '3번글');

select * from board;
--------------------------------------------------------------------------------
--채번하면 .... table 종속적이다 
--------------------------------------------------------------------------------
--채번 (객체) >> static 처럼 >> 모든 테이블이 공유

create sequence board_num;

--1. 채번하기
select board_num.nextval from dual; --채번 (번호표 뽑기)

--2. 채번확인하기
select board_num.currval from dual; --현재까지 채번한 번호 확인(마지막)

--board_num 공유객체 : 하나의 테이블에서만 사용하는 것이 아니고 여러개의 테이블에 사용가능

/*
A테이블        B테이블      C테이블
1             3             4
2             6
5             

*/
create table kboard (
    num number constraint pk_kboard_num primary key,
    title varchar2(20)
);



select * from board;
insert into board(boardid,title)
values(board_num.nextval,'4번글');

select * from board;



insert into kboard(num,title)
values(board_num.nextval,'1번글');

select * from kboard;
commit;
--------------------------------------------------------------------------------
/*
게시판
공지사항, 자유게시판, 답변형게시판 등
1        3          4   
2
시퀀스 객체 한개


공지사항, 자유게시판, 답변형게시판 등
1        1          1

시퀀스 객체 3개

sequence 객체 (DB 소프트웨어)
오라클 (0)
my-sql (x)
mariadb (0)
postgreSQL (0)

순번)
ms-sql
create table board(boardnum int identity(1,1) ....) >> 테이블 종속
insert into board(title) values('방가');

my-sql
create table board(boardnum int auto-increment, ....) >>  테이블 종속
insert into board(title) values('방가');

*/
--옵션
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;

select seq_num.currval from dual;

--------------------------------------------------------------------------------
--개발자 쿼리--
--rownum
/*
게시판 1...... 100번글

최신글 ... 마지막 글 
select boardid, title , content from board order by boardid desc

.....글 ... 10000건

1~102번
pagesize : 10 건
page 개수 : 11개

[1][2][3][4][5][6][7][8][9][10][11]

[1] 1~10
[2] 11~20
[3] 21~30
*/

select rownum, e.*
from (
        select empno, ename, sal
        from emp
        order by sal desc --기준 데이터 만들기
     )e; --순번을 붙인다

--Top-n 쿼리 (기준이 되는 데이터 순으로 정렬시키고 상위 n개 가지고 오기)
--ms-sql : select top 10, * from emp order by sal desc;

--Top-n 오라클(x)
--rownum 순번 부여 상위 n 조건을 만들어서
--1. 정렬 기준을 만들어라(선행)
--2. 정렬된 기준에 rownum 붙이고 데이터 추출

--급여를 많이 받는 사원 5명
--1. 기준 데이터
--2. 순번 부여하기
--3. 조건 걸어서 가져오기

select *
from(
    select rownum as num, e.empno, e.sal
    from(
        select empno, sal
        from emp
        order by sal desc
    ) e
) n where num <=5; -- 대용량 데이터 페이지 처리 원리 (POINT)

--12c 버전-- 에서 top 쿼리
select empno, sal
from emp
order by sal, empno fetch first 5 rows only;

--------------------------------------------------------------------------------
/*
데이터 10만건, 20만건
select * from board;
데이터를 나누어서 가지고 와야 합니다
totaldatacount = 104건 
pagesize = 10
pagecount = 11개 페이지

[1][2][3][4][5][6][7][8][9][10][11]
<a href = "page.do?pageno=1">1번</a> --> 서버 전송 --> select ... between 1 and 10 10건

1. rownum ... 조건처리
2. rownum ... between A and B
*/

--HR 계정이동
show user;

select * from employees;
--107건
--pagesize = 10
--[1] > 1~10
--...
--[5] > 11~20
--------------------------------------------------------------------------------

--1. 기준 데이터 만들기 (정렬)
--요구사항 (사번이 낮은 순)

select * from employees order by employee_id asc;


--2. 기준 데이터 순번 부여하기

select rownum as num, e.*
from (
        select *
        from employees
        order by employee_id asc
     )e
where rownum <= 50; --정렬된 데이터에 내부적으로 생성된 rownum
     
--3. 최종 데이터 추출

select *
from(
    select rownum as num, e.*
    from (
        select *
        from employees
        order by employee_id asc
     )e
    where rownum <= 50
)n where num >= 41;

select *
from(
    select rownum as num, e.*
    from (
        select *
        from employees
        order by employee_id asc
     )e
)n where num between 40 and 50;

--------------------------------------------------------------------------------
--조금씩 .. 분석함수, 통계처리, 다차원함수 등등 ....
--------------------------------------------------------------------------------

--JDBC 실습쿼리 
create table dmlemp
as
    select * from emp;

select * from dmlemp;    

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);

select * from user_constraints where table_name = 'DMLEMP';

select * from dmlemp;

commit;



