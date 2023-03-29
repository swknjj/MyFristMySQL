use db_dbclass;
-- 학생 테이블 생성
create table student(
	id bigint,
    student_name varchar(5),
    student_mobile varchar(20),
    student_major varchar(30)
    );
-- 학생테이블 전체 데이터 조회
select * from student;
-- 본인 옆사람들의 정보를 테이블에 저장해봅시다.
insert into student(id, student_name, student_mobile, student_major)
value(1,'이기홍','010-0000-0000','정처기');

-- 학생테이블 삭제
drop table student;

-- 예제데이터
create table dept (
    deptno int,
    dname varchar(14),
    loc varchar(13)
);

create table emp (
    empno int,
    ename varchar(10),
    job varchar(9),
    mgr int,
    hiredate DATE,
    sal int,
    comm int,
    deptno int
);

create table bonus (
    ename varchar(10),
    job varchar(9),
    sal int,
    comm int
);


create table salgrade (
    grade int,
    losal int,
    hisal int
);
    
insert into dept values	(10,'ACCOUNTING','NEW YORK');
insert into dept values (20,'RESEARCH','DALLAS');
insert into dept values (30,'SALES','CHICAGO');
insert into dept values	(40,'OPERATIONS','BOSTON');    

insert into emp values (7369,'SMITH','CLERK',7902, str_to_date('17-12-1980','%d-%m-%Y'),800,NULL,20);
insert into emp values (7499,'ALLEN','SALESMAN',7698,str_to_date('20-2-1981','%d-%m-%Y'),1600,300,30);
insert into emp values (7521,'WARD','SALESMAN',7698,str_to_date('22-2-1981','%d-%m-%Y'),1250,500,30);
insert into emp values (7566,'JONES','MANAGER',7839,str_to_date('2-4-1981','%d-%m-%Y'),2975,NULL,20);
insert into emp values (7654,'MARTIN','SALESMAN',7698,str_to_date('28-9-1981','%d-%m-%Y'),1250,1400,30);
insert into emp values (7698,'BLAKE','MANAGER',7839,str_to_date('1-5-1981','%d-%m-%Y'),2850,NULL,30);
insert into emp values (7782,'CLARK','MANAGER',7839,str_to_date('9-6-1981','%d-%m-%Y'),2450,NULL,10);
insert into emp values (7788,'SCOTT','ANALYST',7566,str_to_date('13-7-87','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7839,'KING','PRESIDENT',NULL,str_to_date('17-11-1981','%d-%m-%Y'),5000,NULL,10);
insert into emp values (7844,'TURNER','SALESMAN',7698,str_to_date('8-9-1981','%d-%m-%Y'),1500,0,30);
insert into emp values (7876,'ADAMS','CLERK',7788,str_to_date('13-7-87','%d-%m-%Y'),1100,NULL,20);
insert into emp values (7900,'JAMES','CLERK',7698,str_to_date('3-12-1981','%d-%m-%Y'),950,NULL,30);
insert into emp values (7902,'FORD','ANALYST',7566,str_to_date('3-12-1981','%d-%m-%Y'),3000,NULL,20);
insert into emp values (7934,'MILLER','CLERK',7782,str_to_date('23-1-1982','%d-%m-%Y'),1300,NULL,10);
		 
insert into salgrade values (1,700,1200);
insert into salgrade values (2,1201,1400);
insert into salgrade values (3,1401,2000);
insert into salgrade values (4,2001,3000);
insert into salgrade values (5,3001,9999);

select * from emp; 
select * from bonus; -- 조회결과 없음
select * from salgrade;
select * from dept;

-- emp 테이블의 전체 조회
select * from emp;

-- emp 테이블 empno and ename 컬럼만 조회
select empno,ename from emp;

-- emp 테이블의 job 컬럼만 조회
select job from emp;

-- 중복값 제외
select distinct job from emp;

-- 사원 이름 조회(오름차순)
select ename from emp order by ename asc;
select * from emp order by ename asc;

-- 사원 이름 조회(내림차순)
select ename from emp order by ename desc;
select * from emp order by ename desc;

-- 급여(sal) 기준으로 오름차순 , 내림차순 정렬
select * from emp order by sal asc;

select * from emp order by sal desc;

-- 입사일(hiredate) 기준으로 오름차순 , 내림차순 정렬
select * from emp order by hiredate asc;

select * from emp order by hiredate desc;

-- 1차기준 급여 , 급여가 같다면 이름순으로 오름차순 정렬

select * from emp order by sal asc, ename asc;

-- where 절 : 조건을 적용할 때
-- 직급이 salesman인 사원만 조회
select * from emp where job='salesman';

-- 직급이 manager인 사원만 조회
select * from emp where job='manager';

-- 부서번호(deptno)가 10인 사원만 조회
select * from emp where deptno='10';

-- 이름이 james라는 사원의 정보 조회
select * from emp where ename='james';

-- 사번이 7654인 사원의 정보 조회
select * from emp where empno='7654';

-- 직급이 manager이고 부서번호가 20인 사원 조회
select * from emp where job = 'manager' and deptno = '20';

-- 직급이 salesman 이거나 부서번호가 10인 사원 조회
select * from emp where job = 'salesman' or deptno = '10';

-- 급여가 3000 이상인 사원 조회
select * from emp where sal >= 3000;

-- 급여가 3000 이상인 사원 조회 결과르 내림차순 정렬
select * from emp where sal >= 3000 order by sal desc;

-- 직급이 salesman이 아닌 사원 조회
select * from emp where job != 'salesman';
select * from emp where not job = 'salesman';

-- 급여가 2000 이상 3000 이하 사원 조회
select * from emp where 2000 <= sal <= 3000; -- X
select * from emp where sal >= 2000 and sal <= 3000;
select * from emp where sal between 2000 and 3000;

-- 급여가 2000 이상 3000 이하 밖의 사원들을 내림차순 정렬
select * from emp where sal not between 2000 and 3000 order by sal desc;

-- like 연산자
select * from emp where ename like 'm%'; -- m이 맨 앞자리
select * from emp where ename like '%m'; -- m이 맨 뒷자리
select * from emp where ename like '%m%'; -- m 포함 모두
select * from emp where ename like '_m%'; -- m이 2번째자리
select * from emp where ename like '__m%'; -- m이 3번째자리
-- %는 글자 수에 제한없음 _는 그자리만 제한

-- 81년 4월 1일 이후 입사한 사원 조회
select * from emp where hiredate > '1981-04-01';
-- 81년 4월 1일 이전 입사한 사원 조회
select * from emp where hiredate < '1981-04-01';

-- 자바의 형변환
select * from emp where hiredate < str_to_date('1981-04-01', '%Y-%m-%d');

-- 테이블 구조 확인 describe
desc emp;

-- sum(), avg(), max(), min(), count()
-- 사원의 급여 총합
select sum(sal) from emp;
select sum(sal) as '급여총합' from emp;

-- salesman 급여 총합
select sum(sal) from emp where job = 'salesman';

-- manager 급여 총합
select sum(sal) as '매니저 급여 총합' from emp where job = 'manager';

-- 전체 사원의 평균 급여 조회
select avg(sal) from emp;

-- 평균 급여를 소수 들째자리까지 표현
select round(avg(sal),2) from emp;

select sysdate() from dual; -- 구색을 맞추기 위한 것 , 가상의 테이블 sysdate = 현재시간

-- round()
select round(12.345, 2) from dual; -- 12.35
select round(12.345, 1) from dual; -- 12.3
select round(12.345, 0) from dual; -- 12

-- 가장 높은 급여 값 조회
select max(sal) from emp;
select min(sal) from emp;

-- 전체 사원 수 조회 count = 줄 수를 세준다
select count(*) from emp;

--  부서번호가 20인 사원수 조회
select count(*) from emp where deptno = 20;

-- 그룹화(동일한 데이터끼리 묶는것 grouping)
-- 직급으로 그룹핑
-- 조회결과는 그룹핑한 컬럼이름 또는 집계함수 등을 사용함 *= !
select * from emp group by job;

-- 직급별 평균 급여
select job, avg(sal) from emp group by job;

-- 부서별 평균 급여
select deptno, avg(sal) from emp group by deptno;

select *
from emp
where sal = (
	select max(sal)
    from emp
);

-- 직급별 사원수 조회
select job , count(*) from emp group by job;
-- 직급별 평균 급여 , 사원 수 조회
select job , avg(sal),count(*) from emp group by job ;
-- 위의 결과에서 직급값을 오름차순으로 정렬
select job , avg(sal),count(*) from emp group by job order by job asc;
-- 위의 결과에서 평균 급여를 소수점 첫째자리까지 조회
select job , round(avg(sal),1),count(*) from emp group by job order by job asc;
-- 위의 결과에서 job은 직급으로 급여 평균값은 평균급여로, 사원수 조회값은 사원수로 표현하여 조회
select job as '직급' , round(avg(sal),1) as '평균급여',count(*) as '사원수' from emp group by job order by job asc;

-- 2023.03.29
-- 부서별 그룹핑
select deptno from emp group by deptno;
select deptno, avg(sal) from emp group by deptno;

-- 부서별 그룹핑하고 그안에 직급별 그룹핑
select deptno , job , avg(sal) from emp group by deptno , job;
select deptno , job , avg(sal) from emp group by job , deptno;
select deptno , job , avg(sal) from emp group by deptno , job order by job asc;
select deptno , job , avg(sal) from emp group by deptno , job order by deptno asc;
select deptno , job , avg(sal) from emp group by deptno , job order by avg(sal) asc;

-- having : 그룹화한 결과에서 조건 적용
select deptno , job , avg(sal) from emp 
							group by deptno , job 	
								having avg(sal) >= 2000
									order by job asc; 
                                    
-- 급여가 3000이하인 사원을 대상으로 위의 그룹핑 수행
select * from emp order by sal asc;
select deptno , job , avg(sal) from emp
						where sal <= 3000
							group by deptno , job 	
								having avg(sal) >= 2000
									order by job asc;                                  

-- date 타입을 문자로 표현하기: date_format()
select date_format(hiredate, '%Y') from emp;

/*
	연습문제
	1. 부서별 평균급여, 최고급여, 최저급여, 사원수 조회(평균급여는 소수점 둘째자리에서 반올림)
    2. 직급별 사원수 조회(단 3명 이상인 결과만 출력)
    3. 연도별 입사한 사원수 조회(조회결과 : 연도(yyyy), 사원수)
    3.1. 위의 결과에서 각 연도별로 부서별 입사한 사원수 조회(조회결과 : 연도(yyyy), 부서번호, 사원수)
*/
select deptno as '부서번호' , round(avg(sal),1) as '평균급여', max(sal) as '최고급여', min(sal) as '최소급여', count(*) as '사원수' from emp 
				group by deptno;
 
select job , count(empno) from emp group by job
				having count(*) >= 3;
                
select date_format(hiredate, '%Y') as '입사년도' , count(*) as '사원수' from emp
				group by date_format(hiredate, '%Y');
                
select date_format(hiredate, '%Y') as '입사년도' , deptno as '부서번호' , count(*) as '사원수' from emp
				group by date_format(hiredate, '%Y') , deptno;
                
-- 조인
select * from emp;
select * from dept;

-- 외부조인
select * from emp , dept;
-- 조인
select * from emp , dept where emp.deptno = dept.deptno;
select * from emp e , dept d where e.deptno = d.deptno;
-- deptno select 하면 에러
select empno , ename , deptno , dname from emp e , dept d where e.deptno = d.deptno;
select e.empno , e.ename , e.deptno , d.dname , d.loc from emp e , dept d where e.deptno = d.deptno;

select e.* from emp e, dept d where e.deptno = d.deptno;

-- emp , dept를 조인하여 empno , ename , deptno , dname , loc 조회
-- 단 , 급여가 2500 이상인 사람만 조회하고 , 조회 결과는 사원이름 기준으로 오름차순 정렬
select e.empno , e.ename , e.deptno , d.dname , d.loc 
	from emp e , dept d 	
		where e.deptno = d.deptno and e.sal >= 2500
				order by e.ename asc;

-- 최저급여를 받는 사람이 누구인지?
select * from emp order by sal asc;
-- 1. 최저급여값이 얼마인지?
select min(sal) from emp;
-- 2. 최저급여 값을 받는 사람이(최저급여 값과 sal 값이 일치하는) 누구인지 조회
select * from emp where sal=800;
-- 서브쿼리 적용
select * from emp where sal=(select min(sal) from emp);

-- 최고급여를 받는 사원 정보 조회
select * from emp where sal=(select max(sal) from emp);
-- allen보다 높은 급여를 받는 사원 조회
select * from emp where sal>(select sal from emp where ename = 'allen')
	order by sal asc;
    
    /*
	연습문제 
    1. clark 보다 늦게 입사한 사원 조회 
    2. 부서번호가 20인 사원 중에서 전체 사원 평균 급여보다 높은 급여를 받는 사원 조회 
    3. 2번 조회 결과에서 부서이름, 부서위치도 함께 조회 
*/
select * from emp where hiredate > ( select hiredate from emp where ename = 'clark' );

select * from emp where deptno = '20' and sal>(select avg(sal) from emp);

select * from emp e , dept d 
	where e.deptno = '20' and d.deptno = '20' 
		and e.sal>(select avg(sal) from emp);
        
        
create table member1 (
	id bigint,
    member_email varchar(20),
    member_password varchar(10)
);
-- 정석적인 방법
insert into member1(id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- 모든 컬럼에 데이터를 저장한다면 컬럼이름 생략 가능
insert into member1 values(2, 'member2@email.com', '2222');
insert into member1 values(3, 'member2@email.com'); -- error 1136
-- 특정 컬럼에만 값을 넣고 싶은 경우
insert into member1(id, member_email) values(4, 'member4@email.com');
-- 테이블 만들 때 지정한 크기보다 큰 값을 저장할 때
insert into member1 values(null, null, '22222222222'); -- error 1406
insert into member1(id, member_email, member_password) values(5, null, '1111');
insert into member1(id, member_email, member_password) values(null, null, null);
select * from member1;

create table member2 (
	id bigint not null,
    member_email varchar(20),
    member_password varchar(10)
);

desc member2;

insert into member2(id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- error 1048 Column 'id' cannot be null
insert into member2(id, member_email, member_password) values(null, 'member1@email.com', '1111');
insert into member2(id, member_email, member_password) values(2, null, '1111');

select * from member2;

create table member3 (
	id bigint not null unique,
    member_email varchar(20) not null,
    member_password varchar(10) not null
);
desc member3;

insert into member3(id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- error 1062 Duplicate entry '1' for key 'member3.id'
insert into member3(id, member_email, member_password) values(1, 'member1@email.com', '1111');
insert into member3(id, member_email, member_password) values(2, 'member1@email.com', '1111');
select * from member3;

create table member4 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null
);
insert into member4(id, member_email, member_password) values(1, 'member1@email.com', '1111');
-- error 1062 Duplicate entry 'member1@email.com' for key 'member4.memeber_email'
insert into member4(id, member_email, member_password) values(2, 'member1@email.com', '2222');
select * from member4;

create table member5 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime
);

insert into member5(id, member_email, member_password, member_created_date) 
			values(2, 'member1@email.com', '2222', sysdate());
insert into member5(id, member_email, member_password) 
			values(3, 'member2@email.com', '2222');
insert into member5(id, member_email, member_password, member_created_date) 
			values(4, 'member3@email.com', '2222', sysdate());
select * from member5;

create table member6 (
	id bigint not null unique,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now()
);
insert into member6(id, member_email, member_password) 
			values(1, 'member1@email.com', '1111');
select * from member6;

create table member7 (
	id bigint primary key,
    member_email varchar(20) not null unique,
    member_password varchar(10) not null,
    member_created_date datetime default now()
);

insert into member7(id, member_email, member_password) 
			values(1, 'member1@email.com', '1111');
-- error 1062
insert into member7(id, member_email, member_password) 
			values(1, 'member2@email.com', '2222');            
            


