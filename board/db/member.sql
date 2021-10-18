CREATE TABLE member (
	member_num int NOT NULL AUTO_INCREMENT,
	member_id varchar(30) NOT NULL,
	member_pw varchar(15) NOT NULL,
	member_email varchar(30) NOT NULL,
	member_gender char(2) NOT NULL,
	member_joinDate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (member_num), UNIQUE KEY member_id (member_id) 
);

INSERT INTO board.member
(`member_num`,
`member_id`,
`member_pw`,
`member_email`,
`member_gender`,
`member_joinDate`)
VALUES
(<{member_num: }>,
<{member_id: }>,
<{member_pw: }>,
<{member_email: }>,
<{member_gender: }>,
<{member_joinDate: CURRENT_TIMESTAMP}>);