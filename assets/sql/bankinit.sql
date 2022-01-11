-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 11 jan. 2022 à 18:17
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
  `nom_entreprise` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `nom_entreprise`) VALUES
(1, 'AccèsBanque'),
(2, 'AVITECH'),
(3, 'BOA');

-- --------------------------------------------------------

--
-- Structure de la table `loan`
--

CREATE TABLE `loan` (
  `ID` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `amount` bigint(20) NOT NULL,
  `implementationDate` datetime NOT NULL,
  `repaymentEndDate` datetime NOT NULL,
  `repaymentFrequency` int(11) NOT NULL,
  `benefitPaymentMethod` int(11) NOT NULL,
  `capitalPaymentMethod` int(11) NOT NULL,
  `remark` text NOT NULL,
  `refundMade` tinyint(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updateAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `payement_method`
--

CREATE TABLE `payement_method` (
  `id` int(11) NOT NULL,
  `wording` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `payement_method`
--

INSERT INTO `payement_method` (`id`, `wording`) VALUES
(1, 'virement'),
(2, 'mvola'),
(3, 'orange_money'),
(4, 'airtel_money');

-- --------------------------------------------------------

--
-- Structure de la table `repayment_frequency`
--

CREATE TABLE `repayment_frequency` (
  `id` int(11) NOT NULL,
  `wording` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `repayment_frequency`
--

INSERT INTO `repayment_frequency` (`id`, `wording`) VALUES
(1, 'Mensuelle'),
(2, 'Bimestrielle');

-- --------------------------------------------------------

--
-- Structure de la table `responsible`
--

CREATE TABLE `responsible` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `responsible`
--

INSERT INTO `responsible` (`id`, `nom`, `prenom`) VALUES
(1, 'Gregoire', 'Margothon'),
(2, 'Olivier', 'Felix'),
(3, 'Nebra', 'Mathieu');

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
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `payement_method`
--
ALTER TABLE `payement_method`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payement_method`
--
ALTER TABLE `payement_method`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `repayment_frequency`
--
ALTER TABLE `repayment_frequency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `responsible`
--
ALTER TABLE `responsible`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
