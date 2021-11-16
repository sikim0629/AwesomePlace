-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.26 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- awscoffee 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `awscoffee` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `awscoffee`;

-- 테이블 awscoffee.menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu` (
  `mtitle` varchar(32) DEFAULT NULL,
  `mname` varchar(32) DEFAULT NULL,
  `mprice` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mdescription` varchar(1024) DEFAULT NULL,
  `mfile` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 awscoffee.menu:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`mtitle`, `mname`, `mprice`, `mdescription`, `mfile`) VALUES
	('1', '아메리카노', '4500', '아메리카노는 가장 대중적이며', 'ame.jpg'),
	('1', '라떼', '5000', '라떼는말야', 'latte.jpg'),
	('1', '카푸치노', '5000', '향이 가득한', 'cappu.jpg'),
	('2', '레몬차', '5000', '감기와 비염에 좋은 레몬차', 'lemon.jpg'),
	('2', '녹차', '4500', '디톡스에 좋은 녹차', 'green.jpg'),
	('2', '국화차', '5000', '눈과 머리를 맑게 해주는 국화차', 'gukhwa.jpg'),
	('3', '달고나', '1000', '게임에 참여하시겠습니까?', 'dalgona.jpg'),
	('3', '채리케이크', '4500', '카드캡쳐체리아니구요', 'cherry.jpg'),
	('3', '마카롱', '2500', '세일해요! 근데 왜 이가격이죠', 'macaron.jpg'),
	('3', '호박고구마', '3000', '고구마호박 아닙니다', 'pumpkin.jpg');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;