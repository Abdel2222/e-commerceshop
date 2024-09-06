-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 19 Juin 2023 à 17:04
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `e-shop`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`id`, `name`, `email`, `password`) VALUES
(6, '', 'admin@ecommerce.be', 'a87c68a857bc5ec5362391a49d3a37a6');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `createur` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `description`, `createur`, `date_creation`, `date_modification`) VALUES
(2, 'hifii', 'description categorie 3', 0, '0000-00-00', '2023-06-17'),
(10, 'informatiques', 'laptop, samsung, tablette ,tv ...', 21, '2023-06-17', '0000-00-00'),
(11, 'livres', 'roman , thriller, bande dessinees , cuisines , sciences ,.....', 21, '2023-06-17', '0000-00-00'),
(12, 'electromenager', 'frigo, lave vaiselle , sechoir ,,,,,', 21, '2023-06-17', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE IF NOT EXISTS `commandes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `panier` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  `statut` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `commandes`
--

INSERT INTO `commandes` (`id`, `produit`, `quantite`, `total`, `panier`, `date_creation`, `date_modification`, `statut`) VALUES
(1, 1, 12, 840, 0, '2023-06-17', '2023-06-17', 0),
(2, 1, 6, 420, 0, '2023-06-17', '2023-06-17', 0),
(3, 1, 6, 420, 0, '2023-06-17', '2023-06-17', 0),
(18, 2, 12, 552, 17, '2023-06-18', '2023-06-18', 0),
(19, 3, 24, 960, 18, '2023-06-18', '2023-06-18', 0);

-- --------------------------------------------------------

--
-- Structure de la table `paniers`
--

CREATE TABLE IF NOT EXISTS `paniers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visiteur` int(11) NOT NULL,
  `total` float NOT NULL,
  `etat` varchar(25) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Contenu de la table `paniers`
--

INSERT INTO `paniers` (`id`, `visiteur`, `total`, `etat`, `date_creation`, `date_modification`) VALUES
(1, 0, 420, '', '2023-06-17', '0000-00-00'),
(2, 20, 420, '', '2023-06-17', '0000-00-00'),
(3, 20, 552, '', '2023-06-18', '0000-00-00'),
(4, 20, 552, '', '2023-06-18', '0000-00-00'),
(5, 20, 1012, '', '2023-06-18', '0000-00-00'),
(6, 20, 200, '', '2023-06-18', '0000-00-00'),
(7, 20, 208880, '', '2023-06-18', '0000-00-00'),
(8, 20, 208880, '', '2023-06-18', '0000-00-00'),
(9, 20, 552, '', '2023-06-18', '0000-00-00'),
(10, 20, 552, '', '2023-06-18', '0000-00-00'),
(11, 20, 552, '', '2023-06-18', '0000-00-00'),
(12, 20, 690, '', '2023-06-18', '0000-00-00'),
(13, 20, 690, '', '2023-06-18', '0000-00-00'),
(14, 20, 960, '', '2023-06-18', '0000-00-00'),
(15, 20, 960, '', '2023-06-18', '0000-00-00'),
(16, 20, 920, '', '2023-06-18', '0000-00-00'),
(17, 20, 552, '', '2023-06-18', '0000-00-00'),
(18, 20, 960, '', '2023-06-18', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE IF NOT EXISTS `produits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `prix` float NOT NULL,
  `image` varchar(255) NOT NULL,
  `categorie` int(11) NOT NULL,
  `createur` int(11) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Contenu de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `image`, `categorie`, `createur`, `date_creation`, `date_modification`) VALUES
