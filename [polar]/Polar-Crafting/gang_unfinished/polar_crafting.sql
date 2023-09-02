CREATE TABLE `polar_crafting` (
  `id` int(11) NOT NULL,
  `name` longtext,
  `exp` int(11) NOT NULL,
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `polar_crafting`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `polar_crafting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
