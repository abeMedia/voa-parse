--
-- Database: `voa`
--

-- --------------------------------------------------------

--
-- Table structure for table `additional`
--

CREATE TABLE `additional` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `adjustments`
--

CREATE TABLE `adjustments` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `adjustments_total`
--

CREATE TABLE `adjustments_total` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `value_before_adjustments` int(11) NOT NULL,
  `adjustments_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `parking`
--

CREATE TABLE `parking` (
  `id` bigint(20) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `spaces` int(11) NOT NULL,
  `gbp_per_unit` decimal(10,2) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL,
  `value` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plant`
--

CREATE TABLE `plant` (
  `id` int(11) NOT NULL,
  `property_id` bigint(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `unknown1` varchar(255) NOT NULL,
  `billing_authority` int(11) NOT NULL,
  `owner` varchar(50) NOT NULL,
  `building_number` varchar(255) DEFAULT NULL,
  `building_unit` varchar(50) DEFAULT NULL,
  `building_name` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `suburb` varchar(50) DEFAULT NULL,
  `city` varchar(70) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `scheme` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `property_id` bigint(20) NOT NULL,
  `ref` int(11) NOT NULL,
  `floor` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `area` decimal(10,2) NOT NULL,
  `gbp_per_m2` decimal(10,2) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `additional`
--
ALTER TABLE `additional`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments`
--
ALTER TABLE `adjustments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `adjustments_total`
--
ALTER TABLE `adjustments_total`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parking`
--
ALTER TABLE `parking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`property_id`,`ref`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `additional`
--
ALTER TABLE `additional`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adjustments`
--
ALTER TABLE `adjustments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `adjustments_total`
--
ALTER TABLE `adjustments_total`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `parking`
--
ALTER TABLE `parking`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `plant`
--
ALTER TABLE `plant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;