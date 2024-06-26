CREATE SEQUENCE game_no_seq
	INCREMENT BY 1
	START WITH 100;

CREATE SEQUENCE quiz_no_seq
	INCREMENT BY 1
	START WITH 10000;

-- DROP TABLE QUIZ CASCADE CONSTRAINTS PURGE;

-- DROP TABLE HISTORY CASCADE CONSTRAINTS PURGE;

-- DROP TABLE GAME_INFO CASCADE CONSTRAINTS PURGE;

-- DROP TABLE MEMBER CASCADE CONSTRAINTS PURGE;

-- DROP TABLE CATEGORY CASCADE CONSTRAINTS PURGE;

CREATE TABLE CATEGORY
(
	category_id          CHAR(3) NOT NULL ,
	category_name        VARCHAR(30) NULL 
);

CREATE UNIQUE INDEX XPKCATEGORY ON CATEGORY
(category_id   ASC);


ALTER TABLE CATEGORY
	ADD CONSTRAINT category_const PRIMARY KEY USING INDEX XPKCATEGORY;

CREATE TABLE GAME_INFO
(
	game_no              INTEGER NOT NULL ,
	game_title           VARCHAR(300) NULL ,
	game_intro           VARCHAR(1000) NULL ,
	game_difficulty      INTEGER NULL  CONSTRAINT  game_difficulty_constraint CHECK (game_difficulty IN (3, 2, 1)),
	quiz_number          INTEGER NULL ,
	game_score           INTEGER NULL ,
	category_id          CHAR(3) NOT NULL ,
	member_id            VARCHAR(30) NOT NULL 
);

CREATE UNIQUE INDEX XPKGAME_INFO ON GAME_INFO
(game_no   ASC);

ALTER TABLE GAME_INFO
	ADD CONSTRAINT game_const PRIMARY KEY USING INDEX XPKGAME_INFO;



CREATE TABLE QUIZ
(
	quiz_no              INTEGER NOT NULL ,
	question             VARCHAR(100) NULL ,
	answer               VARCHAR(300) NULL ,
	quiz_difficulty      INTEGER NULL  CONSTRAINT  quiz_difficulty_constraint CHECK (quiz_difficulty IN (3, 2, 1)),
	hint                 VARCHAR(1000) NULL ,
	hint_point           INTEGER NULL  CONSTRAINT  hint_constraint CHECK (hint_point IN (10, 20, 30, 40, 50)),
	game_no              INTEGER NOT NULL 
);

CREATE UNIQUE INDEX XPKQUIZ ON QUIZ
(quiz_no   ASC);

ALTER TABLE QUIZ
	ADD CONSTRAINT quiz_const PRIMARY KEY USING INDEX XPKQUIZ;



CREATE TABLE MEMBER
(
	member_id            VARCHAR(30) NOT NULL ,
	passwd               VARCHAR(30) NULL ,
	total_score          INTEGER NULL ,
	rank                 INTEGER NULL ,
	point                INTEGER NULL 
);

CREATE UNIQUE INDEX XPKMEMBER ON MEMBER
(member_id   ASC);

ALTER TABLE MEMBER
	ADD CONSTRAINT  member_const PRIMARY KEY USING INDEX XPKMEMBER;

CREATE TABLE HISTORY
(
	play_date            TIMESTAMP NULL ,
	correct_number       INTEGER NULL ,
	score                INTEGER NULL ,
	game_no              INTEGER NOT NULL ,
	member_id            VARCHAR(30) NOT NULL 
);

CREATE UNIQUE INDEX XPKHISTORY ON HISTORY
(game_no   ASC,member_id   ASC);

ALTER TABLE HISTORY
	ADD CONSTRAINT history_const PRIMARY KEY USING INDEX XPKHISTORY;


ALTER TABLE GAME_INFO
	ADD CONSTRAINT R_7 FOREIGN KEY (category_id) REFERENCES CATEGORY (category_id);

ALTER TABLE GAME_INFO
	ADD CONSTRAINT R_9 FOREIGN KEY (member_id) REFERENCES MEMBER (member_id);

ALTER TABLE QUIZ
	ADD CONSTRAINT R_8 FOREIGN KEY (game_no) REFERENCES GAME_INFO (game_no);

ALTER TABLE HISTORY
	ADD CONSTRAINT R_2 FOREIGN KEY (game_no) REFERENCES GAME_INFO (game_no);

ALTER TABLE HISTORY
	ADD CONSTRAINT R_3 FOREIGN KEY (member_id) REFERENCES MEMBER (member_id);