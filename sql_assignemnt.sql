CREATE DATABASE IF NOT EXISTS `privateschool`;

CREATE TABLE `privateschool`.`course` (
  `courseid` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(150) NOT NULL,
  `stream` VARCHAR(60) NOT NULL,
  `type` VARCHAR(60) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`courseid`));
  
  INSERT INTO `privateschool`.`course` (`title`,`stream`,`type`,`start_date`,`end_date`)
  VALUES ('Private School','History','Theoritical','2020-7-10','2021-5-30'),
         ('Private School','Mathematics','Science','2020-7-10','2021-5-30'),
         ('Private School','Physics','Science','2020-7-10','2021-5-30'),
         ('Private School','Social Studies','Theoritical','2020-7-10','2021-5-30');
  
  CREATE TABLE `privateschool`.`trainer` (
  `trainerid` INT NOT NULL AUTO_INCREMENT,
  `lastname` VARCHAR(60) NOT NULL,
  `firstname` VARCHAR(60) NOT NULL,
  `subject` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`trainerid`));
  
  INSERT INTO `privateschool`.`trainer` ( `lastname`,`firstname`,`subject` )
  VALUES ('Harris','John','History'),
		 ('Stone','George','Mathematics'),
         ('Kelly','Stephen','Physics'),
         ('Terence','Kendal','Social Studies');

  
  CREATE TABLE `privateschool`.`student` (
  `studentid` INT NOT NULL AUTO_INCREMENT,
  `firstname`VARCHAR(60) NOT NULL, 
  `lastname` VARCHAR(60) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `tuition_fees` SMALLINT NOT NULL,
  PRIMARY KEY (`studentid`));
  
  INSERT INTO `privateschool`.`student` ( `firstname`,`lastname`,`date_of_birth`,`tuition_fees`)
  VALUES ('John','Wall','2005-7-5','20000'),
		 ('Bob','Ross','2005-9-3','20000'),
         ('Justin','Young','2006-5-8','15000'),
         ('Jim','Taylor','2006-2-5','15000');
  
  
CREATE TABLE `privateschool`.`assignment` (
  `assignmentid` INT NOT NULL AUTO_INCREMENT,
  `courseid` INT NOT NULL,
  `title` VARCHAR(150) NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  `sub_date_time` DATE NOT NULL,
  `oral_mark` SMALLINT NOT NULL,
  `total_mark` SMALLINT NOT NULL,
  PRIMARY KEY (`assignmentid`),
  FOREIGN KEY (`courseid`)REFERENCES `course`(`courseid`));
  
  INSERT INTO `privateschool`.`assignment` (`courseid`,`title`,`description`,`sub_date_time`,`oral_mark`,`total_mark`)
  VALUES ('1','Native Americans','Explore and discover secrets about native american people culture','2021-1-1','30','100'),
		 ('2','The Geometry of Banking a Basket','Calculate and quantify how much more difficult it is to score a basket from different positions','2021-2-3','20','80'),
         ('3','Mechanics and Motion','Work & Energy, Newton’s Law’s of Motion, Radial Forces, Gravity and Balance','2021-1-1','40','60'),
         ('4','Culture','How human beings create, learn, share, and adapt to culture','2021-2-3','30','70');
  

CREATE TABLE `privateschool`.`course_student` (
`courseid` INT NOT NULL,
`studentid` INT NOT NULL,
 INDEX `courseid_idx` (`courseid` ASC) VISIBLE,
 INDEX `studentid_idx` (`studentid` ASC) VISIBLE,
 CONSTRAINT `courseid`
 FOREIGN KEY (`courseid`)
 REFERENCES `course` (`courseid`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `studentid`
 FOREIGN KEY (`studentid`)
 REFERENCES `student` (`studentid`));
 

CREATE TABLE `privateschool`.`course_trainer` (
`courseid` INT NOT NULL,
`trainerid` INT NOT NULL,
 INDEX `courseid_idx` (`courseid` ASC) VISIBLE,
 INDEX `trainerid_idx` (`trainerid` ASC) VISIBLE,
 CONSTRAINT `coursesid`
 FOREIGN KEY (`courseid`)
 REFERENCES `course` (`courseid`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `trainerid`
 FOREIGN KEY (`trainerid`)
 REFERENCES `trainer` (`trainerid`));

CREATE TABLE `privateschool`.`student_trainer` (
 `studentid` INT NOT NULL,
 `trainerid` INT NOT NULL,
 INDEX `studentid_idx` (`studentid` ASC) VISIBLE,
 INDEX `trainersid_idx` (`trainerid` ASC) VISIBLE,
 CONSTRAINT `studentsid`
 FOREIGN KEY (`studentid`)
 REFERENCES `student` (`studentid`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `trainersid`
 FOREIGN KEY (`trainerid`)
 REFERENCES `trainer` (`trainerid`));

CREATE TABLE `privateschool`.`student_assignment` (
 `studentid` INT NOT NULL,
 `assignmentid` INT NOT NULL,
 INDEX `studentid_idx` (`studentid` ASC) VISIBLE,
 INDEX `assignmentid_idx` (`assignmentid` ASC) VISIBLE,
 CONSTRAINT `assignmentid`
 FOREIGN KEY (`assignmentid`)
 REFERENCES `assignment` (`assignmentid`)
 ON DELETE NO ACTION
 ON UPDATE NO ACTION,
 CONSTRAINT `students_id`
 FOREIGN KEY (`studentid`)
 REFERENCES `student` (`studentid`));