use eldb

CREATE TABLE Settings (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    coursename varchar(30),				/* the name of the course */
    slogan varchar(50),					/* the slogan of the course */
    show_opinions tinyint,				/* 0- don't show, 1- show */
	receive_opinions tinyint,			/* 0- don't reveive, 1- allow adding opinions */
	startpage_content varchar(3000),	/* text content that appears in main site */
    aboutus_content varchar(3000),		/* text content that appears in about us site */
	active_version tinyint,				/* only one entity is for active settings */
	site_mode tinyint					/* 0- closed, 1- opened */
);

CREATE TABLE Materials (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    title varchar(30),					/* the title of file (material) */
	file_path varchar(300),				/* the path of file (material) */
    description varchar(500),			/* the slogan of the course */
    show tinyint						/* 0- don't show, 1- show */
);

CREATE TABLE Ratings (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    username varchar(30),					/* the author of opinion it could be users login, or anonymous name */
	date smalldatetime,						/* the date of opinion */
    rating int,								/* rate from 1 to 5 */
    description varchar(300),				/* opinions text */
	acceptance tinyint					    /* 0- rejected show, 1- accepted */
);

CREATE TABLE Sections (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    title varchar(300),						/* the title of section */
	section_content varchar(8000),			/* the text of section */
    show tinyint							/* 0- hide section, 1- show section */
);

CREATE TABLE Questions (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    section_id int,							/* section id, that the question is for */
	question varchar(300),					/* the text of the question */
    question_type tinyint,					/* 0- open question, 1- choice question */
	answer_1 varchar(300),					/* the first answer - only for choice questions, otherwise null */
	answer_2 varchar(300),					/* the second answer - only for choice questions, otherwise null */
	answer_3 varchar(300),					/* the third answer - only for choice questions, otherwise null */
	answer_4 varchar(300),					/* the fourth answer - only for choice questions, otherwise null */
	correct	 varchar(300)					/* the correct answer */
	constraint section_FK foreign key (section_id) references Sections(id)
);

CREATE TABLE Codes (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    code varchar(32),						/* the valid codes of course coded in md5 */
	valid tinyint							/* 0- not valid (already used), 1- valid */
);

/*
drop table Codes;
drop table Done_sections;
drop table Users;
*/

CREATE TABLE Users (
    id int NOT NULL PRIMARY KEY,
    firstname varchar(30),						/* user first name */
	surname varchar(30),						/* user second name */
	participation_date smalldatetime,			/* user participation date */
	sex tinyint,								/* 0- male, 1- female */
	email varchar(100),							/* users email address */
	birthday smalldatetime,						/* birthday date */
	country varchar(30),						/* user country */
	city varchar(30),							/* user city */
	postcode varchar(10),						/* user post code */
	address varchar(100),						/* user address */
	jump_posibility tinyint,					/* 0- don't allow to jumb over course sections, 1- allow */
	code_id int									/* the code of activation - FK */
	constraint code_FK foreign key (code_id) references Codes(id)
);

CREATE TABLE Done_sections (
    id int NOT NULL identity(1,1) PRIMARY KEY,	
    userid int,								/* the id of user */
	section_id int							/* the id of section he completed */
	constraint user_FK foreign key (userid) references Users(id),
	constraint section_FK2 foreign key (section_id) references Sections(id)
);

