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















