CREATE TABLE post (
  num` int NOT NULL AUTO_INCREMENT,
  title` varchar(15) NOT NULL,
  category varchar(10) DEFAULT NULL,
  contents text NOT NULL,
  createDate timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  post_member varchar(30) DEFAULT NULL,
  PRIMARY KEY (num),
  KEY user_id_idx (post_member),
  CONSTRAINT user_id FOREIGN KEY (post_member) REFERENCES member (member_id) ON DELETE CASCADE
);

INSERT INTO `board`.`post`
(`num`,
`title`,
`category`,
`contents`,
`createDate`,
`post_member`)
VALUES
(<{num: }>,
<{title: }>,
<{category: }>,
<{contents: }>,
<{createDate: CURRENT_TIMESTAMP}>,
<{post_member: }>);
