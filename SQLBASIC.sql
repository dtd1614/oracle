/*
1. ����Ŭ ����Ʈ���� �ٿ�ε�
https://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html

2. Oracle Database 11g Release 2 Express Edition for Windows 64 (���ἳġ)

3. Oracle ��ġ(SYS, SYSTEM ������ ���� ��ȣ : 1004)

4.Sqlplus ���α׷� ����(CMD) : GUI ȯ�� �Ϲݰ����� ��� ����

5.������ Tool ��ġ ����(SqlDeveloper , https://dbeaver.io/)  ,
                 ����(��� , ������ , SqlGate) ������Ʈ�� ��ġ Ȱ�� ^^

6. SqlDeveloper ���� ���ؼ� Oracle Server ���� ....
   >> HR ���� : ��ȣ 1004 , Unlock 2���� ��밡�� .... (������� �ǽ� ���̺�)
   >> ���ο� ���� : BITUSER

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


7. ���� ���� ���� Ȯ�� : show user;   >> USER��(��) "BITUSER"�Դϴ�.


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

show user; --ctrl+ enter -- ����� ��ɹ� ����

/*
�ǽ��ڵ�

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
DB �о�
1. APP ������ (CRUD) : select, insert, update, delete, DDL(create, alter, drop)

2. ������(DBA) : ����� ����, ��Ʈ��ũ ����, �ڿ�����, �ϵ���� ����

3. Ʃ�� : SQL Ʃ��(����Ʃ��) + �ϵ����(��Ʈ��ũ) Ʃ�� 

4. �𵨷� : ���� (DOMAIN) :�䱸���� �м� (ERD)

5. ������ �м��� (���� �̻�, �ڻ��, SCI)
*/
show user;
select * from emp;
select * from dept;
select * from salgrade;
/*
����Ŭ ������ ���� ������ ����Ŭ ���� ���� �н��� �ƴϰ� ���������� �����մϴ�
*/
--������̺� ��� �����͸� ����ϼ���
select * from emp;
select * from dept;

--Ư�� �÷� ������ ���
select empno, ename, sal from emp;

select ename from emp;

--����Ī ����ϱ� (��Ī alias)
select empno ��� , ename �̸�
from emp;

select empno "�� ��" , ename "�� ��"
from emp;
/*
SQL ǥ�� ����
(ANSI)
>> Oracle, Mssql, mysql ������ query ��밡��

ANSI
*/
select empno as "�� ��" , ename as "�� ��"
from emp;

--Oracle ���� ��ҹ��� �����ϰ� ���� (A, a)
/*
JAVA : ���� 'A', ���ڿ� "AAA"
Oracle : ���ڿ� ���ڿ� ���� ���� �ʾƿ� : ���ڿ� : 'A', 'AAAA', 'ȫ�浿'
*/

desc emp; -- ����Ŭ ���̺� ���� (�÷���, null, Ÿ��)

--ENAME VARCHAR2(10) �������� ���ڿ� (�ѱ� : 5��, ������, Ư������, ���� : 10��)

select * from emp
where ename = 'KING';

/*
select ��  3
from   ��  1     1
where  ��  2
*/

-- query �� (���Ǿ�) : ���
-- ������ 

/*
JAVA   : + ������� (10 + 10), + ���տ��� ("ȫ" + "�浿")
ORACLE : + ������� (10 + 10), || ���� ���� ('ȫ' || '�浿')
MS-SQL : + ��� �Ǵ� ����
*/

select '����� �̸��� ' || ename || ' �Դϴ�' as "����̸�"
from emp;

desc emp;

--�ڵ� ����ȯ>> empno ���� Ÿ���� >> ���ڿ� Ÿ�� ����
select empno || ename from emp;

--����� .... �츮 ȸ�翡 ������ ��� �ֳ���?
-- �ߺ��� ���� Ű���� : distinct
select distinct job from emp;

-- distinct �� : grouping > ���� �̸� grouping > �ѳ� ����

select distinct job, deptno
from emp
order by job;

/*
java +, -, *, /, %
oracle +, -, *, /, % ���� >> Like '%%' �̹� ���
������ ���ϴ� �Լ� mod() ���
*/

--������̺��� ����� �޿��� 100�޷� �λ��� ����� ����ϼ���
select empno, ename, sal, sal + 100 as "100�޷� �λ� ���" from emp;


--dual �ӽ� ���̺�
select 100 + 100 from dual; --100100
select 100 || 100 from dual; --'100' ������ ����
select '100' + 100 from dual; --'100' ������ ���� 200
select 'A100' + 100 from dual; --ORA-01722: invalid number

--�񱳿�����
-- <, > ��
-- ���� : java ����(==) �Ҵ�(=), javascript ���� (==, ===)
-- oracle ����(=) �����ʴ�(!=) >> �Ҵ翬���ڴ� ���� >> plsql���� ���� (:=)

--��������
--AND, OR, NOT

select empno, ename, sal
from emp
where sal >= 2000;

--����� 7788���� ����� ���, �̸�, ����, �Ի��� ����ϼ���
select * from emp;
select empno, ename, job, hiredate
from emp
where empno = 7788;

--����� �̸��� king ����� ���, �̸�, �޿��� ����ϼ���
select empno, ename, sal
from emp
where ename = 'KING';

-- �ʰ� : �̸�
-- �̻� : ���� (=)
-- �޿��� 2000 �޶� �̻��̸鼭 ������ manger�� ����� ��� ������ ����ϼ���.
select * 
from emp
where emp.sal >= 2000 and emp.job = 'MANAGER'; --�ΰ��� ������ ��� �����ϴ� ������

-- �޿��� 2000 �޶� �̻��̰ų� ������ manger�� ����� ��� ������ ����ϼ���.
select * 
from emp
where emp.sal >= 2000 or emp.job = 'MANAGER'; --�� �߿� �ϳ��� �����ص� �ǿ�

--�޿��� 2000�޷� �ʰ��̸鼭 ������ manager�� ����� ��� ������ ����ϼ���
select * 
from emp
where emp.sal > 2000 and emp.job = 'MANAGER';

--��¥(������¥(DB))
--sysdate
select sysdate from dual;

-- ���� ���� ������ ���ؼ� formate ����
alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';
select sysdate from dual;

select * from nls_session_parameters; --ȯ�漳��
/*
NLS_LANGUAGE	KOREAN
NLS_DATE_FORMAT	YYYY-MM-DD HH24:MI:SS
NLS_DATE_LANGUAGE	KOREAN
NLS_TIME_FORMAT	HH24:MI:SSXFF

������ ���� ������ ��� ��¥ ����
���� > ȥ�漳�� > �����ͺ��̽�Ȯ�� > NLS > ��¥���� �ٲٰ� ����
*/

select * from emp;

-- ��¥ �˻� > ���ڿ� ������ ���� �˻�
-- '��¥����' �˻�

--1980�� 12�� 17�� �Ի��� ����� ��� ������ ����ϼ���
select * from emp where hiredate='1980-12-17'; --(0)
select * from emp where hiredate='1980/12/17'; --(0)
select * from emp where hiredate='1980.12.17'; --(0)

select * from emp where hiredate='80-12-17'; --���⸦ �������� �ʴ� ���� ���� �ȵ�

--����� �޿��� 2000�޷� �̻��̰� 4000������ ����� ��� ������ ����ϼ���.
select *
from emp
where sal between 2000 and 4000; -- (=)�� ����

--����� �޿��� 2000�޷� �ʰ� 4000�̸��� ����� ��� ������ ����ϼ���.
select *
from emp
where sal > 2000 and sal < 4000;

--�μ���ȣ�� 10�� �Ǵ� 20�� �Ǵ� 30���� ����� ���, �̸�, �޿�, �μ���ȣ�� ����ϼ���
select *
from emp
where deptno = 10 or deptno = 20 or deptno = 30;

--IN ������
select *
from emp
where deptno in(10, 20, 30);

