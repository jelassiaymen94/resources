INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES ('tuner', '0', 'boss');
INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES ('motordealer', '0', 'boss');

CREATE TABLE IF NOT EXISTS `dealerships_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dealership` varchar(45) DEFAULT NULL,
  `vehicle` varchar(45) DEFAULT NULL,
  `deliverydate` date DEFAULT (current_timestamp() + interval 2 day),
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `dealerships_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(45) DEFAULT NULL,
  `dealership` varchar(45) DEFAULT NULL,
  `price` int(45) DEFAULT NULL,
  `stock` int(45) DEFAULT 0,
  PRIMARY KEY (`id`)
);