CREATE DATABASE IF NOT EXISTS daily_happy
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;

-- ����� ���� ���̺� --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,         -- user email --
    name VARCHAR(32),                       -- user name --
    pw VARCHAR(32)							-- user password --
    coin int,                               -- user owned coin  --
    memberType char                         -- member type --
    FOREIGN KEY (userThemeName) REFERENCES theme(themeName) 
);


-- �� ��� ���̺� --
CREATE TABLE IF NOT EXISTS feed(
    email VARCHAR(128) PRIMARY KEY,            -- writer email --
    name VARCHAR(32),                          -- writer name --
    content VARCHAR(8192),                     -- content --
    jarname VARCHAR(32),                       -- �Ҽӵ� ������ --
    paperName VARCHAR(32),                     -- paper type --
    no INT UNSIGNED AUTO_INCREMENT,            -- writing no --
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP     -- writing time--
);

-- ���� ������ --
CREATE TABLE IF NOT EXISTS savedJar(
    email VARCHAR(128) PRIMARY KEY,            -- jar owner email --
    jarname VARCHAR(32),                       -- jar name --
    foldmethodName VARCHAR(32),                -- fold method --
    cnt int                                    -- �ش� �����뿡 �ۼ��� �� ���� --
);

CREATE TABLE IF NOT EXIST userItem(
	FOREIGN KEY (email) REFERENCES theme(user) PRIMARY KEY,
	FOREIGN KEY (paperName) REFERENCES theme(paper),
	FOREIGN KEY (themeName) REFERENCES theme(theme),
	FOREIGN KEY (jarname) REFERENCES theme(jar),
	FOREIGN KEY (folemethodName) REFERENCES theme(folemethod)
);


---------------- ������ ----------------

-- ������ ���̺� --
CREATE TABLE IF NOT EXISTS paper(
    paperName VARCHAR(32) PRIMARY KEY,        -- ������ �̸� --
    price int,                                -- ���� --
    info VARCHAR(1024),                       -- ���� --
    paperImg VARCHAR(1024)                    -- ������ �̹��� --
);

-- �׸� ���̺� --
CREATE TABLE IF NOT EXISTS theme(
    themeName VARCHAR(32) PRIMARY KEY,
    price int,
    info VARCHAR(1024),
    themeImg VARCHAR(1024)
);

-- ������ ���̺� --
CREATE TABLE IF NOT EXISTS jar(
    jarName VARCHAR (32) PRIMARY KEY,
    price int,
    info VARCHAR(1024),
    jarImg VARCHAR(1024)
);

-- ���� ���̺� --
CREATE TABLE IF NOT EXISTS foldmethod(
    foldmethodName VARCHAR(32) PRIMARY KEY,
    price int,
    info VARCHAR(1024),
    foldmethodImg VARCHAR(1024)
);