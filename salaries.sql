-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 05 sep. 2022 à 12:16
-- Version du serveur : 5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecomerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `salaries`
--

CREATE TABLE `salaries` (
  `IDsal` int(11) NOT NULL,
  `Nom` varchar(100) NOT NULL,
  `Prenom` varchar(100) DEFAULT NULL,
  `Secu` int(11) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Adresse` varchar(100) DEFAULT NULL,
  `Ent` int(11) DEFAULT NULL,
  `Sexe` varchar(3) DEFAULT NULL,
  `Salaire` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `salaries`
--

INSERT INTO `salaries` (`IDsal`, `Nom`, `Prenom`, `Secu`, `Age`, `Adresse`, `Ent`, `Sexe`, `Salaire`) VALUES
(1, 'Gastout', 'Camille', 123123, 28, 'gastout.camille@gmail.com', 2, 'Mas', 8521),
(2, 'Lecosta', 'Alfred', 133123, 18, 'zacharie.gailla@stonehousegrp1.com', 2, 'Mas', 1522),
(3, 'Pottier', 'Noel', 124123, 40, 'frederic.gomes@aolmate.com', 1, 'Mas', 1252),
(4, 'Bruneau', 'Alexandria', 153123, 53, 'ipierre@soccerfit.com', 4, 'Fem', 1452),
(5, 'Caron', 'Zoé', 126123, 22, 'elise.giraud@realremedyblog.com', 5, 'Fem', 7862),
(6, 'De Oliveira', 'Mathilde', 127123, 35, 'francoise22@clonemoi.tk', 5, 'Fem', 5202),
(7, 'Delattre', 'Denis', 127823, 48, 'adam.oceane@mailpluss.com', 2, 'Mas', 1232),
(8, 'Huet', 'Timothée', 128923, 28, 'schmitt.jacques@daxur.xyz', 3, 'Mas', 2562),
(9, 'Clerc', 'Nath', 196123, 33, 'sduval@kenvanharen.com', 1, 'Mas', 4312);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`IDsal`),
  ADD KEY `Ent` (`Ent`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `IDsal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `salaries_ibfk_1` FOREIGN KEY (`Ent`) REFERENCES `entreprise` (`IDent`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