-- �μ� ��ȣ�� 10�� �Ǵ� 20���� �ƴ� ����� ���,�̸�,�޿�,�μ���ȣ�� ����ϼ���
select *
from emp
where deptno != 10 and deptno != 20;

--������ Ǯ� �� �� �´� ���� ã���ÿ�
select *
from emp
where deptno not in(10, 20); --  not in�� ������ and

/*
1. deptno != 10 or deptno != 20;
2. deptno != 10 and deptno != 20;
*/

/*
Today Point
null�� ���� �̾߱�
1. ���� ����
2. �ʿ��

�ذ� .... : �Լ� nvl() nvl2()
�ذ� .... : is null, is not null

create table member(
    userid varchar2(20) not null, --�ʼ��Է»���
    name varchar2(20) not null,   --�ʼ��Է»���
    hobby varchar2(50)            --default null ���
)
insert into member(userid, name) values('kglim', '�浿');
hobyy null�� �Էµǿ�
*/

--����(comm)�� ���� �ʴ� ��� ����� ������ ����ϼ���
--�ǽ������� 0�̶�� ������ �޴� ������ �����ϰ� Ǯ��
select *
from emp
where comm is null;

--���� �޴� ��� ��� ���� ���
select *
from emp
where comm is not null;

--������̺��� ���, �̸�, �޿�, ����, �ѱ޿�(�޿� + ����)�� ����ϼ���
select empno, ename, sal, comm, sal + comm as "�� �޿�"
from emp;

select empno, ename, sal, comm, sal + nvl(comm, 0) as "�� �޿�"
from emp;
/*
null�̶�� �༮ ....
1. null���� ��� ������ ����� null ex) null + 100, null * 100 >> null
2. null�� ��ü�Ҽ��ִ� �Լ� : nvl()

nvl(�÷���, ��ü��) >> ġȯ

mysql : null > IFNULL()
ms-sql : null > Convert()

���� : null
1. �ʿ�� (not null, null)
2. �� is null, is not null
3. ���� nvl()
*/
select 1000 + null from dual;
select 1000 + nvl(null, 0) from dual;
select comm, nvl(comm, 10000) from emp;
select nvl(null, 'hello world') from dual;

--����� �޿��� 1000�޷� �̻��̰� ������ �����ʴ� ����� ���,�̸�,����,������ ����Ͻÿ�
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

--���ڿ� �˻�
--�ּҰ˻� >> ���� >> ���� �ܾ ���Ե� ��� �ּ� ....
--Like ���ڿ� ���� �˻�
--���ϵ� ī�� ���� (%(����), _(�ѹ���))

--����ǥ���� �˻�(regexp_like(ename, '[A-C]'))

select *
from emp
where ename like '%A%'; --A ��������� �ǿ�

select *
from emp
where ename like 'A%'; --A�� ���۵Ǵ� �̸�

select *
from emp
where ename like '%A'; --A�� ������ �̸�

select *
from emp
where ename like '%LL%';


select *
from emp
where ename like '%A%A%'; --A�� 2���� �� ã�ƶ�

select *
from emp
where ename like '_A%'; -- _���� �ι�° ���۱��ڰ� A

--������ �����ϱ�
--order by �÷��� : ����, ����, ��¥ ����
--�������� : asc : ���� �� : default
--�������� : desc : ���� �� : order by sal desc
--����� ���� ��� �۾� : ����(�˰���) > cost ���� 

select *
from emp
order by sal; --default asc

select *
from emp
order by sal desc;

--�Ի����� ���� ���� ������ �����ؼ� ���, �̸�, �޿�, �Ի����� ����ϼ���
--���� �ֱٿ� �Ի��� ������
select *
from emp
order by hiredate desc;

/*
select    3
from      1
where     2
order by  4 (select ����� ����)
*/

--
select empno, ename, sal, job, hiredate
from emp
where job = 'MANAGER'
order by hiredate desc;
---------------------------------------------------------------------------------------------
show user;
/*
1. Linux : wsl �Ǵ� vm Linux ��ġ : jdk, tomcat, index.html, war(jar) ����, ���� ���� (�����) putty
1.1. ��ɾ� : vim ��Ʈ��ũ, ������ ����
1.2 ����ȭ : ���� ����ȭ

2. bootstrap ����ϱ� (������ template) > ������ �� �ִ�
*/

select sysdate from dual;

alter session set nls_date_format='YYYY-MM-DD HH24:MI:SS';

select sysdate from dual;

select job, deptno
from emp
order by job asc, deptno desc;
--1. job asc group ������
--2. group �ȿ��� �ٽ� deptno ū ������ ����

--������
--������, ������, ������.....

--������(union) : ���̺�� ���̺��� �����͸� ��ġ�� �� (�ߺ��� ����)
--������(union all) : ���̺�� ���̺��� �����͸� ��ġ�� ��(�ߺ��� ����)

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

--�ǽ����̺�
select * from uta;
select * from ut;

select * from uta
union
select * from ut;
--�ߺ� ������ ����(uta ���� ut�� �ı����� ������ ������)

select * from uta
union all
select * from ut;
--�ߺ� �����͸� �������� �ʾƿ�


--union ��Ģ
--1. �����Ǵ� �÷��� Ÿ���� ����

select empno, ename from emp --����, ���ڿ�
union
select dname, deptno from dept; --���ڿ�, ����

select empno, ename from emp --����, ���ڿ�
union
select deptno, dname from dept; --����, ���ڿ�

--����....... ����......... ���� ���̺� subquery >> from () �������� >> in line view (POINT)
select *
from (
    select empno, ename from emp 
    union
    select deptno, dname from dept
)m
order by m.empno desc;

--2. [����]�Ǵ� [�÷��� ����] ���� >> null�� ���� ���絵 ��
select empno, ename, job, sal from emp 
union
select deptno, dname, loc, null from dept; 
--������ �����ͷ� ���� ���絵 ��
select empno, ename, job, sal, 100 as "data" from emp
union
select deptno, dname, loc, 0, 200 as "data" from dept;
--�ʱ� ������ ����--
--���� ���̺� �⺻���� ��ȸ �۾��� ����
----------------------------------------------------------------

--����Ŭ �Լ�
--����Ŭ.pdf (48������)
/*
���� �� �Լ��� ����
1) ������ �Լ� : ���ڸ� �Է� �ް� ���ڿ� ���� �� ��θ� RETURN �� �� �ִ�.
2) ������ �Լ� : ���ڸ� �Է� �ް� ���ڸ� RETURN �Ѵ�.
3) ��¥�� �Լ� : ��¥���� ���� �����ϰ� ���ڸ� RETURN �ϴ� MONTHS_BETWEEN �Լ���
                �����ϰ� ��� ��¥ ���������� ���� RETURN �Ѵ�.
4) ��ȯ�� �Լ� : � ���������� ���� �ٸ� ������������ ��ȯ�Ѵ�.
5) �Ϲ����� �Լ� : NVL, DECODE
*/

--1. ���ڿ� �Լ�
select initcap('the super man') from dual; --The Super Man

select lower('AAA'), upper('aaa') from dual;

select ename, lower(ename) as "�ҹ���" from emp;

select * from emp where lower(ename) = 'king';

select length('abcd') from dual; -- 4��

select length ('ȫ�浿') from dual; -- 3��

select length ('ȫ�浿  .  a') from dual;

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
������̺��� ename �÷��� �����͸� ù���ڴ� �ҹ��ڷ� ������ ���ڴ� �빮�ڷ� ����ϵ� 
�ϳ��� �÷����� ���� ����Ͻð� �÷��� ��Ī�� fullname���� �ϰ� ù���ڿ� ������ ���� ���̿��� �����ϳ��� �־ ���
��) ���ݱ��� 
*/
select lower(substr(ename, 1, 1)) || ' ' || upper(substr(ename, 2)) as "fullname"
from emp;

select lpad('ABC', 10, '*') from dual;

select rpad('ABC', 10, '&') from dual;

