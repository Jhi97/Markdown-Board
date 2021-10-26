CREATE TABLE `post` (
  `member_num` int NOT NULL,
  `post_num` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(30) DEFAULT NULL,
  `contents` text NOT NULL,
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`member_num`,`post_num`),
  CONSTRAINT `member_num` FOREIGN KEY (`member_num`) REFERENCES `member` (`member_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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
