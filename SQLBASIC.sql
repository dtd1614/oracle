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






