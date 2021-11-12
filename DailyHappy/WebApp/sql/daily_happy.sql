CREATE DATABASE IF NOT EXISTS daily_happy
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;

-- 사용자 정보 테이블 --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,            -- 사용자 이메일 --
    name VARCHAR(32),                        -- 사용자 이름 --
    coin int,                                -- 사용자 보유 코인 --
    memberType char                            -- 회원 유형 --
);

-- 글 목록 테이블 --
CREATE TABLE IF NOT EXISTS feed(
    email VARCHAR(128) PRIMARY KEY,            -- 글 작성자 이메일 --
    name VARCHAR(32),                        -- 글 작성자명 --
    content VARCHAR(8192),                    -- 글 내용 --
    jarname VARCHAR(32),                     -- 소속된 유리병 --
    paperName VARCHAR(32),                    -- 색종이 종류 --
    no INT UNSIGNED AUTO_INCREMENT,         -- 글 번호 --
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP     -- 글 작성 시간--
);

-- 보유 저금통 --
CREATE TABLE IF NOT EXISTS savedJar(
    email VARCHAR(128) PRIMARY KEY,            -- 유리병 소유자 --
    jarname VARCHAR(32),                    -- 유리병 이름 --
    foldmethodName VARCHAR(32),                -- 접는 방법 --
    cnt int                                    -- 해당 저금통에 작성된 글 개수 --
);


---------------- 아이템 ----------------

-- 색종이 테이블 --
CREATE TABLE IF NOT EXISTS paper(
    paperName VARCHAR(32) PRIMARY KEY,        -- 색종이 이름 --
    price int,                                -- 가격 --
    info VARCHAR(1024),                        -- 설명 --
    paperImg VARCHAR(1024)                    -- 색종이 이미지 --
);

-- 테마 테이블 --
CREATE TABLE IF NOT EXISTS theme(
    themeName VARCHAR(32) PRIMARY KEY,
    price int,
    info VARCHAR(1024),
    themeImg VARCHAR(1024)
);

-- 유리병 테이블 --
CREATE TABLE IF NOT EXISTS jar(
    jarName VARCHAR (32) PRIMARY KEY,
    price int,
    info VARCHAR(1024),
    jarImg VARCHAR(1024)
);

-- 도안 테이블 --
CREATE TABLE IF NOT EXISTS foldmethod(
    foldmethodName VARCHAR(32) PRIMARY KEY,
    price int,
    info VARCHAR(1024),
    foldmethodImg VARCHAR(1024)
);