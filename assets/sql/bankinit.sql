-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 23 jan. 2022 à 20:51
-- Version du serveur : 10.4.21-MariaDB
-- Version de PHP : 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bankinit`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `company_name` text NOT NULL,
  `contact` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `company_name`, `contact`) VALUES
(1, 'BOA', NULL),
(2, 'Avitech', NULL),
(3, 'Accès Banque', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `loan`
--

CREATE TABLE `loan` (
  `id` int(11) NOT NULL,
  `responsible_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `implementation_date` datetime DEFAULT NULL,
  `repayment_end_date` datetime DEFAULT NULL,
  `repayment_frequency` int(11) DEFAULT NULL,
  `benefit_payment_method` int(11) DEFAULT NULL,
  `capital_payment_method` int(11) DEFAULT NULL,
  `remark` text DEFAULT NULL,
  `refund_made` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `update_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `payment_method`
--

CREATE TABLE `payment_method` (
  `id` int(11) NOT NULL,
  `label` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment_method`
--

INSERT INTO `payment_method` (`id`, `label`) VALUES
(1, 'virement bancaire'),
(2, 'airtel money'),
(3, 'orange money'),
(4, 'mvola');

-- --------------------------------------------------------

--
-- Structure de la table `repayment`
--

CREATE TABLE `repayment` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `scheduled_repayment_date` datetime DEFAULT NULL,
  `exact_repayment_date` datetime DEFAULT NULL,
  `done` tinyint(1) DEFAULT 0,
  `amount` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `repayment_frequency`
--

CREATE TABLE `repayment_frequency` (
  `id` int(11) NOT NULL,
  `wording` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `repayment_frequency`
--

INSERT INTO `repayment_frequency` (`id`, `wording`) VALUES
(1, 'mensuelle'),
(2, 'bimestrielle');

-- --------------------------------------------------------

--
-- Structure de la table `responsible`
--

CREATE TABLE `responsible` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `responsible`
--

INSERT INTO `responsible` (`id`, `last_name`, `first_name`, `phone_number`) VALUES
(1, 'MIHARISOA', 'Tojoniaina Patrick', '0343784594'),
(2, 'ANDRIATIANA', 'Jean-Marie', '0347558804'),
(3, 'RANAIVOARISON', 'Harena Finaritra', '0347944443');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `responsible_id` (`responsible_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `benefit_payment_method` (`benefit_payment_method`),
  ADD KEY `capital_payment_method` (`capital_payment_method`),
  ADD KEY `repayment_frequency` (`repayment_frequency`),
  ADD KEY `repayment_frequency_2` (`repayment_frequency`);

--
-- Index pour la table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `repayment`
--
ALTER TABLE `repayment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Index pour la table `repayment_frequency`
--
ALTER TABLE `repayment_frequency`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `responsible`
--
ALTER TABLE `responsible`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `repayment`
--
ALTER TABLE `repayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `repayment_frequency`
--
ALTER TABLE `repayment_frequency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `responsible`
--
ALTER TABLE `responsible`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`responsible_id`) REFERENCES `responsible` (`ID`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`ID`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`benefit_payment_method`) REFERENCES `payment_method` (`ID`),
  ADD CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`capital_payment_method`) REFERENCES `payment_method` (`ID`),
  ADD CONSTRAINT `loan_ibfk_5` FOREIGN KEY (`repayment_frequency`) REFERENCES `repayment_frequency` (`ID`);

--
-- Contraintes pour la table `repayment`
--
ALTER TABLE `repayment`
  ADD CONSTRAINT `repayment_ibfk_1` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
