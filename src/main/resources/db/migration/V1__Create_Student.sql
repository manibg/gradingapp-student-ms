CREATE TABLE `student_details` (
  `regno` int(11) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(60) NOT NULL UNIQUE,
  UNIQUE KEY `regno` (`regno`)
); 
alter table student_details auto_increment=1001;

CREATE TABLE `student_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `grade` char(1) NOT NULL,
  `average` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_grade_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`regno`)
); 

CREATE TABLE `student_mark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `mark` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `student_mark_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student_details` (`regno`),
  CONSTRAINT `student_mark_chk_1` CHECK (((`mark` > 0) and (`mark` < 100)))
) 