--����� ��� hong1004 or k1234
--ȭ�� �����ȣ �ձ��� 2�ڸ� ... �������� Ư������
select lpad(substr('hong1004', 1, 2), length('hong1004'), '*') from dual;
select rpad(substr('k1234', 1, 2), length('k1234'), '*') from dual;

--emp ���̺��� ename �÷��� �����͸� ����ϴ� ù���ڸ� ����ϰ� �������� *�� ����ϼ���.
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
--��°��
100 : 123456-*******
200 : 234567-*******
select id || ' : ' || rpad(substr(jumin, 1, 7), length(jumin), '*') 
from member;

--rtrim() �Լ� ������ ���ڸ� ������
select rtrim('MILLER', 'ER') from dual;

--ltrim() �Լ� ���� ���ڸ� ������
select ltrim('MILLLLLER', 'MIL') from dual; --ER �ߺ����� ����׿� ^^

--�� ������ ��������
select '>' || rtrim('MILLER             ', ' ') || '<' from dual;

select ename, replace(ename, 'A', '�Ϳ�') from emp;

---------------------���ڿ� �Լ� END -------------------------------
--�����Լ�
-- round() (�ݿø� �Լ�)
-- trunc() (���� �Լ�)
-- mod()   ������ ���ϴ� �Լ�
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

------------------ ���� �Լ� END --------------------------

-- ��¥ �Լ� (����)
select sysdate from dual;
--POINT : ����

/*
1. Date + number >> Date
2. Date - number >> Date
3. Date - Date >> number
*/

select sysdate + 100 from dual;
select sysdate + 1000 from dual;
select sysdate - 1000 from dual;

select hiredate from emp;

--�� ��¥ ���̿� ������ ����ϴ� �Լ�

select months_between('2022-10-01', '2020-09-20') from dual;

select trunc(months_between('2022-10-01', '2020-09-20'), 0) from dual;

select trunc(months_between(sysdate, '2020-11-11'), 0) from dual; --40���� �ٹ�

-- ���� ����
select '2024-01-01' + 100 from dual; --�������ϰ� ���ڴ� ���� ���ϴ�...
--�ذ��� (������ ��¥ >> to_date())

select to_date('2024-01-01') + 100 from dual; --2024-04-10 00:00:00

--1. ���̺��� ������� �Ի��Ͽ��� ���� ��¥������ �ټ� ������ ���ϼ���
--��µǴ� �����ʹ� ���, �̸�, �Ի���, �ټӿ���
--�� �ټӿ����� ������ ���
select empno, ename, hiredate, trunc(months_between(sysdate, hiredate), 0) as "�ټӿ���"
from emp;

--2. �Ѵ��� 31���̶�� �����ϰ�... �� ���ؿ��� �ټӿ��� ���ϼ���
-- �Լ��� ������� ������(�ݿø����� ������)
select empno, ename, hiredate, trunc((sysdate - hiredate)/31, 0) as "�ټӿ���"
from emp;

----------------------------------------------------------------------------------------
--�����Լ�, �����Լ�, ��¥�Լ�
----------------------------------------------------------------------------------------

--��ȯ�Լ�(Point)
--����Ŭ ������ ���� (���ڿ�, ����, ��¥)
--to_char(), to_number(), to_date()
/*
to_char()
1. ���� -> ���ڿ� (���Ĺ���) format(100000 -> $1,000,000 >> ������� ����
2. ��¥ -> ���ڿ� format('2024-10-10' >> '2024�� 10�� 10��' >> ������� ����

to_date()
1. ���ڿ�(��¥ ����) -> ��¥(����) +, -
select to_date('2024-10-01') + 100 from dual;

to_number()
1. ���ڿ�(������ ����) ->  ����

select '100' + 100 from dual;
select to_number('100') + 100 from dual;
*/

select sysdate, to_char(sysdate, 'YYYY') || '��' as yyyy,
                to_char(sysdate, 'YEAR') as year,
                to_char(sysdate, 'MM') as MM,
                to_char(sysdate, 'DD') as DD,
                to_char(sysdate, 'DAY')
                from dual;
                
--�Ի����� 12���� ����� ���, �̸�, �Ի���, �Ի�⵵, �Ի���� ����ϼ���.                

select  to_char(hiredate, 'YYYY') as �Ի�⵵,
        to_char(hiredate, 'MM') as �Ի��
from emp
where to_char(hiredate, 'MM') = '12';


--------------------------------------------------------------------------------
show user;

select * from employees;

select employee_id, 
        first_name || ' ' || last_name as full_name, 
        to_char(hire_date, 'YYYY') as yyyy,
        to_char(hire_date, 'MM') as MM,
        to_char(salary * 12, '$999,999,999') as ����,
        to_char(salary * 12 * 1.1, '$999,999,999') as �λ󿬺�
from employees
where to_char(hire_date, 'YYYY') >= '2005'
order by �λ󿬺� desc;

select trunc((to_date(sysdate) - to_date(hire_date))/365) as �ټӿ���
from employees
order by �ټӿ��� desc;



select rpad(replace(PHONE_NUMBER, '.', '-'), 18, 0) as ��ȭ��ȣ, 
        nvl(COMMISSION_PCT, 0) as Ŀ�̼�, 
        trunc((to_date(sysdate) - to_date(hire_date))/365) as "�ٹ��Ⱓ(��)", 
        concat(EMPLOYEE_ID || FIRST_NAME, '@.com') as �̸���,
        LAST_NAME as ��, 
        FIRST_NAME as �̸�
from employees
where length(PHONE_NUMBER) = 12
order by LAST_NAME, FIRST_NAME desc;

show user;

create table t_emp
(
    id number(6), --���� 6�ڸ�
    job nvarchar2(20) --20��(20*2 > 40byte)
);

insert into t_emp(id, job) values(100, 'IT');
insert into t_emp(id, job) values(200, 'SALES');
insert into t_emp(id, job) values(300, 'MANAGER');
insert into t_emp(id) values(400);
insert into t_emp(id, job) values(500, 'MANAGER');
commit;

select * from t_emp;

select id, decode(id, 100, '����Ƽ', 
                      200, '������', 
                      300, '������', 
                      '��Ÿ�μ�') as "�μ��̸�"
from t_emp;

