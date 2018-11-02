CREATE TABLE `user` (
	`user_id` INT(8) NOT NULL AUTO_INCREMENT,
	`email_id` VARCHAR(50) NOT NULL UNIQUE,
	`password` VARCHAR(50) NOT NULL,
	`first_name` VARCHAR(50) NOT NULL,
	`middle_name` VARCHAR(50),
	`last_name` VARCHAR(50) NOT NULL,
	`gender` VARCHAR(10),
	`mobile_no` VARCHAR(10),
	`country` VARCHAR(50),
	`state` VARCHAR(50),
	`city` VARCHAR(50),
	`current_position` VARCHAR(250),
	`college` VARCHAR(200),
	`date_of_birth` DATETIME(6),
	`up_votes` INT(8) NOT NULL DEFAULT '0',
	`down_votes` INT(8) NOT NULL DEFAULT '0',
	`date_of_reg` DATETIME(6) NOT NULL,
	`profile_pic` VARCHAR(200),
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `questions` (
	`question_id` INT(8) NOT NULL AUTO_INCREMENT,
	`user_id` INT(8) NOT NULL,
	`question_content` VARCHAR(1000) NOT NULL,
	`title` VARCHAR(100) NOT NULL,
	`votes` INT(8) NOT NULL DEFAULT '0',
	`delete_votes` INT(8) NOT NULL DEFAULT '0',
	`que_date` DATETIME(6) NOT NULL,
	`views` INT(8) NOT NULL DEFAULT '0',
	PRIMARY KEY (`question_id`)
);

CREATE TABLE `answer` (
	`ans_id` INT(8) NOT NULL AUTO_INCREMENT,
	`user_id` INT(8) NOT NULL,
	`question_id` INT(8) NOT NULL,
	`ans_content` VARCHAR(1000) NOT NULL,
	`votes` INT(8) NOT NULL DEFAULT '0',
	`ans_date` DATETIME(6) NOT NULL,
	PRIMARY KEY (`ans_id`)
);

CREATE TABLE `bookmark` (
	`bookmark_id` INT(8) NOT NULL AUTO_INCREMENT,
	`question_id` INT(8) NOT NULL,
	`user_id` INT(8) NOT NULL,
	PRIMARY KEY (`bookmark_id`)
);

CREATE TABLE `comment` (
	`comment_id` INT(8) NOT NULL AUTO_INCREMENT,
	`ans_id` INT(8) NOT NULL,
	`user_id` INT(8) NOT NULL,
	`comment_content` VARCHAR(500) NOT NULL,
	`comment_date` DATETIME(6) NOT NULL,
	PRIMARY KEY (`comment_id`)
);

CREATE TABLE `admin` (
	`admin_id` INT(8) NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(50) NOT NULL,
	`middle_name` VARCHAR(50),
	`last_name` VARCHAR(50) NOT NULL,
	`email_id` VARCHAR(50) NOT NULL,
	`password` VARCHAR(50) NOT NULL,
	`country` VARCHAR(50),
	`state` VARCHAR(50),
	`city` VARCHAR(50),
	`mobile_no` VARCHAR(10),
	`gender` VARCHAR(10),
	`date_of_birth` DATETIME(6),
	`date_of_reg` DATETIME(6) NOT NULL,
	`profile_pic` VARCHAR(200),
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `tag` (
	`tag_id` INT(8) NOT NULL AUTO_INCREMENT,
	`tag_name` VARCHAR(30) NOT NULL UNIQUE,
	PRIMARY KEY (`tag_id`)
);

CREATE TABLE `que_tag` (
	`que_tag_id` INT(8) NOT NULL AUTO_INCREMENT,
	`question_id` INT(8) NOT NULL,
	`tag_id` INT(8) NOT NULL,
	PRIMARY KEY (`que_tag_id`)
);

CREATE TABLE `answer_later` (
	`later_id` INT(8) NOT NULL AUTO_INCREMENT,
	`question_id` INT(8) NOT NULL,
	`user_id` INT(8) NOT NULL,
	PRIMARY KEY (`later_id`)
);

ALTER TABLE `questions` ADD CONSTRAINT `questions_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `answer` ADD CONSTRAINT `answer_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `answer` ADD CONSTRAINT `answer_fk1` FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`);

ALTER TABLE `bookmark` ADD CONSTRAINT `bookmark_fk0` FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`);

ALTER TABLE `bookmark` ADD CONSTRAINT `bookmark_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk0` FOREIGN KEY (`ans_id`) REFERENCES `answer`(`ans_id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

ALTER TABLE `que_tag` ADD CONSTRAINT `que_tag_fk0` FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`);

ALTER TABLE `que_tag` ADD CONSTRAINT `que_tag_fk1` FOREIGN KEY (`tag_id`) REFERENCES `tag`(`tag_id`);

ALTER TABLE `answer_later` ADD CONSTRAINT `answer_later_fk0` FOREIGN KEY (`question_id`) REFERENCES `questions`(`question_id`);

ALTER TABLE `answer_later` ADD CONSTRAINT `answer_later_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);

