-- 주석입니다.
-- 계정 생성
-- 사용자이름 : user1 , 비밀번호 1234
-- 대문자소문자 가리지않는다. MySQL은 소문자를 주로 쓰고 Orcle은 대문자를 많이 씀
-- 실행키 ctrl + enter 한줄씩실행됨
create user user1@localhost identified by '1234';
-- database 생성
create database database1;
-- 권한부여
grant all privileges on database1.* to user1@localhost;

-- 현재 생성된 계정 목록 확인
use mysql;
select user from user;
-- user 삭제
drop user user1@localhost;

-- 계정: user2 , 비번 : 9999로 계정 만들고 database999에 대한 접속 권한 부여하고 해당계정으로 접속해서 database999 사용되는지 확인
create user user2@localhost identified by '9999';
create database database999;
grant all privileges on database999.* to user2@localhost;

use mysql;