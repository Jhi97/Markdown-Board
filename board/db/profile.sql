CREATE TABLE `profile` (
  `profile_num` int NOT NULL,
  `introduce` varchar(45) DEFAULT NULL,
  `member_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`profile_num`),
  CONSTRAINT `profile_num` FOREIGN KEY (`profile_num`) REFERENCES `member` (`member_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
