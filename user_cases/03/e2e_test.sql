/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`e2e_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `e2e_test`;
                    

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: test1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test1`;
CREATE TABLE `test1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) unsigned NOT NULL,
  `hotel` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel` (`hotel`)
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: test2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `test2`;
CREATE TABLE `test2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) unsigned NOT NULL,
  `hotel` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hotel` (`hotel`)
) ENGINE = InnoDB AUTO_INCREMENT = 24 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_bin;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: test1
# ------------------------------------------------------------

INSERT INTO
  `test1` (`id`, `state`, `hotel`)
VALUES
  (1, 1, 'xxx_1'),(2, 0, 'xxx_2'),(10, 1, 'xxx_10'),(20, 1, 'xxx_20'),(22, 1, 'xxx_22');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: test2
# ------------------------------------------------------------

INSERT INTO
  `test2` (`id`, `state`, `hotel`)
VALUES
  (1, 1, 'xxx_1'),(2, 0, 'xxx_2'),(10, 1, 'xxx_10'),(20, 1, 'xxx_20'),(22, 1, 'xxx_22');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
