CREATE DATABASE IF NOT EXISTS daily_happy
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;

-- ����� ���� ���̺� --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,            -- ����� �̸��� --
    name VARCHAR(32),                        -- ����� �̸� --
    coin int,                                -- ����� ���� ���� --
    memberType char                            -- ȸ�� ���� --
);

-- �� ��� ���̺� --
CREATE TABLE IF NOT EXISTS feed(
    email VARCHAR(128) PRIMARY KEY,            -- �� �ۼ��� �̸��� --
    name VARCHAR(32),                        -- �� �ۼ��ڸ� --
    content VARCHAR(8192),                    -- �� ���� --
    jarname VARCHAR(32),                     -- �Ҽӵ� ������ --
    paperName VARCHAR(32),                    -- ������ ���� --
    no INT UNSIGNED AUTO_INCREMENT,         -- �� ��ȣ --
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP     -- �� �ۼ� �ð�--
);

-- ���� ������ --
CREATE TABLE IF NOT EXISTS savedJar(
    email VARCHAR(128) PRIMARY KEY,            -- ������ ������ --
    jarname VARCHAR(32),                    -- ������ �̸� --
    foldmethodName VARCHAR(32),                -- ���� ��� --
    cnt int                                    -- �ش� �����뿡 �ۼ��� �� ���� --
);


---------------- ������ ----------------

-- ������ ���̺� --
CREATE TABLE IF NOT EXISTS paper(
    paperName VARCHAR(32) PRIMARY KEY,        -- ������ �̸� --
    price int,                                -- ���� --
    info VARCHAR(1024),                        -- ���� --
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