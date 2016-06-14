SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE `additional` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `adjustments` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `adjustments_total` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `value_before_adjustments` int(11) NOT NULL,
  `adjustments_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `parking` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `spaces` int(11) NOT NULL,
  `gbp_per_unit` decimal(10,2) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `plant` (
  `id` int(11) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `properties` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `unknown1` varchar(255) NOT NULL,
  `billing_authority` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `building_number` int(11) NOT NULL,
  `building_unit` varchar(255) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `city` varchar(70) NOT NULL,
  `county` varchar(50) NOT NULL,
  `postcode` varchar(8) NOT NULL,
  `scheme` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `area_total` decimal(10,2) NOT NULL,
  `value_subtotal` int(11) NOT NULL,
  `value_total` int(11) NOT NULL,
  `value_rateable` int(11) NOT NULL,
  `rating_list` year(4) NOT NULL,
  `billing_authority_name` varchar(255) NOT NULL,
  `ba_reference` varchar(20) NOT NULL,
  `unknown2` varchar(255) NOT NULL,
  `date_effective` date DEFAULT NULL,
  `date_altered` date DEFAULT NULL,
  `scat` int(11) NOT NULL,
  `basis_of_measurement` varchar(255) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rooms` (
  `property_id` bigint(20) NOT NULL,
  `ref` int(11) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `additional`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `adjustments_total`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `parking`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `plant`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rooms`
  ADD PRIMARY KEY (`property_id`,`ref`);


ALTER TABLE `additional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `adjustments_total`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `parking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
ALTER TABLE `plant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;