--------------------------------------------------------------------------------
create table t_emp2(
  id number(2),
  jumin char(7) --�������� ���ڿ�
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
t_emp2 ���̺��� id, jumin  �����͸� ����ϴµ� jumin  �÷��� ���ڸ��� 1�̸� ���� , 2�̸� ����, 3�̸� �߼� �׿ܴ� ��Ÿ ��� 
����ϴ� ������ ���弼�� (�÷����� ������ �ϼ���)
*/

select id ,  decode(substr(jumin,1,1),1,'����',
                                      2,'����',
                                      3,'�߼�',
                                      '��Ÿ'  ) as ����
from t_emp2;

/*
if(){
  if(){
     if(){
      }
   }
}
��Ģ�� if �ȿ� if���� (decode(decode()) ....

*/
/*
���빮�� : hint) if�� �ȿ� if��
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����̶�� HELLO ���� ����ϰ�
�μ���ȣ�� 20���� ����߿��� SMITH ��� �̸��� ���� ����� �ƴ϶�� WORLD ���� ����ϰ�
�μ���ȣ�� 20���� ����� �ƴ϶�� ETC ��� ���ڸ� ����ϼ���
EMP ���̺����� ....
*/

select empno , ename , deptno , decode(deptno,20,
                                                decode(ename,'SMITH','HELLO','WORLD'),
                                                'ETC')
from emp;

--CASE �� ����
/*
CASE ���ǽ� WHEN ���1 THEN ���1
           WHEN ���2 THEN ���2
           WHEN ���3 THEN ���3
           WHEN ���4 THEN ���4
           ELSE ���5
END "�÷���"           
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


select '0' || to_char(zipcode) , case zipcode when 2  then '����'
                                              when 31 then '���'
                                              when 41 then '����'
                                              else '��Ÿ����'
                                 end �����̸�              
from t_zip;

/*
��� ���̺��� ��� �޿��� 1000�޷� ���ϸ� 4��
1001�޷� 2000�޷� ���ϸ� 3��
2001�޷� 3000�޷� ���ϸ� 2��
3001�޷� 4000�޷� ���ϸ� 1��
4001�޷� �̻��̸� Ư��
*/

select case when sal <= 1000 then '4��'
            when sal between 1001 and 2000 then '3��'
            when sal between 2001 and 3000 then '2��'
            when sal between 3001 and 4000 then '1��'
            else 'Ư��'
        end "�޼�"    
            ,empno
            ,ename
from emp;           
---------------------------------------------------------------------------
--�����Լ�, �����Լ�, ��¥�Լ�, ��ȯ�Լ�(to_char..), �Ϲ��Լ�(nvl, decode, case)
--������� �⺻�Լ� END -----------------------------------------------------

--�����Լ�(����Ŭ.pdf 75page)
/*
1. count(�÷���) > �����ͰǼ�, count(*) > row ��
2. sum()
3. avg()
4. max()
5. min()
��Ÿ .........

1. �����Լ��� group by ���� ���� ���
2. ��� �����Լ��� null �� ����
3. ����) select ���� �����Լ� �̿ܿ� �ٸ� �÷��� ���� �ݵ�� �� �÷��� group by ���� ��õǾ�� �Ѵ�.
*/

select count(*) from emp; --14�� row

select count(empno) from emp; --������ �Ǽ� 14��

select count(comm) from emp; --null ���� 6��

select count(nvl(comm, 0)) from emp; --14��

--�޿��� ��
select sum(sal) as sumsal from emp; --29025
select trunc(avg(sal)) as avgsal from emp;

--����� �� ���� ������ �� ����....
select sum(comm) from emp; --4330
--�� ������ ���
select trunc(avg(nvl(comm, 0))) from emp;

select deptno, avg(sal) --3
from emp                --1 
group by deptno;        --2

--������ ��� �ݿ��� ���ϼ���
select job, avg(sal)
from emp               
group by job;        

--�μ���, ������ �޿��� ���� ���ϼ���
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

--������ ��ձݿ��� 3000�޷� �̻��� ����� ������ ��ձ޿��� ����ϼ���
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
-- HR �������� �̵�
show user;

-- 2005�� ���Ŀ� �Ի��� ��� �߿� �μ� ��ȣ�� �ְ�, �޿��� 5000~10000������ ��� �˻�
-- 2005�� 1�� 1�� ���� �Ի��� ���
-- �μ� ��ȣ�� NULL�� �ƴ� ���
-- �޿��� 5000���� ũ�ų� ����, 10000���� �۰ų� ���� ���
-- ���� ������ ��� �����ϴ� ���� �˻�
-- ���� : DEPARTMENT_ID ��������, SALARY ��������
select employee_id, last_name, hire_date, job_id, salary, department_id
from employees
where hire_date > '05/01/01' and department_id is not null and salary between 5000 and 10000
order by department_id, salary desc;

/*
2. EMPLOYEES ���̺��� �̿��Ͽ� ���� ���ǿ� �����ϴ� ���� �˻��ϼ���. 
�μ���ȣ�� �ְ�, �μ��� �ٹ� �ο����� 2�� �̻��� ���� �˻��Ͽ� �μ��� �ִ� �޿��� �ּ� �޿��� �����
�� �� ���̸� �˻��մϴ�. 
��) ���̺� : employees 
��) �˻� : department_id, MAX(salary), MIN(salary), difference 
        - MAX(salary) �� MIN(salary)�� ���̸� DIFFERENCE�� �˻� 
��) ����
    �� �μ���ȣ�� NULL�� �ƴ� ��� 
    �� �μ��� �ٹ� �ο����� 2�� �̻��� ���� j
��) �׷� : �μ���ȣ�� ���� ��
��) ���� : department_id 
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

---���� �ʱ� ���� �ʼ� ���� ---
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

--����� (equi join)
--�����̺�� �����Ǵ� ���̺� �ִ� �÷��� �����͸� 1:1 ����
--sql join (����Ŭ) ����
--ANSI ���� ���� >> inner join ~ on

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
--������ ���̺� ����
select *
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;

select m.m1, m.m2, s.s2, x.x2
from m, s, x
where m.m1 = s.s1 and s.s1 = x.x1;

--ansi ����
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
--178	Kimberely	Grant �μ��� ����
--���� ����ϰ� �;��

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

--�� (non-equi)
--�ϳ��� �÷����� ������ �ȵǿ� (�÷��� 2�� �̻� ���)
--����(� ���� ����)
select * from emp;
select * from salgrade;


select e.empno, e.ename, e.sal, s.grade
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

--------------------------------------------------------------------------------
--outer join (equi join ����ǰ� �����ִ� �����͸� �������� ���)
/*
1. �������� (������ �Ǵ� �ʿ� �����ִ� ������ �������� ���)
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
--self join (�ڱ����� : �ϳ��� ���̺��� Ư���÷��� �ٸ� �÷��� �����ϴ� ���)
--����(x) > ����� > �ǹ̸� ����

select * from emp;

select e.empno, e.ename, m.empno, m.ename
from emp e left outer join emp m on e.mgr = m.empno;

--------------------------------------------------------------------------------
select * from emp;
select * from dept;
select * from salgrade;

-- 1. ������� �̸�, �μ���ȣ, �μ��̸��� ����϶�.
select e.ename, e.deptno, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno;

-- 2. DALLAS���� �ٹ��ϴ� ����� �̸�, ����, �μ���ȣ, �μ��̸���
-- ����϶�.
select e.ename, e.job, e.deptno, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where d.loc = 'DALLAS';

-- 3. �̸��� 'A'�� ���� ������� �̸��� �μ��̸��� ����϶�.
select e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where e.ename like '%A%';

-- 4. ����̸��� �� ����� ���� �μ��� �μ���, �׸��� ������
--����ϴµ� ������ 3000�̻��� ����� ����϶�.
select e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where e.sal >= 3000;

-- 5. ����(����)�� 'SALESMAN'�� ������� ������ �� ����̸�, �׸���
-- �� ����� ���� �μ� �̸��� ����϶�.
select e.job, e.ename, d.dname
from emp e left outer join dept d
on e.deptno = d.deptno
where e.job = 'SALESMAN';

-- 6. Ŀ�̼��� å���� ������� �����ȣ, �̸�, ����, ����+Ŀ�̼�,
-- �޿������ ����ϵ�, ������ �÷����� '�����ȣ', '����̸�',
-- '����','�Ǳ޿�', '�޿����'���� �Ͽ� ����϶�.
--(�� ) 1 : 1 ���� ��� �÷��� ����
select e.empno as �����ȣ, 
       e.ename as �̸�,
       e.sal as ����,
       e.sal + nvl(e.comm, 0) �Ǳ޿�,
       s.grade �޿����
from emp e left outer join salgrade s
on e.sal between s.losal and s.hisal;

-- 7. �μ���ȣ�� 10���� ������� �μ���ȣ, �μ��̸�, ����̸�,
-- ����, �޿������ ����϶�.
select e.deptno, 
       d.dname,
       e.ename,
       e.sal,
       s.grade
from emp e left outer join dept d on e.deptno = d.deptno 
           left outer join salgrade s on e.sal between s.losal and s.hisal;

-- 8. �μ���ȣ�� 10��, 20���� ������� �μ���ȣ, �μ��̸�,
-- ����̸�, ����, �޿������ ����϶�. �׸��� �� ��µ�
-- ������� �μ���ȣ�� ���� ������, ������ ���� ������
-- �����϶�.
select e.deptno, 
       d.dname,
       e.ename,
       e.sal,
       s.grade
from emp e left outer join dept d on e.deptno = d.deptno 
           left outer join salgrade s on e.sal between s.losal and s.hisal
where e.deptno in(10, 20)
order by e.deptno, e.sal desc;

-- 9. �����ȣ�� ����̸�, �׸��� �� ����� �����ϴ� ��������
-- �����ȣ�� ����̸��� ����ϵ� ������ �÷����� '�����ȣ',
-- '����̸�', '�����ڹ�ȣ', '�������̸�'���� �Ͽ� ����϶�.
--SELF JOIN (�ڱ� �ڽ����̺��� �÷��� ���� �ϴ� ���)
select e.empno as �����ȣ, 
       e.ename as ����̸�, 
       m.empno as �����ڹ�ȣ,
       m.ename as �������̸�
from emp e left outer join emp m on e.mgr = m.empno;

--��� ���̺��� ������� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �޿��� ����ϼ���

select *
from emp
where sal > (select avg(sal) from emp);

/*
1. single row subquery : ���������� �������� �����÷��� ���� �ο��� ��� (�� ���� ��)
ex) select sum(sal) from emp; ..max(), min()
������ : =, !=, >, <
2. mutli row subquery : ���������� �������� �����÷��� ���� ���� �ο��� ��� (���߰�)
ex) select sal from emp

�������� ����
1. ��ȣ �ȿ� �־�� �Ѵ�
2. ���� �÷����� ����
3. ���� ������ �ܵ����� ���� ����

���������� ���� ���� ����
1. ���� ���� ���� ����ǰ� �� ����� ������ ���� ������ ����ȴ�.
*/

--������̺��� jones�� �޿����� �� ���� �޿��� �޴� ����� ���, �̸�, �޿��� ����ϼ���.
select sal from emp where ename = 'JONES';

select empno, ename, sal
from emp
where sal > (select sal 
             from emp 
             where ename='JONES');

--�μ� ��ȣ�� 30���� ����� ���� �޿��� �޴� ��� ��� ������ ����ϼ���
select * from emp
where sal in (select sal from emp where deptno = 30);

--�μ� ��ȣ�� 30���� ����� �ٸ� �޿��� �޴� ��� ����� ������ ����ϼ���.
select * from emp
where sal not in (select sal from emp where deptno = 30);

--���������� �ִ� ����ǻ���� �̸��� ����ϼ���.
select * from emp
where empno in (select mgr from emp);

select * from emp
where empno not in (select nvl(mgr, 0) from emp);

--king���� �����ϴ� �� ���� ����� king�� ����� ��� �̸� ���� ������ ����� ����ϼ���
select * from emp
where mgr = (select empno from emp where ename = 'KING');

--20�� �μ��� ����߿��� ���� ���� �޿��� �޴� ������� �� ���� �޿��� �޴� ����� ���, �̸� ,�޿�, �μ���ȣ�� ����ϼ���
select *
from emp
where sal > (select max(sal) from emp where deptno = 20);

--�ǹ����� ���� ���� ���̴� ����
--�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ���, �̸�, �μ���ȣ, �μ��� ��տ����� ����ϼ���
select e.empno, e.ename, e.deptno, deptavgsal.avgsal
from emp e join (select deptno, trunc(avg(sal)) as avgsal from emp group by deptno) deptavgsal on e.deptno = deptavgsal.deptno
where sal > deptavgsal.avgsal;


--1. 'SMITH'���� ������ ���� �޴� ������� �̸��� ������ ����϶�.
select ename, sal
from emp
where sal > (select sal from emp where ename = 'SMITH');
?
--2. 10�� �μ��� ������ ���� ������ �޴� ������� �̸�, ����,
-- �μ���ȣ�� ����϶�.
select ename, sal, deptno
from emp
where sal in (select sal from emp where deptno = 10);

--3. 'BLAKE'�� ���� �μ��� �ִ� ������� �̸��� ������� �̴µ�
-- 'BLAKE'�� ���� ����϶�.
select ename, hiredate
from emp
where deptno = (select deptno from emp where ename = 'BLAKE') and ename != 'BLAKE';

--4. ��ձ޿����� ���� �޿��� �޴� ������� �����ȣ, �̸�, ������
-- ����ϵ�, ������ ���� ��� ������ ����϶�.
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE SAL>(SELECT  AVG(SAL)  FROM EMP)
ORDER BY SAL DESC;

--5. �̸��� 'T'�� �����ϰ� �ִ� ������ ���� �μ����� �ٹ��ϰ�
-- �ִ� ����� �����ȣ�� �̸��� ����϶�.
SELECT EMPNO, ENAME
FROM EMP
WHERE DEPTNO IN(SELECT DEPTNO
                FROM EMP
                WHERE ENAME LIKE '%T%');
--where deptno = 20 or deptno= 30

--6. 30�� �μ��� �ִ� ����� �߿��� ���� ���� ������ �޴� �������
-- ���� ������ �޴� ������� �̸�, �μ���ȣ, ������ ����϶�.
--(��, ALL(and) �Ǵ� ANY(or) �����ڸ� ����� ��)
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

--7. 'DALLAS'���� �ٹ��ϰ� �ִ� ����� ���� �μ����� ���ϴ� �����
-- �̸�, �μ���ȣ, ������ ����϶�.
select ename, deptno, job
from emp
where 

--8. SALES �μ����� ���ϴ� ������� �μ���ȣ, �̸�, ������ ����϶�.
select e.deptno, e.ename, e.job
from emp e join dept d on e.deptno = d.deptno
where d.dname = 'SALES';

--9. 'KING'���� �����ϴ� ��� ����� �̸��� �޿��� ����϶�
--king �� ����� ��� (mgr �����Ͱ� king ���)
select ename, sal
from emp
where mgr = (select empno from emp where ename = 'KING');

--10. �ڽ��� �޿��� ��� �޿����� ����, �̸��� 'S'�� ����
-- ����� ������ �μ����� �ٹ��ϴ� ��� ����� �����ȣ, �̸�,
-- �޿��� ����϶�.
select empno, ename, sal
from emp
where sal > (select avg(sal) from emp) and
      deptno in (select deptno from emp where ename like '%S%');

--11. Ŀ�̼��� �޴� ����� �μ���ȣ, ������ ���� �����
-- �̸�, ����, �μ���ȣ�� ����϶�.
select ename, sal, deptno
from emp
where deptno in(select deptno from emp where comm is not null) and
      sal in(select sal from emp where comm is not null);

--12. 30�� �μ� ������ ���ް� Ŀ�̼��� ���� ����
--������� �̸�, ����, Ŀ�̼��� ����϶�.
select ename, sal, comm
from emp
where sal not in(select sal from emp where deptno = 30) and
      comm not in(select comm from emp where deptno = 30);
      

--------------------------------------------------------------------------------
/*
�⺻���� SQL ���

DDL (������ ���Ǿ�) : create, alter, drop, truncate ... rename, modify
DML (������ ���۾�) : insert, update, delete (Ʈ����� : transaction)
* Ʈ����� : ������ �۾� ����(��� : ���� �ƴϸ� ����)
* ���� : A ���¿��� 1000���� ����ؼ� B��� ���¿� ��ü

begin tran
    update ....
    update ....
    insert ....
end tran

�ǹ�)
�۾� ..... ȸ�� DB select �� �� ...... insert, update, delete �ȵǿ�
1. ����Ŭ ... insert, update, delete (�⺻������ trans ~ 

*/
-- DML (����Ŭ.pdf 168page)

--------------------------------------------------------------------------------
--�ڹ� ��� .... (������ �ϱ�)
--1. insert

create table temp(
    id number primary key, --not null, unique (�ֹι�ȣ....)
    name varchar2(20)
);

desc temp;
select * from tab where tname = 'TEMP';

--1. �Ϲ����� insert
insert into temp(id, name) values(100, 'ȫ�浿');

select * from temp;

commit; -- ���� �ݿ�

select * from temp;

--2. ����
insert into temp values(200, '������'); -- ���� ...
commit;

insert into temp values(200);

--3. insert �ߺ� ������
insert into temp(id, name) values(100, '����ѹ�');

--------------------------------------------------------------------------------
-- SQL ���α׷������� ��� (x)
-- PL-SQL ����, ���

create table temp2 (id varchar2(50));

--pl-sql
--BEGIN
--    FOR i IN 1..100 LOOP
--        insert into temp2(id) values('A' || to_char(i));
--    END LOOP;
--END;

select * from temp2;

create table temp3(
    memberid number(3), --3�ڸ� ����
    name varchar2(10), --default null ���'
    regdate date default sysdate --������ �⺻�� ���� (insert ���� ������ ��¥ �ڵ�)
);

desc temp3;

--1. ����
insert into temp3(memberid, name, regdate)
values(100, 'ȫ�浿', '2024-04-03');

select * from temp3;
commit;

insert into temp3(memberid, name)
values(200, '������');
commit;

insert into temp3(memberid)
values(300);

--------------------------------------------------------------------------------
-- �뷮 ������ �����ϱ�
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

--temp4�� �ִ� �뷮�� �����͸� temp5�� �ְ� �;��
insert into temp5(num) 
select id from temp4;

select * from temp5;

--2. �뷮 ������ �����ϱ�
--�����͸� ���� ���̺��� ���� .... >> ���̺� ����(����):��Ű��

create table copyemp
as
  select * from emp;
  
select * from copyemp;

create table copyemp2
as
  select empno, ename from emp
  where deptno = 20;
  
select * from copyemp2;

--���̺��� ���� ���� (������ �ʿ� ����)

create table copyemp3
as
  select * from emp where 1=2;
  
select * from copyemp3;

commit;
--------------------------------------------------------------------------------
--insert end--

--update

/*
update ���̺��
set �÷��� = ��, �÷��� = �� ......
where ������
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

--����Ŭ pdf (138page)
--���̺� �����ϱ�

--KOSA ���� �� �� �ִ� ...
select * from tab;
select * from tab where lower(tname) = 'emp';

create table board (
    boardid number, 
    title varchar2(50), --50byte
    content nvarchar2(2000), --2000�� (4000byte)
    regdate date
);

desc board;

--Tip)
select * from user_tables where table_name = 'EMP';
select * from col where lower(tname) = 'emp';
-- ���� Ȯ��
select * from user_constraints where table_name = 'EMP';

/*
number
char(10) ��������
varchar2(10) ��������
nvarchar 2byte (�ѱ� ������ ��������ʰ� ����)
*/

--oracle 11g �����÷�(�����÷�)
--�л� ���� ���̺�
--�̸�, ����, ����, ���� (��Ģ)
--����, ��� (�߰��Ѵ� .. ��ȸ �Ź� �Ѵ�)
--���� : ���� � �л� ���� ���� > ���� ��յ� �����ؾ���

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



--�ǹ����� Ȱ��Ǵ� �ڵ�
-- ��ǰ���� (�԰�) : �б⺰ ������ ����(4�б�)
create table vtable2(
   no number, --����
   p_code char(4), --��ǰ�ڵ� (A001 , B003)
   p_date char(8), --�԰��� (20230101)
   p_qty number, --����
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
--���̺� ����� ���� ����
--1. ���̺� �����ϱ�
create table temp6(id number);
desc temp6;

--2. ���̺� ���� �Ŀ� �÷� �߰��ϱ�
alter table temp6
add ename varchar2(20);

desc temp6;

--3. ���� ���̺� �ִ� �÷��̸� �߸� ǥ�� (ename -> username)
alter table temp6
rename column ename to username;

desc temp6;

--4. ���� ���̺� �ִ� ���� �÷��� Ÿ�� ũ�� ����(modify)
alter table temp6
modify (username varchar2(2000));

desc temp6;

--5. ���� ���̺� �ִ� ���� �÷��� ����
alter table temp6
drop column username;

desc temp6;

--6. ���̺� ��ü�� �ʿ� �����
--6.1 delete from emp >> �����͸� ����
/*
���̺� ó�� ����� ũ��  ���� >> ������ ������ >> ������ ũ�⸸ŭ ���̺� ũ�� ����
ó�� 1M >> 10���� >> 100M >> delete 10���� ���� >> ���̺� ũ�� >> 100M

���̺� ������ ���� ..������ ũ�⵵ ó������..
truncate (where�� ��� ���ؿ�)
ó�� 1M >> 10���� >> 100M >> truncate >> ���̺��� ũ�� >> 1M
DBA truncate table emp;
*/

--6
drop table temp6;

desc temp6; --ORA-04043: temp6 ��ü�� �������� �ʽ��ϴ�.
--------------------------------------------------------------------------------

/*
������ ���Ἲ ���� ������ ���� 
�� �� �� �� 
��     �� 
PRIMARY KEY(PK) �����ϰ� ���̺��� ������ �ĺ�(NOT NULL�� UNIQUE������ ����) 
FOREIGN KEY(FK) ���� ������ �� ������ �ܷ�Ű ���踦 �����ϰ� �����մϴ�. 
UNIQUE key(UK) 
���̺��� ��� ���� �����ϰ� �ϴ� ���� ���� ��(NULL�� ���) 
NOT NULL(NN) 
���� NULL���� ������ �� �����ϴ�. 
CHECK(CK) 
���̾�� �ϴ� ������ ������(��κ� ���� ��Ģ�� ����)
index(����) �˻� ...... ���� �ʿ� ..
*/

--���� ����� ����
--1. create table ������
--2. create table �����Ŀ� ..... �ʿ信 �߰� (alter table add constraint

select * from user_constraints where table_name = 'EMP';

create table temp7(
    --id number primary key �������� �ʾƿ� (�����̸� ����Ŭ ���� ������ ...) ���
    id number constraint pk_temp7_id primary key, 
    name varchar2(20) not null,
    addr varchar2(50)
);

select * from user_constraints where table_name = 'TEMP7';

insert into temp7(id, name, addr) values(1, 'ȫ�浿', '������');

insert into temp7(id, name, addr) values(1, '�ߺ���', '������'); --ORA-00001: unique constraint (KOSA.PK_TEMP7_ID) violated

insert into temp7(name, addr) values('�ߺ���', '������'); --ORA-01400: cannot insert NULL into ("KOSA"."TEMP7"."ID")

select * from temp7;
commit;

--------------------------------------------------------------------------------
--UNIQUE key (UK)
--���̺� �÷� ����ŭ ����� �� �־��
--null ���

create table temp8 (
    id number constraint pk_temp8_id primary key,
    name varchar2(20) not null,
    jumin nvarchar2(6) constraint uk_temp8_jumin unique,
    addr varchar2(50)
);

--------------------------------------------------------------------------------
--���̺� ���� �Ŀ� ���� �ɱ�(��õ)
create table temp9(id number);

--���� ���̺� ���� �߰��ϱ�
alter table temp9
add constraint pk_temp9_id primary key(id);

select * from user_constraints where table_name = 'TEMP9';

--����Ű ....
create table temp10 (id number, num number);

alter table temp10
add constraint pk_temp10_id_num primary key(id, num);

select * from user_constraints where table_name = 'TEMP10';
--������ �Ѱ��� row : where id = 10 and num = 1

desc temp9;

alter table temp9
add ename varchar2(50);

--ename �÷��� not null
alter table temp9
modify(ename not null);

desc temp9;

--------------------------------------------------------------------------------
--check ����(���� �� : where ������ ����ó��)
--where gender in('��','��') ��Ģ�� ���� ���� (����)


create table temp11(
    id number constraint pk_temp11_id primary key,
    name varchar2(20) not null,
    jumin char(6) not null constraint uk_temp11_jumin unique,
    addr varchar2(30),
    age number constraint ck_temp11_age check(age >= 19)
);

select * from user_constraints where lower(table_name) = 'temp11';

insert into temp11(id, name, jumin, addr, age)
values(100, '�߹�����', '123456', '����� ������', 18);
--ORA-02290: check constraint (KOSA.CK_TEMP11_AGE) violated

insert into temp11(id, name, jumin, addr, age)
values(100, '�߹�����', '123456', '����� ������', 20);

select * from temp11;

commit;
--------------------------------------------------------------------------------
--FOREIGN KEY (FK)
--�������� (���̺�� ���̺� ������ ���� ����)
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

--�μ�
insert into c_dept(deptno, dname) values(100, '�λ���');
insert into c_dept(deptno, dname) values(200, '������');
insert into c_dept(deptno, dname) values(300, 'ȸ����');

commit;

insert into c_emp(empno, ename, deptno)
values(9999, '������', 10);

insert into c_emp(empno, ename, deptno)
values(9999, '������', 100);

commit;
select * from c_emp;
--------------------------------------------------------------------------------

select * from c_emp;
select * from c_dept;

--���� �����ϱ�
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
--���߱� ���� END-------------------------------------------------------------------

--�������̺� , ���� �÷���
--[�л� ���� ���̺�]
--�й��� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�
--�̸� NULL ���� ������� �ʴ´�
--����
--����
--���� ���� �÷��� ���� Ÿ���̰� NULL ���� ���
--���� �Է����� ������ default�� 0���� ���´�
--���� ,��� �÷��� �����÷�����(�����÷�) �����Ѵ�
--�а��ڵ�� �а� ���̺� �а��ڵ带 �����Ѵ�
--�й� , �̸� , ���� , ���� , ���� , ���� , ��� , �а��ڵ�
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
--�а� ���̺�
--�а��ڵ� �����ʹ� �ߺ��ǰų� NULL ���� ����ϸ� �ȵȴ�,
--�а��� �� null���� ������� �ʴ´�
--�а��ڵ� , �а���
create table departments(
    d_no number,
    d_name varchar(20) not null
);

alter table departments
add constraint pk_departments_d_no primary key(d_no);

alter table students
add constraint fk_students_d_no foreign key(d_no) references departments(d_no);

--���� ������ insert ..
insert into departments(d_no, d_name)
values(1, '����');
insert into departments(d_no, d_name)
values(2, '�濵');
insert into departments(d_no, d_name)
values(3, '��ǻ��');
insert into departments(d_no, d_name)
values(4, '���');

insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(1, 'ȫ�浿', 50, 60, 70, 1);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(2, '��浿', 10, 20, 30, 1);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(3, '�ֱ浿', 90, 80, 70, 2);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(4, '���浿', 50, 60, 70, 2);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(5, '���浿', 20, 40, 60, 3);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(6, '��浿', 10, 30, 50, 3);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(7, '���浿', 50, 60, 70, 4);
insert into students(s_no, s_name, kor_p, eng_p, math_p, d_no)
values(8, '�̱浿', 40, 60, 80, 4);

--�׸��� select �����
--�й� , �̸� , ����, ��� , �а��ڵ� , �а��� �� ����ϼ���
select s_no as �й�, s_name as �̸�, sum_p as ����, avg_p as ���, s.d_no as �а��ڵ�, d.d_name as �а���
from students s join departments d on s.d_no = d.d_no;


----------------------------���Խ� ����-------------------------------------------
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

-- ���ĺ�, ����, Ư������ ��� �����ϴ� 6�ڸ� �̻��� ��й�ȣ ���
select password
from client
where regexp_like(password, '[a-zA-Z]') --���ĺ� �����ϴ��� �˻�
  and regexp_like(password, '[0-9]') --���� �����ϴ��� �˻�
  and regexp_like(password, '[^a-zA-Z0-9]') --Ư������ �����ϴ��� �˻�
  and length(password) >= 6; --6�ڸ� �̻����� �˻�

--�Ʒ�ó�� ���Խ� �ѹ��� ���Ƴ����� �ν��� �ȵǼ� ��ó�� �и���
--select password
--from client
--where regexp_like(password, '^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{6,}$');

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--View 
--����Ŭ.pdf  (192page)
--���� ���̺� (subquery -> from () -> in line view -> join -> �ʿ��Ҷ����� ���� ...)
--�ʿ��� �������̺��� ��ü���·� ���� ������� (����������)
--view sql������ ������ �ִ� ��ü 
--view ����ϴ� �� ���ϰ� >> ���̺� ó�� ...��� 
--Ȥ�ڴ�  view sql ���� ��� ....


/*
CREATE  [OR  REPLACE]  [FORCE | NOFORCE]  VIEW view_name [(alias[,alias,...])] 
AS Subquery  
[WITH  CHECK  OPTION  [CONSTRAINT  constraint ]] 
[WITH  READ  ONLY]

OR REPLACE                 �̹� �����Ѵٸ� �ٽ� �����Ѵ�.
FORCE                      Base Table  ������ ������� VIEW �� �����.
NOFORCE                    �⺻ ���̺��� ������ ��쿡�� VIEW �� �����Ѵ�.
view_name VIEW �� �̸�
Alias Subquery �� ���� ���õ� ���� ���� Column ���� �ȴ�.
Subquery                    SELECT ������ ����Ѵ�.
WITH CHECK OPTION           VIEW    �� ���� �׼��� �� �� �ִ� �ุ�� �Է�,���ŵ� �� �ִ�. 
Constraint CHECK OPTON ���� ���ǿ� ���� ������ �̸��̴�.
WITH READ ONLY �� VIEW ���� DML �� ����� �� ���� �Ѵ�.

*/

create view view001
as
  select * from emp;

-- SYSTEM PRIVILEGES
--GRANT CREATE ANY VIEW TO "KOSA" WITH ADMIN OPTION;

--view001 �� ���̺�� �Ȱ��� ������� ��밡��

select * from view001;
--����� view001 ������ �ִ� ������ ���� (���)

select * from view001 where empno=7788;

/*
view ���� ���̺� 
����: �Ϲ� ���̺�� ���� (���� ���ؼ� ....select , insert , update , delete  ...�� ���̺� ������)
�� view ���� �ִ� �����͸� ���� 

view ���ؼ� DML �۾� ���� (�����δ� ���� ������) 

��ȸ (���ϰ�).....

view ����
1. �������� ���� : join ó���� ���̺��� ���ٸ� .. subquery(in line view) .... view ��ü�� ����� �ΰ� ...����
2. ���� �ܼ�ȭ :view �� ���ؼ� ���� ���̺� .... join �� view ���
3. DBA  ���� : ���� ���̺� �������� �ʰ� view ���� Ư�� �÷��� �����͸� ���� ...
*/

create or replace view v_001
as
  select empno , ename from emp;
  
  
select * from v_001;

create or replace view v_002
as
  select empno , ename , job , hiredate from emp;
  
select * from v_002;  

--select sal from v_002;  --sal  �÷���  view �� �� �����

--���� (���� ��� ����)
create or replace view v_002
as
  select e.empno , e.ename , e.deptno , d.dname
  from emp e join dept d
  on e.deptno = d.deptno;
  
 
select * from v_002 where empno=7788;

select * from v_002;
------------------------------------------------------------------------------------
--�ǹ����� ���� ���� ���̴� ����( �߱� )
 --1. hint) join
 --2. hint) �μ��� ����� ��� �ִ� ���̺� �ִٸ� .... (�������̺�)
 
 --�ڱ� �μ��� ��� ���޺��� �� ���� ������ �޴� ����� ��� , �̸� , �μ���ȣ , �μ��� ��տ����� ����ϼ���
 
  select *
  from emp e join (select deptno , trunc(avg(sal)) as avgsal from emp group by deptno) s
  on e.deptno = s.deptno
  where e.sal > s.avgsal;
 -------------------------------------------------------------------------------------------- 

--������ ��� �޿��� ��� �ִ� view 
create view v_003
as
  select deptno , trunc(avg(sal)) as avgsal 
  from emp 
  group by deptno;
  

  select *
  from emp e join v_003 s
  on e.deptno = s.deptno   --���ϱ��� ... 
  where e.sal > s.avgsal;
  
  /*
  view  ���� ���� ���̺��̴� .... from ....
  view �� ���ؼ� view �� �����ִ� ������ .....
  DML  ���� �ϴ� (insert , update , delete)
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
set comm = 0; --view �� ���� ���� ������ 


-- 30�� �μ� �������  ����, �̸�, ������ ��� VIEW�� ����µ�,
-- ������ �÷����� ����, ����̸�, �������� ALIAS�� �ְ� ������
-- 300���� ���� ����鸸 �����ϵ��� �϶�.  view101
create or replace view view101
as
  select job , ename, sal
  from emp
  where deptno=30 and sal > 300;

--view ���ؼ� DML �۾� ...... ���� ���̺� view .....

--�μ��� ��տ����� ��� VIEW�� �����, ��տ����� 2000 �̻���
--�μ��� ����ϵ��� �϶�.  view102
create view view102
as
    select deptno , avg(sal) as avgsal
    from emp
    group by deptno
    having avg(sal) >= 2000;
    
select * from view102;
--------------------------------------------------------------------------------
--������ �������� �ٶ󺸴�  SQL----------------------------------------------------
--��11�� SEQUENCE  (����Ŭ.pdf ... 185page )
/*
CREATE  SEQUENCE  sequence_name 
[INCREMENT  BY  n] 
[START  WITH  n] 
[{MAXVALUE n | NOMAXVALUE}] 
[{MINVALUE n | NOMINVALUE}] 
[{CYCLE | NOCYCLE}] 
[{CACHE | NOCACHE}]; 

sequence_name           SEQUENCE �� �̸��Դϴ�.
INCREMENT BY            n ���� ���� n ���� SEQUENCE ��ȣ ������ ������ ����.
                        �� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
START WITH             n �����ϱ� ���� ù��° SEQUENCE �� ����.
                        �� ���� �����Ǹ� SEQUENCE �� 1 �� ����.
MAXVALUE n SEQUENCE �� ������ �� �ִ� �ִ� ���� ����.
NOMAXVALUE ���������� 10^27 �ִ밪�� ����������-1 �� �ּҰ��� ����.
MINVALUE n �ּ� SEQUENCE ���� ����.
NOMINVALUE ���������� 1 �� ����������-(10^26)�� �ּҰ��� ����.
CYCLE | NOCYCLE �ִ� �Ǵ� �ּҰ��� ������ �Ŀ� ��� ���� ������ ���� ���θ�
����. NOCYCLE �� ����Ʈ.
CACHE | NOCACHE �󸶳� ���� ���� �޸𸮿� ����Ŭ ������ �̸� �Ҵ��ϰ� ����
�ϴ°��� ����. ����Ʈ�� ����Ŭ ������ 20 �� CACHE

*/
desc board;
drop table board;

create table board(
    boardid number constraint pk_board_boardid primary key, --not null , unique , index ����
    title nvarchar2(50)
);

select * from user_constraints where table_name ='BOARD';

insert into board(boardid, title) values(1,'1����');
insert into board(boardid, title) values(2,'2����');

select * from board;
rollback;
--��Ģ : �۹�ȣ ó�����̸� 1 ..... ���� ���̸� 2 ....3 ....4
select * from board;

--1. 
select count(*) + 1 from board;

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'1����');

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'2����');

