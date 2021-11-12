CREATE DATABASE IF NOT EXISTS daily_happy;
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;

-- ����� ���� ���̺� --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,         	-- user email --
    name VARCHAR(32),                       	-- user name --
    pw VARCHAR(32),								-- user password --
    coin int,                               	-- user owned coin  --
    memberType char,                         	-- member type --
    userThemeCode int  							-- apply theme --
);


-- �� ��� ���̺� --
CREATE TABLE IF NOT EXISTS writing(
    email VARCHAR(128) PRIMARY KEY,            -- writer email --
    name VARCHAR(32),                          -- writer name --
    content VARCHAR(8192),                     -- content --
    jarName VARCHAR(32),                       -- �Ҽӵ� ������ --
    paperName VARCHAR(32),                     -- paper type --
    no INT UNSIGNED AUTO_INCREMENT,            -- writing no --
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP     -- writing time--
    FOREIGN KEY (jarName) 
);


-- ���� ������ --
CREATE TABLE IF NOT EXISTS savedJar(
    email VARCHAR(128) PRIMARY KEY,            -- jar owner email --
    jarName VARCHAR(32),                       -- jar name --
    foldmethodName VARCHAR(32),                -- fold method --
    cnt int UNSIGNED AUTO_INCREMENT            -- �ش� �����뿡 �ۼ��� �� ���� --
);


-- ���� ������ --
CREATE TABLE IF NOT EXIST userItem(
	email VARCHAR(128) PRIMARY KEY,         -- user email --
	itemcode int NOT NULL					-- item code --
);


-- ������ --
CREATE TABLE IF NOT EXISTS item(
	itemcode int PRIMARY KEY,			-- item code --
	itemName VARCHAR(32) NOT NULL,		-- item name --
	price INT NOT NULL,					-- item price --
	info VARCHAR(1024) NOT NULL,		-- item information --
	img1 VARCHAR(1024) NOT NULL,		-- item image1 --
	img2 VARCHAR(1024),					-- item image2--
	img3 VARCHAR(1024),					-- item image3 --
	img4 VARCHAR(1024)					-- item image4 --
);


