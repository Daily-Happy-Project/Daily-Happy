CREATE DATABASE IF NOT EXISTS daily_happy
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;

-- 사용자 정보 테이블 --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,         -- user email --
    name VARCHAR(32),                       -- user name --
    pw VARCHAR(32)							-- user password --
    coin int,                               -- user owned coin  --
    memberType char                         -- member type --
    FOREIGN KEY (userThemeName) REFERENCES theme(themeName) 
);


-- 글 목록 테이블 --
CREATE TABLE IF NOT EXISTS feed(
    email VARCHAR(128) PRIMARY KEY,            -- writer email --
    name VARCHAR(32),                          -- writer name --
    content VARCHAR(8192),                     -- content --
    jarname VARCHAR(32),                       -- 소속된 유리병 --
    paperName VARCHAR(32),                     -- paper type --
    no INT UNSIGNED AUTO_INCREMENT,            -- writing no --
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP     -- writing time--
);

-- 보유 저금통 --
CREATE TABLE IF NOT EXISTS savedJar(
    email VARCHAR(128) PRIMARY KEY,            -- jar owner email --
    jarname VARCHAR(32),                       -- jar name --
    foldmethodName VARCHAR(32),                -- fold method --
    cnt int                                    -- 해당 저금통에 작성된 글 개수 --
);

CREATE TABLE IF NOT EXIST userItem(
	FOREIGN KEY (email) REFERENCES theme(user) PRIMARY KEY,
	FOREIGN KEY (paperName) REFERENCES theme(paper),
	FOREIGN KEY (themeName) REFERENCES theme(theme),
	FOREIGN KEY (jarname) REFERENCES theme(jar),
	FOREIGN KEY (folemethodName) REFERENCES theme(folemethod)
);


---------------- 아이템 ----------------

-- 색종이 테이블 --
CREATE TABLE IF NOT EXISTS paper(
    paperName VARCHAR(32) PRIMARY KEY,        -- 색종이 이름 --
    price int,                                -- 가격 --
    info VARCHAR(1024),                       -- 설명 --
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