insert into board(boardid, title) 
values((select count(boardid) + 1 from board),'3����');

select * from board;

--�� ����
delete from board where boardid=1;

insert into board(boardid, title) 
values((select count(*) + 1 from board),'4����');

--���� �۹��� �浹 (boardid pk)
rollback;
---------------------------------------------------------------------------------
--������ ����µ� �����Ͱ� �����Ǿ ������ �����ϰ� �;��
--1. 1�� ... ������  1+1 , 2+1 ....

select nvl(max(boardid),0) + 1 from board; --���� ������ null ��ȯ

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '1����');

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '2����');

select * from board;

delete from board where boardid=1;

insert into board(boardid, title)
values((select nvl(max(boardid),0) + 1 from board), '3����');

select * from board;
--------------------------------------------------------------------------------
--ä���ϸ� .... table �������̴� 
--------------------------------------------------------------------------------
--ä�� (��ü) >> static ó�� >> ��� ���̺��� ����

create sequence board_num;

--1. ä���ϱ�
select board_num.nextval from dual; --ä�� (��ȣǥ �̱�)

--2. ä��Ȯ���ϱ�
select board_num.currval from dual; --������� ä���� ��ȣ Ȯ��(������)

--board_num ������ü : �ϳ��� ���̺����� ����ϴ� ���� �ƴϰ� �������� ���̺� ��밡��

