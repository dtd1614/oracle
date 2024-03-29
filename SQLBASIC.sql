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















