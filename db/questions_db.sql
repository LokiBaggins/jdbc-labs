-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.40 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for questions_db
DROP DATABASE IF EXISTS `questions_db`;
CREATE DATABASE IF NOT EXISTS `questions_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `questions_db`;

-- Dumping data for table questions_db.answers: ~9 rows (approximately)
DELETE FROM `answers`;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` (`ID`, `TEXT`, `QUESTION_ID`) VALUES
	(1, 'answer1', 1),
	(2, 'answer2', 1),
	(3, 'answer3', 1),
	(4, 'answer4', 2),
	(5, 'answer5', 2),
	(6, 'answer6', 2),
	(7, 'answer7', 3),
	(8, 'answer8', 3),
	(9, 'answer9', 3);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;

-- Dumping data for table questions_db.questions: ~3 rows (approximately)
DELETE FROM `questions`;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` (`ID`, `TEXT`, `CORRECT_ANSWER`) VALUES
	(1, 'Question 1', '1'),
	(2, 'Question 2', '4'),
	(3, 'Question 3', '7');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;

-- Dumping data for table questions_db.questions_to_answers: ~0 rows (approximately)
DELETE FROM `questions_to_answers`;
/*!40000 ALTER TABLE `questions_to_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions_to_answers` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