/*
A���̺�        B���̺�      C���̺�
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
values(board_num.nextval,'4����');

select * from board;



insert into kboard(num,title)
values(board_num.nextval,'1����');

select * from kboard;
commit;
--------------------------------------------------------------------------------
/*
�Խ���
��������, �����Խ���, �亯���Խ��� ��
1        3          4   
2
������ ��ü �Ѱ�


��������, �����Խ���, �亯���Խ��� ��
1        1          1

������ ��ü 3��

sequence ��ü (DB ����Ʈ����)
����Ŭ (0)
my-sql (x)
mariadb (0)
postgreSQL (0)

����)
ms-sql
create table board(boardnum int identity(1,1) ....) >> ���̺� ����
insert into board(title) values('�氡');

my-sql
create table board(boardnum int auto-increment, ....) >>  ���̺� ����
insert into board(title) values('�氡');

*/
--�ɼ�
create sequence seq_num
start with 10
increment by 2;

select seq_num.nextval from dual;

select seq_num.currval from dual;

--------------------------------------------------------------------------------
--������ ����--
--rownum
/*
�Խ��� 1...... 100����

�ֽű� ... ������ �� 
select boardid, title , content from board order by boardid desc

.....�� ... 10000��

1~102��
pagesize : 10 ��
page ���� : 11��

[1][2][3][4][5][6][7][8][9][10][11]

[1] 1~10
[2] 11~20
[3] 21~30
*/

