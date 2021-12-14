CREATE DATABASE IF NOT EXISTS daily_happy;
DEFAULT CHARACTER SET utf-8 COLLATE utf-8_general_ci;

USE daily_happy;


--		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	--
--		{{!!!!!!!DEFAULT TABLE!!!!!!!!}} --
--		{{!!!!!!!HAVE TO CREATE!!!!!!!}} --
--		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!	--



-- [USER TABLE] --
CREATE TABLE IF NOT EXISTS user(
    email VARCHAR(128) PRIMARY KEY,         
    name VARCHAR(32),                       
    pw VARCHAR(32),			
    coin int DEFAULT 0,                        
    memberType char DEFAULT 'M',            
    userThemeCode int  	
);




-- [STORE ITEM TABLE]--
CREATE TABLE IF NOT EXISTS item(
	itemCode int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	itemName VARCHAR(32) UNIQUE NOT NULL,
	itemType VARCHAR(32) NOT NULL,
	price INT NOT NULL,	
	info VARCHAR(1024) NOT NULL,	
	img1 VARCHAR(1024) NOT NULL,	
	img2 VARCHAR(1024),					
	img3 VARCHAR(1024),					
	img4 VARCHAR(1024)					
);

-- [CREATE ITEM TABLE AFTER -> insert !soon seo dae ro!] -- 
insert into item (itemName, itemType, price, info, img1) 
values("占썩본 占쏙옙占쏙옙占쏙옙", "jar", 100, "占썩본 占쏙옙占쏙옙占쏙옙占쌉니댐옙.", "http://211.253.26.72/DailyHappy/resources/images/normal-0.png");

insert into item (itemName, itemType, price, info, img1) 
values("占쏙옙占쏙옙 占쌓띰옙占싱쇽옙 占쏙옙占쏙옙占쏙옙", "paper", 100, "占쏙옙占쏙옙占쏙옙 占쌓띰옙占싱쇽옙 占쏙옙占쏙옙占쏙옙占쌉니댐옙.", "http://211.253.26.72/DailyHappy/resources/images/gra-paper-r.png");

insert into item (itemName, itemType, price, info, img1) 
values("占쏙옙", "foldMethod", 100, "占싻몌옙占� 占쏙옙占쏙옙占쌉니댐옙.", "http://211.253.26.72/DailyHappy/resources/images/color-logo2.png");

insert into item (itemName, itemType, price, info, img1) 
values("占쏙옙占� 占쌓띰옙占싱쇽옙 占쏙옙占쏙옙占쏙옙", "paper", 100, "占쏙옙占쏙옙占� 占쌓띰옙占싱쇽옙 占쏙옙占쏙옙占쏙옙占쌉니댐옙.", "http://211.253.26.72/DailyHappy/resources/images/gra-paper-y.png");

insert into item (itemName, itemType, price, info, img1) 
values("占십뤄옙 占쌓띰옙占싱쇽옙 占쏙옙占쏙옙占쏙옙", "paper", 100, "占십록삼옙 占쌓띰옙占싱쇽옙 占쏙옙占쏙옙占쏙옙占쌉니댐옙.", "http://211.253.26.72/DailyHappy/resources/images/gra-paper-g.png");

-- [!!!!!!!!!!!!!!SOON SEO DAE RO insert!!!!!!!!!!!!!!] --





-- [JAR IMG BY TYPE TABLE] --
CREATE TABLE IF NOT EXISTS jarImg(
	imgName VARCHAR(128) NOT NULL PRIMARY KEY,	
	img1 VARCHAR(1024) NOT NULL,		
	img2 VARCHAR(1024) NOT NULL,		
	img3 VARCHAR(1024) NOT NULL,		
	img4 VARCHAR(1024) NOT NULL
);

-- [CREATE jarImg TABLE AFTER -> insert !soon seo dae ro!] --
insert into jarImg values("占썩본 占쏙옙占쏙옙占쏙옙占쏙옙",
	"http://211.253.26.72/DailyHappy/resources/images/normal-0.png", 
	"http://211.253.26.72/DailyHappy/resources/images/normal-1.png",
	"http://211.253.26.72/DailyHappy/resources/images/normal-2.png",
	"http://211.253.26.72/DailyHappy/resources/images/normal-3.png");



=====================================================================================================

--		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --
--		{{!!!!!AUTO CREATE TABLE <WHEN YOU SIGN UP>!!!!!}} --
--		!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! --



-- [USER JAR LIST TABLE] --
CREATE TABLE IF NOT EXISTS emailJarList(
	jarName VARCHAR(32) PRIMARY KEY, 
    jarItemName VARCHAR(32), 
    foldMethodName VARCHAR(32), 
    cnt int UNSIGNED DEFAULT 0, 
    goalNum int UNSIGNED DEFAULT 0,
    shareState boolean DEFAULT 0,
    jarImgName VARCHAR(128),
    FOREIGN KEY (jarItemName) REFERENCES item (itemName),
    FOREIGN KEY (jarImgName) REFERENCES jarImg (imgName));

--  ↑ shareState 0이면 공유 X, 1이면 공유 O --


-- [USER WRITING LIST TABLE] --
CREATE TABLE IF NOT EXISTS emailWritingList(
	no INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
        jarName VARCHAR(32), 
        content VARCHAR(8192), 
        paperCode int,
        ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        FOREIGN KEY (jarName) REFERENCES " + email + "JarList (jarName) ON DELETE CASCADE);




-- [USER ITEM LIST TABLE] --
CREATE TABLE IF NOT EXISTS emailItem(
	itemCode int UNSIGNED PRIMARY KEY, 
    itemType VARCHAR(32),
    apply tinyint(1) DEFAULT 0,
    FOREIGN KEY (itemCode) REFERENCES item (itemCode));
    
    

-- [USER FRIEND LIST TABLE]
CREATE TABLE IF NOT EXISTS emailFriendList(
	friendEmail VARCHAR(128) PRIMARY KEY,
	FOREIGN KEY (friendEmail) REFERENCES user (email) ON DELETE CASCADE);
