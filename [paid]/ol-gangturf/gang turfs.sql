-- by orangelist
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table bigamertest.gang_npc
CREATE TABLE IF NOT EXISTS `gang_npc` (
  `gang` varchar(50) NOT NULL DEFAULT '',
  `money` int(11) NOT NULL DEFAULT 0,
  `bought` int(11) DEFAULT 0,
  UNIQUE KEY `gang` (`gang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

-- Dumping structure for table bigamertest.gang_turf
CREATE TABLE IF NOT EXISTS `gang_turf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gang` varchar(50) NOT NULL DEFAULT '',
  `creator` varchar(150) NOT NULL DEFAULT '',
  `rotation` varchar(150) NOT NULL DEFAULT '',
  `position` varchar(150) NOT NULL DEFAULT '',
  `isexist` tinyint(4) NOT NULL DEFAULT 0,
  `discoverd` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