select rownum, e.*
from (
        select empno, ename, sal
        from emp
        order by sal desc --���� ������ �����
     )e; --������ ���δ�

--Top-n ���� (������ �Ǵ� ������ ������ ���Ľ�Ű�� ���� n�� ������ ����)
--ms-sql : select top 10, * from emp order by sal desc;

--Top-n ����Ŭ(x)
--rownum ���� �ο� ���� n ������ ����
--1. ���� ������ ������(����)
--2. ���ĵ� ���ؿ� rownum ���̰� ������ ����

--�޿��� ���� �޴� ��� 5��
--1. ���� ������
--2. ���� �ο��ϱ�
--3. ���� �ɾ ��������

select *
from(
    select rownum as num, e.empno, e.sal
    from(
        select empno, sal
        from emp
        order by sal desc
    ) e
) n where num <=5; -- ��뷮 ������ ������ ó�� ���� (POINT)

--12c ����-- ���� top ����
select empno, sal
from emp
order by sal, empno fetch first 5 rows only;

--------------------------------------------------------------------------------
/*
������ 10����, 20����
select * from board;
�����͸� ����� ������ �;� �մϴ�
totaldatacount = 104�� 
pagesize = 10
pagecount = 11�� ������

[1][2][3][4][5][6][7][8][9][10][11]
<a href = "page.do?pageno=1">1��</a> --> ���� ���� --> select ... between 1 and 10 10��

1. rownum ... ����ó��
2. rownum ... between A and B
*/

--HR �����̵�
show user;

select * from employees;
--107��
--pagesize = 10
--[1] > 1~10
--...
--[5] > 11~20
--------------------------------------------------------------------------------

--1. ���� ������ ����� (����)
--�䱸���� (����� ���� ��)

select * from employees order by employee_id asc;


--2. ���� ������ ���� �ο��ϱ�

select rownum as num, e.*
from (
        select *
        from employees
        order by employee_id asc
     )e
where rownum <= 50; --���ĵ� �����Ϳ� ���������� ������ rownum
     
--3. ���� ������ ����

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
--���ݾ� .. �м��Լ�, ���ó��, �������Լ� ��� ....
--------------------------------------------------------------------------------

--JDBC �ǽ����� 
create table dmlemp
as
    select * from emp;

select * from dmlemp;    

alter table dmlemp
add constraint pk_dmlemp_empno primary key(empno);

select * from user_constraints where table_name = 'DMLEMP';

select * from dmlemp;

commit;



