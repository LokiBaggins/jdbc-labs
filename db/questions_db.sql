-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.40 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/* !40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/* !40101 SET NAMES utf8mb4 */;
/* !40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/* !40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for questions_db
DROP DATABASE IF EXISTS `questions_db`;
CREATE DATABASE `questions_db` /* !40100 DEFAULT CHARACTER SET utf8 */;
USE `questions_db`;


-- Dumping structure for table questions_db.answers
CREATE TABLE IF NOT EXISTS `answers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEXT` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table questions_db.answers: ~9 rows (approximately)
DELETE FROM `answers`;
/* !40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`ID`, `TEXT`) VALUES
	(1, 'answer1'),
	(2, 'answer2'),
	(3, 'answer3'),
	(4, 'answer4'),
	(5, 'answer5'),
	(6, 'answer6'),
	(7, 'answer7'),
	(8, 'answer8'),
	(9, 'answer9');
/* !40000 ALTER TABLE `answers` ENABLE KEYS */;


-- Dumping structure for table questions_db.questions
CREATE TABLE IF NOT EXISTS `questions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEXT` varchar(255) NOT NULL,
  `CORRECT_ANSWER` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_to_answers` (`CORRECT_ANSWER`),
  CONSTRAINT `FK_to_answers` FOREIGN KEY (`CORRECT_ANSWER`) REFERENCES `answers` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table questions_db.questions: ~3 rows (approximately)
DELETE FROM `questions`;
/* !40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `TEXT`, `CORRECT_ANSWER`) VALUES
	(1, 'Question 1', 1),
	(2, 'Question 2', 4),
	(3, 'Question 3', 7);
/* !40000 ALTER TABLE `questions` ENABLE KEYS */;
/* !40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/* !40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/* !40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