(1, 'Fede micto', 'micro Kraoke sans fil ', 70, 'baphhiffi.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(2, 'Harry potter et la sorciere', 'livre de thriller', 46, '18114_potter.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(3, 'radio hifii g20', 'radio hifii moderne 200hz', 40, 'radiohifii.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(4, 'samsung 20', 's20 camera bluethooth 120pixels 20 gb de memoire ', 450, 'samsung20.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(9, 'Gardiens du cite des paradis', 'livre d aventiure blabla', 15.8, '78521_images.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(10, 'Le sang et la cendre ', 'Roman de guerre .......', 38.95, '51k+izI6RvL._SY344_BO1,204,203,200_.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(11, 'amplificateur hifii', 'amplificateur son 45hz .....', 48.82, '71FNAdbjaGL._SX466_.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(12, 'iphone 11', 'gsm derniere generation apple .....', 465.99, 'iphone 1 red.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(13, 'mixeur audio hifii', 'son mixeur 14hz', 72.32, 'pexels-stephen-niemeier-63703.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(14, 'Astrologhie du monde', 'livres de sciences....', 50, 'Astrologie-La-Bibliotheque-de-l-Esoterisme.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(15, 'ecouteurs s123', 'eouteurs wifii bluetooth ...', 89, 'ecouteurs.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(21, 'iphone 10', 'lgsm 125 px 30go .....', 662.35, 'iphone10.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(22, 'laptop hp 2017', '250go , 18 go ram, wifii bluetooth,core i7 intel', 460, 'PC-Portable-Lenovo-IdeaPad-3-15ITL6-15-6-Intel-Core-i5-8-Go-RAM-256-Go-D-Gris-arctique.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(23, 'casque hifii 123 pr', 'casque ncnx bluetooth wifiii 12 hz .....', 36.21, 'casque.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(26, 'lecteur disque vn', 'lecteur generation 2008...', 23, 'lecteur.jpg', 0, 0, '0000-00-00', '0000-00-00'),
(27, 'tablette samsung', 'tablette 300go , wifii ....', 489.5, 'tablette.jpg', 0, 0, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `stocks`
--

CREATE TABLE IF NOT EXISTS `stocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produit` varchar(255) NOT NULL,
  `quantite` int(11) NOT NULL,
  `createur` varchar(255) NOT NULL,
  `date_creation` date NOT NULL,
  `date_modification` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `stocks`
--

INSERT INTO `stocks` (`id`, `produit`, `quantite`, `createur`, `date_creation`, `date_modification`) VALUES
(1, '8', 12, '', '2023-06-17', '0000-00-00'),
(2, '9', 5, '', '2023-06-18', '0000-00-00'),
(3, '10', 13, '', '2023-06-19', '0000-00-00'),
(4, '11', 10, '', '2023-06-19', '0000-00-00'),
(5, '12', 12, '', '2023-06-19', '0000-00-00'),
(6, '13', 0, '', '2023-06-19', '0000-00-00'),
(7, '14', 5, '', '2023-06-19', '0000-00-00'),
(8, '15', 18, '', '2023-06-19', '0000-00-00'),
(9, '16', 0, '', '2023-06-19', '0000-00-00'),
(10, '17', 0, '', '2023-06-19', '0000-00-00'),
(11, '18', 0, '', '2023-06-19', '0000-00-00'),
(12, '19', 0, '', '2023-06-19', '0000-00-00'),
(13, '20', 10, '', '2023-06-19', '0000-00-00'),
(14, '21', 0, '', '2023-06-19', '0000-00-00'),
(15, '22', 23, '', '2023-06-19', '0000-00-00'),
(16, '23', 20, '', '2023-06-19', '0000-00-00'),
(17, '24', 0, '', '2023-06-19', '0000-00-00'),
(18, '25', 0, '', '2023-06-19', '0000-00-00'),
(19, '26', 5, '', '2023-06-19', '0000-00-00'),
(20, '27', 16, '', '2023-06-19', '0000-00-00'),
(21, '28', 8, '', '2023-06-19', '0000-00-00'),
(22, '29', 0, '', '2023-06-19', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `visiteurs`
--

CREATE TABLE IF NOT EXISTS `visiteurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `etat` int(11) NOT NULL,
  `date_modification` int(11) NOT NULL,
  `date_creation` int(11) NOT NULL,
  `gsm` varchar(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Contenu de la table `visiteurs`
--

INSERT INTO `visiteurs` (`id`, `email`, `password`, `nom`, `prenom`, `etat`, `date_modification`, `date_creation`, `gsm`) VALUES
(17, 'l@hotmail.com', '123', 'Toni', 'Kroos', 1, 0, 0, '046663255'),
(18, 'jtt@htt.com', '1111', 'pite', 'simpras', 1, 0, 0, ''),
(19, 'bendahouabdelbaki@gmail.com', '111', 'pite', 'simpras', 1, 0, 0, '01122544'),
(20, 'itshubie@hotmail.com', '202cb962ac59075b964b07152d234b70', 'Bendahou', 'Abdelbaki', 1, 0, 0, '0487654122'),
(21, 'admin@eshop.be', 'a01610228fe998f515a72dd730294d87', 'admin', 'admin', 1, 0, 0, '045632000'),
(22, 'kkhh@outlook.be', 'c6f057b86584942e415435ffb1fa93d4', 'ter', 'skyp', 1, 0, 0, '22222');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
