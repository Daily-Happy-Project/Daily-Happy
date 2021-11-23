CREATE DATABASE IF NOT EXISTS daily_happy;
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;

-- user table --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,         	-- user email --
    name VARCHAR(32),                       	-- user name --
    pw VARCHAR(32),								-- user password --
    coin int,                               	-- user owned coin  --
    memberType char DEFAULT 'M',                -- member type. member='M' manager='K' -- 
    userThemeCode int  							-- apply theme --   
);



-- writing table --
CREATE TABLE IF NOT EXISTS USERNAME+writingList(                     
    no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    jarName VARCHAR(32),                           -- writer name --
    content VARCHAR(8192),                      -- content --
    paperCode int,            					-- paper code --
    ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP      -- writing time--
    FOREIGN KEY (jarName) 						-- USERNAMEjarList(jarName) --
);


-- Jar List
CREATE TABLE IF NOT EXISTS USERNAME+JarList(
    jarName VARCHAR(32) PRIMARY KEY,           -- jar name --
    foldmethodName VARCHAR(32),                -- fold method --
    cnt int UNSIGNED,      					   -- count --
    goalnum int UNSIGNED DEFAULT 0			   -- goal number --
);


-- user item --
CREATE TABLE IF NOT EXIST USERNAME+Item(
--	email VARCHAR(128) PRIMARY KEY,         -- user email --
	itemcode PRIMARY KEY
	apply boolean default 0,				-- apply item --
	FOREIGN KEY (itemcode)					-- item code --
	
);


-- store item --
CREATE TABLE IF NOT EXISTS item(
	itemcode int UNSIGNED DEFAULT 0 AUTO_INCREMENT PRIMARY KEY,			-- item code --
	itemName VARCHAR(32) NOT NULL,		-- item name --
	itemtype VARCHAR(32) NOT NULL,		-- item type (paper, jar, foldmethod, theme) -- 
	price INT NOT NULL,					-- item price --
	info VARCHAR(1024) NOT NULL,		-- item information --
	img1 VARCHAR(1024) NOT NULL,		-- item image1 --
	img2 VARCHAR(1024),					-- item image2 --
	img3 VARCHAR(1024),					-- item image3 --
	img4 VARCHAR(1024)					-- item image4 --
);